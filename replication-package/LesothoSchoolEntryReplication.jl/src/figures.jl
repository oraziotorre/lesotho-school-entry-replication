using DataFrames
using Statistics
using ReadStatTables
using Plots
using Plots.PlotMeasures
using GLM
using StatsModels

function figure_school_entry_mics_A(df)
    local_df = copy(df)

    local_df.birthyr      = Vector{Union{Missing,Int}}(local_df.birthyr)
    local_df.birthmoyr    = Vector{Union{Missing,Int}}(local_df.birthmoyr)
    local_df.grade1ormore = Vector{Union{Missing,Float64}}(local_df.grade1ormore)

    filter!(row -> !ismissing(row.birthyr) && 2011 <= row.birthyr <= 2013, local_df)

    gdf = combine(groupby(local_df, :birthmoyr),:grade1ormore => mean_se => AsTable)

    sort!(gdf, :birthmoyr)

    gdf.yu   = gdf.y .+ 1.96 .* gdf.se_y
    gdf.yl   = gdf.y .- 1.96 .* gdf.se_y
    gdf.rank = 1:nrow(gdf)

    months = [
        "Jan","Feb","Mar","Apr","May","Jun",
        "Jul","Aug","Sep","Oct","Nov","Dec"
    ]

    xlabels = String[]

    for yr in 2011:2013
        for mo in months
            push!(xlabels, "$mo $yr")
        end
    end

    xlabels = xlabels[1:36]

    p = scatter(
        gdf.rank,
        gdf.y,

        xlabel = "Month and year of birth",
        ylabel = "Probability currently attending grade 1 or higher",

        legend = false,
        title  = "(a) Entry into primary school",

        xticks       = (1:36, xlabels),
        xrotation    = 90,
        tickfontsize = 5,

        xlims = (0, 37),
        ylims = (-0.05, 1.05),

        markercolor = :steelblue,
        markersize  = 4,

        grid = true,

        left_margin   = 10mm,
        bottom_margin = 20mm
    )

    for i in 1:nrow(gdf)

        plot!(
            [gdf.rank[i], gdf.rank[i]],
            [gdf.yl[i], gdf.yu[i]],

            lw    = 1,
            color = :steelblue,
            label = false
        )
    end

    vline!(
        [18.5],

        color = :black,
        lw = 1,
        linestyle = :dash,
        label = false
    )

    return p
end


function figure_school_entry_mics_B(df)
    local_df = copy(df)

    local_df.birthmo = Vector{Union{Missing,Int}}(local_df.birthmo)
    local_df.grade   = Vector{Union{Missing,Int}}(local_df.grade)
    local_df.grade_r = Vector{Union{Missing,Int}}(local_df.grade_r)
    local_df.schage  = Vector{Union{Missing,Float64}}(local_df.schage)

    filter!(row -> coalesce(row.grade == 1, false) && coalesce(row.grade_r == 0, false), local_df)

    gdf = combine(groupby(local_df, :birthmo), :schage => mean_se => AsTable)

    sort!(gdf, :birthmo)

    gdf.yu = gdf.y .+ 1.96 .* gdf.se_y
    gdf.yl = gdf.y .- 1.96 .* gdf.se_y

    month_labels = [
        "Jan","Feb","Mar","Apr","May","Jun",
        "Jul","Aug","Sep","Oct","Nov","Dec"
    ]

    p = scatter(
        gdf.birthmo,
        gdf.y,

        xlabel = "Month of birth",
        ylabel = "Age at beginning of school year (years)",

        legend = false,
        title  = "(b) Average age at entry into grade 1",

        xticks       = (1:12, month_labels),
        xrotation    = 45,
        tickfontsize = 6,

        xlims = (0, 13),
        ylims = (5.0, 6.35),

        yticks = (
            [5.0, 5.25, 5.5, 5.75, 6.0, 6.25],
            ["5", "5.25", "5.5", "5.75", "6", "6.25"]
        ),

        markercolor = :steelblue,
        markersize  = 4,

        grid = true,

        left_margin   = 10mm,
        bottom_margin = 15mm
    )

    for i in 1:nrow(gdf)

        plot!(
            [gdf.birthmo[i], gdf.birthmo[i]],
            [gdf.yl[i], gdf.yu[i]],

            lw    = 1,
            color = :steelblue,
            label = false
        )
    end

    vline!(
        [6.5],

        color = :black,
        lw = 1,
        linestyle = :dash,
        label = false
    )

    return p
