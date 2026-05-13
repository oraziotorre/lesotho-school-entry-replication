using DataFrames
using Statistics
using ReadStatTables
using Plots
using Plots.PlotMeasures
using GLM
using StatsModels


function figure_1A(df)

    """
    Generates a scatter plot with confidence intervals showing the probability of 
    currently attending grade 1 or higher, categorized by month and year of birth. 
    Specifically filters for children born between 2011 and 2013 (MICS 2018 survey).

    # Arguments
    - `df`: The input DataFrame containing birth dates and schooling status.
    """

    local_df = copy(df)

    local_df.birthyr      = Vector{Union{Missing,Int}}(local_df.birthyr)
    local_df.birthmoyr    = Vector{Union{Missing,Int}}(local_df.birthmoyr)
    local_df.grade1ormore = Vector{Union{Missing,Float64}}(local_df.grade1ormore)

    filter!(
        row ->
            !ismissing(row.birthyr) &&
            2011 <= row.birthyr <= 2013,
        local_df
    )

    gdf = combine(
        groupby(local_df, :birthmoyr),
        :grade1ormore => mean_se => AsTable
    )

    sort!(gdf, :birthmoyr)
    add_ci!(gdf)
    gdf.rank = 1:nrow(gdf)
    xlabels = String[]

    for yr in 2011:2013
        for mo in MONTH_LABELS
            push!(xlabels, "$mo $yr")
        end
    end

    xlabels = xlabels[1:36]

    p = scatter_ci_plot(
        gdf,

        x = :rank,

        xlabel = "Month and year of birth",
        ylabel = "Probability currently attending grade 1 or higher",

        title = "(a) Entry into primary school",

        xticks = (1:36, xlabels),

        xrotation = 90,
        tickfontsize = 5,

        xlims = (0, 37),
        ylims = (-0.05, 1.05),

        vline_at = 18.5,

        size = (850, 450)
    )

    return p
end



function figure_1B(df)

    """
    Generates a scatter plot showing the average age at the beginning of the 
    school year for current grade 1 students, grouped by their month of birth.

    # Arguments
    - `df`: The input DataFrame containing birth month, grade, and school age data.
    """


    local_df = copy(df)

    local_df.birthmo = Vector{Union{Missing,Int}}(local_df.birthmo)
    local_df.grade   = Vector{Union{Missing,Int}}(local_df.grade)
    local_df.grade_r = Vector{Union{Missing,Int}}(local_df.grade_r)
    local_df.schage  = Vector{Union{Missing,Float64}}(local_df.schage)

    filter!(
        row ->
            coalesce(row.grade == 1, false) &&
            coalesce(row.grade_r == 0, false),
        local_df
    )

    gdf = combine(
        groupby(local_df, :birthmo),
        :schage => mean_se => AsTable
    )

    sort!(gdf, :birthmo)
    add_ci!(gdf)

    p = scatter_ci_plot(
        gdf,

        x = :birthmo,

        xlabel = "Month of birth",
        ylabel = "Age at beginning of school year (years)",

        title = "(b) Average age at entry into grade 1",

        xticks = (1:12, MONTH_LABELS),

        xlims = (0, 13),
        ylims = (5.0, 6.35),

        yticks = (
            [5.0, 5.25, 5.5, 5.75, 6.0, 6.25],
            ["5", "5.25", "5.5", "5.75", "6", "6.25"]
        ),

        vline_at = 6.5
    )

    return p
end


function run_figure1(df, FIGURES)

    """
    Runs both `figure_1A` and `figure_1B`, combines them into a single layout, 
    and saves the resulting plot to the specified directory.

    # Arguments
    - `df`: The input DataFrame.
    - `FIGURES`: The directory path where the combined plot will be saved.
    """


    @info "Running Figure 1A"
    pA = figure_1A(df)

    @info "Running Figure 1B"
    pB = figure_1B(df)

    combined = plot(
        pA,
        pB,

        layout = (1, 2),

        size = (1100, 500),

        left_margin = 12mm
    )

    output_path = joinpath(
        FIGURES,
        "MOB_and_SchoolEntry.png"
    )

    savefig(combined, output_path)
end



function run_figure3(df, FIGURES)

    """
    Generates and saves a scatter plot showing the probability that a mother 
    attained secondary education, based on the month of birth of her first child.

    # Arguments
    - `df`: The input DataFrame.
    - `FIGURES`: The directory path where the plot will be saved.
    """

    local_df = copy(df)

    local_df.brthord       = Vector{Union{Missing,Int}}(local_df.brthord)
    local_df.birthmo_child = Vector{Union{Missing,Int}}(local_df.birthmo_child)
    local_df.momsec        = Vector{Union{Missing,Float64}}(local_df.momsec)

    filter!(
        row ->
            coalesce(row.brthord == 1, false) &&
            !ismissing(row.birthmo_child),
        local_df
    )

    gdf = combine(
        groupby(local_df, :birthmo_child),
        :momsec => mean_se => AsTable
    )

    sort!(gdf, :birthmo_child)
    add_ci!(gdf)

    p = scatter_ci_plot(
        gdf,

        x = :birthmo_child,

        xlabel = "Month of birth of first child",
        ylabel = "Probability mother attained secondary school",

        xticks = (1:12, MONTH_LABELS),

        xlims = (0, 13),
        ylims = (0.4, 0.7),

        yticks = (
            [0.4, 0.5, 0.6, 0.7],
            ["0.4", "0.5", "0.6", "0.7"]
        ),

        vline_at = 6.5
    )

    output_path = joinpath(
        FIGURES,
        "placebo_maternaleducation.png"
    )

    savefig(p, output_path)
