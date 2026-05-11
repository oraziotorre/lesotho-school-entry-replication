function run_all()
    
    # Useful Paths
    REPLICATION_ROOT = normpath(joinpath(@__DIR__, "..", ".."))
    ORIGINAL = joinpath(REPLICATION_ROOT, "original-replication")

    RAW_DATA = joinpath(ORIGINAL, "Raw_data")
    MICS_DATA = joinpath(RAW_DATA, "MICS")

    OUTPUT = joinpath(@__DIR__, "..", "output")
    TABLES = joinpath(OUTPUT, "tables")
    FIGURES = joinpath(OUTPUT, "figures")
    mkpath(TABLES)
    mkpath(FIGURES)
    

    # Loading
    include(joinpath(@__DIR__, "..", "src", "tables.jl"))
    include(joinpath(@__DIR__, "..", "src", "figures.jl"))


    # Running
    run_all_figures(MICS_DATA, FIGURES)
    run_all_tables(MICS_DATA, TABLES)

end