end



function skills_panel(df_fs, outcome_col::Symbol, panel_title::String, ytitle::String)
    local_df = copy(df_fs)

    local_df.schage       = Vector{Union{Missing,Float64}}(local_df.schage)
    local_df.birthmo_jul  = Vector{Union{Missing,Int}}(local_df.birthmo_jul)
    local_df.schagecat2_from5 = Vector{Union{Missing,Int}}(local_df.schagecat2_from5)
    local_df[!, outcome_col] = Vector{Union{Missing,Float64}}(local_df[!, outcome_col])
    local_df.fsweight     = Vector{Union{Missing,Float64}}(local_df.fsweight)

    filter!(row -> !ismissing(row.schage) && 7 <= row.schage <= 14, local_df)

    filter!(row -> !ismissing(row.birthmo_jul) &&
                   !ismissing(row.schagecat2_from5) &&
                   !ismissing(row[outcome_col]) &&
                   !ismissing(row.fsweight), local_df)

    gdf = combine(
        groupby(local_df, [:schagecat2_from5, :birthmo_jul]),
        [outcome_col, :fsweight] =>
            ((y, w) -> (y = sum(y .* w) / sum(w),)) => AsTable
    )
    sort!(gdf, [:schagecat2_from5, :birthmo_jul])

    agecat_labels = Dict(7 => "7-8", 9 => "9-10", 11 => "11-12", 13 => "13-14")
    agecats = sort(unique(gdf.schagecat2_from5))
    n_cats  = length(agecats)

    bar_width   = 0.35
    group_gap   = 0.3
    group_width = 2 * bar_width + group_gap
    centers     = [(i - 1) * group_width + bar_width for i in 1:n_cats]

    jan_jun_vals = Float64[]
    jul_dec_vals = Float64[]
    for cat in agecats
        sub = filter(r -> r.schagecat2_from5 == cat, gdf)
        jan = filter(r -> r.birthmo_jul == 0, sub)
        jul = filter(r -> r.birthmo_jul == 1, sub)
        push!(jan_jun_vals, nrow(jan) > 0 ? jan.y[1] : 0.0)
        push!(jul_dec_vals, nrow(jul) > 0 ? jul.y[1] : 0.0)
    end

    ymax = max(maximum(jan_jun_vals), maximum(jul_dec_vals)) * 1.25

    p = plot(
        title        = panel_title,
        xlabel       = "Age at beginning of school year",
        ylabel       = ytitle,
        legend       = :topleft,
        legendfontsize = 6,
        titlefontsize  = 8,
        xguidefontsize = 7,
        yguidefontsize = 7,
        tickfontsize   = 6,
        xlims  = (-bar_width, centers[end] + bar_width * 2 + group_gap / 2),
        ylims  = (0, ymax),
        xticks = (centers .+ bar_width / 2,
                  [get(agecat_labels, c, string(c)) for c in agecats]),
        yticks = range(0, stop=ymax, length=5) .|> x -> round(x, digits=2),
        grid        = true,
        gridstyle   = :dot,
        gridcolor   = :gray70,
        framestyle  = :box,
        left_margin   = 8mm,
        bottom_margin = 8mm,
        top_margin    = 4mm,
        right_margin  = 2mm,
    )

    for (i, cat) in enumerate(agecats)
        x_left = centers[i] - bar_width / 2
        bar_h  = jan_jun_vals[i]
        plot!(p,
            [x_left, x_left + bar_width, x_left + bar_width, x_left, x_left],
            [0,       0,                  bar_h,              bar_h,  0],
            seriestype = :shape,
            fillcolor  = :gray20,
            linecolor  = :gray20,
            linewidth  = 0.5,
            label      = i == 1 ? "Born Jan - Jun" : false
        )
    end

    for (i, cat) in enumerate(agecats)
        x_left = centers[i] + bar_width / 2 + group_gap / 4
        bar_h  = jul_dec_vals[i]
        plot!(p,
            [x_left, x_left + bar_width, x_left + bar_width, x_left, x_left],
            [0,       0,                  bar_h,              bar_h,  0],
            seriestype = :shape,
            fillcolor  = :gray65,
            linecolor  = :gray65,
            linewidth  = 0.5,
            label      = i == 1 ? "Born Jul - Dec" : false
        )
    end

    return p