end



function run_figure5(df, FIGURES)

    """
    Performs a series of age-specific regressions to estimate the effect of 
    being born in the second half of the year (July–December) on total years 
    of schooling. Generates and saves a line plot showing the regression 
    coefficients and their confidence intervals across different ages at the 
    beginning of the school year.

    # Arguments
    - `df`: The input DataFrame
    - `FIGURES`: The directory path where the plot will be saved.
    """

    local_df = copy(df)

    local_df.educ        = Vector{Union{Missing,Float64}}(local_df.educ)
    local_df.birthmo_jul = Vector{Union{Missing,Float64}}(local_df.birthmo_jul)
    local_df.schage      = Vector{Union{Missing,Int}}(local_df.schage)

    filter!(
        row ->
            !ismissing(row.educ)        &&
            !ismissing(row.birthmo_jul) &&
            !ismissing(row.schage)      &&
            3 <= row.schage <= 19,        # ← filtra il range sensato
        local_df
    )

    gdf = regression_by_group(
        local_df,
        groupvar = :schage,
        formula  = @formula(educ ~ birthmo_jul),
        minobs   = 10
    )

    filter!(row -> 3 <= row.group <= 19, gdf)

    p = plot(
        gdf.group,
        gdf.beta;
        seriestype = :line,
        marker     = :circle,
        linewidth  = 2,
        color      = :gray30,
        xlabel     = "Age at beginning of school year (years)",
        ylabel     = "Coefficient on treatment variable",
        xticks     = (3:19, string.(3:19)),   # ← tick espliciti, uno per età
        xlims      = (2, 20),
        ylims      = (-1.0, 1.5),
        size       = (700, 450),
        legend     = :none,
        framestyle = :box,
        dpi        = 150,
        left_margin   = 10mm,
        bottom_margin = 10mm,
        right_margin  = 5mm,
        top_margin    = 5mm,
    )

    plot!(p;
        grid      = true,
        gridstyle = :dot,
        gridcolor = :gray70,
    )

    add_errorbars!(p, gdf.group, gdf.yl, gdf.yu; color = :gray40)
    add_reference_line!(p; h = 0)

    output_path = joinpath(FIGURES, "Reversal_of_fortunes.png")
    savefig(p, output_path)

end



