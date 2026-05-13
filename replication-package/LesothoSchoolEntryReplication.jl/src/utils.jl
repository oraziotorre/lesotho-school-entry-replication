using DataFrames
using Statistics
using ReadStatTables
using Plots
using Plots.PlotMeasures
using GLM
using StatsModels

const MONTH_LABELS = [
    "Jan","Feb","Mar","Apr","May","Jun",
    "Jul","Aug","Sep","Oct","Nov","Dec"
]

const FIG_STYLE = (;
    grid = true,
    gridstyle = :dot,
    gridcolor = :gray70,

    framestyle = :box,

    legend = :none,

    left_margin   = 10mm,
    bottom_margin = 10mm,
    right_margin  = 5mm,
    top_margin    = 5mm,

    dpi = 150
)


weighted_mean(x, w) = sum(x .* w) / sum(w)


function mean_se(x)
    vals = collect(skipmissing(x))
    n = length(vals)
    n == 0 && return (y = missing, se_y = missing)
    n == 1 && return (y = vals[1], se_y = 0.0)
    m = mean(vals)
    se = std(vals) / sqrt(n)
    return (y = m, se_y = se)
end


function add_ci!(
    df;
    ycol = :y,
    secol = :se_y,
    z = 1.96
)

    df.yu = df[!, ycol] .+ z .* df[!, secol]
    df.yl = df[!, ycol] .- z .* df[!, secol]

    return df
end


function regression_by_group(
    df;

    groupvar,
    formula,

    minobs = 10
)

    groups = sort(unique(skipmissing(df[!, groupvar])))

    out = DataFrame(
        group = Int[],
        beta = Float64[],
        se = Float64[]
    )

    for g in groups

        subdf = filter(row -> row[groupvar] == g, df)

        nrow(subdf) < minobs && continue

        reg = lm(formula, subdf)

        beta = coef(reg)[2]
        se   = sqrt(vcov(reg)[2,2])

        push!(
            out,
            (
                group = g,
                beta = beta,
                se = se
            )
        )
    end

    add_ci!(out, ycol = :beta, secol = :se)

    return out
end


function grouped_weighted_mean(
    df;

    groupvars,
    value,
    weight
)

    combine(
        groupby(df, groupvars),

        [value, weight] =>
            ((y, w) -> (
                y = weighted_mean(y, w),
            )) => AsTable
    )
end


# =========================================================
# PLOTTING UTILITIES
# =========================================================

function add_errorbars!(
    p,
    x,
    yl,
    yu;

    color = :gray40,
    cap = 0.15,
    lw = 1
)

    for i in eachindex(x)

        plot!(
            p,
            [x[i], x[i]],
            [yl[i], yu[i]],

            color = color,
            lw = lw,
            label = false
        )

        plot!(
            p,
            [x[i] - cap, x[i] + cap],
            [yu[i], yu[i]],

            color = color,
            lw = lw,
            label = false
        )

        plot!(
            p,
            [x[i] - cap, x[i] + cap],
            [yl[i], yl[i]],

            color = color,
            lw = lw,
            label = false
        )
    end

    return p
end



function add_reference_line!(
    p;
    v = nothing,
    h = nothing,

    color = :black,
    lw = 1,
    linestyle = :dash
)

    !isnothing(v) && vline!(
        p,
        [v],

        color = color,
        lw = lw,
        linestyle = linestyle,
        label = false
    )

    !isnothing(h) && hline!(
        p,
        [h],

        color = color,
        lw = lw,
        linestyle = linestyle,
        label = false
    )

    return p
end



function scatter_ci_plot(
    gdf;
    x,
    y = :y,
    xlabel = "",
    ylabel = "",
    title = "",
    xticks,
    yticks = nothing,
    xlims,
    ylims,
    vline_at = nothing,
    markercolor = :white,
    markerstrokecolor = :gray40,
    ci_color = :gray40,
    markersize = 4,
    xrotation = 0,
    tickfontsize = 7,
    size = (700, 450)
)

    p = scatter(
        gdf[!, x],
        gdf[!, y];
        xlabel       = xlabel,
        ylabel       = ylabel,
        title        = title,
        xticks       = xticks,
        yticks       = yticks,
        xrotation    = xrotation,
        tickfontsize = tickfontsize,
        xlims        = xlims,
        ylims        = ylims,
        markercolor       = markercolor,
        markerstrokecolor = markerstrokecolor,
        markersize   = markersize,
        size         = size,
        legend       = :none,
        framestyle   = :box,
        dpi          = 150,
        left_margin   = 10mm,
        bottom_margin = 10mm,
        right_margin  = 5mm,
        top_margin    = 5mm,
    )

    # Apply grid style separately — avoids recipe dispatch ambiguity
    plot!(p;
        grid      = true,
        gridstyle = :dot,
        gridcolor = :gray70,
    )

    add_errorbars!(p, gdf[!, x], gdf.yl, gdf.yu; color = ci_color)
    add_reference_line!(p; v = vline_at)

    return p
end


# =========================================================
# TABLE UTILITIES
# =========================================================


function calculate_margin(fitted_lm, df_sub::DataFrame)
    df_margin = filter(row ->
        !ismissing(row.birthmo)      &&
        row.birthmo <= 6             &&
        !ismissing(row.birthmo_jul)  &&
        !ismissing(row.birthmo_cent) &&
        !ismissing(row.schage),
        df_sub)
    df_margin = copy(df_margin)
    df_margin.birthmo_cent .= 0.0
    df_margin.birthmo_jul_x_cent .= 0.0

    preds = GLM.predict(fitted_lm, df_margin)
    return mean(preds)
end



function check_controls(fe_models)   
    controls_interaction = String[]
    controls_mob         = String[]
    controls_schage      = String[]

    for m in fe_models
        cn = coefnames(m)

        # Check (Born July to December) x MOB = interaction birthmo_jul & birthmo_cent
        has_interaction = any(occursin("birthmo_jul", c) && occursin("birthmo_cent", c) for c in cn)

        # Check MOB = birthmo_cent is in the model
        has_mob = "birthmo_cent" in cn

        # Check School age indicators = schage absorbed as fixed effect
        fe_names = String.(m.fekeys)
        has_schage_fe = any(occursin("schage", f) for f in fe_names)

        push!(controls_interaction, has_interaction ? "✓" : "")
        push!(controls_mob,         has_mob         ? "✓" : "")
        push!(controls_schage,      has_schage_fe   ? "✓" : "")
    end

    return controls_interaction, controls_mob, controls_schage
end

unlabel(x) = ismissing(x) ? missing : Float64(ReadStatTables.value(x))
unlabel_int(x) = ismissing(x) ? missing : Int(ReadStatTables.value(x))