end

function figure6_panel_A(df_hl, df_dhs)

    local_hl  = copy(df_hl)
    local_dhs = copy(df_dhs)

    local_hl[!, :year] = Vector{Int}(fill(2018, nrow(local_hl)))

    local_df = vcat(local_hl, local_dhs; cols = :union)

    local_df.age = Int.(local_df.age)

    local_df.birthmo = Int.(local_df.birthmo)

    local_df.birthmo_jul = Int.(local_df.birthmo_jul)

    local_df.year = Int.(local_df.year)

    filter!(
        row ->
            !ismissing(row.age) &&
            25 <= row.age <= 49 &&
            !ismissing(row.birthmo) &&
            (row.birthmo == 6 || row.birthmo == 7),
        local_df
    )

    outcomes = Symbol.([
        "AtLeast1","AtLeast2","AtLeast3","AtLeast4",
        "AtLeast5","AtLeast6","AtLeast7","AtLeast8",
        "AtLeast9","AtLeast10","AtLeast11","AtLeast12",
        "AtLeast13","AtLeast14"
    ])

    june_means = Float64[]
    july_means = Float64[]

    for outcome in outcomes

        local_df[!, outcome] =
            Float64.(local_df[!, outcome])

        june_vals = skipmissing(
            local_df[local_df.birthmo .== 6, outcome]
        )

        july_vals = skipmissing(
            local_df[local_df.birthmo .== 7, outcome]
        )

        push!(june_means, mean(june_vals))

        push!(july_means, mean(july_vals))
    end

    x = 1:length(outcomes)

    p = bar(
        x .- 0.18,
        june_means,

        bar_width = 0.35,

        color = :black,

        label = "Born June",

        xlabel = "Completed at least X years of schooling (=1)",

        ylabel = "Pr (Completed at least X years of schooling)",

        title = "(a) Pr (At least X years) by month of birth",

        xticks = (
            x,
            string.(1:14)
        ),

        xrotation = 45,

        ylims = (0, 1),

        legend = :topright,

        framestyle = :box,

        grid = true,

        left_margin   = 10mm,
        bottom_margin = 12mm,

        size = (700, 450),
        dpi  = 150
    )

    bar!(
        x .+ 0.18,
        july_means,

        bar_width = 0.35,

        color = :gray65,

        label = "Born July"
    )

    return p
end