function skills_panel(df_fs, outcome_col::Symbol, panel_title::String, ytitle::String)

    """
    Generates a panel visualization comparing age-related trends between earlier 
    school entrants (born January–June) and later entrants (born July–December).

    # Arguments
    - `df_fs`: The input DataFrame.
    - `outcome_col::Symbol`: The specific variable to plot (e.g. reading skills).
    - `panel_title::String`: The main title for the plot.
    - `ytitle::String`: The label for the y-axis.
    """

    local_df = copy(df_fs)

    local_df.schage = Vector{Union{Missing,Float64}}(local_df.schage)
    local_df.birthmo_jul = Vector{Union{Missing,Int}}(local_df.birthmo_jul)
    local_df.schagecat2_from5 = Vector{Union{Missing,Int}}(local_df.schagecat2_from5)
    local_df[!, outcome_col] = Vector{Union{Missing,Float64}}(local_df[!, outcome_col])
    local_df.fsweight = Vector{Union{Missing,Float64}}(local_df.fsweight)

    filter!(
        row ->
            !ismissing(row.schage) &&
            7 <= row.schage <= 14,
        local_df
    )

    filter!(
        row ->
            !ismissing(row.birthmo_jul) &&
            !ismissing(row.schagecat2_from5) &&
            !ismissing(row[outcome_col]) &&
            !ismissing(row.fsweight),
        local_df
    )

    gdf = grouped_weighted_mean(
        local_df,
        groupvars = [:schagecat2_from5, :birthmo_jul],
        value = outcome_col,
        weight = :fsweight
    )

    sort!(gdf, [:schagecat2_from5, :birthmo_jul])

    agecat_labels = Dict(
        7  => "7-8",
        9  => "9-10",
        11 => "11-12",
        13 => "13-14"
    )

    agecats = sort(unique(gdf.schagecat2_from5))
    n_cats = length(agecats)
    bar_width   = 0.35
    group_gap   = 0.3
    group_width = 2 * bar_width + group_gap

    centers = [
        (i - 1) * group_width + bar_width
        for i in 1:n_cats
    ]

    jan_jun_vals = Float64[]
    jul_dec_vals = Float64[]

    for cat in agecats
        sub = filter(
            r -> r.schagecat2_from5 == cat,
            gdf
        )
        jan = filter(r -> r.birthmo_jul == 0, sub)
        jul = filter(r -> r.birthmo_jul == 1, sub)
        push!(
            jan_jun_vals,
            nrow(jan) > 0 ? jan.y[1] : 0.0
        )
        push!(
            jul_dec_vals,
            nrow(jul) > 0 ? jul.y[1] : 0.0
        )
    end

    ymax = max(
        maximum(jan_jun_vals),
        maximum(jul_dec_vals)
    ) * 1.25

    p = plot(;
        title = panel_title,

        xlabel = "Age at beginning of school year",
        ylabel = ytitle,

        legend = :topleft,

        legendfontsize = 6,
        titlefontsize  = 8,
        xguidefontsize = 7,
        yguidefontsize = 7,
        tickfontsize   = 6,

        xlims = (
            -bar_width,
            centers[end] + bar_width * 2 + group_gap / 2
        ),

        ylims = (0, ymax),

        xticks = (
            centers .+ bar_width / 2,
            [get(agecat_labels, c, string(c)) for c in agecats]
        ),

        yticks = range(0, stop = ymax, length = 5) .|> x -> round(x, digits = 2),

        framestyle   = :box,
        legend_font_pointsize = 6,
        dpi          = 150,
        left_margin   = 10mm,
        bottom_margin = 10mm,
        right_margin  = 5mm,
        top_margin    = 5mm,
    )

    plot!(p;
        grid      = true,
        gridstyle = :dot,
        gridcolor = :gray70,
    )

    
    for (i, cat) in enumerate(agecats)
        x_left = centers[i] - bar_width / 2
        bar_h = jan_jun_vals[i]

        plot!(
            p,

            [x_left,
             x_left + bar_width,
             x_left + bar_width,
             x_left,
             x_left],

            [0,
             0,
             bar_h,
             bar_h,
             0],

            seriestype = :shape,

            fillcolor = :gray20,
            linecolor = :gray20,

            linewidth = 0.5,

            label = i == 1 ? "Born Jan - Jun" : false
        )
    end

    
    for (i, cat) in enumerate(agecats)
        x_left = centers[i] + bar_width / 2 + group_gap / 4
        bar_h = jul_dec_vals[i]

        plot!(
            p,

            [x_left,
             x_left + bar_width,
             x_left + bar_width,
             x_left,
             x_left],

            [0,
             0,
             bar_h,
             bar_h,
             0],

            seriestype = :shape,

            fillcolor = :gray65,
            linecolor = :gray65,

            linewidth = 0.5,

            label = i == 1 ? "Born Jul - Dec" : false
        )
    end

    return p
end



function run_figure18(df_fs, FIGURES)

    """
    Generates four separate subplots using 'skills_panel' and merges them into a
    single layout, and saves the resulting plot to the specified directory.

    # Arguments
    - `df_fs`: The input DataFrame.
    - `FIGURES`: The directory path where the combined plot will be saved.
    """


    # Sesotho reading skills
    pA = skills_panel(df_fs, :readsk_s,  "(a) Sesotho reading skills",   "Pr(foundational reading skills Sesotho)")
    
    # English reading skills
    pB = skills_panel(df_fs, :readsk_e,  "(b) English reading skills",   "Pr(foundational reading skills English)")
    
    # Numeracy skills
    pC = skills_panel(df_fs, :numbskill, "(c) Numeracy skills",           "Pr(foundational numeracy skills)")
    
    # Probability of reading books at home
    pD = skills_panel(df_fs, :read,      "(d) Reading books at home",     "Pr(child reads books at home)")

    p = plot(
        pA, pB, pC, pD,
        layout = (2, 2),
        size   = (900, 700),
        dpi    = 150
    )

    output_path = joinpath(FIGURES, "skills_kids.png")
    savefig(p, output_path)

end



function run_all_figures(MICS_DATA, FIGURES)

    include(joinpath(@__DIR__, "..", "src", "utils.jl"))
    df = DataFrame(readstat(joinpath(MICS_DATA, "mics6hl.dta")))
    df_bh = DataFrame(readstat(joinpath(MICS_DATA, "micsbh.dta")))
    df_fs = DataFrame(readstat(joinpath(MICS_DATA, "mics6fs.dta")))

    @info "Creating Figure 1..."
    run_figure1(df, FIGURES)
    @info "Figure 1 completed."

    @info "Creating Figure 3..."
    run_figure3(df_bh, FIGURES)
    @info "Figure 3 completed."

    @info "Creating Figure 5..."
    run_figure5(df, FIGURES)
    @info "Figure 5 completed."

    @info "Creating Figure 18..."
    run_figure18(df_fs, FIGURES)
    @info "Figure 18 completed."

end