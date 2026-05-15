using TestItemRunner

using LesothoSchoolEntryReplication
 

@run_package_tests
 

@testitem "mean_se computes correctly" begin

    x = [1.0, 2.0, 3.0, 4.0]

    out = mean_se(x)

    @test out.y ≈ 2.5
    
end


@testitem "figure_1A works" begin

    df = mock_main_df()

    p = figure_1A(df)

    @test true

end


 @testitem "figure_1B works" begin

    df = mock_main_df()

    p = figure_1B(df)

    @test true
end


@testitem "run_figure1 works" begin

    df = mock_main_df()

    mktempdir() do tmpdir

        run_figure1(df, tmpdir)

        outfile = joinpath(
            tmpdir,
            "MOB_and_SchoolEntry.png"
        )

        @test isfile(outfile)
    end
end


@testitem "run_figure3 works" begin

    df = mock_bh_df()

    mktempdir() do tmpdir

        run_figure3(df, tmpdir)

        outfile = joinpath(
            tmpdir,
            "placebo_maternaleducation.png"
        )

        @test isfile(outfile)
    end
end


@testitem "run_figure5 works" begin

    df = mock_main_df()

    mktempdir() do tmpdir

        run_figure5(df, tmpdir)

        outfile = joinpath(
            tmpdir,
            "Reversal_of_fortunes.png"
        )

        @test isfile(outfile)
    end
end


@testitem "skills_panel works" begin

    df_fs = mock_fs_df()

    p = skills_panel(
        df_fs,
        :readsk_s,
        "Test title",
        "Test ylabel"
    )

    @test true
end


@testitem "run_figure18 works" begin

    df_fs = mock_fs_df()

    mktempdir() do tmpdir

        run_figure18(df_fs, tmpdir)

        outfile = joinpath(
            tmpdir,
            "skills_kids.png"
        )

        @test isfile(outfile)
    end
end


@testitem "run_table2 works" begin

    df = mock_fs_df()

    mktempdir() do tmpdir

        run_table2(df, tmpdir)

        outfile = joinpath(
            tmpdir,
            "opportunity_costs.txt"
        )

        @test isfile(outfile)
    end
end