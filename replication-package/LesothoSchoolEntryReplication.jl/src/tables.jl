using DataFrames
using ReadStatTables
using FixedEffectModels
using RegressionTables
using Statistics
using StatsModels
using GLM


function write_table2(fe_models, margins_results, nobs_list, r2_list, output_file)
    lw  = 30
    cw  = 9
    sep = repeat("-", lw + cw * 8)

    ctrl_interaction, ctrl_mob, ctrl_schage = check_controls(fe_models)

    open(output_file, "w") do io
        println(io, sep)
        println(io, "TABLE 2: EFFECT OF AGE AT SCHOOL ENTRY ON CHILDREN'S TIME USE BY GENDER")
        println(io, sep)

        dv_labels = ["Herding animals", "Domestic activities", "Economic activities", "Hazardous labor"]
        dv_units  = ["(hours)", "(hours)", "(hours)", "(= 1)"]

        print(io, rpad("Dependent variable (DV):", lw))
        for label in dv_labels; print(io, lpad(label, 2*cw)); end
        println(io, "")

        print(io, rpad("", lw))
        for u in dv_units; print(io, lpad(u, 2*cw)); end
        println(io, "")

        subsamples = ["Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male"]
        col_nums   = ["(1)", "(2)", "(3)", "(4)", "(5)", "(6)", "(7)", "(8)"]

        print(io, rpad("Subsample", lw))
        for s in subsamples; print(io, lpad(s, cw)); end
        println(io, "")

        print(io, rpad("", lw))
        for c in col_nums; print(io, lpad(c, cw)); end
        println(io, "")
        println(io, sep)

        coefs_row = Float64[]
        ses_row   = Float64[]
        for m in fe_models
            cn = coefnames(m)
            coef_dict = Dict(zip(cn, coef(m)))
            se_dict   = Dict(zip(cn, stderror(m)))
            push!(coefs_row, get(coef_dict, "birthmo_jul", NaN))
            push!(ses_row,   get(se_dict,   "birthmo_jul", NaN))
        end

        print(io, rpad("Born July to December (= 1)", lw))
        for v in coefs_row; print(io, lpad(string(round(v, digits=3)), cw)); end
        println(io, "")

        print(io, rpad("", lw))
        for v in ses_row; print(io, lpad("(" * string(round(v, digits=3)) * ")", cw)); end
        println(io, "")
        println(io, "")

        println(io, rpad("Controls", lw))

        print(io, rpad("  (Born July to December) x MOB", lw))
        for v in ctrl_interaction; print(io, lpad(v, cw)); end
        println(io, "")

        print(io, rpad("  MOB", lw))
        for v in ctrl_mob; print(io, lpad(v, cw)); end
        println(io, "")

        print(io, rpad("  School age indicators", lw))
        for v in ctrl_schage; print(io, lpad(v, cw)); end
        println(io, "")
        println(io, sep)

        print(io, rpad("Mean DV, lower limit", lw))
        for v in margins_results; print(io, lpad(string(round(v, digits=3)), cw)); end
        println(io, "")
        println(io, "")

        print(io, rpad("Observations", lw))
        for n in nobs_list; print(io, lpad(string(n), cw)); end
        println(io, "")

        print(io, rpad("R²", lw))
        for r in r2_list; print(io, lpad(string(round(r, digits=3)), cw)); end
        println(io, "")
        println(io, sep)

    end
end


function run_table2(df, tables_output_path)
    for col in names(df)
        df[!, col] = map(x -> ismissing(x) ? missing : unwrap(x), df[!, col])
    end
    for col in names(df)
        if eltype(skipmissing(df[!, col])) == Float32
            df[!, col] = map(x -> ismissing(x) ? missing : Float64(x), df[!, col])
        end
    end

    filter!(row -> !ismissing(row.schage) && 10 <= row.schage <= 14, df)
    dropmissing!(df, [:hours_he, :hours_wafi, :hours_otherdomestic, :hours_econ])

    df.hours_domestic     = df.hours_wafi .+ df.hours_otherdomestic
    df.birthmo_jul_x_cent = df.birthmo_jul .* df.birthmo_cent
    df.schage_cat         = string.(df.schage)

    dvs      = [:hours_he, :hours_domestic, :hours_econ, :hazard]
    dv_names = ["Herding", "Domestic", "Econ", "Hazard"]

    fe_models       = []
    margins_results = Float64[]
    nobs_list       = Int[]
    r2_list         = Float64[]

    for dv in dvs
        for is_fem in [1, 0]
            df_sub = filter(row -> !ismissing(row.fem) && row.fem == is_fem, df)
            dropmissing!(df_sub, [dv, :birthmo_jul, :birthmo_cent, :schage])

            formula_fe = term(dv) ~ term(:birthmo_jul) * term(:birthmo_cent) + fe(:schage)
            m_fe = reg(df_sub, formula_fe, Vcov.robust())
            push!(fe_models, m_fe)
            push!(nobs_list, nobs(m_fe))
            push!(r2_list, r2(m_fe))

            formula_lm = term(dv) ~ term(:birthmo_jul) + term(:birthmo_cent) +
                         term(:birthmo_jul_x_cent) + term(:schage_cat)
            m_lm = lm(formula_lm, df_sub)

            marg = calculate_margin(m_lm, df_sub)
            push!(margins_results, marg)
        end
    end

    output_file = joinpath(tables_output_path, "opportunity_costs.txt")
    touch(output_file)
    write_table2(fe_models, margins_results, nobs_list, r2_list, output_file)
end


function run_all_tables(MICS_DATA, TABLES)

    include(joinpath(@__DIR__, "..", "src", "utils.jl"))
    df = DataFrame(readstat(joinpath(MICS_DATA, "mics6fs.dta")))

    @info "Creating Table 2..."
    run_table2(df, TABLES)
    @info "Table 2 completed."

end