function figure6_panel_B(df_hl, df_dhs)

    local_hl  = copy(df_hl)
    local_dhs = copy(df_dhs)

    local_hl[!, :year] = Vector{Int}(fill(2018, nrow(local_hl)))

    local_df = vcat(local_hl, local_dhs; cols = :union)

    local_df.age = Int.(local_df.age)

    local_df.birthmo_jul = Int.(local_df.birthmo_jul)

    local_df.birthmo_cent = Float64.(local_df.birthmo_cent)

    local_df.fem = Int.(local_df.fem)

    local_df.year = Int.(local_df.year)

    filter!(
        row ->
            !ismissing(row.age) &&
            25 <= row.age <= 49,
        local_df
    )

    outcomes = Symbol.([
        "AtLeast1","AtLeast2","AtLeast3","AtLeast4",
        "AtLeast5","AtLeast6","AtLeast7","AtLeast8",
        "AtLeast9","AtLeast10","AtLeast11","AtLeast12",
        "AtLeast13","AtLeast14"
    ])

    betas = Float64[]

    ses = Float64[]

    xs = Int[]

    for (i, outcome) in enumerate(outcomes)

        local_df[!, outcome] =
            Float64.(local_df[!, outcome])

        reg_df = select(
            local_df,
            outcome,
            :birthmo_jul,
            :birthmo_cent,
            :age,
            :fem,
            :year
        )

        dropmissing!(reg_df)

        if nrow(reg_df) < 50
            continue
        end

        formula = Term(outcome) ~
            term(:birthmo_jul) +
            term(:birthmo_cent) +
            term(:birthmo_jul) & term(:birthmo_cent) +
            term(:age) +
            term(:fem) +
            term(:year)

        reg = lm(
            formula,
            reg_df
        )

        coefs = coef(reg)

        vcovm = vcov(reg)

        coef_names = coefnames(reg)

        idx = findfirst(
            ==("birthmo_jul"),
            coef_names
        )

        if isnothing(idx)
            continue
        end

        beta = coefs[idx]

        se = sqrt(vcovm[idx, idx])

        push!(xs, i)

        push!(betas, beta)

        push!(ses, se)
    end

    yu = betas .+ 1.96 .* ses

    yl = betas .- 1.96 .* ses

    p = plot(
        xs,
        betas,

        seriestype = :line,

        linewidth = 2,

        marker = :circle,

        markersize = 4,

        color = :black,

        xlabel = "Completed at least X years of schooling (=1)",

        ylabel = "Coefficient on treatment variable",

        title = "(b) Regression discontinuity estimates",

        legend = false,

        xticks = (
            1:14,
            string.(1:14)
        ),

        xrotation = 45,

        framestyle = :box,

        grid = true,

        left_margin   = 10mm,
        bottom_margin = 12mm,

        size = (700, 450),
        dpi  = 150
    )

    for i in eachindex(xs)

        plot!(
            [xs[i], xs[i]],
            [yl[i], yu[i]],

            color = :black,

            lw = 1.5,

            linestyle = :dash,

            label = false
        )
    end

    hline!(
        [0],

        color = :black,

        linestyle = :dash,

        lw = 1,

        label = false
    )

    return p
end


function run_figure1(df, FIGURES)

    @info "Running Figure 1A"
    pA = figure_school_entry_mics_A(df)

    @info "Running Figure 1B"
    pB = figure_school_entry_mics_B(df)

    combined = plot(pA, pB, layout = (1, 2), size = (900, 600), dpi  = 100, left_margin = 12mm)
    output_path = joinpath(FIGURES, "MOB_and_SchoolEntry.png")

    savefig(combined, output_path)

end


function run_figure3(df, FIGURES)
    local_df = copy(df)

    local_df.brthord        = Vector{Union{Missing,Int}}(local_df.brthord)
    local_df.birthmo_child  = Vector{Union{Missing,Int}}(local_df.birthmo_child)
    local_df.momsec         = Vector{Union{Missing,Float64}}(local_df.momsec)

    filter!(row -> coalesce(row.brthord == 1, false) && !ismissing(row.birthmo_child), local_df)

    gdf = combine(groupby(local_df, :birthmo_child), :momsec => mean_se => AsTable)
    sort!(gdf, :birthmo_child)

    gdf.yu = gdf.y .+ 1.96 .* gdf.se_y
    gdf.yl = gdf.y .- 1.96 .* gdf.se_y

    month_labels = [
        "Jan","Feb","Mar","Apr","May","Jun",
        "Jul","Aug","Sep","Oct","Nov","Dec"
    ]

    p = scatter(
        gdf.birthmo_child,
        gdf.y,

        xlabel = "Month of birth of first child",
        ylabel = "Probability mother attained secondary school",

        legend = false,

        xticks       = (1:12, month_labels),
        xrotation    = 0,
        tickfontsize = 7,

        xlims = (0, 13),
        ylims = (0.4, 0.7),
        yticks = ([0.4, 0.5, 0.6, 0.7], ["0.4", "0.5", "0.6", "0.7"]),

        markercolor = :white,
        markerstrokecolor = :gray40,
        markersize  = 4,

        grid = true,
        gridstyle = :dot,
        gridcolor = :gray70,

        framestyle = :box,

        left_margin   = 10mm,
        bottom_margin = 10mm,
        right_margin  = 5mm,
        top_margin    = 5mm,

        size = (700, 450),
        dpi  = 150
    )


    for i in 1:nrow(gdf)
        plot!(
            [gdf.birthmo_child[i], gdf.birthmo_child[i]],
            [gdf.yl[i], gdf.yu[i]],
            lw    = 1,
            color = :gray40,
            label = false
        )

        plot!(
            [gdf.birthmo_child[i] - 0.15, gdf.birthmo_child[i] + 0.15],
            [gdf.yu[i], gdf.yu[i]],
            lw = 1, color = :gray40, label = false
        )
 
        plot!(
            [gdf.birthmo_child[i] - 0.15, gdf.birthmo_child[i] + 0.15],
            [gdf.yl[i], gdf.yl[i]],
            lw = 1, color = :gray40, label = false
        )
    end

    vline!(
        [6.5],
        color     = :black,
        lw        = 1,
        linestyle = :dash,
        label     = false
    )

    output_path = joinpath(FIGURES, "placebo_maternaleducation.png")
    savefig(p, output_path)

