using DataFrames
using Statistics
using ReadStatTables


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


function mean_se(x)
    vals = collect(skipmissing(x))
    n = length(vals)
    n == 0 && return (y = missing, se_y = missing)
    n == 1 && return (y = vals[1], se_y = 0.0)
    m = mean(vals)
    se = std(vals) / sqrt(n)
    return (y = m, se_y = se)
end
