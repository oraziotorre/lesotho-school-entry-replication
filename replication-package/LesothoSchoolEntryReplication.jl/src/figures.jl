########################################################
# FIGURES
########################################################

using DataFrames
using ReadStatTables
using Statistics
using Plots

########################################################
# Figure 1A + 1B
########################################################

function figure_school_entry_mics(MICS_DATA, FIGURES)

    println("Running Figure 1...")

    ####################################################
    # PANEL A
    ####################################################

    df = DataFrame(
        readstat(joinpath(MICS_DATA, "mics6hl.dta"))
    )

    ####################################################
    # CONVERT VARIABLES
    ####################################################

    df.birthyr = [
        ismissing(x) ? missing : Int(x)
        for x in df.birthyr
    ]

    df.birthmoyr = [
        ismissing(x) ? missing : Int(x)
        for x in df.birthmoyr
    ]

    df.grade1ormore = [
        ismissing(x) ? missing : Float64(x)
        for x in df.grade1ormore
    ]

    ####################################################
    # FILTER
    ####################################################

    filter!(
        row ->
            !ismissing(row.birthyr) &&
            row.birthyr >= 2011 &&
            row.birthyr <= 2013,
        df
    )

    ####################################################
    # COLLAPSE
    ####################################################

    gdf = combine(
        groupby(df, :birthmoyr),
        :grade1ormore => (
            x -> begin

                vals = collect(skipmissing(x))

                (
                    y = mean(vals),
                    se_y = std(vals) / sqrt(length(vals))
                )

            end
        ) => AsTable
    )

    sort!(gdf, :birthmoyr)

    gdf.yu = gdf.y .+ 1.96 .* gdf.se_y
    gdf.yl = gdf.y .- 1.96 .* gdf.se_y
    gdf.rank = 1:nrow(gdf)

    ####################################################
    # LABELS
    ####################################################

    labelsA = [
        "Jan 2011","Feb 2011","Mar 2011","Apr 2011",
        "May 2011","Jun 2011","Jul 2011","Aug 2011",
        "Sep 2011","Oct 2011","Nov 2011","Dec 2011",
        "Jan 2012","Feb 2012","Mar 2012","Apr 2012",
        "May 2012","Jun 2012","Jul 2012","Aug 2012",
        "Sep 2012","Oct 2012","Nov 2012","Dec 2012",
        "Jan 2013","Feb 2013","Mar 2013","Apr 2013",
        "May 2013","Jun 2013","Jul 2013","Aug 2013",
        "Sep 2013","Oct 2013","Nov 2013","Dec 2013"
    ]

    ####################################################
    # PANEL A PLOT
    ####################################################

    p1 = scatter(
        gdf.rank,
        gdf.y,
        xlabel = "Month and year of birth",
        ylabel = "Probability currently attending grade 1 or higher",
        title = "(a) Entry into primary school",
        legend = false,
        xticks = (1:36, labelsA),
        xrotation = 90,
        markersize = 4
    )

    vline!(
        p1,
        [18.5],
        linestyle = :dash,
        color = :black
    )

    for i in 1:nrow(gdf)

        plot!(
            p1,
            [gdf.rank[i], gdf.rank[i]],
            [gdf.yl[i], gdf.yu[i]],
            lw = 1,
            color = :black
        )

    end

    ####################################################
    # PANEL B
    ####################################################

    df2 = DataFrame(
        readstat(joinpath(MICS_DATA, "mics6hl.dta"))
    )

    ####################################################
    # CONVERT VARIABLES
    ####################################################

    df2.grade = [
        ismissing(x) ? missing : Int(x)
        for x in df2.grade
    ]

    df2.grade_r = [
        ismissing(x) ? missing : Int(x)
        for x in df2.grade_r
    ]

    df2.birthmo = [
        ismissing(x) ? missing : Int(x)
        for x in df2.birthmo
    ]

    df2.schage = [
        ismissing(x) ? missing : Float64(x)
        for x in df2.schage
    ]

    ####################################################
    # FILTER
    ####################################################

    filter!(
        row ->
            !ismissing(row.grade) &&
            !ismissing(row.grade_r) &&
            row.grade == 1 &&
            row.grade_r == 0,
        df2
    )

    ####################################################
    # COLLAPSE
    ####################################################

    gdf2 = combine(
        groupby(df2, :birthmo),
        :schage => (
            x -> begin

                vals = collect(skipmissing(x))

                (
                    y = mean(vals),
                    se_y = std(vals) / sqrt(length(vals))
                )

            end
        ) => AsTable
    )

    sort!(gdf2, :birthmo)

    gdf2.yu = gdf2.y .+ 1.96 .* gdf2.se_y
    gdf2.yl = gdf2.y .- 1.96 .* gdf2.se_y

    ####################################################
    # LABELS
    ####################################################

    labelsB = [
        "Jan","Feb","Mar","Apr","May","Jun",
        "Jul","Aug","Sep","Oct","Nov","Dec"
    ]

    ####################################################
    # PANEL B PLOT
    ####################################################

    p2 = scatter(
        gdf2.birthmo,
        gdf2.y,
        xlabel = "Month of birth",
        ylabel = "Age at beginning of school year (years)",
        title = "(b) Average age at entry into grade 1",
        legend = false,
        xticks = (1:12, labelsB),
        yticks = 5:0.25:6.25,
        markersize = 4
    )

    vline!(
        p2,
        [6.5],
        linestyle = :dash,
        color = :black
    )

    for i in 1:nrow(gdf2)

        plot!(
            p2,
            [gdf2.birthmo[i], gdf2.birthmo[i]],
            [gdf2.yl[i], gdf2.yu[i]],
            lw = 1,
            color = :black
        )

    end

    ####################################################
    # COMBINE
    ####################################################

    final_plot = plot(
        p1,
        p2,
        layout = (1,2),
        size = (1600,700)
    )

    savefig(
        final_plot,
        joinpath(FIGURES, "MOB_and_SchoolEntry.jpg")
    )

    println("Figure 1 completed.")

end

########################################################
# RUN ALL FIGURES
########################################################

function run_all_figures(MICS_DATA, FIGURES)

    println("===================================")
    println("RUNNING ALL FIGURES")
    println("===================================")

    figure_school_entry_mics(
        MICS_DATA,
        FIGURES
    )

    println("===================================")
    println("ALL FIGURES COMPLETED")
    println("===================================")

end