end



function run_figure5(df, FIGURES)
    
    local_df = copy(df)
 
    local_df.educ        = Vector{Union{Missing,Float64}}(local_df.educ)
    local_df.birthmo_jul = Vector{Union{Missing,Float64}}(local_df.birthmo_jul)
    local_df.schage      = Vector{Union{Missing,Int}}(local_df.schage)

 
    filter!(
        row ->
            !ismissing(row.educ) &&
            !ismissing(row.birthmo_jul) &&
            !ismissing(row.schage),
        local_df
    )


    ages  = Int[]
    betas = Float64[]
    ses   = Float64[]

    for x in 3:19

        subdf = filter(row -> row.schage == x, local_df)

        if nrow(subdf) < 10
            continue
        end


        reg = lm(
            @formula(educ ~ birthmo_jul),
            subdf
        )

        coefs = coef(reg)
        vcovm = vcov(reg)

        beta = coefs[2]
        se   = sqrt(vcovm[2,2])

        push!(ages,  x)
        push!(betas, beta)
        push!(ses,   se)
    end


    yu = betas .+ 1.96 .* ses
    yl = betas .- 1.96 .* ses


    p = plot(
        ages,
        betas,

        seriestype = :line,

        linewidth = 2,

        marker = :circle,
        markersize = 4,

        color = :steelblue,

        xlabel = "Age at beginning of school year (years)",
        ylabel = "Coefficient on treatment variable",

        title = "",

        legend = false,

        xticks = 3:19,

        yticks = -1:0.5:1.5,

        ylims = (-1.0, 1.5),

        grid = true,

        left_margin   = 12mm,
        bottom_margin = 10mm
    )


    for i in eachindex(ages)

        plot!(
            [ages[i], ages[i]],
            [yl[i], yu[i]],

            color = :steelblue,

            lw = 1.5,

            linestyle = :dash,

            label = false
        )
    end


    hline!(
        [0],

        color = :black,

        lw = 1,

        linestyle = :dash,

        label = false
    )


    output_path = joinpath(
        FIGURES,
        "Reversal_of_fortunes.png"
    )

    savefig(p, output_path)
end



function run_figure6(df_hl, df_dhs, FIGURES)

    @info "Running Figure 6A"

    pA = figure6_panel_A(df_hl, df_dhs)

    @info "Running Figure 6B"

    pB = figure6_panel_B(df_hl, df_dhs)

    combined = plot(
        pA,
        pB,

        layout = (1, 2),

        size = (1000, 500),

        dpi = 150,

        left_margin = 12mm,

        bottom_margin = 12mm
    )

    output_path = joinpath(
        FIGURES,
        "School_attainment.png"
    )

    savefig(
        combined,
        output_path
    )

end


function run_figure18(df_fs, FIGURES)

    pA = skills_panel(df_fs, :readsk_s,  "(a) Sesotho reading skills",   "Pr(foundational reading skills Sesotho)")
    pB = skills_panel(df_fs, :readsk_e,  "(b) English reading skills",   "Pr(foundational reading skills English)")
    pC = skills_panel(df_fs, :numbskill, "(c) Numeracy skills",           "Pr(foundational numeracy skills)")
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
    
    @info "Creating Figure 6..."
    run_figure6(df, df_bh, FIGURES)
    @info "Figure 6 completed."

    @info "Creating Figure 18..."
    run_figure18(df_fs, FIGURES)
    @info "Figure 18 completed."

end