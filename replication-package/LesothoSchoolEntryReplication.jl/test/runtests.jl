using TestItemRunner
using LesothoSchoolEntryReplication

@run_package_tests

@testitem "Esempio" begin
    
    e = add_numbers(2,3)
    @test true

end