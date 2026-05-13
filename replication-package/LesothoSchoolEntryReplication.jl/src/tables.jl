using DataFrames
using ReadStatTables
using FixedEffectModels
using RegressionTables
using Statistics
using StatsModels
using GLM


function write_table2(fe_models, margins_results, nobs_list, r2_list, output_file)
    lw, cw = 30, 9
    sep = "─"^(lw + cw * 8)

    ctrl_interaction, ctrl_mob, ctrl_schage = check_controls(fe_models)

    dv_labels  = ["Herding animals", "Domestic activities", "Economic activities", "Hazardous labor"]
    dv_units   = ["(hours)", "(hours)", "(hours)", "(= 1)"]
    subsamples = repeat(["Female", "Male"], 4)
    col_nums   = ["($i)" for i in 1:8]

    function get_coef_se(m)
        vals = Dict(zip(coefnames(m), coef(m)))
        errs = Dict(zip(coefnames(m), stderror(m)))
        get(vals, "birthmo_jul", NaN), get(errs, "birthmo_jul", NaN)
    end

    coef_se = get_coef_se.(fe_models)
    coefs   = first.(coef_se)
    ses     = last.(coef_se)

    fmt(x)   = string(round(x, digits=3))
    padl(s)  = lpad(s, cw)
    padl2(s) = lpad(s, 2cw)

    open(output_file, "w") do io
        println(io, sep)
        println(io, "TABLE 2: EFFECT OF AGE AT SCHOOL ENTRY ON CHILDREN'S TIME USE BY GENDER")
        println(io, sep)

        print(io, rpad("Dependent variable (DV):", lw))
        foreach(l -> print(io, padl2(l)), dv_labels)
        println(io)

        print(io, rpad("", lw))
        foreach(u -> print(io, padl2(u)), dv_units)
        println(io)

        print(io, rpad("Subsample", lw))
        foreach(s -> print(io, padl(s)), subsamples)
        println(io)

        print(io, rpad("", lw))
        foreach(c -> print(io, padl(c)), col_nums)
        println(io)
        println(io, sep)

        print(io, rpad("Born July to December (= 1)", lw))
        foreach(v -> print(io, padl(fmt(v))), coefs)
        println(io)

        print(io, rpad("", lw))
        foreach(v -> print(io, padl("($(fmt(v)))")), ses)
        println(io)
        println(io)

        println(io, rpad("Controls", lw))
        for (label, vals) in [
            ("  (Born July to December) x MOB", ctrl_interaction),
            ("  MOB",                           ctrl_mob),
            ("  School age indicators",         ctrl_schage),
        ]
            print(io, rpad(label, lw))
            foreach(v -> print(io, padl(v)), vals)
            println(io)
        end
        println(io, sep)

        print(io, rpad("Mean DV, lower limit", lw))
        foreach(v -> print(io, padl(fmt(v))), margins_results)
        println(io)
        println(io)

        print(io, rpad("Observations", lw))
        foreach(n -> print(io, padl(string(n))), nobs_list)
        println(io)

        print(io, rpad("R²", lw))
        foreach(r -> print(io, padl(fmt(r))), r2_list)
        println(io)
        println(io, sep)
    end
end


function run_table2(df, tables_output_path)
    
    for col in names(df)
        df[!, col] = map(x -> ismissing(x) ? missing : unwrap(x), df[!, col])
    end
    
    for col in names(df)
        eltype(skipmissing(df[!, col])) == Float32 || continue
        df[!, col] = map(x -> ismissing(x) ? missing : Float64(x), df[!, col])
    end

    filter!(row -> !ismissing(row.schage) && 10 <= row.schage <= 14, df)
    dropmissing!(df, [:hours_he, :hours_wafi, :hours_otherdomestic, :hours_econ])

    df.hours_domestic     = df.hours_wafi .+ df.hours_otherdomestic
    df.birthmo_jul_x_cent = df.birthmo_jul .* df.birthmo_cent   # manual interaction for lm()
    df.schage_cat         = string.(df.schage)                   # categorical FE for lm()

    dvs = [:hours_he, :hours_domestic, :hours_econ, :hazard]

    fe_models       = []
    margins_results = Float64[]
    nobs_list       = Int[]
    r2_list         = Float64[]

    for dv in dvs, is_fem in (1, 0)
        df_sub = filter(row -> !ismissing(row.fem) && row.fem == is_fem, df)
        dropmissing!(df_sub, [dv, :birthmo_jul, :birthmo_cent, :schage])

        m_fe = reg(df_sub,
            term(dv) ~ term(:birthmo_jul) * term(:birthmo_cent) + fe(:schage),
            Vcov.robust())

        m_lm = lm(
            term(dv) ~ term(:birthmo_jul) + term(:birthmo_cent) +
                       term(:birthmo_jul_x_cent) + term(:schage_cat),
            df_sub)

        push!(fe_models, m_fe)
        push!(nobs_list, nobs(m_fe))
        push!(r2_list,   r2(m_fe))
        push!(margins_results, calculate_margin(m_lm, df_sub))
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