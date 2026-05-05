* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                         ///
  int     country            1-3      ///
  int     year               4-7      ///
  double  sample             8-16     ///
  double  serial             17-28    ///
  int     persons            29-32    ///
  double  hhwt               33-40    ///
  byte    subsamp            41-42    ///
  byte    gq                 43-44    ///
  byte    unrel              45-45    ///
  byte    urban              46-46    ///
  byte    regionw            47-48    ///
  long    geolev1            49-54    ///
  double  geolev2            55-63    ///
  double  popdensgeo1        64-71    ///
  double  popdensgeo2        72-83    ///
  double  areamollwgeo1      84-93    ///
  double  areamollwgeo2      94-103   ///
  long    geo1_ls            104-109  ///
  long    geo1_ls1996        110-115  ///
  int     geo1_ls2006        116-118  ///
  double  geo2_ls            119-127  ///
  long    geo2_ls2006        128-133  ///
  byte    dhs_ipumsi_ls      134-135  ///
  byte    ownership          136-136  ///
  int     ownershipd         137-139  ///
  byte    electric           140-140  ///
  byte    watsup             141-142  ///
  byte    fuelcook           143-144  ///
  byte    fuelheat           145-146  ///
  byte    phone              147-147  ///
  byte    cell               148-148  ///
  byte    trash              149-150  ///
  byte    autos              151-151  ///
  byte    refrig             152-152  ///
  byte    tv                 153-154  ///
  byte    radio              155-155  ///
  byte    rooms              156-157  ///
  byte    toilet             158-159  ///
  int     floor              160-162  ///
  int     wall               163-165  ///
  byte    roof               166-167  ///
  byte    mortnum            168-168  ///
  byte    anymort            169-169  ///
  byte    hhtype             170-171  ///
  byte    nfams              172-172  ///
  byte    ncouples           173-173  ///
  byte    nmothers           174-174  ///
  byte    nfathers           175-175  ///
  int     headloc            176-178  ///
  int     pernum             179-182  ///
  double  perwt              183-190  ///
  byte    resident           191-191  ///
  int     momloc             192-194  ///
  int     poploc             195-197  ///
  int     sploc              198-200  ///
  byte    parrule            201-202  ///
  byte    sprule             203-204  ///
  byte    stepmom            205-205  ///
  byte    steppop            206-206  ///
  byte    polymal            207-207  ///
  byte    poly2nd            208-208  ///
  int     famunit            209-212  ///
  int     famsize            213-216  ///
  byte    nchild             217-218  ///
  byte    nchlt5             219-220  ///
  byte    eldch              221-222  ///
  byte    yngch              223-224  ///
  byte    relate             225-225  ///
  int     related            226-229  ///
  int     age                230-232  ///
  byte    age2               233-234  ///
  byte    sex                235-235  ///
  byte    marst              236-236  ///
  int     marstd             237-239  ///
  byte    consens            240-240  ///
  byte    polygam            241-242  ///
  byte    agemarr            243-244  ///
  int     birthyr            245-248  ///
  byte    birthmo            249-250  ///
  byte    chborn             251-252  ///
  byte    chsurv             253-254  ///
  byte    chbornf            255-256  ///
  byte    chbornm            257-258  ///
  byte    chsurvf            259-260  ///
  byte    chsurvm            261-262  ///
  byte    lastbmo            263-264  ///
  int     lastbyr            265-268  ///
  byte    lastbsex           269-269  ///
  byte    chdead             270-271  ///
  byte    chdeadfem          272-273  ///
  byte    chdeadmale         274-275  ///
  byte    lastbmort          276-276  ///
  byte    mortmot            277-277  ///
  byte    mortfat            278-278  ///
  byte    homechild          279-280  ///
  byte    homefem            281-282  ///
  byte    homemale           283-284  ///
  byte    awaychild          285-286  ///
  byte    awayfem            287-288  ///
  byte    awaymale           289-290  ///
  byte    nativity           291-291  ///
  long    bplcountry         292-296  ///
  byte    citizen            297-297  ///
  byte    school             298-298  ///
  byte    lit                299-299  ///
  byte    edattain           300-300  ///
  int     edattaind          301-303  ///
  byte    yrschool           304-305  ///
  byte    educls             306-307  ///
  byte    empstat            308-308  ///
  int     empstatd           309-311  ///
  byte    labforce           312-312  ///
  byte    occisco            313-314  ///
  int     occ                315-318  ///
  int     indgen             319-321  ///
  long    ind                322-326  ///
  byte    classwk            327-327  ///
  int     classwkd           328-330  ///
  byte    empsect            331-332  ///
  byte    migrate0           333-334  ///
  long    migctry0           335-339  ///
  byte    migyrs1            340-341  ///
  byte    disabled           342-342  ///
  byte    disemp             343-343  ///
  byte    disblnd            344-344  ///
  byte    disdeaf            345-345  ///
  byte    dismute            346-346  ///
  byte    dislowr            347-347  ///
  byte    dismntl            348-348  ///
  byte    dispsyc            349-349  ///
  byte    disorig            350-351  ///
  byte    ls1996a_status     352-352  ///
  byte    ls1996a_rescntry   353-354  ///
  byte    ls1996a_absdur     355-355  ///
  byte    ls1996a_splive     356-356  ///
  byte    ls1996a_citizen    357-357  ///
  byte    ls1996a_bpl        358-359  ///
  byte    ls1996a_res10yr    360-361  ///
  byte    ls1996a_resdur     362-363  ///
  byte    ls1996a_school     364-364  ///
  byte    ls1996a_edattain   365-366  ///
  byte    ls1996a_activity   367-368  ///
  byte    ls1996a_empstat12  369-370  ///
  byte    ls1996a_sector     371-371  ///
  int     ls1996a_occ        372-374  ///
  byte    ls1996a_wkloc1     375-376  ///
  byte    ls1996a_wkloc2     377-378  ///
  byte    ls1996a_wklocza    379-379  ///
  byte    ls1996a_wkdurza    380-381  ///
  byte    ls2006a_status     382-382  ///
  byte    ls2006a_rescntry   383-384  ///
  byte    ls2006a_absdur     385-386  ///
  byte    ls2006a_citizen    387-388  ///
  byte    ls2006a_bpl        389-390  ///
  byte    ls2006a_res10yr    391-392  ///
  byte    ls2006a_resdur     393-394  ///
  byte    ls2006a_school     395-395  ///
  byte    ls2006a_edattain   396-397  ///
  byte    ls2006a_lit        398-398  ///
  byte    ls2006a_activity   399-400  ///
  byte    ls2006a_empstat12  401-402  ///
  byte    ls2006a_classwk    403-403  ///
  byte    ls2006a_occ        404-405  ///
  byte    ls2006a_ind        406-407  ///
  byte    ls2006a_wkloc      408-409  ///
  byte    ls2006a_wkurb      410-411  ///
  byte    ls2006a_work10yr   412-412  ///
  byte    ls2006a_workdur    413-414  ///
  int     famsize_head       415-418  ///
  int     famsize_mom        419-422  ///
  int     famsize_pop        423-426  ///
  int     famsize_sp         427-430  ///
  byte    nchild_head        431-432  ///
  byte    nchild_mom         433-434  ///
  byte    nchild_pop         435-436  ///
  byte    nchild_sp          437-438  ///
  byte    nchlt5_head        439-440  ///
  byte    nchlt5_mom         441-442  ///
  byte    nchlt5_pop         443-444  ///
  byte    nchlt5_sp          445-446  ///
  byte    eldch_head         447-448  ///
  byte    eldch_mom          449-450  ///
  byte    eldch_pop          451-452  ///
  byte    eldch_sp           453-454  ///
  byte    yngch_head         455-456  ///
  byte    yngch_mom          457-458  ///
  byte    yngch_pop          459-460  ///
  byte    yngch_sp           461-462  ///
  byte    relate_head        463-463  ///
  byte    relate_mom         464-464  ///
  byte    relate_pop         465-465  ///
  byte    relate_sp          466-466  ///
  int     related_head       467-470  ///
  int     related_mom        471-474  ///
  int     related_pop        475-478  ///
  int     related_sp         479-482  ///
  int     age_head           483-485  ///
  int     age_mom            486-488  ///
  int     age_pop            489-491  ///
  int     age_sp             492-494  ///
  byte    sex_head           495-495  ///
  byte    sex_mom            496-496  ///
  byte    sex_pop            497-497  ///
  byte    sex_sp             498-498  ///
  byte    marst_head         499-499  ///
  byte    marst_mom          500-500  ///
  byte    marst_pop          501-501  ///
  byte    marst_sp           502-502  ///
  int     marstd_head        503-505  ///
  int     marstd_mom         506-508  ///
  int     marstd_pop         509-511  ///
  int     marstd_sp          512-514  ///
  int     birthyr_head       515-518  ///
  int     birthyr_mom        519-522  ///
  int     birthyr_pop        523-526  ///
  int     birthyr_sp         527-530  ///
  byte    birthmo_head       531-532  ///
  byte    birthmo_mom        533-534  ///
  byte    birthmo_pop        535-536  ///
  byte    birthmo_sp         537-538  ///
  byte    chbornf_head       539-540  ///
  byte    chbornf_mom        541-542  ///
  byte    chbornf_pop        543-544  ///
  byte    chbornf_sp         545-546  ///
  byte    chbornm_head       547-548  ///
  byte    chbornm_mom        549-550  ///
  byte    chbornm_pop        551-552  ///
  byte    chbornm_sp         553-554  ///
  byte    chsurvf_head       555-556  ///
  byte    chsurvf_mom        557-558  ///
  byte    chsurvf_pop        559-560  ///
  byte    chsurvf_sp         561-562  ///
  byte    chsurvm_head       563-564  ///
  byte    chsurvm_mom        565-566  ///
  byte    chsurvm_pop        567-568  ///
  byte    chsurvm_sp         569-570  ///
  byte    lastbmo_head       571-572  ///
  byte    lastbmo_mom        573-574  ///
  byte    lastbmo_pop        575-576  ///
  byte    lastbmo_sp         577-578  ///
  int     lastbyr_head       579-582  ///
  int     lastbyr_mom        583-586  ///
  int     lastbyr_pop        587-590  ///
  int     lastbyr_sp         591-594  ///
  byte    lastbsex_head      595-595  ///
  byte    lastbsex_mom       596-596  ///
  byte    lastbsex_pop       597-597  ///
  byte    lastbsex_sp        598-598  ///
  byte    chdead_head        599-600  ///
  byte    chdead_mom         601-602  ///
  byte    chdead_pop         603-604  ///
  byte    chdead_sp          605-606  ///
  byte    chdeadfem_head     607-608  ///
  byte    chdeadfem_mom      609-610  ///
  byte    chdeadfem_pop      611-612  ///
  byte    chdeadfem_sp       613-614  ///
  byte    chdeadmale_head    615-616  ///
  byte    chdeadmale_mom     617-618  ///
  byte    chdeadmale_pop     619-620  ///
  byte    chdeadmale_sp      621-622  ///
  byte    lastbmort_head     623-623  ///
  byte    lastbmort_mom      624-624  ///
  byte    lastbmort_pop      625-625  ///
  byte    lastbmort_sp       626-626  ///
  byte    mortmot_head       627-627  ///
  byte    mortmot_mom        628-628  ///
  byte    mortmot_pop        629-629  ///
  byte    mortmot_sp         630-630  ///
  byte    mortfat_head       631-631  ///
  byte    mortfat_mom        632-632  ///
  byte    mortfat_pop        633-633  ///
  byte    mortfat_sp         634-634  ///
  byte    homechild_head     635-636  ///
  byte    homechild_mom      637-638  ///
  byte    homechild_pop      639-640  ///
  byte    homechild_sp       641-642  ///
  byte    homefem_head       643-644  ///
  byte    homefem_mom        645-646  ///
  byte    homefem_pop        647-648  ///
  byte    homefem_sp         649-650  ///
  byte    homemale_head      651-652  ///
  byte    homemale_mom       653-654  ///
  byte    homemale_pop       655-656  ///
  byte    homemale_sp        657-658  ///
  byte    awaychild_head     659-660  ///
  byte    awaychild_mom      661-662  ///
  byte    awaychild_pop      663-664  ///
  byte    awaychild_sp       665-666  ///
  byte    awayfem_head       667-668  ///
  byte    awayfem_mom        669-670  ///
  byte    awayfem_pop        671-672  ///
  byte    awayfem_sp         673-674  ///
  byte    awaymale_head      675-676  ///
  byte    awaymale_mom       677-678  ///
  byte    awaymale_pop       679-680  ///
  byte    awaymale_sp        681-682  ///
  byte    nativity_head      683-683  ///
  byte    nativity_mom       684-684  ///
  byte    nativity_pop       685-685  ///
  byte    nativity_sp        686-686  ///
  long    bplcountry_head    687-691  ///
  long    bplcountry_mom     692-696  ///
  long    bplcountry_pop     697-701  ///
  long    bplcountry_sp      702-706  ///
  byte    citizen_head       707-707  ///
  byte    citizen_mom        708-708  ///
  byte    citizen_pop        709-709  ///
  byte    citizen_sp         710-710  ///
  byte    school_head        711-711  ///
  byte    school_mom         712-712  ///
  byte    school_pop         713-713  ///
  byte    school_sp          714-714  ///
  byte    lit_head           715-715  ///
  byte    lit_mom            716-716  ///
  byte    lit_pop            717-717  ///
  byte    lit_sp             718-718  ///
  byte    edattain_head      719-719  ///
  byte    edattain_mom       720-720  ///
  byte    edattain_pop       721-721  ///
  byte    edattain_sp        722-722  ///
  int     edattaind_head     723-725  ///
  int     edattaind_mom      726-728  ///
  int     edattaind_pop      729-731  ///
  int     edattaind_sp       732-734  ///
  byte    yrschool_head      735-736  ///
  byte    yrschool_mom       737-738  ///
  byte    yrschool_pop       739-740  ///
  byte    yrschool_sp        741-742  ///
  byte    educls_head        743-744  ///
  byte    educls_mom         745-746  ///
  byte    educls_pop         747-748  ///
  byte    educls_sp          749-750  ///
  byte    empstat_head       751-751  ///
  byte    empstat_mom        752-752  ///
  byte    empstat_pop        753-753  ///
  byte    empstat_sp         754-754  ///
  int     empstatd_head      755-757  ///
  int     empstatd_mom       758-760  ///
  int     empstatd_pop       761-763  ///
  int     empstatd_sp        764-766  ///
  byte    labforce_head      767-767  ///
  byte    labforce_mom       768-768  ///
  byte    labforce_pop       769-769  ///
  byte    labforce_sp        770-770  ///
  byte    occisco_head       771-772  ///
  byte    occisco_mom        773-774  ///
  byte    occisco_pop        775-776  ///
  byte    occisco_sp         777-778  ///
  int     occ_head           779-782  ///
  int     occ_mom            783-786  ///
  int     occ_pop            787-790  ///
  int     occ_sp             791-794  ///
  int     indgen_head        795-797  ///
  int     indgen_mom         798-800  ///
  int     indgen_pop         801-803  ///
  int     indgen_sp          804-806  ///
  long    ind_head           807-811  ///
  long    ind_mom            812-816  ///
  long    ind_pop            817-821  ///
  long    ind_sp             822-826  ///
  byte    classwk_head       827-827  ///
  byte    classwk_mom        828-828  ///
  byte    classwk_pop        829-829  ///
  byte    classwk_sp         830-830  ///
  int     classwkd_head      831-833  ///
  int     classwkd_mom       834-836  ///
  int     classwkd_pop       837-839  ///
  int     classwkd_sp        840-842  ///
  byte    empsect_sp         843-844  ///
  byte    migrate0_sp        845-846  ///
  long    migctry0_sp        847-851  ///
  byte    migyrs1_sp         852-853  ///
  byte    disabled_sp        854-854  ///
  byte    disemp_sp          855-855  ///
  byte    disblnd_sp         856-856  ///
  byte    disdeaf_sp         857-857  ///
  byte    dismute_sp         858-858  ///
  byte    dislowr_sp         859-859  ///
  byte    dismntl_sp         860-860  ///
  byte    dispsyc_sp         861-861  ///
  byte    disorig_sp         862-863  ///
  byte    ls1996a_splive_sp  864-864  ///
  using `"ipumsi_00071.dat"'

replace hhwt              = hhwt              / 100
replace perwt             = perwt             / 100

format sample            %9.0f
format serial            %12.0f
format hhwt              %8.2f
format geolev2           %9.0f
format popdensgeo1       %8.0g
format popdensgeo2       %12.0g
format areamollwgeo1     %10.0g
format areamollwgeo2     %10.0g
format geo2_ls           %9.0f
format perwt             %8.2f

label var country           `"Country"'
label var year              `"Year"'
label var sample            `"IPUMS sample identifier"'
label var serial            `"Household serial number"'
label var persons           `"Number of person records in the household"'
label var hhwt              `"Household weight"'
label var subsamp           `"Subsample number"'
label var gq                `"Group quarters (collective dwelling) status"'
label var unrel             `"Number of unrelated persons"'
label var urban             `"Urban-rural status"'
label var regionw           `"Continent and region of country"'
label var geolev1           `"1st subnational geographic level, world [consistent boundaries over time]"'
label var geolev2           `"2nd subnational geographic level, world [consistent boundaries over time]"'
label var popdensgeo1       `"Population density of GEOLEV1 unit, in persons per square kilometer"'
label var popdensgeo2       `"Population density of GEOLEV2 unit, in persons per square kilometer"'
label var areamollwgeo1     `"Area of GEOLEV1 unit in square kilometers"'
label var areamollwgeo2     `"Area of GEOLEV2 unit in square kilometers"'
label var geo1_ls           `"Lesotho, District 1996 - 2006 [Level 1; consistent boundaries, GIS]"'
label var geo1_ls1996       `"Lesotho, District 1996 [Level 1, GIS]"'
label var geo1_ls2006       `"Lesotho, District 2006 [Level 1, GIS]"'
label var geo2_ls           `"Lesotho, Constituency 2006 [Level 2; consistent boundaries, GIS]"'
label var geo2_ls2006       `"Lesotho, Constituency 2006 [Level 2, GIS]"'
label var dhs_ipumsi_ls     `"DHS-IPUMS-I Lesotho regions, 1996-2014 [consistent boundaries, GIS]"'
label var ownership         `"Ownership of dwelling [general version]"'
label var ownershipd        `"Ownership of dwelling [detailed version]"'
label var electric          `"Electricity"'
label var watsup            `"Water supply"'
label var fuelcook          `"Cooking fuel"'
label var fuelheat          `"Fuel for heating"'
label var phone             `"Telephone availability"'
label var cell              `"Cellular phone availability"'
label var trash             `"Trash disposal"'
label var autos             `"Automobiles available"'
label var refrig            `"Refrigerator"'
label var tv                `"Television set"'
label var radio             `"Radio in household"'
label var rooms             `"Number of rooms"'
label var toilet            `"Toilet"'
label var floor             `"Floor material"'
label var wall              `"Wall or building material"'
label var roof              `"Roof material"'
label var mortnum           `"Number of deaths in household last year"'
label var anymort           `"Any deaths in household last year"'
label var hhtype            `"Household classification"'
label var nfams             `"Number of families in household"'
label var ncouples          `"Number of married couples in household"'
label var nmothers          `"Number of mothers in household"'
label var nfathers          `"Number of fathers in household"'
label var headloc           `"Head's location in household"'
label var pernum            `"Person number"'
label var perwt             `"Person weight"'
label var resident          `"Residence status: de facto, de jure"'
label var momloc            `"Mother's location in household"'
label var poploc            `"Father's location in household"'
label var sploc             `"Spouse's location in household"'
label var parrule           `"Rule for linking parent"'
label var sprule            `"Rule for linking spouse"'
label var stepmom           `"Probable stepmother"'
label var steppop           `"Probable stepfather"'
label var polymal           `"Man with more than one wife linked"'
label var poly2nd           `"Woman is second or higher order wife"'
label var famunit           `"Family unit membership"'
label var famsize           `"Number of own family members in household"'
label var nchild            `"Number of own children in household"'
label var nchlt5            `"Number of own children under age 5 in household"'
label var eldch             `"Age of eldest own child in household"'
label var yngch             `"Age of youngest own child in household"'
label var relate            `"Relationship to household head [general version]"'
label var related           `"Relationship to household head [detailed version]"'
label var age               `"Age"'
label var age2              `"Age, grouped into intervals"'
label var sex               `"Sex"'
label var marst             `"Marital status [general version]"'
label var marstd            `"Marital status [detailed version]"'
label var consens           `"Consensual union"'
label var polygam           `"Polygamous union"'
label var agemarr           `"Age at first marriage or union"'
label var birthyr           `"Year of birth"'
label var birthmo           `"Month of birth"'
label var chborn            `"Children ever born"'
label var chsurv            `"Children surviving"'
label var chbornf           `"Number of female children ever born"'
label var chbornm           `"Number of male children ever born"'
label var chsurvf           `"Number of female children surviving"'
label var chsurvm           `"Number of male children surviving"'
label var lastbmo           `"Month of last birth"'
label var lastbyr           `"Year of last birth"'
label var lastbsex          `"Sex of last birth"'
label var chdead            `"Number of children dead"'
label var chdeadfem         `"Number of female children dead"'
label var chdeadmale        `"Number of male children dead"'
label var lastbmort         `"Mortality status of last birth"'
label var mortmot           `"Mortality status of mother"'
label var mortfat           `"Mortality status of father"'
label var homechild         `"Number of own children in household"'
label var homefem           `"Number of own female children in household"'
label var homemale          `"Number of own male children in household"'
label var awaychild         `"Number of own children living elsewhere"'
label var awayfem           `"Number of own female children living elsewhere"'
label var awaymale          `"Number of own male children living elsewhere"'
label var nativity          `"Nativity status"'
label var bplcountry        `"Country of birth"'
label var citizen           `"Citizenship"'
label var school            `"School attendance"'
label var lit               `"Literacy"'
label var edattain          `"Educational attainment, international recode [general version]"'
label var edattaind         `"Educational attainment, international recode [detailed version]"'
label var yrschool          `"Years of schooling"'
label var educls            `"Educational attainment, Lesotho"'
label var empstat           `"Activity status (employment status) [general version]"'
label var empstatd          `"Activity status (employment status) [detailed version]"'
label var labforce          `"Labor force participation"'
label var occisco           `"Occupation, ISCO general"'
label var occ               `"Occupation, unrecoded"'
label var indgen            `"Industry, general recode"'
label var ind               `"Industry, unrecoded"'
label var classwk           `"Status in employment (class of worker) [general version]"'
label var classwkd          `"Status in employment (class of worker) [detailed version]"'
label var empsect           `"Sector of employment"'
label var migrate0          `"Migration status, 10 years"'
label var migctry0          `"Country of residence 10 years ago"'
label var migyrs1           `"Years residing in current locality"'
label var disabled          `"Disability status"'
label var disemp            `"Employment disability"'
label var disblnd           `"Blind or vision-impaired"'
label var disdeaf           `"Deaf or hearing-impaired"'
label var dismute           `"Mute or speech impaired"'
label var dislowr           `"Disability affecting lower extremities"'
label var dismntl           `"Mental disability"'
label var dispsyc           `"Psychological disability"'
label var disorig           `"Origin of disability"'
label var ls1996a_status    `"Residential status"'
label var ls1996a_rescntry  `"Country of stay"'
label var ls1996a_absdur    `"Duration of residence outside Lesotho  (years)"'
label var ls1996a_splive    `"Spouse alive"'
label var ls1996a_citizen   `"Citizenship"'
label var ls1996a_bpl       `"District or country of birth"'
label var ls1996a_res10yr   `"District or country of residence in April 1986"'
label var ls1996a_resdur    `"Duration of residence in current village or town (since 1986)"'
label var ls1996a_school    `"School attendance"'
label var ls1996a_edattain  `"Educational attainment"'
label var ls1996a_activity  `"Employment status last week"'
label var ls1996a_empstat12 `"Employment status of job seekers 1 year ago"'
label var ls1996a_sector    `"Employer"'
label var ls1996a_occ       `"Occupation (2-digits)"'
label var ls1996a_wkloc1    `"District or country of employment location"'
label var ls1996a_wkloc2    `"District or country of employment in urban areas"'
label var ls1996a_wklocza   `"Works or ever worked in South Africa"'
label var ls1996a_wkdurza   `"Duration of work in South Africa"'
label var ls2006a_status    `"Residency status"'
label var ls2006a_rescntry  `"Country of residence"'
label var ls2006a_absdur    `"Years residing abroad"'
label var ls2006a_citizen   `"Citzenship"'
label var ls2006a_bpl       `"District or country of birth "'
label var ls2006a_res10yr   `"District or country of residence in 1996"'
label var ls2006a_resdur    `"Years of residence in the village"'
label var ls2006a_school    `"School attendance"'
label var ls2006a_edattain  `"Education attainment"'
label var ls2006a_lit       `"Literacy (read and write)"'
label var ls2006a_activity  `"Economic activity in the last week"'
label var ls2006a_empstat12 `"Employment status of job seekers (12 months ago)"'
label var ls2006a_classwk   `"Class of worker"'
label var ls2006a_occ       `"Occupation (2-digits)"'
label var ls2006a_ind       `"Industry (2-digits)"'
label var ls2006a_wkloc     `"District or country of work location"'
label var ls2006a_wkurb     `"District or country of work location in urban areas"'
label var ls2006a_work10yr  `"Worked in South Africa since 1996"'
label var ls2006a_workdur   `"Number of years worked in South Africa "'
label var famsize_head      `"Number of own family members in household [of Head's location in household]"'
label var famsize_mom       `"Number of own family members in household [of Mother's location in household]"'
label var famsize_pop       `"Number of own family members in household [of Father's location in household]"'
label var famsize_sp        `"Number of own family members in household [of Spouse's location in household]"'
label var nchild_head       `"Number of own children in household [of Head's location in household]"'
label var nchild_mom        `"Number of own children in household [of Mother's location in household]"'
label var nchild_pop        `"Number of own children in household [of Father's location in household]"'
label var nchild_sp         `"Number of own children in household [of Spouse's location in household]"'
label var nchlt5_head       `"Number of own children under age 5 in household [of Head's location in household"'
label var nchlt5_mom        `"Number of own children under age 5 in household [of Mother's location in househo"'
label var nchlt5_pop        `"Number of own children under age 5 in household [of Father's location in househo"'
label var nchlt5_sp         `"Number of own children under age 5 in household [of Spouse's location in househo"'
label var eldch_head        `"Age of eldest own child in household [of Head's location in household]"'
label var eldch_mom         `"Age of eldest own child in household [of Mother's location in household]"'
label var eldch_pop         `"Age of eldest own child in household [of Father's location in household]"'
label var eldch_sp          `"Age of eldest own child in household [of Spouse's location in household]"'
label var yngch_head        `"Age of youngest own child in household [of Head's location in household]"'
label var yngch_mom         `"Age of youngest own child in household [of Mother's location in household]"'
label var yngch_pop         `"Age of youngest own child in household [of Father's location in household]"'
label var yngch_sp          `"Age of youngest own child in household [of Spouse's location in household]"'
label var relate_head       `"Relationship to household head [of Head's location in household; general version"'
label var relate_mom        `"Relationship to household head [of Mother's location in household; general versi"'
label var relate_pop        `"Relationship to household head [of Father's location in household; general versi"'
label var relate_sp         `"Relationship to household head [of Spouse's location in household; general versi"'
label var related_head      `"Relationship to household head [of Head's location in household; detailed versio"'
label var related_mom       `"Relationship to household head [of Mother's location in household; detailed vers"'
label var related_pop       `"Relationship to household head [of Father's location in household; detailed vers"'
label var related_sp        `"Relationship to household head [of Spouse's location in household; detailed vers"'
label var age_head          `"Age [of Head's location in household]"'
label var age_mom           `"Age [of Mother's location in household]"'
label var age_pop           `"Age [of Father's location in household]"'
label var age_sp            `"Age [of Spouse's location in household]"'
label var sex_head          `"Sex [of Head's location in household]"'
label var sex_mom           `"Sex [of Mother's location in household]"'
label var sex_pop           `"Sex [of Father's location in household]"'
label var sex_sp            `"Sex [of Spouse's location in household]"'
label var marst_head        `"Marital status [of Head's location in household; general version]"'
label var marst_mom         `"Marital status [of Mother's location in household; general version]"'
label var marst_pop         `"Marital status [of Father's location in household; general version]"'
label var marst_sp          `"Marital status [of Spouse's location in household; general version]"'
label var marstd_head       `"Marital status [of Head's location in household; detailed version]"'
label var marstd_mom        `"Marital status [of Mother's location in household; detailed version]"'
label var marstd_pop        `"Marital status [of Father's location in household; detailed version]"'
label var marstd_sp         `"Marital status [of Spouse's location in household; detailed version]"'
label var birthyr_head      `"Year of birth [of Head's location in household]"'
label var birthyr_mom       `"Year of birth [of Mother's location in household]"'
label var birthyr_pop       `"Year of birth [of Father's location in household]"'
label var birthyr_sp        `"Year of birth [of Spouse's location in household]"'
label var birthmo_head      `"Month of birth [of Head's location in household]"'
label var birthmo_mom       `"Month of birth [of Mother's location in household]"'
label var birthmo_pop       `"Month of birth [of Father's location in household]"'
label var birthmo_sp        `"Month of birth [of Spouse's location in household]"'
label var chbornf_head      `"Number of female children ever born [of Head's location in household]"'
label var chbornf_mom       `"Number of female children ever born [of Mother's location in household]"'
label var chbornf_pop       `"Number of female children ever born [of Father's location in household]"'
label var chbornf_sp        `"Number of female children ever born [of Spouse's location in household]"'
label var chbornm_head      `"Number of male children ever born [of Head's location in household]"'
label var chbornm_mom       `"Number of male children ever born [of Mother's location in household]"'
label var chbornm_pop       `"Number of male children ever born [of Father's location in household]"'
label var chbornm_sp        `"Number of male children ever born [of Spouse's location in household]"'
label var chsurvf_head      `"Number of female children surviving [of Head's location in household]"'
label var chsurvf_mom       `"Number of female children surviving [of Mother's location in household]"'
label var chsurvf_pop       `"Number of female children surviving [of Father's location in household]"'
label var chsurvf_sp        `"Number of female children surviving [of Spouse's location in household]"'
label var chsurvm_head      `"Number of male children surviving [of Head's location in household]"'
label var chsurvm_mom       `"Number of male children surviving [of Mother's location in household]"'
label var chsurvm_pop       `"Number of male children surviving [of Father's location in household]"'
label var chsurvm_sp        `"Number of male children surviving [of Spouse's location in household]"'
label var lastbmo_head      `"Month of last birth [of Head's location in household]"'
label var lastbmo_mom       `"Month of last birth [of Mother's location in household]"'
label var lastbmo_pop       `"Month of last birth [of Father's location in household]"'
label var lastbmo_sp        `"Month of last birth [of Spouse's location in household]"'
label var lastbyr_head      `"Year of last birth [of Head's location in household]"'
label var lastbyr_mom       `"Year of last birth [of Mother's location in household]"'
label var lastbyr_pop       `"Year of last birth [of Father's location in household]"'
label var lastbyr_sp        `"Year of last birth [of Spouse's location in household]"'
label var lastbsex_head     `"Sex of last birth [of Head's location in household]"'
label var lastbsex_mom      `"Sex of last birth [of Mother's location in household]"'
label var lastbsex_pop      `"Sex of last birth [of Father's location in household]"'
label var lastbsex_sp       `"Sex of last birth [of Spouse's location in household]"'
label var chdead_head       `"Number of children dead [of Head's location in household]"'
label var chdead_mom        `"Number of children dead [of Mother's location in household]"'
label var chdead_pop        `"Number of children dead [of Father's location in household]"'
label var chdead_sp         `"Number of children dead [of Spouse's location in household]"'
label var chdeadfem_head    `"Number of female children dead [of Head's location in household]"'
label var chdeadfem_mom     `"Number of female children dead [of Mother's location in household]"'
label var chdeadfem_pop     `"Number of female children dead [of Father's location in household]"'
label var chdeadfem_sp      `"Number of female children dead [of Spouse's location in household]"'
label var chdeadmale_head   `"Number of male children dead [of Head's location in household]"'
label var chdeadmale_mom    `"Number of male children dead [of Mother's location in household]"'
label var chdeadmale_pop    `"Number of male children dead [of Father's location in household]"'
label var chdeadmale_sp     `"Number of male children dead [of Spouse's location in household]"'
label var lastbmort_head    `"Mortality status of last birth [of Head's location in household]"'
label var lastbmort_mom     `"Mortality status of last birth [of Mother's location in household]"'
label var lastbmort_pop     `"Mortality status of last birth [of Father's location in household]"'
label var lastbmort_sp      `"Mortality status of last birth [of Spouse's location in household]"'
label var mortmot_head      `"Mortality status of mother [of Head's location in household]"'
label var mortmot_mom       `"Mortality status of mother [of Mother's location in household]"'
label var mortmot_pop       `"Mortality status of mother [of Father's location in household]"'
label var mortmot_sp        `"Mortality status of mother [of Spouse's location in household]"'
label var mortfat_head      `"Mortality status of father [of Head's location in household]"'
label var mortfat_mom       `"Mortality status of father [of Mother's location in household]"'
label var mortfat_pop       `"Mortality status of father [of Father's location in household]"'
label var mortfat_sp        `"Mortality status of father [of Spouse's location in household]"'
label var homechild_head    `"Number of own children in household [of Head's location in household]"'
label var homechild_mom     `"Number of own children in household [of Mother's location in household]"'
label var homechild_pop     `"Number of own children in household [of Father's location in household]"'
label var homechild_sp      `"Number of own children in household [of Spouse's location in household]"'
label var homefem_head      `"Number of own female children in household [of Head's location in household]"'
label var homefem_mom       `"Number of own female children in household [of Mother's location in household]"'
label var homefem_pop       `"Number of own female children in household [of Father's location in household]"'
label var homefem_sp        `"Number of own female children in household [of Spouse's location in household]"'
label var homemale_head     `"Number of own male children in household [of Head's location in household]"'
label var homemale_mom      `"Number of own male children in household [of Mother's location in household]"'
label var homemale_pop      `"Number of own male children in household [of Father's location in household]"'
label var homemale_sp       `"Number of own male children in household [of Spouse's location in household]"'
label var awaychild_head    `"Number of own children living elsewhere [of Head's location in household]"'
label var awaychild_mom     `"Number of own children living elsewhere [of Mother's location in household]"'
label var awaychild_pop     `"Number of own children living elsewhere [of Father's location in household]"'
label var awaychild_sp      `"Number of own children living elsewhere [of Spouse's location in household]"'
label var awayfem_head      `"Number of own female children living elsewhere [of Head's location in household]"'
label var awayfem_mom       `"Number of own female children living elsewhere [of Mother's location in househol"'
label var awayfem_pop       `"Number of own female children living elsewhere [of Father's location in househol"'
label var awayfem_sp        `"Number of own female children living elsewhere [of Spouse's location in househol"'
label var awaymale_head     `"Number of own male children living elsewhere [of Head's location in household]"'
label var awaymale_mom      `"Number of own male children living elsewhere [of Mother's location in household]"'
label var awaymale_pop      `"Number of own male children living elsewhere [of Father's location in household]"'
label var awaymale_sp       `"Number of own male children living elsewhere [of Spouse's location in household]"'
label var nativity_head     `"Nativity status [of Head's location in household]"'
label var nativity_mom      `"Nativity status [of Mother's location in household]"'
label var nativity_pop      `"Nativity status [of Father's location in household]"'
label var nativity_sp       `"Nativity status [of Spouse's location in household]"'
label var bplcountry_head   `"Country of birth [of Head's location in household]"'
label var bplcountry_mom    `"Country of birth [of Mother's location in household]"'
label var bplcountry_pop    `"Country of birth [of Father's location in household]"'
label var bplcountry_sp     `"Country of birth [of Spouse's location in household]"'
label var citizen_head      `"Citizenship [of Head's location in household]"'
label var citizen_mom       `"Citizenship [of Mother's location in household]"'
label var citizen_pop       `"Citizenship [of Father's location in household]"'
label var citizen_sp        `"Citizenship [of Spouse's location in household]"'
label var school_head       `"School attendance [of Head's location in household]"'
label var school_mom        `"School attendance [of Mother's location in household]"'
label var school_pop        `"School attendance [of Father's location in household]"'
label var school_sp         `"School attendance [of Spouse's location in household]"'
label var lit_head          `"Literacy [of Head's location in household]"'
label var lit_mom           `"Literacy [of Mother's location in household]"'
label var lit_pop           `"Literacy [of Father's location in household]"'
label var lit_sp            `"Literacy [of Spouse's location in household]"'
label var edattain_head     `"Educational attainment, international recode [of Head's location in household; g"'
label var edattain_mom      `"Educational attainment, international recode [of Mother's location in household;"'
label var edattain_pop      `"Educational attainment, international recode [of Father's location in household;"'
label var edattain_sp       `"Educational attainment, international recode [of Spouse's location in household;"'
label var edattaind_head    `"Educational attainment, international recode [of Head's location in household; d"'
label var edattaind_mom     `"Educational attainment, international recode [of Mother's location in household;"'
label var edattaind_pop     `"Educational attainment, international recode [of Father's location in household;"'
label var edattaind_sp      `"Educational attainment, international recode [of Spouse's location in household;"'
label var yrschool_head     `"Years of schooling [of Head's location in household]"'
label var yrschool_mom      `"Years of schooling [of Mother's location in household]"'
label var yrschool_pop      `"Years of schooling [of Father's location in household]"'
label var yrschool_sp       `"Years of schooling [of Spouse's location in household]"'
label var educls_head       `"Educational attainment, Lesotho [of Head's location in household]"'
label var educls_mom        `"Educational attainment, Lesotho [of Mother's location in household]"'
label var educls_pop        `"Educational attainment, Lesotho [of Father's location in household]"'
label var educls_sp         `"Educational attainment, Lesotho [of Spouse's location in household]"'
label var empstat_head      `"Activity status (employment status) [of Head's location in household; general ve"'
label var empstat_mom       `"Activity status (employment status) [of Mother's location in household; general "'
label var empstat_pop       `"Activity status (employment status) [of Father's location in household; general "'
label var empstat_sp        `"Activity status (employment status) [of Spouse's location in household; general "'
label var empstatd_head     `"Activity status (employment status) [of Head's location in household; detailed v"'
label var empstatd_mom      `"Activity status (employment status) [of Mother's location in household; detailed"'
label var empstatd_pop      `"Activity status (employment status) [of Father's location in household; detailed"'
label var empstatd_sp       `"Activity status (employment status) [of Spouse's location in household; detailed"'
label var labforce_head     `"Labor force participation [of Head's location in household]"'
label var labforce_mom      `"Labor force participation [of Mother's location in household]"'
label var labforce_pop      `"Labor force participation [of Father's location in household]"'
label var labforce_sp       `"Labor force participation [of Spouse's location in household]"'
label var occisco_head      `"Occupation, ISCO general [of Head's location in household]"'
label var occisco_mom       `"Occupation, ISCO general [of Mother's location in household]"'
label var occisco_pop       `"Occupation, ISCO general [of Father's location in household]"'
label var occisco_sp        `"Occupation, ISCO general [of Spouse's location in household]"'
label var occ_head          `"Occupation, unrecoded [of Head's location in household]"'
label var occ_mom           `"Occupation, unrecoded [of Mother's location in household]"'
label var occ_pop           `"Occupation, unrecoded [of Father's location in household]"'
label var occ_sp            `"Occupation, unrecoded [of Spouse's location in household]"'
label var indgen_head       `"Industry, general recode [of Head's location in household]"'
label var indgen_mom        `"Industry, general recode [of Mother's location in household]"'
label var indgen_pop        `"Industry, general recode [of Father's location in household]"'
label var indgen_sp         `"Industry, general recode [of Spouse's location in household]"'
label var ind_head          `"Industry, unrecoded [of Head's location in household]"'
label var ind_mom           `"Industry, unrecoded [of Mother's location in household]"'
label var ind_pop           `"Industry, unrecoded [of Father's location in household]"'
label var ind_sp            `"Industry, unrecoded [of Spouse's location in household]"'
label var classwk_head      `"Status in employment (class of worker) [of Head's location in household; general"'
label var classwk_mom       `"Status in employment (class of worker) [of Mother's location in household; gener"'
label var classwk_pop       `"Status in employment (class of worker) [of Father's location in household; gener"'
label var classwk_sp        `"Status in employment (class of worker) [of Spouse's location in household; gener"'
label var classwkd_head     `"Status in employment (class of worker) [of Head's location in household; detaile"'
label var classwkd_mom      `"Status in employment (class of worker) [of Mother's location in household; detai"'
label var classwkd_pop      `"Status in employment (class of worker) [of Father's location in household; detai"'
label var classwkd_sp       `"Status in employment (class of worker) [of Spouse's location in household; detai"'
label var empsect_sp        `"Sector of employment [of Spouse's location in household]"'
label var migrate0_sp       `"Migration status, 10 years [of Spouse's location in household]"'
label var migctry0_sp       `"Country of residence 10 years ago [of Spouse's location in household]"'
label var migyrs1_sp        `"Years residing in current locality [of Spouse's location in household]"'
label var disabled_sp       `"Disability status [of Spouse's location in household]"'
label var disemp_sp         `"Employment disability [of Spouse's location in household]"'
label var disblnd_sp        `"Blind or vision-impaired [of Spouse's location in household]"'
label var disdeaf_sp        `"Deaf or hearing-impaired [of Spouse's location in household]"'
label var dismute_sp        `"Mute or speech impaired [of Spouse's location in household]"'
label var dislowr_sp        `"Disability affecting lower extremities [of Spouse's location in household]"'
label var dismntl_sp        `"Mental disability [of Spouse's location in household]"'
label var dispsyc_sp        `"Psychological disability [of Spouse's location in household]"'
label var disorig_sp        `"Origin of disability [of Spouse's location in household]"'
label var ls1996a_splive_sp `"Spouse alive [of Spouse's location in household]"'

label define country_lbl 032 `"Argentina"'
label define country_lbl 051 `"Armenia"', add
label define country_lbl 040 `"Austria"', add
label define country_lbl 050 `"Bangladesh"', add
label define country_lbl 112 `"Belarus"', add
label define country_lbl 204 `"Benin"', add
label define country_lbl 068 `"Bolivia"', add
label define country_lbl 072 `"Botswana"', add
label define country_lbl 076 `"Brazil"', add
label define country_lbl 854 `"Burkina Faso"', add
label define country_lbl 116 `"Cambodia"', add
label define country_lbl 120 `"Cameroon"', add
label define country_lbl 124 `"Canada"', add
label define country_lbl 152 `"Chile"', add
label define country_lbl 156 `"China"', add
label define country_lbl 170 `"Colombia"', add
label define country_lbl 188 `"Costa Rica"', add
label define country_lbl 192 `"Cuba"', add
label define country_lbl 208 `"Denmark"', add
label define country_lbl 214 `"Dominican Republic"', add
label define country_lbl 218 `"Ecuador"', add
label define country_lbl 818 `"Egypt"', add
label define country_lbl 222 `"El Salvador"', add
label define country_lbl 231 `"Ethiopia"', add
label define country_lbl 242 `"Fiji"', add
label define country_lbl 246 `"Finland"', add
label define country_lbl 250 `"France"', add
label define country_lbl 276 `"Germany"', add
label define country_lbl 288 `"Ghana"', add
label define country_lbl 300 `"Greece"', add
label define country_lbl 320 `"Guatemala"', add
label define country_lbl 324 `"Guinea"', add
label define country_lbl 332 `"Haiti"', add
label define country_lbl 340 `"Honduras"', add
label define country_lbl 348 `"Hungary"', add
label define country_lbl 352 `"Iceland"', add
label define country_lbl 356 `"India"', add
label define country_lbl 360 `"Indonesia"', add
label define country_lbl 364 `"Iran"', add
label define country_lbl 368 `"Iraq"', add
label define country_lbl 372 `"Ireland"', add
label define country_lbl 376 `"Israel"', add
label define country_lbl 380 `"Italy"', add
label define country_lbl 384 `"Côte d'Ivoire"', add
label define country_lbl 388 `"Jamaica"', add
label define country_lbl 400 `"Jordan"', add
label define country_lbl 404 `"Kenya"', add
label define country_lbl 417 `"Kyrgyz Republic"', add
label define country_lbl 418 `"Laos"', add
label define country_lbl 426 `"Lesotho"', add
label define country_lbl 430 `"Liberia"', add
label define country_lbl 454 `"Malawi"', add
label define country_lbl 458 `"Malaysia"', add
label define country_lbl 466 `"Mali"', add
label define country_lbl 480 `"Mauritius"', add
label define country_lbl 484 `"Mexico"', add
label define country_lbl 496 `"Mongolia"', add
label define country_lbl 504 `"Morocco"', add
label define country_lbl 508 `"Mozambique"', add
label define country_lbl 104 `"Myanmar"', add
label define country_lbl 524 `"Nepal"', add
label define country_lbl 528 `"Netherlands"', add
label define country_lbl 558 `"Nicaragua"', add
label define country_lbl 566 `"Nigeria"', add
label define country_lbl 578 `"Norway"', add
label define country_lbl 586 `"Pakistan"', add
label define country_lbl 275 `"Palestine"', add
label define country_lbl 591 `"Panama"', add
label define country_lbl 598 `"Papua New Guinea"', add
label define country_lbl 600 `"Paraguay"', add
label define country_lbl 604 `"Peru"', add
label define country_lbl 608 `"Philippines"', add
label define country_lbl 616 `"Poland"', add
label define country_lbl 620 `"Portugal"', add
label define country_lbl 630 `"Puerto Rico"', add
label define country_lbl 642 `"Romania"', add
label define country_lbl 643 `"Russia"', add
label define country_lbl 646 `"Rwanda"', add
label define country_lbl 662 `"Saint Lucia"', add
label define country_lbl 686 `"Senegal"', add
label define country_lbl 694 `"Sierra Leone"', add
label define country_lbl 703 `"Slovak Republic"', add
label define country_lbl 705 `"Slovenia"', add
label define country_lbl 710 `"South Africa"', add
label define country_lbl 728 `"South Sudan"', add
label define country_lbl 724 `"Spain"', add
label define country_lbl 729 `"Sudan"', add
label define country_lbl 740 `"Suriname"', add
label define country_lbl 752 `"Sweden"', add
label define country_lbl 756 `"Switzerland"', add
label define country_lbl 834 `"Tanzania"', add
label define country_lbl 764 `"Thailand"', add
label define country_lbl 768 `"Togo"', add
label define country_lbl 780 `"Trinidad and Tobago"', add
label define country_lbl 792 `"Turkey"', add
label define country_lbl 800 `"Uganda"', add
label define country_lbl 804 `"Ukraine"', add
label define country_lbl 826 `"United Kingdom"', add
label define country_lbl 840 `"United States"', add
label define country_lbl 858 `"Uruguay"', add
label define country_lbl 862 `"Venezuela"', add
label define country_lbl 704 `"Vietnam"', add
label define country_lbl 894 `"Zambia"', add
label define country_lbl 716 `"Zimbabwe"', add
label values country country_lbl

label define year_lbl 1703 `"1703"'
label define year_lbl 1729 `"1729"', add
label define year_lbl 1787 `"1787"', add
label define year_lbl 1801 `"1801"', add
label define year_lbl 1819 `"1819"', add
label define year_lbl 1845 `"1845"', add
label define year_lbl 1848 `"1848"', add
label define year_lbl 1850 `"1850"', add
label define year_lbl 1851 `"1851"', add
label define year_lbl 1852 `"1852"', add
label define year_lbl 1860 `"1860"', add
label define year_lbl 1861 `"1861"', add
label define year_lbl 1865 `"1865"', add
label define year_lbl 1868 `"1868"', add
label define year_lbl 1870 `"1870"', add
label define year_lbl 1871 `"1871"', add
label define year_lbl 1875 `"1875"', add
label define year_lbl 1880 `"1880"', add
label define year_lbl 1881 `"1881"', add
label define year_lbl 1885 `"1885"', add
label define year_lbl 1890 `"1890"', add
label define year_lbl 1891 `"1891"', add
label define year_lbl 1900 `"1900"', add
label define year_lbl 1901 `"1901"', add
label define year_lbl 1910 `"1910"', add
label define year_lbl 1911 `"1911"', add
label define year_lbl 1960 `"1960"', add
label define year_lbl 1961 `"1961"', add
label define year_lbl 1962 `"1962"', add
label define year_lbl 1963 `"1963"', add
label define year_lbl 1964 `"1964"', add
label define year_lbl 1966 `"1966"', add
label define year_lbl 1968 `"1968"', add
label define year_lbl 1969 `"1969"', add
label define year_lbl 1970 `"1970"', add
label define year_lbl 1971 `"1971"', add
label define year_lbl 1972 `"1972"', add
label define year_lbl 1973 `"1973"', add
label define year_lbl 1974 `"1974"', add
label define year_lbl 1975 `"1975"', add
label define year_lbl 1976 `"1976"', add
label define year_lbl 1977 `"1977"', add
label define year_lbl 1978 `"1978"', add
label define year_lbl 1979 `"1979"', add
label define year_lbl 1980 `"1980"', add
label define year_lbl 1981 `"1981"', add
label define year_lbl 1982 `"1982"', add
label define year_lbl 1983 `"1983"', add
label define year_lbl 1984 `"1984"', add
label define year_lbl 1985 `"1985"', add
label define year_lbl 1986 `"1986"', add
label define year_lbl 1987 `"1987"', add
label define year_lbl 1989 `"1989"', add
label define year_lbl 1990 `"1990"', add
label define year_lbl 1991 `"1991"', add
label define year_lbl 1992 `"1992"', add
label define year_lbl 1993 `"1993"', add
label define year_lbl 1994 `"1994"', add
label define year_lbl 1995 `"1995"', add
label define year_lbl 1996 `"1996"', add
label define year_lbl 1997 `"1997"', add
label define year_lbl 1998 `"1998"', add
label define year_lbl 1999 `"1999"', add
label define year_lbl 2000 `"2000"', add
label define year_lbl 2001 `"2001"', add
label define year_lbl 2002 `"2002"', add
label define year_lbl 2003 `"2003"', add
label define year_lbl 2004 `"2004"', add
label define year_lbl 2005 `"2005"', add
label define year_lbl 2006 `"2006"', add
label define year_lbl 2007 `"2007"', add
label define year_lbl 2008 `"2008"', add
label define year_lbl 2009 `"2009"', add
label define year_lbl 2010 `"2010"', add
label define year_lbl 2011 `"2011"', add
label define year_lbl 2012 `"2012"', add
label define year_lbl 2013 `"2013"', add
label define year_lbl 2014 `"2014"', add
label define year_lbl 2015 `"2015"', add
label define year_lbl 2016 `"2016"', add
label define year_lbl 2017 `"2017"', add
label define year_lbl 2018 `"2018"', add
label define year_lbl 2019 `"2019"', add
label define year_lbl 2020 `"2020"', add
label values year year_lbl

label define sample_lbl 032197001 `"Argentina 1970"'
label define sample_lbl 032198001 `"Argentina 1980"', add
label define sample_lbl 032199101 `"Argentina 1991"', add
label define sample_lbl 032200101 `"Argentina 2001"', add
label define sample_lbl 032201001 `"Argentina 2010"', add
label define sample_lbl 051200101 `"Armenia 2001"', add
label define sample_lbl 051201101 `"Armenia 2011"', add
label define sample_lbl 040197101 `"Austria 1971"', add
label define sample_lbl 040198101 `"Austria 1981"', add
label define sample_lbl 040199101 `"Austria 1991"', add
label define sample_lbl 040200101 `"Austria 2001"', add
label define sample_lbl 040201101 `"Austria 2011"', add
label define sample_lbl 050199101 `"Bangladesh 1991"', add
label define sample_lbl 050200101 `"Bangladesh 2001"', add
label define sample_lbl 050201101 `"Bangladesh 2011"', add
label define sample_lbl 112199901 `"Belarus 1999"', add
label define sample_lbl 112200901 `"Belarus 2009"', add
label define sample_lbl 204197901 `"Benin 1979"', add
label define sample_lbl 204199201 `"Benin 1992"', add
label define sample_lbl 204200201 `"Benin 2002"', add
label define sample_lbl 204201301 `"Benin 2013"', add
label define sample_lbl 068197601 `"Bolivia 1976"', add
label define sample_lbl 068199201 `"Bolivia 1992"', add
label define sample_lbl 068200101 `"Bolivia 2001"', add
label define sample_lbl 068201201 `"Bolivia 2012"', add
label define sample_lbl 072198101 `"Botswana 1981"', add
label define sample_lbl 072199101 `"Botswana 1991"', add
label define sample_lbl 072200101 `"Botswana 2001"', add
label define sample_lbl 072201101 `"Botswana 2011"', add
label define sample_lbl 076196001 `"Brazil 1960"', add
label define sample_lbl 076197001 `"Brazil 1970"', add
label define sample_lbl 076198001 `"Brazil 1980"', add
label define sample_lbl 076199101 `"Brazil 1991"', add
label define sample_lbl 076200001 `"Brazil 2000"', add
label define sample_lbl 076201001 `"Brazil 2010"', add
label define sample_lbl 854198501 `"Burkina Faso 1985"', add
label define sample_lbl 854199601 `"Burkina Faso 1996"', add
label define sample_lbl 854200601 `"Burkina Faso 2006"', add
label define sample_lbl 116199801 `"Cambodia 1998"', add
label define sample_lbl 116200401 `"Cambodia 2004"', add
label define sample_lbl 116200801 `"Cambodia 2008"', add
label define sample_lbl 116201301 `"Cambodia 2013"', add
label define sample_lbl 116201901 `"Cambodia 2019"', add
label define sample_lbl 120197601 `"Cameroon 1976"', add
label define sample_lbl 120198701 `"Cameroon 1987"', add
label define sample_lbl 120200501 `"Cameroon 2005"', add
label define sample_lbl 124185201 `"Canada 1852"', add
label define sample_lbl 124187101 `"Canada 1871"', add
label define sample_lbl 124188101 `"Canada 1881"', add
label define sample_lbl 124189101 `"Canada 1891"', add
label define sample_lbl 124190101 `"Canada 1901"', add
label define sample_lbl 124191101 `"Canada 1911"', add
label define sample_lbl 124197101 `"Canada 1971"', add
label define sample_lbl 124198101 `"Canada 1981"', add
label define sample_lbl 124199101 `"Canada 1991"', add
label define sample_lbl 124200101 `"Canada 2001"', add
label define sample_lbl 124201101 `"Canada 2011"', add
label define sample_lbl 152196001 `"Chile 1960"', add
label define sample_lbl 152197001 `"Chile 1970"', add
label define sample_lbl 152198201 `"Chile 1982"', add
label define sample_lbl 152199201 `"Chile 1992"', add
label define sample_lbl 152200201 `"Chile 2002"', add
label define sample_lbl 152201701 `"Chile 2017"', add
label define sample_lbl 156198201 `"China 1982"', add
label define sample_lbl 156199001 `"China 1990"', add
label define sample_lbl 156200001 `"China 2000"', add
label define sample_lbl 170196401 `"Colombia 1964"', add
label define sample_lbl 170197301 `"Colombia 1973"', add
label define sample_lbl 170198501 `"Colombia 1985"', add
label define sample_lbl 170199301 `"Colombia 1993"', add
label define sample_lbl 170200501 `"Colombia 2005"', add
label define sample_lbl 188196301 `"Costa Rica 1963"', add
label define sample_lbl 188197301 `"Costa Rica 1973"', add
label define sample_lbl 188198401 `"Costa Rica 1984"', add
label define sample_lbl 188200001 `"Costa Rica 2000"', add
label define sample_lbl 188201101 `"Costa Rica 2011"', add
label define sample_lbl 192200201 `"Cuba 2002"', add
label define sample_lbl 192201201 `"Cuba 2012"', add
label define sample_lbl 208178701 `"Denmark 1787"', add
label define sample_lbl 208180101 `"Denmark 1801"', add
label define sample_lbl 208184501 `"Denmark 1845"', add
label define sample_lbl 208188001 `"Denmark 1880"', add
label define sample_lbl 208188501 `"Denmark 1885"', add
label define sample_lbl 214196001 `"Dominican Republic 1960"', add
label define sample_lbl 214197001 `"Dominican Republic 1970"', add
label define sample_lbl 214198101 `"Dominican Republic 1981"', add
label define sample_lbl 214200201 `"Dominican Republic 2002"', add
label define sample_lbl 214201001 `"Dominican Republic 2010"', add
label define sample_lbl 218196201 `"Ecuador 1962"', add
label define sample_lbl 218197401 `"Ecuador 1974"', add
label define sample_lbl 218198201 `"Ecuador 1982"', add
label define sample_lbl 218199001 `"Ecuador 1990"', add
label define sample_lbl 218200101 `"Ecuador 2001"', add
label define sample_lbl 218201001 `"Ecuador 2010"', add
label define sample_lbl 818184801 `"Egypt 1848"', add
label define sample_lbl 818186801 `"Egypt 1868"', add
label define sample_lbl 818198601 `"Egypt 1986"', add
label define sample_lbl 818199601 `"Egypt 1996"', add
label define sample_lbl 818200601 `"Egypt 2006"', add
label define sample_lbl 222199201 `"El Salvador 1992"', add
label define sample_lbl 222200701 `"El Salvador 2007"', add
label define sample_lbl 231198401 `"Ethiopia 1984"', add
label define sample_lbl 231199401 `"Ethiopia 1994"', add
label define sample_lbl 231200701 `"Ethiopia 2007"', add
label define sample_lbl 242196601 `"Fiji 1966"', add
label define sample_lbl 242197601 `"Fiji 1976"', add
label define sample_lbl 242198601 `"Fiji 1986"', add
label define sample_lbl 242199601 `"Fiji 1996"', add
label define sample_lbl 242200701 `"Fiji 2007"', add
label define sample_lbl 242201401 `"Fiji 2014"', add
label define sample_lbl 246201001 `"Finland 2010"', add
label define sample_lbl 250196201 `"France 1962"', add
label define sample_lbl 250196801 `"France 1968"', add
label define sample_lbl 250197501 `"France 1975"', add
label define sample_lbl 250198201 `"France 1982"', add
label define sample_lbl 250199001 `"France 1990"', add
label define sample_lbl 250199901 `"France 1999"', add
label define sample_lbl 250200601 `"France 2006"', add
label define sample_lbl 250201101 `"France 2011"', add
label define sample_lbl 276181901 `"Germany 1819 (Mecklenburg)"', add
label define sample_lbl 276197001 `"Germany 1970 (West)"', add
label define sample_lbl 276197101 `"Germany 1971 (East)"', add
label define sample_lbl 276198101 `"Germany 1981 (East)"', add
label define sample_lbl 276198701 `"Germany 1987 (West)"', add
label define sample_lbl 288198401 `"Ghana 1984"', add
label define sample_lbl 288200001 `"Ghana 2000"', add
label define sample_lbl 288201001 `"Ghana 2010"', add
label define sample_lbl 300197101 `"Greece 1971"', add
label define sample_lbl 300198101 `"Greece 1981"', add
label define sample_lbl 300199101 `"Greece 1991"', add
label define sample_lbl 300200101 `"Greece 2001"', add
label define sample_lbl 300201101 `"Greece 2011"', add
label define sample_lbl 320196401 `"Guatemala 1964"', add
label define sample_lbl 320197301 `"Guatemala 1973"', add
label define sample_lbl 320198101 `"Guatemala 1981"', add
label define sample_lbl 320199401 `"Guatemala 1994"', add
label define sample_lbl 320200201 `"Guatemala 2002"', add
label define sample_lbl 324198301 `"Guinea 1983"', add
label define sample_lbl 324199601 `"Guinea 1996"', add
label define sample_lbl 324201401 `"Guinea 2014"', add
label define sample_lbl 332197101 `"Haiti 1971"', add
label define sample_lbl 332198201 `"Haiti 1982"', add
label define sample_lbl 332200301 `"Haiti 2003"', add
label define sample_lbl 340196101 `"Honduras 1961"', add
label define sample_lbl 340197401 `"Honduras 1974"', add
label define sample_lbl 340198801 `"Honduras 1988"', add
label define sample_lbl 340200101 `"Honduras 2001"', add
label define sample_lbl 340201301 `"Honduras 2013"', add
label define sample_lbl 348197001 `"Hungary 1970"', add
label define sample_lbl 348198001 `"Hungary 1980"', add
label define sample_lbl 348199001 `"Hungary 1990"', add
label define sample_lbl 348200101 `"Hungary 2001"', add
label define sample_lbl 348201101 `"Hungary 2011"', add
label define sample_lbl 352170301 `"Iceland 1703"', add
label define sample_lbl 352172901 `"Iceland 1729"', add
label define sample_lbl 352180101 `"Iceland 1801"', add
label define sample_lbl 352190101 `"Iceland 1901"', add
label define sample_lbl 352191001 `"Iceland 1910"', add
label define sample_lbl 356198341 `"India 1983"', add
label define sample_lbl 356198741 `"India 1987"', add
label define sample_lbl 356199341 `"India 1993"', add
label define sample_lbl 356199941 `"India 1999"', add
label define sample_lbl 356200441 `"India 2004"', add
label define sample_lbl 356200941 `"India 2009"', add
label define sample_lbl 360197101 `"Indonesia 1971"', add
label define sample_lbl 360197601 `"Indonesia 1976"', add
label define sample_lbl 360198001 `"Indonesia 1980"', add
label define sample_lbl 360198501 `"Indonesia 1985"', add
label define sample_lbl 360199001 `"Indonesia 1990"', add
label define sample_lbl 360199501 `"Indonesia 1995"', add
label define sample_lbl 360200001 `"Indonesia 2000"', add
label define sample_lbl 360200501 `"Indonesia 2005"', add
label define sample_lbl 360201001 `"Indonesia 2010"', add
label define sample_lbl 364200601 `"Iran 2006"', add
label define sample_lbl 364201101 `"Iran 2011"', add
label define sample_lbl 368199701 `"Iraq 1997"', add
label define sample_lbl 372190101 `"Ireland 1901"', add
label define sample_lbl 372191101 `"Ireland 1911"', add
label define sample_lbl 372197101 `"Ireland 1971"', add
label define sample_lbl 372197901 `"Ireland 1979"', add
label define sample_lbl 372198101 `"Ireland 1981"', add
label define sample_lbl 372198601 `"Ireland 1986"', add
label define sample_lbl 372199101 `"Ireland 1991"', add
label define sample_lbl 372199601 `"Ireland 1996"', add
label define sample_lbl 372200201 `"Ireland 2002"', add
label define sample_lbl 372200601 `"Ireland 2006"', add
label define sample_lbl 372201101 `"Ireland 2011"', add
label define sample_lbl 372201601 `"Ireland 2016"', add
label define sample_lbl 376197201 `"Israel 1972"', add
label define sample_lbl 376198301 `"Israel 1983"', add
label define sample_lbl 376199501 `"Israel 1995"', add
label define sample_lbl 376200801 `"Israel 2008"', add
label define sample_lbl 380200101 `"Italy 2001"', add
label define sample_lbl 380201101 `"Italy 2011"', add
label define sample_lbl 380201121 `"Italy 2011 Q1 LFS"', add
label define sample_lbl 380201221 `"Italy 2012 Q1 LFS"', add
label define sample_lbl 380201321 `"Italy 2013 Q1 LFS"', add
label define sample_lbl 380201421 `"Italy 2014 Q1 LFS"', add
label define sample_lbl 380201521 `"Italy 2015 Q1 LFS"', add
label define sample_lbl 380201621 `"Italy 2016 Q1 LFS"', add
label define sample_lbl 380201721 `"Italy 2017 Q1 LFS"', add
label define sample_lbl 380201821 `"Italy 2018 Q1 LFS"', add
label define sample_lbl 380201921 `"Italy 2019 Q1 LFS"', add
label define sample_lbl 380202021 `"Italy 2020 Q1 LFS"', add
label define sample_lbl 384198801 `"Côte d'Ivoire 1988"', add
label define sample_lbl 384199801 `"Côte d'Ivoire 1998"', add
label define sample_lbl 388198201 `"Jamaica 1982"', add
label define sample_lbl 388199101 `"Jamaica 1991"', add
label define sample_lbl 388200101 `"Jamaica 2001"', add
label define sample_lbl 400200401 `"Jordan 2004"', add
label define sample_lbl 404196901 `"Kenya 1969"', add
label define sample_lbl 404197901 `"Kenya 1979"', add
label define sample_lbl 404198901 `"Kenya 1989"', add
label define sample_lbl 404199901 `"Kenya 1999"', add
label define sample_lbl 404200901 `"Kenya 2009"', add
label define sample_lbl 404201901 `"Kenya 2019"', add
label define sample_lbl 417199901 `"Kyrgyz Republic 1999"', add
label define sample_lbl 417200901 `"Kyrgyz Republic 2009"', add
label define sample_lbl 418199501 `"Laos 1995"', add
label define sample_lbl 418200501 `"Laos 2005"', add
label define sample_lbl 418201501 `"Laos 2015"', add
label define sample_lbl 426199601 `"Lesotho 1996"', add
label define sample_lbl 426200601 `"Lesotho 2006"', add
label define sample_lbl 430197401 `"Liberia 1974"', add
label define sample_lbl 430200801 `"Liberia 2008"', add
label define sample_lbl 454198701 `"Malawi 1987"', add
label define sample_lbl 454199801 `"Malawi 1998"', add
label define sample_lbl 454200801 `"Malawi 2008"', add
label define sample_lbl 454201801 `"Malawi 2018"', add
label define sample_lbl 458197001 `"Malaysia 1970"', add
label define sample_lbl 458198001 `"Malaysia 1980"', add
label define sample_lbl 458199101 `"Malaysia 1991"', add
label define sample_lbl 458200001 `"Malaysia 2000"', add
label define sample_lbl 466198701 `"Mali 1987"', add
label define sample_lbl 466199801 `"Mali 1998"', add
label define sample_lbl 466200901 `"Mali 2009"', add
label define sample_lbl 480199001 `"Mauritius 1990"', add
label define sample_lbl 480200001 `"Mauritius 2000"', add
label define sample_lbl 480201101 `"Mauritius 2011"', add
label define sample_lbl 484196001 `"Mexico 1960"', add
label define sample_lbl 484197001 `"Mexico 1970"', add
label define sample_lbl 484199001 `"Mexico 1990"', add
label define sample_lbl 484199501 `"Mexico 1995"', add
label define sample_lbl 484200001 `"Mexico 2000"', add
label define sample_lbl 484200501 `"Mexico 2005"', add
label define sample_lbl 484201001 `"Mexico 2010"', add
label define sample_lbl 484201501 `"Mexico 2015"', add
label define sample_lbl 484202001 `"Mexico 2020"', add
label define sample_lbl 484200521 `"Mexico 2005 Q1 LFS"', add
label define sample_lbl 484200522 `"Mexico 2005 Q2 LFS"', add
label define sample_lbl 484200523 `"Mexico 2005 Q3 LFS"', add
label define sample_lbl 484200524 `"Mexico 2005 Q4 LFS"', add
label define sample_lbl 484200621 `"Mexico 2006 Q1 LFS"', add
label define sample_lbl 484200622 `"Mexico 2006 Q2 LFS"', add
label define sample_lbl 484200623 `"Mexico 2006 Q3 LFS"', add
label define sample_lbl 484200624 `"Mexico 2006 Q4 LFS"', add
label define sample_lbl 484200721 `"Mexico 2007 Q1 LFS"', add
label define sample_lbl 484200722 `"Mexico 2007 Q2 LFS"', add
label define sample_lbl 484200723 `"Mexico 2007 Q3 LFS"', add
label define sample_lbl 484200724 `"Mexico 2007 Q4 LFS"', add
label define sample_lbl 484200821 `"Mexico 2008 Q1 LFS"', add
label define sample_lbl 484200822 `"Mexico 2008 Q2 LFS"', add
label define sample_lbl 484200823 `"Mexico 2008 Q3 LFS"', add
label define sample_lbl 484200824 `"Mexico 2008 Q4 LFS"', add
label define sample_lbl 484200921 `"Mexico 2009 Q1 LFS"', add
label define sample_lbl 484200922 `"Mexico 2009 Q2 LFS"', add
label define sample_lbl 484200923 `"Mexico 2009 Q3 LFS"', add
label define sample_lbl 484200924 `"Mexico 2009 Q4 LFS"', add
label define sample_lbl 484201021 `"Mexico 2010 Q1 LFS"', add
label define sample_lbl 484201022 `"Mexico 2010 Q2 LFS"', add
label define sample_lbl 484201023 `"Mexico 2010 Q3 LFS"', add
label define sample_lbl 484201024 `"Mexico 2010 Q4 LFS"', add
label define sample_lbl 484201121 `"Mexico 2011 Q1 LFS"', add
label define sample_lbl 484201122 `"Mexico 2011 Q2 LFS"', add
label define sample_lbl 484201123 `"Mexico 2011 Q3 LFS"', add
label define sample_lbl 484201124 `"Mexico 2011 Q4 LFS"', add
label define sample_lbl 484201221 `"Mexico 2012 Q1 LFS"', add
label define sample_lbl 484201222 `"Mexico 2012 Q2 LFS"', add
label define sample_lbl 484201223 `"Mexico 2012 Q3 LFS"', add
label define sample_lbl 484201224 `"Mexico 2012 Q4 LFS"', add
label define sample_lbl 484201321 `"Mexico 2013 Q1 LFS"', add
label define sample_lbl 484201322 `"Mexico 2013 Q2 LFS"', add
label define sample_lbl 484201323 `"Mexico 2013 Q3 LFS"', add
label define sample_lbl 484201324 `"Mexico 2013 Q4 LFS"', add
label define sample_lbl 484201421 `"Mexico 2014 Q1 LFS"', add
label define sample_lbl 484201422 `"Mexico 2014 Q2 LFS"', add
label define sample_lbl 484201423 `"Mexico 2014 Q3 LFS"', add
label define sample_lbl 484201424 `"Mexico 2014 Q4 LFS"', add
label define sample_lbl 484201521 `"Mexico 2015 Q1 LFS"', add
label define sample_lbl 484201522 `"Mexico 2015 Q2 LFS"', add
label define sample_lbl 484201523 `"Mexico 2015 Q3 LFS"', add
label define sample_lbl 484201524 `"Mexico 2015 Q4 LFS"', add
label define sample_lbl 484201621 `"Mexico 2016 Q1 LFS"', add
label define sample_lbl 484201622 `"Mexico 2016 Q2 LFS"', add
label define sample_lbl 484201623 `"Mexico 2016 Q3 LFS"', add
label define sample_lbl 484201624 `"Mexico 2016 Q4 LFS"', add
label define sample_lbl 484201721 `"Mexico 2017 Q1 LFS"', add
label define sample_lbl 484201722 `"Mexico 2017 Q2 LFS"', add
label define sample_lbl 484201723 `"Mexico 2017 Q3 LFS"', add
label define sample_lbl 484201724 `"Mexico 2017 Q4 LFS"', add
label define sample_lbl 484201821 `"Mexico 2018 Q1 LFS"', add
label define sample_lbl 484201822 `"Mexico 2018 Q2 LFS"', add
label define sample_lbl 484201823 `"Mexico 2018 Q3 LFS"', add
label define sample_lbl 484201824 `"Mexico 2018 Q4 LFS"', add
label define sample_lbl 484201921 `"Mexico 2019 Q1 LFS"', add
label define sample_lbl 484201922 `"Mexico 2019 Q2 LFS"', add
label define sample_lbl 484201923 `"Mexico 2019 Q3 LFS"', add
label define sample_lbl 484201924 `"Mexico 2019 Q4 LFS"', add
label define sample_lbl 484202021 `"Mexico 2020 Q1 LFS"', add
label define sample_lbl 484202023 `"Mexico 2020 Q3 LFS"', add
label define sample_lbl 496198901 `"Mongolia 1989"', add
label define sample_lbl 496200001 `"Mongolia 2000"', add
label define sample_lbl 496201001 `"Mongolia 2010"', add
label define sample_lbl 496202001 `"Mongolia 2020"', add
label define sample_lbl 504198201 `"Morocco 1982"', add
label define sample_lbl 504199401 `"Morocco 1994"', add
label define sample_lbl 504200401 `"Morocco 2004"', add
label define sample_lbl 504201401 `"Morocco 2014"', add
label define sample_lbl 508199701 `"Mozambique 1997"', add
label define sample_lbl 508200701 `"Mozambique 2007"', add
label define sample_lbl 508201701 `"Mozambique 2017"', add
label define sample_lbl 104201401 `"Myanmar 2014"', add
label define sample_lbl 524200101 `"Nepal 2001"', add
label define sample_lbl 524201101 `"Nepal 2011"', add
label define sample_lbl 528196001 `"Netherlands 1960"', add
label define sample_lbl 528197101 `"Netherlands 1971"', add
label define sample_lbl 528200101 `"Netherlands 2001"', add
label define sample_lbl 528201101 `"Netherlands 2011"', add
label define sample_lbl 558197101 `"Nicaragua 1971"', add
label define sample_lbl 558199501 `"Nicaragua 1995"', add
label define sample_lbl 558200501 `"Nicaragua 2005"', add
label define sample_lbl 566200621 `"Nigeria 2006"', add
label define sample_lbl 566200721 `"Nigeria 2007"', add
label define sample_lbl 566200821 `"Nigeria 2008"', add
label define sample_lbl 566200921 `"Nigeria 2009"', add
label define sample_lbl 566201021 `"Nigeria 2010"', add
label define sample_lbl 578180101 `"Norway 1801"', add
label define sample_lbl 578186501 `"Norway 1865"', add
label define sample_lbl 578187501 `"Norway 1875"', add
label define sample_lbl 578190001 `"Norway 1900"', add
label define sample_lbl 578191001 `"Norway 1910"', add
label define sample_lbl 586197301 `"Pakistan 1973"', add
label define sample_lbl 586198101 `"Pakistan 1981"', add
label define sample_lbl 586199801 `"Pakistan 1998"', add
label define sample_lbl 275199701 `"Palestine 1997"', add
label define sample_lbl 275200701 `"Palestine 2007"', add
label define sample_lbl 275201701 `"Palestine 2017"', add
label define sample_lbl 591196001 `"Panama 1960"', add
label define sample_lbl 591197001 `"Panama 1970"', add
label define sample_lbl 591198001 `"Panama 1980"', add
label define sample_lbl 591199001 `"Panama 1990"', add
label define sample_lbl 591200001 `"Panama 2000"', add
label define sample_lbl 591201001 `"Panama 2010"', add
label define sample_lbl 598198001 `"Papua New Guinea 1980"', add
label define sample_lbl 598199001 `"Papua New Guinea 1990"', add
label define sample_lbl 598200001 `"Papua New Guinea 2000"', add
label define sample_lbl 600196201 `"Paraguay 1962"', add
label define sample_lbl 600197201 `"Paraguay 1972"', add
label define sample_lbl 600198201 `"Paraguay 1982"', add
label define sample_lbl 600199201 `"Paraguay 1992"', add
label define sample_lbl 600200201 `"Paraguay 2002"', add
label define sample_lbl 604199301 `"Peru 1993"', add
label define sample_lbl 604200701 `"Peru 2007"', add
label define sample_lbl 604201701 `"Peru 2017"', add
label define sample_lbl 608199721 `"Philippines 1997 Q1 LFS"', add
label define sample_lbl 608199722 `"Philippines 1997 Q2 LFS"', add
label define sample_lbl 608199723 `"Philippines 1997 Q3 LFS"', add
label define sample_lbl 608199724 `"Philippines 1997 Q4 LFS"', add
label define sample_lbl 608199821 `"Philippines 1998 Q1 LFS"', add
label define sample_lbl 608199822 `"Philippines 1998 Q2 LFS"', add
label define sample_lbl 608199823 `"Philippines 1998 Q3 LFS"', add
label define sample_lbl 608199824 `"Philippines 1998 Q4 LFS"', add
label define sample_lbl 608199921 `"Philippines 1999 Q1 LFS"', add
label define sample_lbl 608199922 `"Philippines 1999 Q2 LFS"', add
label define sample_lbl 608199923 `"Philippines 1999 Q3 LFS"', add
label define sample_lbl 608199924 `"Philippines 1999 Q4 LFS"', add
label define sample_lbl 608200021 `"Philippines 2000 Q1 LFS"', add
label define sample_lbl 608200022 `"Philippines 2000 Q2 LFS"', add
label define sample_lbl 608200023 `"Philippines 2000 Q3 LFS"', add
label define sample_lbl 608200024 `"Philippines 2000 Q4 LFS"', add
label define sample_lbl 608200121 `"Philippines 2001 Q1 LFS"', add
label define sample_lbl 608200122 `"Philippines 2001 Q2 LFS"', add
label define sample_lbl 608200123 `"Philippines 2001 Q3 LFS"', add
label define sample_lbl 608200124 `"Philippines 2001 Q4 LFS"', add
label define sample_lbl 608200221 `"Philippines 2002 Q1 LFS"', add
label define sample_lbl 608200222 `"Philippines 2002 Q2 LFS"', add
label define sample_lbl 608200223 `"Philippines 2002 Q3 LFS"', add
label define sample_lbl 608200224 `"Philippines 2002 Q4 LFS"', add
label define sample_lbl 608200321 `"Philippines 2003 Q1 LFS"', add
label define sample_lbl 608200322 `"Philippines 2003 Q2 LFS"', add
label define sample_lbl 608200323 `"Philippines 2003 Q3 LFS"', add
label define sample_lbl 608200324 `"Philippines 2003 Q4 LFS"', add
label define sample_lbl 608200421 `"Philippines 2004 Q1 LFS"', add
label define sample_lbl 608200422 `"Philippines 2004 Q2 LFS"', add
label define sample_lbl 608200423 `"Philippines 2004 Q3 LFS"', add
label define sample_lbl 608200424 `"Philippines 2004 Q4 LFS"', add
label define sample_lbl 608200521 `"Philippines 2005 Q1 LFS"', add
label define sample_lbl 608200522 `"Philippines 2005 Q2 LFS"', add
label define sample_lbl 608200523 `"Philippines 2005 Q3 LFS"', add
label define sample_lbl 608200524 `"Philippines 2005 Q4 LFS"', add
label define sample_lbl 608200621 `"Philippines 2006 Q1 LFS"', add
label define sample_lbl 608200622 `"Philippines 2006 Q2 LFS"', add
label define sample_lbl 608200623 `"Philippines 2006 Q3 LFS"', add
label define sample_lbl 608200624 `"Philippines 2006 Q4 LFS"', add
label define sample_lbl 608200721 `"Philippines 2007 Q1 LFS"', add
label define sample_lbl 608200722 `"Philippines 2007 Q2 LFS"', add
label define sample_lbl 608200723 `"Philippines 2007 Q3 LFS"', add
label define sample_lbl 608200724 `"Philippines 2007 Q4 LFS"', add
label define sample_lbl 608200821 `"Philippines 2008 Q1 LFS"', add
label define sample_lbl 608200822 `"Philippines 2008 Q2 LFS"', add
label define sample_lbl 608200823 `"Philippines 2008 Q3 LFS"', add
label define sample_lbl 608200824 `"Philippines 2008 Q4 LFS"', add
label define sample_lbl 608200921 `"Philippines 2009 Q1 LFS"', add
label define sample_lbl 608200922 `"Philippines 2009 Q2 LFS"', add
label define sample_lbl 608200923 `"Philippines 2009 Q3 LFS"', add
label define sample_lbl 608200924 `"Philippines 2009 Q4 LFS"', add
label define sample_lbl 608201021 `"Philippines 2010 Q1 LFS"', add
label define sample_lbl 608201022 `"Philippines 2010 Q2 LFS"', add
label define sample_lbl 608201023 `"Philippines 2010 Q3 LFS"', add
label define sample_lbl 608201024 `"Philippines 2010 Q4 LFS"', add
label define sample_lbl 608201121 `"Philippines 2011 Q1 LFS"', add
label define sample_lbl 608201122 `"Philippines 2011 Q2 LFS"', add
label define sample_lbl 608201123 `"Philippines 2011 Q3 LFS"', add
label define sample_lbl 608201124 `"Philippines 2011 Q4 LFS"', add
label define sample_lbl 608201221 `"Philippines 2012 Q1 LFS"', add
label define sample_lbl 608201222 `"Philippines 2012 Q2 LFS"', add
label define sample_lbl 608201223 `"Philippines 2012 Q3 LFS"', add
label define sample_lbl 608201224 `"Philippines 2012 Q4 LFS"', add
label define sample_lbl 608201321 `"Philippines 2013 Q1 LFS"', add
label define sample_lbl 608201322 `"Philippines 2013 Q2 LFS"', add
label define sample_lbl 608201323 `"Philippines 2013 Q3 LFS"', add
label define sample_lbl 608201324 `"Philippines 2013 Q4 LFS"', add
label define sample_lbl 608201421 `"Philippines 2014 Q1 LFS"', add
label define sample_lbl 608201422 `"Philippines 2014 Q2 LFS"', add
label define sample_lbl 608201423 `"Philippines 2014 Q3 LFS"', add
label define sample_lbl 608201424 `"Philippines 2014 Q4 LFS"', add
label define sample_lbl 608201521 `"Philippines 2015 Q1 LFS"', add
label define sample_lbl 608201522 `"Philippines 2015 Q2 LFS"', add
label define sample_lbl 608201523 `"Philippines 2015 Q3 LFS"', add
label define sample_lbl 608201524 `"Philippines 2015 Q4 LFS"', add
label define sample_lbl 608201621 `"Philippines 2016 Q1 LFS"', add
label define sample_lbl 608201622 `"Philippines 2016 Q2 LFS"', add
label define sample_lbl 608201623 `"Philippines 2016 Q3 LFS"', add
label define sample_lbl 608201624 `"Philippines 2016 Q4 LFS"', add
label define sample_lbl 608201721 `"Philippines 2017 Q1 LFS"', add
label define sample_lbl 608201722 `"Philippines 2017 Q2 LFS"', add
label define sample_lbl 608201723 `"Philippines 2017 Q3 LFS"', add
label define sample_lbl 608201724 `"Philippines 2017 Q4 LFS"', add
label define sample_lbl 608201821 `"Philippines 2018 Q1 LFS"', add
label define sample_lbl 608201822 `"Philippines 2018 Q2 LFS"', add
label define sample_lbl 608201823 `"Philippines 2018 Q3 LFS"', add
label define sample_lbl 608201824 `"Philippines 2018 Q4 LFS"', add
label define sample_lbl 608201921 `"Philippines 2019 Q1 LFS"', add
label define sample_lbl 608201922 `"Philippines 2019 Q2 LFS"', add
label define sample_lbl 608201923 `"Philippines 2019 Q3 LFS"', add
label define sample_lbl 608199001 `"Philippines 1990"', add
label define sample_lbl 608199501 `"Philippines 1995"', add
label define sample_lbl 608200001 `"Philippines 2000"', add
label define sample_lbl 608201001 `"Philippines 2010"', add
label define sample_lbl 616197801 `"Poland 1978"', add
label define sample_lbl 616198801 `"Poland 1988"', add
label define sample_lbl 616200201 `"Poland 2002"', add
label define sample_lbl 616201101 `"Poland 2011"', add
label define sample_lbl 620198101 `"Portugal 1981"', add
label define sample_lbl 620199101 `"Portugal 1991"', add
label define sample_lbl 620200101 `"Portugal 2001"', add
label define sample_lbl 620201101 `"Portugal 2011"', add
label define sample_lbl 630197001 `"Puerto Rico 1970"', add
label define sample_lbl 630198001 `"Puerto Rico 1980"', add
label define sample_lbl 630199001 `"Puerto Rico 1990"', add
label define sample_lbl 630200001 `"Puerto Rico 2000"', add
label define sample_lbl 630200501 `"Puerto Rico 2005"', add
label define sample_lbl 630201001 `"Puerto Rico 2010"', add
label define sample_lbl 630201501 `"Puerto Rico 2015"', add
label define sample_lbl 630202001 `"Puerto Rico 2020"', add
label define sample_lbl 642197701 `"Romania 1977"', add
label define sample_lbl 642199201 `"Romania 1992"', add
label define sample_lbl 642200201 `"Romania 2002"', add
label define sample_lbl 642201101 `"Romania 2011"', add
label define sample_lbl 643200201 `"Russia 2002"', add
label define sample_lbl 643201001 `"Russia 2010"', add
label define sample_lbl 646199101 `"Rwanda 1991"', add
label define sample_lbl 646200201 `"Rwanda 2002"', add
label define sample_lbl 646201201 `"Rwanda 2012"', add
label define sample_lbl 662198001 `"Saint Lucia 1980"', add
label define sample_lbl 662199101 `"Saint Lucia 1991"', add
label define sample_lbl 686198801 `"Senegal 1988"', add
label define sample_lbl 686200201 `"Senegal 2002"', add
label define sample_lbl 686201301 `"Senegal 2013"', add
label define sample_lbl 694200401 `"Sierra Leone 2004"', add
label define sample_lbl 694201501 `"Sierra Leone 2015"', add
label define sample_lbl 703199101 `"Slovak Republic 1991"', add
label define sample_lbl 703200101 `"Slovak Republic 2001"', add
label define sample_lbl 703201101 `"Slovak Republic 2011"', add
label define sample_lbl 705200201 `"Slovenia 2002"', add
label define sample_lbl 710199601 `"South Africa 1996"', add
label define sample_lbl 710200101 `"South Africa 2001"', add
label define sample_lbl 710200701 `"South Africa 2007"', add
label define sample_lbl 710201101 `"South Africa 2011"', add
label define sample_lbl 710201601 `"South Africa 2016"', add
label define sample_lbl 728200801 `"South Sudan 2008"', add
label define sample_lbl 724198101 `"Spain 1981"', add
label define sample_lbl 724199101 `"Spain 1991"', add
label define sample_lbl 724200101 `"Spain 2001"', add
label define sample_lbl 724201101 `"Spain 2011"', add
label define sample_lbl 724200521 `"Spain 2005 Q1 LFS"', add
label define sample_lbl 724200522 `"Spain 2005 Q2 LFS"', add
label define sample_lbl 724200523 `"Spain 2005 Q3 LFS"', add
label define sample_lbl 724200524 `"Spain 2005 Q4 LFS"', add
label define sample_lbl 724200621 `"Spain 2006 Q1 LFS"', add
label define sample_lbl 724200622 `"Spain 2006 Q2 LFS"', add
label define sample_lbl 724200623 `"Spain 2006 Q3 LFS"', add
label define sample_lbl 724200624 `"Spain 2006 Q4 LFS"', add
label define sample_lbl 724200721 `"Spain 2007 Q1 LFS"', add
label define sample_lbl 724200722 `"Spain 2007 Q2 LFS"', add
label define sample_lbl 724200723 `"Spain 2007 Q3 LFS"', add
label define sample_lbl 724200724 `"Spain 2007 Q4 LFS"', add
label define sample_lbl 724200821 `"Spain 2008 Q1 LFS"', add
label define sample_lbl 724200822 `"Spain 2008 Q2 LFS"', add
label define sample_lbl 724200823 `"Spain 2008 Q3 LFS"', add
label define sample_lbl 724200824 `"Spain 2008 Q4 LFS"', add
label define sample_lbl 724200921 `"Spain 2009 Q1 LFS"', add
label define sample_lbl 724200922 `"Spain 2009 Q2 LFS"', add
label define sample_lbl 724200923 `"Spain 2009 Q3 LFS"', add
label define sample_lbl 724200924 `"Spain 2009 Q4 LFS"', add
label define sample_lbl 724201021 `"Spain 2010 Q1 LFS"', add
label define sample_lbl 724201022 `"Spain 2010 Q2 LFS"', add
label define sample_lbl 724201023 `"Spain 2010 Q3 LFS"', add
label define sample_lbl 724201024 `"Spain 2010 Q4 LFS"', add
label define sample_lbl 724201121 `"Spain 2011 Q1 LFS"', add
label define sample_lbl 724201122 `"Spain 2011 Q2 LFS"', add
label define sample_lbl 724201123 `"Spain 2011 Q3 LFS"', add
label define sample_lbl 724201124 `"Spain 2011 Q4 LFS"', add
label define sample_lbl 724201221 `"Spain 2012 Q1 LFS"', add
label define sample_lbl 724201222 `"Spain 2012 Q2 LFS"', add
label define sample_lbl 724201223 `"Spain 2012 Q3 LFS"', add
label define sample_lbl 724201224 `"Spain 2012 Q4 LFS"', add
label define sample_lbl 724201321 `"Spain 2013 Q1 LFS"', add
label define sample_lbl 724201322 `"Spain 2013 Q2 LFS"', add
label define sample_lbl 724201323 `"Spain 2013 Q3 LFS"', add
label define sample_lbl 724201324 `"Spain 2013 Q4 LFS"', add
label define sample_lbl 724201421 `"Spain 2014 Q1 LFS"', add
label define sample_lbl 724201422 `"Spain 2014 Q2 LFS"', add
label define sample_lbl 724201423 `"Spain 2014 Q3 LFS"', add
label define sample_lbl 724201424 `"Spain 2014 Q4 LFS"', add
label define sample_lbl 724201521 `"Spain 2015 Q1 LFS"', add
label define sample_lbl 724201522 `"Spain 2015 Q2 LFS"', add
label define sample_lbl 724201523 `"Spain 2015 Q3 LFS"', add
label define sample_lbl 724201524 `"Spain 2015 Q4 LFS"', add
label define sample_lbl 724201621 `"Spain 2016 Q1 LFS"', add
label define sample_lbl 724201622 `"Spain 2016 Q2 LFS"', add
label define sample_lbl 724201623 `"Spain 2016 Q3 LFS"', add
label define sample_lbl 724201624 `"Spain 2016 Q4 LFS"', add
label define sample_lbl 724201721 `"Spain 2017 Q1 LFS"', add
label define sample_lbl 724201722 `"Spain 2017 Q2 LFS"', add
label define sample_lbl 724201723 `"Spain 2017 Q3 LFS"', add
label define sample_lbl 724201724 `"Spain 2017 Q4 LFS"', add
label define sample_lbl 724201821 `"Spain 2018 Q1 LFS"', add
label define sample_lbl 724201822 `"Spain 2018 Q2 LFS"', add
label define sample_lbl 724201823 `"Spain 2018 Q3 LFS"', add
label define sample_lbl 724201824 `"Spain 2018 Q4 LFS"', add
label define sample_lbl 724201921 `"Spain 2019 Q1 LFS"', add
label define sample_lbl 724201922 `"Spain 2019 Q2 LFS"', add
label define sample_lbl 724201923 `"Spain 2019 Q3 LFS"', add
label define sample_lbl 724201924 `"Spain 2019 Q4 LFS"', add
label define sample_lbl 724202021 `"Spain 2020 Q1 LFS"', add
label define sample_lbl 724202022 `"Spain 2020 Q2 LFS"', add
label define sample_lbl 724202023 `"Spain 2020 Q3 LFS"', add
label define sample_lbl 724202024 `"Spain 2020 Q4 LFS"', add
label define sample_lbl 729200801 `"Sudan 2008"', add
label define sample_lbl 740200401 `"Suriname 2004"', add
label define sample_lbl 740201201 `"Suriname 2012"', add
label define sample_lbl 752188001 `"Sweden 1880"', add
label define sample_lbl 752189001 `"Sweden 1890"', add
label define sample_lbl 752190001 `"Sweden 1900"', add
label define sample_lbl 752191001 `"Sweden 1910"', add
label define sample_lbl 756197001 `"Switzerland 1970"', add
label define sample_lbl 756198001 `"Switzerland 1980"', add
label define sample_lbl 756199001 `"Switzerland 1990"', add
label define sample_lbl 756200001 `"Switzerland 2000"', add
label define sample_lbl 756201101 `"Switzerland 2011"', add
label define sample_lbl 834198801 `"Tanzania 1988"', add
label define sample_lbl 834200201 `"Tanzania 2002"', add
label define sample_lbl 834201201 `"Tanzania 2012"', add
label define sample_lbl 764197001 `"Thailand 1970"', add
label define sample_lbl 764198001 `"Thailand 1980"', add
label define sample_lbl 764199001 `"Thailand 1990"', add
label define sample_lbl 764200001 `"Thailand 2000"', add
label define sample_lbl 768196001 `"Togo 1960"', add
label define sample_lbl 768197001 `"Togo 1970"', add
label define sample_lbl 768201001 `"Togo 2010"', add
label define sample_lbl 780197001 `"Trinidad and Tobago 1970"', add
label define sample_lbl 780198001 `"Trinidad and Tobago 1980"', add
label define sample_lbl 780199001 `"Trinidad and Tobago 1990"', add
label define sample_lbl 780200001 `"Trinidad and Tobago 2000"', add
label define sample_lbl 780201101 `"Trinidad and Tobago 2011"', add
label define sample_lbl 792198501 `"Turkey 1985"', add
label define sample_lbl 792199001 `"Turkey 1990"', add
label define sample_lbl 792200001 `"Turkey 2000"', add
label define sample_lbl 800199101 `"Uganda 1991"', add
label define sample_lbl 800200201 `"Uganda 2002"', add
label define sample_lbl 800201401 `"Uganda 2014"', add
label define sample_lbl 804200101 `"Ukraine 2001"', add
label define sample_lbl 826185101 `"United Kingdom 1851 (England and Wales)"', add
label define sample_lbl 826185102 `"United Kingdom 1851 (Scotland)"', add
label define sample_lbl 826185103 `"United Kingdom 1851 (2% sample)"', add
label define sample_lbl 826186101 `"United Kingdom 1861 (England and Wales)"', add
label define sample_lbl 826186102 `"United Kingdom 1861 (Scotland)"', add
label define sample_lbl 826187101 `"United Kingdom 1871 (Scotland)"', add
label define sample_lbl 826188101 `"United Kingdom 1881 (England and Wales)"', add
label define sample_lbl 826188102 `"United Kingdom 1881 (Scotland)"', add
label define sample_lbl 826189101 `"United Kingdom 1891 (England and Wales)"', add
label define sample_lbl 826189102 `"United Kingdom 1891 (Scotland)"', add
label define sample_lbl 826190101 `"United Kingdom 1901 (England and Wales)"', add
label define sample_lbl 826190102 `"United Kingdom 1901 (Scotland)"', add
label define sample_lbl 826191101 `"United Kingdom 1911 (England and Wales)"', add
label define sample_lbl 826196101 `"United Kingdom 1961"', add
label define sample_lbl 826197101 `"United Kingdom 1971"', add
label define sample_lbl 826199101 `"United Kingdom 1991"', add
label define sample_lbl 826200101 `"United Kingdom 2001"', add
label define sample_lbl 840185001 `"United States 1850 (100%)"', add
label define sample_lbl 840185002 `"United States 1850 (1%)"', add
label define sample_lbl 840186001 `"United States 1860 (1%)"', add
label define sample_lbl 840187001 `"United States 1870 (1%)"', add
label define sample_lbl 840188001 `"United States 1880 (100%)"', add
label define sample_lbl 840188002 `"United States 1880 (10%)"', add
label define sample_lbl 840190001 `"United States 1900 (5%)"', add
label define sample_lbl 840191001 `"United States 1910 (1%)"', add
label define sample_lbl 840196001 `"United States 1960"', add
label define sample_lbl 840197001 `"United States 1970"', add
label define sample_lbl 840198001 `"United States 1980"', add
label define sample_lbl 840199001 `"United States 1990"', add
label define sample_lbl 840200001 `"United States 2000"', add
label define sample_lbl 840200501 `"United States 2005"', add
label define sample_lbl 840201001 `"United States 2010"', add
label define sample_lbl 840201501 `"United States 2015"', add
label define sample_lbl 840202001 `"United States 2020"', add
label define sample_lbl 858196301 `"Uruguay 1963"', add
label define sample_lbl 858196302 `"Uruguay 1963 (full count)"', add
label define sample_lbl 858197501 `"Uruguay 1975"', add
label define sample_lbl 858197502 `"Uruguay 1975 (full count)"', add
label define sample_lbl 858198501 `"Uruguay 1985"', add
label define sample_lbl 858198502 `"Uruguay 1985 (full count)"', add
label define sample_lbl 858199601 `"Uruguay 1996"', add
label define sample_lbl 858199602 `"Uruguay 1996 (full count)"', add
label define sample_lbl 858200621 `"Uruguay 2006"', add
label define sample_lbl 858201101 `"Uruguay 2011"', add
label define sample_lbl 858201102 `"Uruguay 2011 (full count)"', add
label define sample_lbl 862197101 `"Venezuela 1971"', add
label define sample_lbl 862198101 `"Venezuela 1981"', add
label define sample_lbl 862199001 `"Venezuela 1990"', add
label define sample_lbl 862200101 `"Venezuela 2001"', add
label define sample_lbl 704198901 `"Vietnam 1989"', add
label define sample_lbl 704199901 `"Vietnam 1999"', add
label define sample_lbl 704200901 `"Vietnam 2009"', add
label define sample_lbl 704201901 `"Vietnam 2019"', add
label define sample_lbl 894199001 `"Zambia 1990"', add
label define sample_lbl 894200001 `"Zambia 2000"', add
label define sample_lbl 894201001 `"Zambia 2010"', add
label define sample_lbl 716201201 `"Zimbabwe 2012"', add
label values sample sample_lbl

label define subsamp_lbl 00 `"1st 1% subsample"'
label define subsamp_lbl 01 `"2nd 1% subsample"', add
label define subsamp_lbl 02 `"3rd 1% subsample"', add
label define subsamp_lbl 03 `"4th 1% subsample"', add
label define subsamp_lbl 04 `"5th 1% subsample"', add
label define subsamp_lbl 05 `"6th 1% subsample"', add
label define subsamp_lbl 06 `"7th 1% subsample"', add
label define subsamp_lbl 07 `"8th 1% subsample"', add
label define subsamp_lbl 08 `"9th 1% subsample"', add
label define subsamp_lbl 09 `"10th 1% subsample"', add
label define subsamp_lbl 10 `"11th 1% subsample"', add
label define subsamp_lbl 11 `"12th 1% subsample"', add
label define subsamp_lbl 12 `"13th 1% subsample"', add
label define subsamp_lbl 13 `"14th 1% subsample"', add
label define subsamp_lbl 14 `"15th 1% subsample"', add
label define subsamp_lbl 15 `"16th 1% subsample"', add
label define subsamp_lbl 16 `"17th 1% subsample"', add
label define subsamp_lbl 17 `"18th 1% subsample"', add
label define subsamp_lbl 18 `"19th 1% subsample"', add
label define subsamp_lbl 19 `"20th 1% subsample"', add
label define subsamp_lbl 20 `"21st 1% subsample"', add
label define subsamp_lbl 21 `"22nd 1% subsample"', add
label define subsamp_lbl 22 `"23rd 1% subsample"', add
label define subsamp_lbl 23 `"24th 1% subsample"', add
label define subsamp_lbl 24 `"25th 1% subsample"', add
label define subsamp_lbl 25 `"26th 1% subsample"', add
label define subsamp_lbl 26 `"27th 1% subsample"', add
label define subsamp_lbl 27 `"28th 1% subsample"', add
label define subsamp_lbl 28 `"29th 1% subsample"', add
label define subsamp_lbl 29 `"30th 1% subsample"', add
label define subsamp_lbl 30 `"31st 1% subsample"', add
label define subsamp_lbl 31 `"32nd 1% subsample"', add
label define subsamp_lbl 32 `"33rd 1% subsample"', add
label define subsamp_lbl 33 `"34th 1% subsample"', add
label define subsamp_lbl 34 `"35th 1% subsample"', add
label define subsamp_lbl 35 `"36th 1% subsample"', add
label define subsamp_lbl 36 `"37th 1% subsample"', add
label define subsamp_lbl 37 `"38th 1% subsample"', add
label define subsamp_lbl 38 `"39th 1% subsample"', add
label define subsamp_lbl 39 `"40th 1% subsample"', add
label define subsamp_lbl 40 `"41st 1% subsample"', add
label define subsamp_lbl 41 `"42nd 1% subsample"', add
label define subsamp_lbl 42 `"43rd 1% subsample"', add
label define subsamp_lbl 43 `"44th 1% subsample"', add
label define subsamp_lbl 44 `"45th 1% subsample"', add
label define subsamp_lbl 45 `"46th 1% subsample"', add
label define subsamp_lbl 46 `"47th 1% subsample"', add
label define subsamp_lbl 47 `"48th 1% subsample"', add
label define subsamp_lbl 48 `"49th 1% subsample"', add
label define subsamp_lbl 49 `"50th 1% subsample"', add
label define subsamp_lbl 50 `"51st 1% subsample"', add
label define subsamp_lbl 51 `"52nd 1% subsample"', add
label define subsamp_lbl 52 `"53rd 1% subsample"', add
label define subsamp_lbl 53 `"54th 1% subsample"', add
label define subsamp_lbl 54 `"55th 1% subsample"', add
label define subsamp_lbl 55 `"56th 1% subsample"', add
label define subsamp_lbl 56 `"57th 1% subsample"', add
label define subsamp_lbl 57 `"58th 1% subsample"', add
label define subsamp_lbl 58 `"59th 1% subsample"', add
label define subsamp_lbl 59 `"60th 1% subsample"', add
label define subsamp_lbl 60 `"61st 1% subsample"', add
label define subsamp_lbl 61 `"62nd 1% subsample"', add
label define subsamp_lbl 62 `"63rd 1% subsample"', add
label define subsamp_lbl 63 `"64th 1% subsample"', add
label define subsamp_lbl 64 `"65th 1% subsample"', add
label define subsamp_lbl 65 `"66th 1% subsample"', add
label define subsamp_lbl 66 `"67th 1% subsample"', add
label define subsamp_lbl 67 `"68th 1% subsample"', add
label define subsamp_lbl 68 `"69th 1% subsample"', add
label define subsamp_lbl 69 `"70th 1% subsample"', add
label define subsamp_lbl 70 `"71st 1% subsample"', add
label define subsamp_lbl 71 `"72nd 1% subsample"', add
label define subsamp_lbl 72 `"73rd 1% subsample"', add
label define subsamp_lbl 73 `"74th 1% subsample"', add
label define subsamp_lbl 74 `"75th 1% subsample"', add
label define subsamp_lbl 75 `"76th 1% subsample"', add
label define subsamp_lbl 76 `"77th 1% subsample"', add
label define subsamp_lbl 77 `"78th 1% subsample"', add
label define subsamp_lbl 78 `"79th 1% subsample"', add
label define subsamp_lbl 79 `"80th 1% subsample"', add
label define subsamp_lbl 80 `"81st 1% subsample"', add
label define subsamp_lbl 81 `"82nd 1% subsample"', add
label define subsamp_lbl 82 `"83rd 1% subsample"', add
label define subsamp_lbl 83 `"84th 1% subsample"', add
label define subsamp_lbl 84 `"85th 1% subsample"', add
label define subsamp_lbl 85 `"86th 1% subsample"', add
label define subsamp_lbl 86 `"87th 1% subsample"', add
label define subsamp_lbl 87 `"88th 1% subsample"', add
label define subsamp_lbl 88 `"89th 1% subsample"', add
label define subsamp_lbl 89 `"90th 1% subsample"', add
label define subsamp_lbl 90 `"91st 1% subsample"', add
label define subsamp_lbl 91 `"92nd 1% subsample"', add
label define subsamp_lbl 92 `"93rd 1% subsample"', add
label define subsamp_lbl 93 `"94th 1% subsample"', add
label define subsamp_lbl 94 `"95th 1% subsample"', add
label define subsamp_lbl 95 `"96th 1% subsample"', add
label define subsamp_lbl 96 `"97th 1% subsample"', add
label define subsamp_lbl 97 `"98th 1% subsample"', add
label define subsamp_lbl 98 `"99th 1% subsample"', add
label define subsamp_lbl 99 `"100th 1% subsample"', add
label values subsamp subsamp_lbl

label define gq_lbl 00 `"Vacant"'
label define gq_lbl 10 `"Households"', add
label define gq_lbl 20 `"Group quarters (collective), n.s."', add
label define gq_lbl 21 `"Institutions"', add
label define gq_lbl 22 `"Other group quarters"', add
label define gq_lbl 29 `"1-person unit created by splitting large household"', add
label define gq_lbl 99 `"Unknown/group quarters not identified"', add
label values gq gq_lbl

label define unrel_lbl 0 `"0"'
label define unrel_lbl 1 `"1"', add
label define unrel_lbl 2 `"2"', add
label define unrel_lbl 3 `"3"', add
label define unrel_lbl 4 `"4"', add
label define unrel_lbl 5 `"5"', add
label define unrel_lbl 6 `"6"', add
label define unrel_lbl 7 `"7"', add
label define unrel_lbl 8 `"8"', add
label define unrel_lbl 9 `"9+"', add
label values unrel unrel_lbl

label define urban_lbl 1 `"Rural"'
label define urban_lbl 2 `"Urban"', add
label define urban_lbl 9 `"Unknown"', add
label values urban urban_lbl

label define regionw_lbl 11 `"Eastern Africa"'
label define regionw_lbl 12 `"Middle Africa"', add
label define regionw_lbl 13 `"Northern Africa"', add
label define regionw_lbl 14 `"Southern Africa"', add
label define regionw_lbl 15 `"Western Africa"', add
label define regionw_lbl 21 `"Caribbean"', add
label define regionw_lbl 22 `"Central America"', add
label define regionw_lbl 23 `"North America"', add
label define regionw_lbl 24 `"South America"', add
label define regionw_lbl 31 `"Central Asia"', add
label define regionw_lbl 32 `"Eastern Asia"', add
label define regionw_lbl 33 `"Southern Asia"', add
label define regionw_lbl 34 `"South-Eastern Asia"', add
label define regionw_lbl 35 `"Western Asia"', add
label define regionw_lbl 41 `"Eastern Europe"', add
label define regionw_lbl 42 `"Northern Europe"', add
label define regionw_lbl 43 `"Southern Europe"', add
label define regionw_lbl 44 `"Western Europe"', add
label define regionw_lbl 51 `"Australia and New Zealand"', add
label define regionw_lbl 52 `"Melanesia"', add
label define regionw_lbl 53 `"Micronesia"', add
label define regionw_lbl 54 `"Polynesia"', add
label values regionw regionw_lbl

label define popdensgeo1_lbl 00000000 `"Unknown"'
label values popdensgeo1 popdensgeo1_lbl

label define geo1_ls_lbl 426001 `"Butha Buthe"'
label define geo1_ls_lbl 426002 `"Leribe"', add
label define geo1_ls_lbl 426003 `"Berea"', add
label define geo1_ls_lbl 426004 `"Maseru"', add
label define geo1_ls_lbl 426005 `"Mafeteng"', add
label define geo1_ls_lbl 426006 `"Mohale's Hoek"', add
label define geo1_ls_lbl 426007 `"Quthing"', add
label define geo1_ls_lbl 426008 `"Qacha's Nek"', add
label define geo1_ls_lbl 426009 `"Mokhotlong"', add
label define geo1_ls_lbl 426010 `"Thaba-Tseka"', add
label define geo1_ls_lbl 426099 `"Unknown"', add
label values geo1_ls geo1_ls_lbl

label define geo1_ls1996_lbl 000001 `"Butha Buthe"'
label define geo1_ls1996_lbl 000002 `"Leribe"', add
label define geo1_ls1996_lbl 000003 `"Berea"', add
label define geo1_ls1996_lbl 000004 `"Maseru"', add
label define geo1_ls1996_lbl 000005 `"Mafeteng"', add
label define geo1_ls1996_lbl 000006 `"Mohale's Hoek"', add
label define geo1_ls1996_lbl 000007 `"Quthing"', add
label define geo1_ls1996_lbl 000008 `"Qacha's Nek"', add
label define geo1_ls1996_lbl 000009 `"Mokhotlong"', add
label define geo1_ls1996_lbl 000010 `"Thaba Tseka"', add
label define geo1_ls1996_lbl 000099 `"Unknown"', add
label values geo1_ls1996 geo1_ls1996_lbl

label define geo1_ls2006_lbl 001 `"Butha Buthe"'
label define geo1_ls2006_lbl 002 `"Leribe"', add
label define geo1_ls2006_lbl 003 `"Berea"', add
label define geo1_ls2006_lbl 004 `"Maseru"', add
label define geo1_ls2006_lbl 005 `"Mafeteng"', add
label define geo1_ls2006_lbl 006 `"Mohale's Hoek"', add
label define geo1_ls2006_lbl 007 `"Quthing"', add
label define geo1_ls2006_lbl 008 `"Qacha's Nek"', add
label define geo1_ls2006_lbl 009 `"Mokhotlong"', add
label define geo1_ls2006_lbl 010 `"Thaba Tseka"', add
label values geo1_ls2006 geo1_ls2006_lbl

label define geo2_ls_lbl 426001002 `"Hololo, Mechachane, Qalo"'
label define geo2_ls_lbl 426001003 `"Motete"', add
label define geo2_ls_lbl 426001005 `"Botha-Bothe"', add
label define geo2_ls_lbl 426002006 `"Malibamatso"', add
label define geo2_ls_lbl 426002007 `"Mphosong"', add
label define geo2_ls_lbl 426002008 `"Thaba-Phatsoa"', add
label define geo2_ls_lbl 426002010 `"Pela-Tsoeu"', add
label define geo2_ls_lbl 426002011 `"Matlakeng, Mohobollo"', add
label define geo2_ls_lbl 426002013 `"Hlotse, Mahobong"', add
label define geo2_ls_lbl 426002014 `"Tsikoane"', add
label define geo2_ls_lbl 426002015 `"Maputsoe"', add
label define geo2_ls_lbl 426002016 `"Likhetlane"', add
label define geo2_ls_lbl 426002017 `"Peka, Kolonyama"', add
label define geo2_ls_lbl 426003019 `"Mosalemane"', add
label define geo2_ls_lbl 426003020 `"Nokong"', add
label define geo2_ls_lbl 426003021 `"Bela-Bela"', add
label define geo2_ls_lbl 426003023 `"Khafung"', add
label define geo2_ls_lbl 426003024 `"Teyateyaneng"', add
label define geo2_ls_lbl 426003025 `"Malimong, Pulane"', add
label define geo2_ls_lbl 426003026 `"Thupa-Kubu, Seqonoka"', add
label define geo2_ls_lbl 426003028 `"Berea"', add
label define geo2_ls_lbl 426003029 `"Mabote"', add
label define geo2_ls_lbl 426004030 `"Motimposo"', add
label define geo2_ls_lbl 426004031 `"Stadium Area"', add
label define geo2_ls_lbl 426004032 `"Maseru Central"', add
label define geo2_ls_lbl 426004033 `"Qoaling"', add
label define geo2_ls_lbl 426004034 `"Lithoteng, Abia"', add
label define geo2_ls_lbl 426004035 `"Lithabaneng"', add
label define geo2_ls_lbl 426004037 `"Thaba-Bosiu"', add
label define geo2_ls_lbl 426004038 `"Machache"', add
label define geo2_ls_lbl 426004039 `"Thaba-Putsoa"', add
label define geo2_ls_lbl 426004040 `"Maama, Koro-Koro"', add
label define geo2_ls_lbl 426004042 `"Qeme"', add
label define geo2_ls_lbl 426004043 `"Rothe"', add
label define geo2_ls_lbl 426004044 `"Matsieng"', add
label define geo2_ls_lbl 426004045 `"Makhaleng"', add
label define geo2_ls_lbl 426004046 `"Maletsunyane"', add
label define geo2_ls_lbl 426005047 `"Thaba-Pechela"', add
label define geo2_ls_lbl 426005048 `"Kolo"', add
label define geo2_ls_lbl 426005051 `"Matelile, Maliepetsane, Thaba-Tsoeu"', add
label define geo2_ls_lbl 426005052 `"Thabana-Morena"', add
label define geo2_ls_lbl 426005053 `"Likhoele"', add
label define geo2_ls_lbl 426005055 `"Mafeteng, Qablane"', add
label define geo2_ls_lbl 426006057 `"Qhalasi, Taung, Mpharane"', add
label define geo2_ls_lbl 426006058 `"Mohale's Hoek"', add
label define geo2_ls_lbl 426006059 `"Mekaling"', add
label define geo2_ls_lbl 426006060 `"Qaqatu"', add
label define geo2_ls_lbl 426006062 `"Ketane"', add
label define geo2_ls_lbl 426006063 `"Hloahloeng"', add
label define geo2_ls_lbl 426007064 `"Tele"', add
label define geo2_ls_lbl 426007065 `"Moyeni"', add
label define geo2_ls_lbl 426007066 `"Sebapala"', add
label define geo2_ls_lbl 426007067 `"MT Moroosi"', add
label define geo2_ls_lbl 426007068 `"Qhoali"', add
label define geo2_ls_lbl 426008069 `"Qacha's Nek, Lebakeng"', add
label define geo2_ls_lbl 426008071 `"Tsoelike"', add
label define geo2_ls_lbl 426009077 `"Malingoaneng"', add
label define geo2_ls_lbl 426009078 `"Senqu"', add
label define geo2_ls_lbl 426009079 `"Mokhotlong"', add
label define geo2_ls_lbl 426009080 `"Bobatsi"', add
label define geo2_ls_lbl 426010072 `"Mantsonyane, Thaba-Moea"', add
label define geo2_ls_lbl 426010074 `"Thaba-Tseka"', add
label define geo2_ls_lbl 426010075 `"Semena"', add
label define geo2_ls_lbl 426010076 `"Mashai"', add
label values geo2_ls geo2_ls_lbl

label define geo2_ls2006_lbl 001002 `"Hololo, Mechachane, Qalo"'
label define geo2_ls2006_lbl 001003 `"Motete"', add
label define geo2_ls2006_lbl 001005 `"Botha-Bothe"', add
label define geo2_ls2006_lbl 002006 `"Malibamatso"', add
label define geo2_ls2006_lbl 002007 `"Mphosong"', add
label define geo2_ls2006_lbl 002008 `"Thaba-Phatsoa"', add
label define geo2_ls2006_lbl 002010 `"Pela-Tsoeu"', add
label define geo2_ls2006_lbl 002011 `"Matlakeng, Mohobollo"', add
label define geo2_ls2006_lbl 002013 `"Hlotse, Mahobong"', add
label define geo2_ls2006_lbl 002014 `"Tsikoane"', add
label define geo2_ls2006_lbl 002015 `"Maputsoe"', add
label define geo2_ls2006_lbl 002016 `"Likhetlane"', add
label define geo2_ls2006_lbl 002017 `"Peka, Kolonyama"', add
label define geo2_ls2006_lbl 003019 `"Mosalemane"', add
label define geo2_ls2006_lbl 003020 `"Nokong"', add
label define geo2_ls2006_lbl 003021 `"Bela-Bela"', add
label define geo2_ls2006_lbl 003023 `"Khafung"', add
label define geo2_ls2006_lbl 003024 `"Teyateyaneng"', add
label define geo2_ls2006_lbl 003025 `"Malimong, Pulane"', add
label define geo2_ls2006_lbl 003026 `"Thupa-Kubu, Seqonoka"', add
label define geo2_ls2006_lbl 003028 `"Berea"', add
label define geo2_ls2006_lbl 003029 `"Mabote"', add
label define geo2_ls2006_lbl 004030 `"Motimposo"', add
label define geo2_ls2006_lbl 004031 `"Stadium Area"', add
label define geo2_ls2006_lbl 004032 `"Maseru Central"', add
label define geo2_ls2006_lbl 004033 `"Qoaling"', add
label define geo2_ls2006_lbl 004034 `"Lithoteng, Abia"', add
label define geo2_ls2006_lbl 004035 `"Lithabaneng"', add
label define geo2_ls2006_lbl 004037 `"Thaba-Bosiu"', add
label define geo2_ls2006_lbl 004038 `"Machache"', add
label define geo2_ls2006_lbl 004039 `"Thaba-Putsoa"', add
label define geo2_ls2006_lbl 004040 `"Maama, Koro-Koro"', add
label define geo2_ls2006_lbl 004042 `"Qeme"', add
label define geo2_ls2006_lbl 004043 `"Rothe"', add
label define geo2_ls2006_lbl 004044 `"Matsieng"', add
label define geo2_ls2006_lbl 004045 `"Makhaleng"', add
label define geo2_ls2006_lbl 004046 `"Maletsunyane"', add
label define geo2_ls2006_lbl 005047 `"Thaba-Pechela"', add
label define geo2_ls2006_lbl 005048 `"Kolo"', add
label define geo2_ls2006_lbl 005051 `"Matelile, Maliepetsane, Thaba-Tsoeu"', add
label define geo2_ls2006_lbl 005052 `"Thabana-Morena"', add
label define geo2_ls2006_lbl 005053 `"Likhoele"', add
label define geo2_ls2006_lbl 005055 `"Mafeteng, Qablane"', add
label define geo2_ls2006_lbl 006057 `"Qhalasi, Taung, Mpharane"', add
label define geo2_ls2006_lbl 006058 `"Mohale's Hoek"', add
label define geo2_ls2006_lbl 006059 `"Mekaling"', add
label define geo2_ls2006_lbl 006060 `"Qaqatu"', add
label define geo2_ls2006_lbl 006062 `"Ketane"', add
label define geo2_ls2006_lbl 006063 `"Hloahloeng"', add
label define geo2_ls2006_lbl 007064 `"Tele"', add
label define geo2_ls2006_lbl 007065 `"Moyeni"', add
label define geo2_ls2006_lbl 007066 `"Sebapala"', add
label define geo2_ls2006_lbl 007067 `"MT Moroosi"', add
label define geo2_ls2006_lbl 007068 `"Qhoali"', add
label define geo2_ls2006_lbl 008069 `"Qacha's Nek, Lebakeng"', add
label define geo2_ls2006_lbl 008071 `"Tsoelike"', add
label define geo2_ls2006_lbl 009077 `"Malingoaneng"', add
label define geo2_ls2006_lbl 009078 `"Senqu"', add
label define geo2_ls2006_lbl 009079 `"Mokhotlong"', add
label define geo2_ls2006_lbl 009080 `"Bobatsi"', add
label define geo2_ls2006_lbl 010072 `"Mantsonyane, Thaba-Moea"', add
label define geo2_ls2006_lbl 010074 `"Thaba-Tseka"', add
label define geo2_ls2006_lbl 010075 `"Semena"', add
label define geo2_ls2006_lbl 010076 `"Mashai"', add
label values geo2_ls2006 geo2_ls2006_lbl

label define dhs_ipumsi_ls_lbl 01 `"Botha-bothe"'
label define dhs_ipumsi_ls_lbl 02 `"Leribe"', add
label define dhs_ipumsi_ls_lbl 03 `"Berea"', add
label define dhs_ipumsi_ls_lbl 04 `"Maseru"', add
label define dhs_ipumsi_ls_lbl 05 `"Mafeteng"', add
label define dhs_ipumsi_ls_lbl 06 `"Mohale's hoek"', add
label define dhs_ipumsi_ls_lbl 07 `"Quthing"', add
label define dhs_ipumsi_ls_lbl 08 `"Qacha's-nek"', add
label define dhs_ipumsi_ls_lbl 09 `"Mokhotlong"', add
label define dhs_ipumsi_ls_lbl 10 `"Thaba Tseka"', add
label define dhs_ipumsi_ls_lbl 98 `"Unknown"', add
label values dhs_ipumsi_ls dhs_ipumsi_ls_lbl

label define ownership_lbl 0 `"NIU (not in universe)"'
label define ownership_lbl 1 `"Owned"', add
label define ownership_lbl 2 `"Not owned"', add
label define ownership_lbl 9 `"Unknown"', add
label values ownership ownership_lbl

label define ownershipd_lbl 000 `"NIU (not in universe)"'
label define ownershipd_lbl 100 `"Owned"', add
label define ownershipd_lbl 110 `"Owned, already paid"', add
label define ownershipd_lbl 120 `"Owned, still paying"', add
label define ownershipd_lbl 130 `"Owned, constructed"', add
label define ownershipd_lbl 140 `"Owned, inherited"', add
label define ownershipd_lbl 190 `"Owned, other"', add
label define ownershipd_lbl 191 `"Owned, house"', add
label define ownershipd_lbl 192 `"Owned, condominium"', add
label define ownershipd_lbl 193 `"Apartment proprietor"', add
label define ownershipd_lbl 194 `"Shared ownership"', add
label define ownershipd_lbl 200 `"Not owned"', add
label define ownershipd_lbl 210 `"Renting, not specified"', add
label define ownershipd_lbl 211 `"Renting, government"', add
label define ownershipd_lbl 212 `"Renting, local authority"', add
label define ownershipd_lbl 213 `"Renting, parastatal"', add
label define ownershipd_lbl 214 `"Renting, private"', add
label define ownershipd_lbl 215 `"Renting, private company"', add
label define ownershipd_lbl 216 `"Renting, individual"', add
label define ownershipd_lbl 217 `"Renting, collective"', add
label define ownershipd_lbl 218 `"Renting, joint state and individual"', add
label define ownershipd_lbl 219 `"Renting, public subsidized"', add
label define ownershipd_lbl 220 `"Renting, private subsidized"', add
label define ownershipd_lbl 221 `"Renting, co-tenant"', add
label define ownershipd_lbl 222 `"Renting, relative of tenant"', add
label define ownershipd_lbl 223 `"Renting, cooperative"', add
label define ownershipd_lbl 224 `"Renting, with a job or business"', add
label define ownershipd_lbl 225 `"Renting, loan-backed habitation"', add
label define ownershipd_lbl 226 `"Renting, mixed contract"', add
label define ownershipd_lbl 227 `"Furnished dwelling"', add
label define ownershipd_lbl 228 `"Sharecropping"', add
label define ownershipd_lbl 230 `"Subletting"', add
label define ownershipd_lbl 231 `"Rent to own"', add
label define ownershipd_lbl 239 `"Renting, other"', add
label define ownershipd_lbl 240 `"Occupied de facto/squatting"', add
label define ownershipd_lbl 250 `"Free/usufruct (no cash rent)"', add
label define ownershipd_lbl 251 `"Free, provided by employer"', add
label define ownershipd_lbl 252 `"Free, without work or services"', add
label define ownershipd_lbl 253 `"Free, provided by family or friend"', add
label define ownershipd_lbl 254 `"Free, private"', add
label define ownershipd_lbl 255 `"Free, public"', add
label define ownershipd_lbl 256 `"Free, condemned"', add
label define ownershipd_lbl 257 `"Free, other"', add
label define ownershipd_lbl 260 `"Endowment, Waqf (Egypt historical)"', add
label define ownershipd_lbl 290 `"Not owned, other"', add
label define ownershipd_lbl 999 `"Unknown"', add
label values ownershipd ownershipd_lbl

label define electric_lbl 0 `"NIU (not in universe)"'
label define electric_lbl 1 `"Yes"', add
label define electric_lbl 2 `"No"', add
label define electric_lbl 9 `"Unknown"', add
label values electric electric_lbl

label define watsup_lbl 00 `"NIU (not in universe)"'
label define watsup_lbl 10 `"Yes, piped water"', add
label define watsup_lbl 11 `"Piped inside dwelling"', add
label define watsup_lbl 12 `"Piped, exclusively to this household"', add
label define watsup_lbl 13 `"Piped, shared with other households"', add
label define watsup_lbl 14 `"Piped outside the dwelling"', add
label define watsup_lbl 15 `"Piped outside dwelling, in building"', add
label define watsup_lbl 16 `"Piped within the building or plot of land"', add
label define watsup_lbl 17 `"Piped outside the building or lot"', add
label define watsup_lbl 18 `"Have access to public piped water"', add
label define watsup_lbl 20 `"No piped water"', add
label define watsup_lbl 99 `"Unknown"', add
label values watsup watsup_lbl

label define fuelcook_lbl 00 `"NIU (not in universe)"'
label define fuelcook_lbl 10 `"None"', add
label define fuelcook_lbl 20 `"Electricity"', add
label define fuelcook_lbl 30 `"Petroleum gas, unspecified"', add
label define fuelcook_lbl 31 `"Gas -- piped/utility"', add
label define fuelcook_lbl 32 `"Gas -- tanked or bottled"', add
label define fuelcook_lbl 33 `"Propane"', add
label define fuelcook_lbl 34 `"Liquefied petroleum gas"', add
label define fuelcook_lbl 35 `"Gas -- piped and bottled"', add
label define fuelcook_lbl 40 `"Petroleum liquid"', add
label define fuelcook_lbl 41 `"Oil, kerosene, and other liquid fuels"', add
label define fuelcook_lbl 42 `"Kerosene/paraffin"', add
label define fuelcook_lbl 43 `"Kerosene or oil"', add
label define fuelcook_lbl 44 `"Kerosene or gasoline"', add
label define fuelcook_lbl 45 `"Gasoline"', add
label define fuelcook_lbl 46 `"Cocinol"', add
label define fuelcook_lbl 47 `"Diesel"', add
label define fuelcook_lbl 50 `"Wood, coal, and other solid fuels"', add
label define fuelcook_lbl 51 `"Wood and other plant fuels"', add
label define fuelcook_lbl 52 `"Non-wood plant materials"', add
label define fuelcook_lbl 53 `"Coal or charcoal"', add
label define fuelcook_lbl 54 `"Charcoal"', add
label define fuelcook_lbl 55 `"Coal"', add
label define fuelcook_lbl 56 `"Wood or charcoal"', add
label define fuelcook_lbl 60 `"Multiple fuels"', add
label define fuelcook_lbl 61 `"Bottled gas and wood"', add
label define fuelcook_lbl 62 `"Propane and electricity"', add
label define fuelcook_lbl 63 `"Propane, kerosene, and electricity"', add
label define fuelcook_lbl 64 `"Propane and kerosene"', add
label define fuelcook_lbl 65 `"Kerosene and electrictiy"', add
label define fuelcook_lbl 66 `"Other combinations"', add
label define fuelcook_lbl 70 `"Other"', add
label define fuelcook_lbl 71 `"Alcohol"', add
label define fuelcook_lbl 72 `"Biogas"', add
label define fuelcook_lbl 73 `"Discarded or waste material"', add
label define fuelcook_lbl 74 `"Dung/manure"', add
label define fuelcook_lbl 75 `"Other combined organic waste materials"', add
label define fuelcook_lbl 76 `"Solar energy"', add
label define fuelcook_lbl 77 `"Candle"', add
label define fuelcook_lbl 99 `"Unknown/missing"', add
label values fuelcook fuelcook_lbl

label define fuelheat_lbl 00 `"NIU (not in universe)"'
label define fuelheat_lbl 01 `"None"', add
label define fuelheat_lbl 02 `"Electricity"', add
label define fuelheat_lbl 03 `"Fuel oil, kerosene, other liquid fuels"', add
label define fuelheat_lbl 04 `"Kerosene/paraffin"', add
label define fuelheat_lbl 05 `"Diesel"', add
label define fuelheat_lbl 06 `"Gas"', add
label define fuelheat_lbl 07 `"Bottled gas, in tank, liquified"', add
label define fuelheat_lbl 08 `"Solid fuel"', add
label define fuelheat_lbl 09 `"Coal"', add
label define fuelheat_lbl 10 `"Wood"', add
label define fuelheat_lbl 11 `"Wood or coal"', add
label define fuelheat_lbl 12 `"Solar"', add
label define fuelheat_lbl 13 `"Animal dung"', add
label define fuelheat_lbl 14 `"Charcoal"', add
label define fuelheat_lbl 15 `"Biofuel"', add
label define fuelheat_lbl 16 `"Other"', add
label define fuelheat_lbl 17 `"Multiple sources"', add
label define fuelheat_lbl 99 `"Unknown"', add
label values fuelheat fuelheat_lbl

label define phone_lbl 0 `"NIU (not in universe)"'
label define phone_lbl 1 `"No"', add
label define phone_lbl 2 `"Yes"', add
label define phone_lbl 9 `"Unknown/missing"', add
label values phone phone_lbl

label define cell_lbl 0 `"NIU (not in universe)"'
label define cell_lbl 1 `"Yes"', add
label define cell_lbl 2 `"No"', add
label define cell_lbl 9 `"Unknown"', add
label values cell cell_lbl

label define trash_lbl 00 `"NIU (not in universe)"'
label define trash_lbl 10 `"Collected by a sanitation service"', add
label define trash_lbl 11 `"Collected directly from the household or dwelling"', add
label define trash_lbl 12 `"Collected indirectly from a garbage container or deposit"', add
label define trash_lbl 13 `"Collected by a sanitation service only"', add
label define trash_lbl 14 `"Collected by a sanitation service and disposed of in some other manner"', add
label define trash_lbl 20 `"Disposed of in some other manner"', add
label define trash_lbl 21 `"Burned or buried"', add
label define trash_lbl 22 `"Burned"', add
label define trash_lbl 23 `"Buried"', add
label define trash_lbl 24 `"Thrown into street, vacant land, or common area"', add
label define trash_lbl 25 `"Thrown into river, lake, ocean, lagoon, etc."', add
label define trash_lbl 26 `"Thrown into canyon or gulley"', add
label define trash_lbl 27 `"Dumped in pit"', add
label define trash_lbl 28 `"Communal refuse dump"', add
label define trash_lbl 29 `"Own refuse dump"', add
label define trash_lbl 30 `"Authorized refuse dump"', add
label define trash_lbl 31 `"Illegal refuse dump"', add
label define trash_lbl 32 `"Other dumping"', add
label define trash_lbl 33 `"Outside"', add
label define trash_lbl 34 `"In the fields"', add
label define trash_lbl 35 `"Fed to animals"', add
label define trash_lbl 36 `"Composted"', add
label define trash_lbl 37 `"Heap"', add
label define trash_lbl 38 `"Garden"', add
label define trash_lbl 39 `"Other, none"', add
label define trash_lbl 99 `"Unknown/missing"', add
label values trash trash_lbl

label define autos_lbl 0 `"No autos"'
label define autos_lbl 1 `"1 auto"', add
label define autos_lbl 2 `"2 autos"', add
label define autos_lbl 3 `"3 autos"', add
label define autos_lbl 4 `"4 autos"', add
label define autos_lbl 5 `"5 autos"', add
label define autos_lbl 6 `"6+ autos"', add
label define autos_lbl 7 `"Have auto, number unspecified"', add
label define autos_lbl 8 `"Unknown"', add
label define autos_lbl 9 `"NIU (not in universe)"', add
label values autos autos_lbl

label define refrig_lbl 0 `"NIU (not in universe)"'
label define refrig_lbl 1 `"No"', add
label define refrig_lbl 2 `"Yes"', add
label define refrig_lbl 9 `"Unknown/missing"', add
label values refrig refrig_lbl

label define tv_lbl 00 `"NIU (not in universe)"'
label define tv_lbl 10 `"No"', add
label define tv_lbl 20 `"Yes, color or black-and-white not specified"', add
label define tv_lbl 21 `"1 television"', add
label define tv_lbl 22 `"2 televisions"', add
label define tv_lbl 23 `"3 televisions"', add
label define tv_lbl 24 `"4 televisions"', add
label define tv_lbl 25 `"5 televisions"', add
label define tv_lbl 26 `"6 televisions"', add
label define tv_lbl 27 `"7 televisions"', add
label define tv_lbl 28 `"8 televisions"', add
label define tv_lbl 29 `"9+ televisions"', add
label define tv_lbl 30 `"Yes, at least one color tv"', add
label define tv_lbl 31 `"1 color tv"', add
label define tv_lbl 32 `"2 color tvs"', add
label define tv_lbl 33 `"3+ televisions"', add
label define tv_lbl 40 `"Yes, black-and-white only"', add
label define tv_lbl 41 `"1 black-white tv"', add
label define tv_lbl 42 `"2 black-white tvs"', add
label define tv_lbl 43 `"3+ black-white tvs"', add
label define tv_lbl 99 `"Unknown/missing"', add
label values tv tv_lbl

label define radio_lbl 0 `"NIU (not in universe)"'
label define radio_lbl 1 `"No"', add
label define radio_lbl 2 `"Yes"', add
label define radio_lbl 9 `"Unknown/missing"', add
label values radio radio_lbl

label define rooms_lbl 00 `"Part of a room; no rooms"'
label define rooms_lbl 01 `"1"', add
label define rooms_lbl 02 `"2"', add
label define rooms_lbl 03 `"3"', add
label define rooms_lbl 04 `"4"', add
label define rooms_lbl 05 `"5"', add
label define rooms_lbl 06 `"6"', add
label define rooms_lbl 07 `"7"', add
label define rooms_lbl 08 `"8"', add
label define rooms_lbl 09 `"9"', add
label define rooms_lbl 10 `"10"', add
label define rooms_lbl 11 `"11"', add
label define rooms_lbl 12 `"12"', add
label define rooms_lbl 13 `"13"', add
label define rooms_lbl 14 `"14"', add
label define rooms_lbl 15 `"15"', add
label define rooms_lbl 16 `"16"', add
label define rooms_lbl 17 `"17"', add
label define rooms_lbl 18 `"18"', add
label define rooms_lbl 19 `"19"', add
label define rooms_lbl 20 `"20"', add
label define rooms_lbl 21 `"21"', add
label define rooms_lbl 22 `"22"', add
label define rooms_lbl 23 `"23"', add
label define rooms_lbl 24 `"24"', add
label define rooms_lbl 25 `"25"', add
label define rooms_lbl 26 `"26"', add
label define rooms_lbl 27 `"27"', add
label define rooms_lbl 28 `"28"', add
label define rooms_lbl 29 `"29"', add
label define rooms_lbl 30 `"30+"', add
label define rooms_lbl 98 `"Unknown"', add
label define rooms_lbl 99 `"NIU (not in universe)"', add
label values rooms rooms_lbl

label define toilet_lbl 00 `"NIU (not in universe)"'
label define toilet_lbl 10 `"No toilet"', add
label define toilet_lbl 11 `"No flush toilet"', add
label define toilet_lbl 20 `"Have toilet, type not specified"', add
label define toilet_lbl 21 `"Flush toilet"', add
label define toilet_lbl 22 `"Non-flush, latrine"', add
label define toilet_lbl 23 `"Non-flush, other and unspecified"', add
label define toilet_lbl 99 `"Unknown"', add
label values toilet toilet_lbl

label define floor_lbl 000 `"NIU (not in universe)"'
label define floor_lbl 100 `"None/unfinished (earth)"', add
label define floor_lbl 110 `"Sand"', add
label define floor_lbl 120 `"Dung"', add
label define floor_lbl 200 `"Finished"', add
label define floor_lbl 201 `"Cement, tile, or brick"', add
label define floor_lbl 202 `"Cement"', add
label define floor_lbl 203 `"Concrete"', add
label define floor_lbl 204 `"Cement screed"', add
label define floor_lbl 205 `"Ceramic tile"', add
label define floor_lbl 206 `"Paving stone, cement tile"', add
label define floor_lbl 207 `"Stone"', add
label define floor_lbl 208 `"Brick"', add
label define floor_lbl 209 `"Brick or stone"', add
label define floor_lbl 210 `"Brick or cement"', add
label define floor_lbl 211 `"Block"', add
label define floor_lbl 212 `"Terrazzo"', add
label define floor_lbl 213 `"Wood"', add
label define floor_lbl 214 `"Palm, bamboo"', add
label define floor_lbl 215 `"Parquet"', add
label define floor_lbl 216 `"Parquet, tile, vinyl"', add
label define floor_lbl 217 `"Parquet, tile, marble"', add
label define floor_lbl 218 `"Ceramic, marble, granite"', add
label define floor_lbl 219 `"Ceramic, marble, tile, or vinyl"', add
label define floor_lbl 220 `"Marble"', add
label define floor_lbl 221 `"Mosaic"', add
label define floor_lbl 222 `"Tile"', add
label define floor_lbl 223 `"Tile, linoleum, ceramic, etc"', add
label define floor_lbl 224 `"Tile, cement"', add
label define floor_lbl 225 `"Tile, stone"', add
label define floor_lbl 226 `"Tile, stone, brick"', add
label define floor_lbl 227 `"Tile, stone, vinyl, brick"', add
label define floor_lbl 228 `"Tile, vinyl, brick"', add
label define floor_lbl 229 `"Tile, vinyl"', add
label define floor_lbl 230 `"Vinyl, linoleum, etc"', add
label define floor_lbl 231 `"Asphalt sheet, vinyl, etc"', add
label define floor_lbl 232 `"Synthetic, plastic"', add
label define floor_lbl 233 `"Cane"', add
label define floor_lbl 234 `"Carpet, rug"', add
label define floor_lbl 235 `"Scrap material"', add
label define floor_lbl 236 `"Other finished, n.e.c."', add
label define floor_lbl 999 `"Unknown/missing"', add
label values floor floor_lbl

label define wall_lbl 000 `"NIU (not in universe)"'
label define wall_lbl 100 `"No walls"', add
label define wall_lbl 200 `"Cardboard, scrap, and miscellaneous materials"', add
label define wall_lbl 201 `"Waste, scrap, or discarded material"', add
label define wall_lbl 202 `"Fabric or discarded material"', add
label define wall_lbl 203 `"Zinc, fabric, cardboard, tins, and waste material"', add
label define wall_lbl 204 `"Cardboard sheet"', add
label define wall_lbl 205 `"Plastic sheeting, cardboard"', add
label define wall_lbl 206 `"Makeshift, salvaged, or improvised materials"', add
label define wall_lbl 207 `"Reused materials"', add
label define wall_lbl 300 `"Wood"', add
label define wall_lbl 310 `"Rough wood"', add
label define wall_lbl 320 `"Wood, fibercement or plywood"', add
label define wall_lbl 330 `"Wood, formica, and other"', add
label define wall_lbl 340 `"Wood or bamboo"', add
label define wall_lbl 350 `"Wood or straw"', add
label define wall_lbl 400 `"Other plant-based materials"', add
label define wall_lbl 401 `"Plantain leaves and similar material"', add
label define wall_lbl 402 `"Bamboo or cane"', add
label define wall_lbl 403 `"Bamboo, sawali, cogon, nipa"', add
label define wall_lbl 404 `"Straw or bamboo"', add
label define wall_lbl 405 `"Grass, straw or reed"', add
label define wall_lbl 406 `"Reed, bamboo, or palm"', add
label define wall_lbl 407 `"Cane, palm leaves, logs"', add
label define wall_lbl 408 `"Palm leaves or palm planks"', add
label define wall_lbl 409 `"Bark, sticks, or cane"', add
label define wall_lbl 500 `"Masonry, stone, cement, adobe, metal, glass, and other fabricated materials (sometimes mixed with wood)"', add
label define wall_lbl 501 `"Brick, block, stone, or cement"', add
label define wall_lbl 502 `"Brick, stone, concrete"', add
label define wall_lbl 503 `"Brick, stone, or substitutes (dividing panels made of reinforced concrete)"', add
label define wall_lbl 504 `"Brick, stone, or substitutes (dividing panels made of wood)"', add
label define wall_lbl 505 `"Brick or tile"', add
label define wall_lbl 506 `"Brick or stone"', add
label define wall_lbl 507 `"Brick or cement block"', add
label define wall_lbl 508 `"Brick with plaster exterior"', add
label define wall_lbl 509 `"Brick without plaster exterior"', add
label define wall_lbl 510 `"Burnt or stabilized brick"', add
label define wall_lbl 511 `"Covered brick"', add
label define wall_lbl 512 `"Brick"', add
label define wall_lbl 513 `"Unburnt brick"', add
label define wall_lbl 514 `"Unburnt brick with cement"', add
label define wall_lbl 515 `"Unburnt brick with mud"', add
label define wall_lbl 516 `"Concrete"', add
label define wall_lbl 517 `"Landcrete, sandcrete"', add
label define wall_lbl 518 `"Cement blocks"', add
label define wall_lbl 519 `"Cement blocks or brick"', add
label define wall_lbl 520 `"Cement blocks or brick, unfinished"', add
label define wall_lbl 521 `"Cement and adobe bricks"', add
label define wall_lbl 522 `"Cement and stone block"', add
label define wall_lbl 523 `"Cement and tiles"', add
label define wall_lbl 524 `"Reinforced concrete, pre-cast concrete panels, or steel skeleton framed concrete"', add
label define wall_lbl 525 `"Concrete, reinforced concrete, blocks, panels"', add
label define wall_lbl 526 `"Fibercement"', add
label define wall_lbl 527 `"Adobe"', add
label define wall_lbl 528 `"Adobe walls with plaster exterior"', add
label define wall_lbl 529 `"Adobe walls without plaster exterior"', add
label define wall_lbl 530 `"Adobe with cement exterior"', add
label define wall_lbl 531 `"Wood and earth adobe"', add
label define wall_lbl 532 `"Wood and cement adobe"', add
label define wall_lbl 533 `"Mud or adobe"', add
label define wall_lbl 534 `"Pressed dirt"', add
label define wall_lbl 535 `"Clay"', add
label define wall_lbl 536 `"Coated clay/mud with sticks/cane"', add
label define wall_lbl 537 `"Clay or clay-covered sticks"', add
label define wall_lbl 538 `"Netted bamboo or cane with mud"', add
label define wall_lbl 539 `"Bundle of mud, straw, other materials"', add
label define wall_lbl 540 `"Mud with wood/wattle"', add
label define wall_lbl 541 `"Pole and mud"', add
label define wall_lbl 542 `"Mud with cement"', add
label define wall_lbl 543 `"Unfinished lathe and plaster, stucco, etc."', add
label define wall_lbl 544 `"Stone"', add
label define wall_lbl 545 `"Hand-laid stone"', add
label define wall_lbl 546 `"Quarried stone"', add
label define wall_lbl 547 `"Cut stone and concrete"', add
label define wall_lbl 548 `"Cemented stone"', add
label define wall_lbl 549 `"Stone with clay"', add
label define wall_lbl 550 `"Blocks of light material"', add
label define wall_lbl 551 `"Prefabricated material"', add
label define wall_lbl 552 `"Asbestos"', add
label define wall_lbl 553 `"Metal or asbestos sheet"', add
label define wall_lbl 554 `"Metal or iron sheet"', add
label define wall_lbl 555 `"Metal or fibercement sheeting"', add
label define wall_lbl 556 `"Galvanized iron or aluminum"', add
label define wall_lbl 557 `"Tin"', add
label define wall_lbl 558 `"Glass"', add
label define wall_lbl 559 `"Cloth"', add
label define wall_lbl 560 `"Covintec panels"', add
label define wall_lbl 561 `"Mixed material"', add
label define wall_lbl 562 `"Mixed material: part wood; part concrete, brick, or stone"', add
label define wall_lbl 563 `"Wood plastered with clay, adobe, other materials; wood pressed panels; rolled mud bricks; etc."', add
label define wall_lbl 564 `"Mixed material: wood or galvanized metal"', add
label define wall_lbl 570 `"Mainly permanent materials"', add
label define wall_lbl 600 `"Other material"', add
label define wall_lbl 601 `"Partition wall, lined with wood or steel"', add
label define wall_lbl 602 `"Partition wall, unlined"', add
label define wall_lbl 999 `"Unknown/missing"', add
label values wall wall_lbl

label define roof_lbl 00 `"NIU (not in universe)"'
label define roof_lbl 10 `"Masonry, concrete, clay tile, or tiles of unspecified type"', add
label define roof_lbl 11 `"Concrete or cement"', add
label define roof_lbl 12 `"Reinforced concrete (slab)"', add
label define roof_lbl 13 `"Cement or sheet metal"', add
label define roof_lbl 14 `"Tile, unspecified material"', add
label define roof_lbl 15 `"Clay tile"', add
label define roof_lbl 16 `"Tile or cement"', add
label define roof_lbl 17 `"Modern tiles, industrial"', add
label define roof_lbl 18 `"Traditional tiles, locally made"', add
label define roof_lbl 19 `"Tile or flat stone"', add
label define roof_lbl 20 `"Tile, unspecified or mixed materials"', add
label define roof_lbl 21 `"Fibercement or plastic"', add
label define roof_lbl 22 `"Fibercement or metal sheets"', add
label define roof_lbl 23 `"Asphalt or laminate cover"', add
label define roof_lbl 24 `"Tile, cement, asphalt"', add
label define roof_lbl 25 `"Asphalt tile"', add
label define roof_lbl 26 `"Slate or tile"', add
label define roof_lbl 27 `"Slate or asbestos"', add
label define roof_lbl 28 `"Asbestos"', add
label define roof_lbl 29 `"Adobe"', add
label define roof_lbl 30 `"Tiles or wood planks"', add
label define roof_lbl 31 `"Roofing shingles"', add
label define roof_lbl 32 `"Tar paper"', add
label define roof_lbl 33 `"Metal"', add
label define roof_lbl 34 `"Sheet metal"', add
label define roof_lbl 35 `"Zinc or tin"', add
label define roof_lbl 36 `"Tin"', add
label define roof_lbl 37 `"Sheet metal or other sheet material"', add
label define roof_lbl 38 `"Sheet metal, tile, slate"', add
label define roof_lbl 40 `"Wood and other plant materials"', add
label define roof_lbl 41 `"Wood"', add
label define roof_lbl 42 `"Wood, including bamboo"', add
label define roof_lbl 43 `"Bamboo"', add
label define roof_lbl 44 `"Cogon, nipa, anahaw"', add
label define roof_lbl 45 `"Thatch (straw, grass, leaves, palm, etc.)"', add
label define roof_lbl 46 `"Cane, wood, straw"', add
label define roof_lbl 47 `"Grass or straw"', add
label define roof_lbl 48 `"Papyrus"', add
label define roof_lbl 49 `"Banana leaves or fiber"', add
label define roof_lbl 50 `"Palm or makuti"', add
label define roof_lbl 51 `"Straw, bamboo, polythene"', add
label define roof_lbl 52 `"Wood with clay"', add
label define roof_lbl 53 `"Grass and mud"', add
label define roof_lbl 54 `"Rustic mat"', add
label define roof_lbl 60 `"Mud or earth"', add
label define roof_lbl 61 `"Clay"', add
label define roof_lbl 70 `"Cardboard, scrap, and miscellaneous materials"', add
label define roof_lbl 71 `"Discarded or scrap material"', add
label define roof_lbl 72 `"Cardboard"', add
label define roof_lbl 73 `"Plastic, tarpaulin"', add
label define roof_lbl 80 `"Other, unspecified"', add
label define roof_lbl 90 `"No roof"', add
label define roof_lbl 99 `"Unknown/missing"', add
label values roof roof_lbl

label define mortnum_lbl 0 `"None"'
label define mortnum_lbl 1 `"1 death"', add
label define mortnum_lbl 2 `"2 deaths"', add
label define mortnum_lbl 3 `"3 deaths"', add
label define mortnum_lbl 4 `"4 deaths"', add
label define mortnum_lbl 5 `"5 deaths"', add
label define mortnum_lbl 6 `"6 deaths"', add
label define mortnum_lbl 7 `"7 or more deaths"', add
label define mortnum_lbl 8 `"Unknown"', add
label define mortnum_lbl 9 `"NIU (not in universe)"', add
label values mortnum mortnum_lbl

label define anymort_lbl 1 `"Yes"'
label define anymort_lbl 2 `"No"', add
label define anymort_lbl 8 `"Unknown/missing"', add
label define anymort_lbl 9 `"NIU (not in universe)"', add
label values anymort anymort_lbl

label define hhtype_lbl 00 `"Vacant household"'
label define hhtype_lbl 01 `"One-person household"', add
label define hhtype_lbl 02 `"Married/cohab couple, no children"', add
label define hhtype_lbl 03 `"Married/cohab couple with children"', add
label define hhtype_lbl 04 `"Single-parent family"', add
label define hhtype_lbl 05 `"Polygamous family"', add
label define hhtype_lbl 06 `"Extended family, relatives only"', add
label define hhtype_lbl 07 `"Composite household, family and non-relatives"', add
label define hhtype_lbl 08 `"Non-family household"', add
label define hhtype_lbl 09 `"Unclassified subfamily"', add
label define hhtype_lbl 10 `"Other relative or non-relative household"', add
label define hhtype_lbl 11 `"Group quarters"', add
label define hhtype_lbl 99 `"Unclassifiable"', add
label values hhtype hhtype_lbl

label define nfams_lbl 0 `"Vacant household"'
label define nfams_lbl 1 `"1 family"', add
label define nfams_lbl 2 `"2 families"', add
label define nfams_lbl 3 `"3 families"', add
label define nfams_lbl 4 `"4 families"', add
label define nfams_lbl 5 `"5 families"', add
label define nfams_lbl 6 `"6 families"', add
label define nfams_lbl 7 `"7 families"', add
label define nfams_lbl 8 `"8 families"', add
label define nfams_lbl 9 `"9 or more families"', add
label values nfams nfams_lbl

label define ncouples_lbl 0 `"No married couples in household"'
label define ncouples_lbl 1 `"1 couple"', add
label define ncouples_lbl 2 `"2 couples"', add
label define ncouples_lbl 3 `"3 couples"', add
label define ncouples_lbl 4 `"4 couples"', add
label define ncouples_lbl 5 `"5 couples"', add
label define ncouples_lbl 6 `"6 couples"', add
label define ncouples_lbl 7 `"7 couples"', add
label define ncouples_lbl 8 `"8 couples"', add
label define ncouples_lbl 9 `"9 or more couples"', add
label values ncouples ncouples_lbl

label define nmothers_lbl 0 `"No mothers in household"'
label define nmothers_lbl 1 `"1 mother"', add
label define nmothers_lbl 2 `"2 mothers"', add
label define nmothers_lbl 3 `"3 mothers"', add
label define nmothers_lbl 4 `"4 mothers"', add
label define nmothers_lbl 5 `"5 mothers"', add
label define nmothers_lbl 6 `"6 mothers"', add
label define nmothers_lbl 7 `"7 mothers"', add
label define nmothers_lbl 8 `"8 mothers"', add
label define nmothers_lbl 9 `"9 or more mothers in household"', add
label values nmothers nmothers_lbl

label define nfathers_lbl 0 `"No fathers in household"'
label define nfathers_lbl 1 `"1 father"', add
label define nfathers_lbl 2 `"2 fathers"', add
label define nfathers_lbl 3 `"3 fathers"', add
label define nfathers_lbl 4 `"4 fathers"', add
label define nfathers_lbl 5 `"5 fathers"', add
label define nfathers_lbl 6 `"6 fathers"', add
label define nfathers_lbl 7 `"7 fathers"', add
label define nfathers_lbl 8 `"8 fathers"', add
label define nfathers_lbl 9 `"9 or more fathers in household"', add
label values nfathers nfathers_lbl

label define resident_lbl 1 `"Present resident"'
label define resident_lbl 2 `"Absent resident"', add
label define resident_lbl 3 `"Visitor/non-resident"', add
label define resident_lbl 4 `"De facto population (present persons)"', add
label define resident_lbl 9 `"Unknown/missing"', add
label values resident resident_lbl

label define parrule_lbl 00 `"No parent of person in household"'
label define parrule_lbl 11 `"Link to head or spouse, unambiguous"', add
label define parrule_lbl 12 `"Link to head or spouse, ambiguous"', add
label define parrule_lbl 21 `"Child-Grandchild, within empirical child cap"', add
label define parrule_lbl 22 `"Child-Grandchild, within constructed child cap"', add
label define parrule_lbl 23 `"Child-Grandchild, exceeds child cap"', add
label define parrule_lbl 31 `"Specified Other Relatives, within empirical child cap"', add
label define parrule_lbl 32 `"Specified Other Relatives, within constructed child cap"', add
label define parrule_lbl 33 `"Specified Other Relatives, exceeds child cap"', add
label define parrule_lbl 41 `"Other Relatives, within empirical child cap"', add
label define parrule_lbl 42 `"Other Relatives, within constructed child cap"', add
label define parrule_lbl 51 `"Non-Relatives, within empirical child cap"', add
label define parrule_lbl 52 `"Non-Relatives, within constructed child cap"', add
label values parrule parrule_lbl

label define sprule_lbl 00 `"No spouse present"'
label define sprule_lbl 01 `"Rule 1: strong relationship pairing, couple adjacent"', add
label define sprule_lbl 02 `"Rule 2: strong relationship pairing, couple not adjacent"', add
label define sprule_lbl 03 `"Rule 3: weak relationship pairing, couple adjacent"', add
label define sprule_lbl 04 `"Rule 4: weak relationship pairing, couple not adjacent"', add
label define sprule_lbl 05 `"Rule 5: weak consensual union pairings"', add
label define sprule_lbl 06 `"Rule 6: sample-specific rules (usually child-to-child)"', add
label values sprule sprule_lbl

label define stepmom_lbl 0 `"Biological mother or no mother present"'
label define stepmom_lbl 1 `"Mother has no children born or surviving"', add
label define stepmom_lbl 2 `"Child reports mother is deceased"', add
label define stepmom_lbl 3 `"Explicitly identified step relationship"', add
label define stepmom_lbl 4 `"Mother reports no children in the home"', add
label define stepmom_lbl 5 `"Age difference implausible"', add
label define stepmom_lbl 6 `"Child exceeds known fertility of mother"', add
label values stepmom stepmom_lbl

label define steppop_lbl 0 `"Biological father or no father present"'
label define steppop_lbl 1 `"Child reports father is deceased"', add
label define steppop_lbl 2 `"Explicitly identified step relationship"', add
label define steppop_lbl 3 `"Age difference implausible"', add
label define steppop_lbl 4 `"Spouse of mother"', add
label define steppop_lbl 5 `"Identified as adopted"', add
label define steppop_lbl 6 `"Surname difference -- male child or never-married female"', add
label values steppop steppop_lbl

label define polymal_lbl 0 `"No more than one wife linked via SPLOC"'
label define polymal_lbl 1 `"More than one wife linked via SPLOC"', add
label values polymal polymal_lbl

label define poly2nd_lbl 0 `"Person is not the 2nd or higher order wife linked via SPLOC"'
label define poly2nd_lbl 1 `"Person is the 2nd or higher order wife linked via SPLOC"', add
label values poly2nd poly2nd_lbl

label define famsize_lbl 0001 `"1 family member present"'
label define famsize_lbl 0002 `"2 family members present"', add
label define famsize_lbl 0003 `"3 family members present"', add
label define famsize_lbl 0004 `"4"', add
label define famsize_lbl 0005 `"5"', add
label define famsize_lbl 0006 `"6"', add
label define famsize_lbl 0007 `"7"', add
label define famsize_lbl 0008 `"8"', add
label define famsize_lbl 0009 `"9"', add
label define famsize_lbl 0010 `"10"', add
label define famsize_lbl 0011 `"11"', add
label define famsize_lbl 0012 `"12"', add
label define famsize_lbl 0013 `"13"', add
label define famsize_lbl 0014 `"14"', add
label define famsize_lbl 0015 `"15"', add
label define famsize_lbl 0016 `"16"', add
label define famsize_lbl 0017 `"17"', add
label define famsize_lbl 0018 `"18"', add
label define famsize_lbl 0019 `"19"', add
label define famsize_lbl 0020 `"20"', add
label define famsize_lbl 0021 `"21"', add
label define famsize_lbl 0022 `"22"', add
label define famsize_lbl 0023 `"23"', add
label define famsize_lbl 0024 `"24"', add
label define famsize_lbl 0025 `"25"', add
label define famsize_lbl 0026 `"26"', add
label define famsize_lbl 0027 `"27"', add
label define famsize_lbl 0028 `"28"', add
label define famsize_lbl 0029 `"29"', add
label define famsize_lbl 0030 `"30"', add
label define famsize_lbl 0031 `"31"', add
label define famsize_lbl 0032 `"32"', add
label define famsize_lbl 0033 `"33"', add
label define famsize_lbl 0034 `"34"', add
label define famsize_lbl 0035 `"35"', add
label define famsize_lbl 0036 `"36"', add
label define famsize_lbl 0037 `"37"', add
label define famsize_lbl 0038 `"38"', add
label define famsize_lbl 0039 `"39"', add
label define famsize_lbl 0040 `"40"', add
label define famsize_lbl 0041 `"41"', add
label define famsize_lbl 0042 `"42"', add
label define famsize_lbl 0043 `"43"', add
label define famsize_lbl 0044 `"44"', add
label define famsize_lbl 0045 `"45"', add
label define famsize_lbl 0046 `"46"', add
label define famsize_lbl 0047 `"47"', add
label define famsize_lbl 0048 `"48"', add
label define famsize_lbl 0049 `"49"', add
label define famsize_lbl 0050 `"50"', add
label define famsize_lbl 0051 `"51"', add
label define famsize_lbl 0052 `"52"', add
label define famsize_lbl 0053 `"53"', add
label define famsize_lbl 0054 `"54"', add
label define famsize_lbl 0055 `"55"', add
label define famsize_lbl 0056 `"56"', add
label define famsize_lbl 0057 `"57"', add
label define famsize_lbl 0058 `"58"', add
label define famsize_lbl 0059 `"59"', add
label define famsize_lbl 0060 `"60"', add
label define famsize_lbl 0061 `"61"', add
label define famsize_lbl 0062 `"62"', add
label define famsize_lbl 0063 `"63"', add
label define famsize_lbl 0064 `"64"', add
label define famsize_lbl 0065 `"65"', add
label define famsize_lbl 0066 `"66"', add
label define famsize_lbl 0067 `"67"', add
label define famsize_lbl 0068 `"68"', add
label define famsize_lbl 0069 `"69"', add
label define famsize_lbl 0070 `"70"', add
label define famsize_lbl 0071 `"71"', add
label define famsize_lbl 0072 `"72"', add
label define famsize_lbl 0073 `"73"', add
label define famsize_lbl 0074 `"74"', add
label define famsize_lbl 0075 `"75"', add
label define famsize_lbl 0076 `"76"', add
label define famsize_lbl 0077 `"77"', add
label define famsize_lbl 0078 `"78"', add
label define famsize_lbl 0079 `"79"', add
label define famsize_lbl 0080 `"80"', add
label define famsize_lbl 0081 `"81"', add
label define famsize_lbl 0082 `"82"', add
label define famsize_lbl 0083 `"83"', add
label define famsize_lbl 0084 `"84"', add
label define famsize_lbl 0085 `"85"', add
label define famsize_lbl 0086 `"86"', add
label define famsize_lbl 0087 `"87"', add
label define famsize_lbl 0088 `"88"', add
label define famsize_lbl 0089 `"89"', add
label define famsize_lbl 0090 `"90"', add
label define famsize_lbl 0091 `"91"', add
label define famsize_lbl 0092 `"92"', add
label define famsize_lbl 0093 `"93"', add
label define famsize_lbl 0094 `"94"', add
label define famsize_lbl 0095 `"95"', add
label define famsize_lbl 0096 `"96"', add
label define famsize_lbl 0097 `"97"', add
label define famsize_lbl 0098 `"98"', add
label define famsize_lbl 0099 `"99 or more persons"', add
label values famsize famsize_lbl

label define nchild_lbl 00 `"0"'
label define nchild_lbl 01 `"1"', add
label define nchild_lbl 02 `"2"', add
label define nchild_lbl 03 `"3"', add
label define nchild_lbl 04 `"4"', add
label define nchild_lbl 05 `"5"', add
label define nchild_lbl 06 `"6"', add
label define nchild_lbl 07 `"7"', add
label define nchild_lbl 08 `"8"', add
label define nchild_lbl 09 `"9 or more children in household"', add
label values nchild nchild_lbl

label define nchlt5_lbl 00 `"0"'
label define nchlt5_lbl 01 `"1"', add
label define nchlt5_lbl 02 `"2"', add
label define nchlt5_lbl 03 `"3"', add
label define nchlt5_lbl 04 `"4"', add
label define nchlt5_lbl 05 `"5"', add
label define nchlt5_lbl 06 `"6"', add
label define nchlt5_lbl 07 `"7"', add
label define nchlt5_lbl 08 `"8"', add
label define nchlt5_lbl 09 `"9 or more own children under age 5 in household"', add
label define nchlt5_lbl 98 `"One or more children have unknown age"', add
label values nchlt5 nchlt5_lbl

label define eldch_lbl 00 `"0"'
label define eldch_lbl 01 `"1"', add
label define eldch_lbl 02 `"2"', add
label define eldch_lbl 03 `"3"', add
label define eldch_lbl 04 `"4"', add
label define eldch_lbl 05 `"5"', add
label define eldch_lbl 06 `"6"', add
label define eldch_lbl 07 `"7"', add
label define eldch_lbl 08 `"8"', add
label define eldch_lbl 09 `"9"', add
label define eldch_lbl 10 `"10"', add
label define eldch_lbl 11 `"11"', add
label define eldch_lbl 12 `"12"', add
label define eldch_lbl 13 `"13"', add
label define eldch_lbl 14 `"14"', add
label define eldch_lbl 15 `"15"', add
label define eldch_lbl 16 `"16"', add
label define eldch_lbl 17 `"17"', add
label define eldch_lbl 18 `"18"', add
label define eldch_lbl 19 `"19"', add
label define eldch_lbl 20 `"20"', add
label define eldch_lbl 21 `"21"', add
label define eldch_lbl 22 `"22"', add
label define eldch_lbl 23 `"23"', add
label define eldch_lbl 24 `"24"', add
label define eldch_lbl 25 `"25"', add
label define eldch_lbl 26 `"26"', add
label define eldch_lbl 27 `"27"', add
label define eldch_lbl 28 `"28"', add
label define eldch_lbl 29 `"29"', add
label define eldch_lbl 30 `"30"', add
label define eldch_lbl 31 `"31"', add
label define eldch_lbl 32 `"32"', add
label define eldch_lbl 33 `"33"', add
label define eldch_lbl 34 `"34"', add
label define eldch_lbl 35 `"35"', add
label define eldch_lbl 36 `"36"', add
label define eldch_lbl 37 `"37"', add
label define eldch_lbl 38 `"38"', add
label define eldch_lbl 39 `"39"', add
label define eldch_lbl 40 `"40"', add
label define eldch_lbl 41 `"41"', add
label define eldch_lbl 42 `"42"', add
label define eldch_lbl 43 `"43"', add
label define eldch_lbl 44 `"44"', add
label define eldch_lbl 45 `"45"', add
label define eldch_lbl 46 `"46"', add
label define eldch_lbl 47 `"47"', add
label define eldch_lbl 48 `"48"', add
label define eldch_lbl 49 `"49"', add
label define eldch_lbl 50 `"50 or older"', add
label define eldch_lbl 98 `"One or more children have unknown age"', add
label define eldch_lbl 99 `"No own child in household"', add
label values eldch eldch_lbl

label define yngch_lbl 00 `"0"'
label define yngch_lbl 01 `"1"', add
label define yngch_lbl 02 `"2"', add
label define yngch_lbl 03 `"3"', add
label define yngch_lbl 04 `"4"', add
label define yngch_lbl 05 `"5"', add
label define yngch_lbl 06 `"6"', add
label define yngch_lbl 07 `"7"', add
label define yngch_lbl 08 `"8"', add
label define yngch_lbl 09 `"9"', add
label define yngch_lbl 10 `"10"', add
label define yngch_lbl 11 `"11"', add
label define yngch_lbl 12 `"12"', add
label define yngch_lbl 13 `"13"', add
label define yngch_lbl 14 `"14"', add
label define yngch_lbl 15 `"15"', add
label define yngch_lbl 16 `"16"', add
label define yngch_lbl 17 `"17"', add
label define yngch_lbl 18 `"18"', add
label define yngch_lbl 19 `"19"', add
label define yngch_lbl 20 `"20"', add
label define yngch_lbl 21 `"21"', add
label define yngch_lbl 22 `"22"', add
label define yngch_lbl 23 `"23"', add
label define yngch_lbl 24 `"24"', add
label define yngch_lbl 25 `"25"', add
label define yngch_lbl 26 `"26"', add
label define yngch_lbl 27 `"27"', add
label define yngch_lbl 28 `"28"', add
label define yngch_lbl 29 `"29"', add
label define yngch_lbl 30 `"30"', add
label define yngch_lbl 31 `"31"', add
label define yngch_lbl 32 `"32"', add
label define yngch_lbl 33 `"33"', add
label define yngch_lbl 34 `"34"', add
label define yngch_lbl 35 `"35"', add
label define yngch_lbl 36 `"36"', add
label define yngch_lbl 37 `"37"', add
label define yngch_lbl 38 `"38"', add
label define yngch_lbl 39 `"39"', add
label define yngch_lbl 40 `"40"', add
label define yngch_lbl 41 `"41"', add
label define yngch_lbl 42 `"42"', add
label define yngch_lbl 43 `"43"', add
label define yngch_lbl 44 `"44"', add
label define yngch_lbl 45 `"45"', add
label define yngch_lbl 46 `"46"', add
label define yngch_lbl 47 `"47"', add
label define yngch_lbl 48 `"48"', add
label define yngch_lbl 49 `"49"', add
label define yngch_lbl 50 `"50 or older"', add
label define yngch_lbl 98 `"One or more children have unknown age"', add
label define yngch_lbl 99 `"No own child in household"', add
label values yngch yngch_lbl

label define relate_lbl 1 `"Head"'
label define relate_lbl 2 `"Spouse/partner"', add
label define relate_lbl 3 `"Child"', add
label define relate_lbl 4 `"Other relative"', add
label define relate_lbl 5 `"Non-relative"', add
label define relate_lbl 6 `"Other relative or non-relative"', add
label define relate_lbl 9 `"Unknown"', add
label values relate relate_lbl

label define related_lbl 1000 `"Head"'
label define related_lbl 2000 `"Spouse/partner"', add
label define related_lbl 2100 `"Spouse"', add
label define related_lbl 2200 `"Unmarried partner"', add
label define related_lbl 2210 `"Civil union"', add
label define related_lbl 2300 `"Same-sex spouse/partner"', add
label define related_lbl 3000 `"Child"', add
label define related_lbl 3100 `"Biological child"', add
label define related_lbl 3200 `"Adopted child"', add
label define related_lbl 3300 `"Stepchild"', add
label define related_lbl 3400 `"Child/child-in-law"', add
label define related_lbl 3500 `"Child/child-in-law/grandchild"', add
label define related_lbl 3600 `"Child of unmarried partner"', add
label define related_lbl 4000 `"Other relative"', add
label define related_lbl 4100 `"Grandchild"', add
label define related_lbl 4110 `"Grandchild or great grandchild"', add
label define related_lbl 4120 `"Great grandchild"', add
label define related_lbl 4130 `"Great-great grandchild"', add
label define related_lbl 4200 `"Parent/parent-in-law"', add
label define related_lbl 4210 `"Parent"', add
label define related_lbl 4211 `"Stepparent"', add
label define related_lbl 4220 `"Parent-in-law"', add
label define related_lbl 4300 `"Child-in-law"', add
label define related_lbl 4301 `"Daughter-in-law"', add
label define related_lbl 4302 `"Spouse/partner of child"', add
label define related_lbl 4310 `"Unmarried partner of child"', add
label define related_lbl 4400 `"Sibling/sibling-in-law"', add
label define related_lbl 4410 `"Sibling"', add
label define related_lbl 4420 `"Stepsibling"', add
label define related_lbl 4430 `"Sibling-in-law"', add
label define related_lbl 4431 `"Sibling of spouse/partner"', add
label define related_lbl 4432 `"Spouse/partner of sibling"', add
label define related_lbl 4500 `"Grandparent"', add
label define related_lbl 4510 `"Great grandparent"', add
label define related_lbl 4600 `"Parent/grandparent/ascendant"', add
label define related_lbl 4700 `"Aunt/uncle"', add
label define related_lbl 4800 `"Other specified relative"', add
label define related_lbl 4810 `"Nephew/niece"', add
label define related_lbl 4820 `"Cousin"', add
label define related_lbl 4830 `"Sibling's sibling-in-law"', add
label define related_lbl 4900 `"Other relative, not elsewhere classified"', add
label define related_lbl 4910 `"Other relative with same family name"', add
label define related_lbl 4920 `"Other relative with different family name"', add
label define related_lbl 4930 `"Other relative, not specified (secondary family)"', add
label define related_lbl 5000 `"Non-relative"', add
label define related_lbl 5100 `"Friend/guest/visitor/partner"', add
label define related_lbl 5110 `"Partner/friend"', add
label define related_lbl 5111 `"Friend"', add
label define related_lbl 5112 `"Partner/roommate"', add
label define related_lbl 5113 `"Housemate/roommate"', add
label define related_lbl 5120 `"Visitor"', add
label define related_lbl 5130 `"Ex-spouse"', add
label define related_lbl 5140 `"Godparent"', add
label define related_lbl 5150 `"Godchild"', add
label define related_lbl 5200 `"Employee"', add
label define related_lbl 5210 `"Domestic employee"', add
label define related_lbl 5220 `"Relative of employee, n.s."', add
label define related_lbl 5221 `"Spouse of servant"', add
label define related_lbl 5222 `"Child of servant"', add
label define related_lbl 5223 `"Other relative of servant"', add
label define related_lbl 5300 `"Roomer/boarder/lodger/foster child"', add
label define related_lbl 5310 `"Boarder"', add
label define related_lbl 5311 `"Boarder or guest"', add
label define related_lbl 5320 `"Lodger"', add
label define related_lbl 5330 `"Foster child"', add
label define related_lbl 5340 `"Tutored/foster child"', add
label define related_lbl 5350 `"Tutored child"', add
label define related_lbl 5400 `"Employee, boarder, or guest"', add
label define related_lbl 5500 `"Other specified non-relative"', add
label define related_lbl 5510 `"Agregado"', add
label define related_lbl 5520 `"Temporary resident, guest"', add
label define related_lbl 5600 `"Group quarters"', add
label define related_lbl 5610 `"Group quarters, non-inmates"', add
label define related_lbl 5620 `"Institutional inmates"', add
label define related_lbl 5900 `"Non-relative, n.e.c."', add
label define related_lbl 6000 `"Other relative or non-relative"', add
label define related_lbl 9999 `"Unknown"', add
label values related related_lbl

label define age_lbl 000 `"Less than 1 year"'
label define age_lbl 001 `"1 year"', add
label define age_lbl 002 `"2 years"', add
label define age_lbl 003 `"3"', add
label define age_lbl 004 `"4"', add
label define age_lbl 005 `"5"', add
label define age_lbl 006 `"6"', add
label define age_lbl 007 `"7"', add
label define age_lbl 008 `"8"', add
label define age_lbl 009 `"9"', add
label define age_lbl 010 `"10"', add
label define age_lbl 011 `"11"', add
label define age_lbl 012 `"12"', add
label define age_lbl 013 `"13"', add
label define age_lbl 014 `"14"', add
label define age_lbl 015 `"15"', add
label define age_lbl 016 `"16"', add
label define age_lbl 017 `"17"', add
label define age_lbl 018 `"18"', add
label define age_lbl 019 `"19"', add
label define age_lbl 020 `"20"', add
label define age_lbl 021 `"21"', add
label define age_lbl 022 `"22"', add
label define age_lbl 023 `"23"', add
label define age_lbl 024 `"24"', add
label define age_lbl 025 `"25"', add
label define age_lbl 026 `"26"', add
label define age_lbl 027 `"27"', add
label define age_lbl 028 `"28"', add
label define age_lbl 029 `"29"', add
label define age_lbl 030 `"30"', add
label define age_lbl 031 `"31"', add
label define age_lbl 032 `"32"', add
label define age_lbl 033 `"33"', add
label define age_lbl 034 `"34"', add
label define age_lbl 035 `"35"', add
label define age_lbl 036 `"36"', add
label define age_lbl 037 `"37"', add
label define age_lbl 038 `"38"', add
label define age_lbl 039 `"39"', add
label define age_lbl 040 `"40"', add
label define age_lbl 041 `"41"', add
label define age_lbl 042 `"42"', add
label define age_lbl 043 `"43"', add
label define age_lbl 044 `"44"', add
label define age_lbl 045 `"45"', add
label define age_lbl 046 `"46"', add
label define age_lbl 047 `"47"', add
label define age_lbl 048 `"48"', add
label define age_lbl 049 `"49"', add
label define age_lbl 050 `"50"', add
label define age_lbl 051 `"51"', add
label define age_lbl 052 `"52"', add
label define age_lbl 053 `"53"', add
label define age_lbl 054 `"54"', add
label define age_lbl 055 `"55"', add
label define age_lbl 056 `"56"', add
label define age_lbl 057 `"57"', add
label define age_lbl 058 `"58"', add
label define age_lbl 059 `"59"', add
label define age_lbl 060 `"60"', add
label define age_lbl 061 `"61"', add
label define age_lbl 062 `"62"', add
label define age_lbl 063 `"63"', add
label define age_lbl 064 `"64"', add
label define age_lbl 065 `"65"', add
label define age_lbl 066 `"66"', add
label define age_lbl 067 `"67"', add
label define age_lbl 068 `"68"', add
label define age_lbl 069 `"69"', add
label define age_lbl 070 `"70"', add
label define age_lbl 071 `"71"', add
label define age_lbl 072 `"72"', add
label define age_lbl 073 `"73"', add
label define age_lbl 074 `"74"', add
label define age_lbl 075 `"75"', add
label define age_lbl 076 `"76"', add
label define age_lbl 077 `"77"', add
label define age_lbl 078 `"78"', add
label define age_lbl 079 `"79"', add
label define age_lbl 080 `"80"', add
label define age_lbl 081 `"81"', add
label define age_lbl 082 `"82"', add
label define age_lbl 083 `"83"', add
label define age_lbl 084 `"84"', add
label define age_lbl 085 `"85"', add
label define age_lbl 086 `"86"', add
label define age_lbl 087 `"87"', add
label define age_lbl 088 `"88"', add
label define age_lbl 089 `"89"', add
label define age_lbl 090 `"90"', add
label define age_lbl 091 `"91"', add
label define age_lbl 092 `"92"', add
label define age_lbl 093 `"93"', add
label define age_lbl 094 `"94"', add
label define age_lbl 095 `"95"', add
label define age_lbl 096 `"96"', add
label define age_lbl 097 `"97"', add
label define age_lbl 098 `"98"', add
label define age_lbl 099 `"99"', add
label define age_lbl 100 `"100+"', add
label define age_lbl 999 `"Not reported/missing"', add
label values age age_lbl

label define age2_lbl 01 `"0 to 4"'
label define age2_lbl 02 `"5 to 9"', add
label define age2_lbl 03 `"10 to 14"', add
label define age2_lbl 04 `"15 to 19"', add
label define age2_lbl 05 `"0 to 5"', add
label define age2_lbl 06 `"6 to 10"', add
label define age2_lbl 07 `"10 to 15"', add
label define age2_lbl 08 `"11 to 14"', add
label define age2_lbl 09 `"15 to 17"', add
label define age2_lbl 10 `"16 to 19"', add
label define age2_lbl 11 `"18 to 24"', add
label define age2_lbl 12 `"20 to 24"', add
label define age2_lbl 13 `"25 to 29"', add
label define age2_lbl 14 `"30 to 34"', add
label define age2_lbl 15 `"35 to 39"', add
label define age2_lbl 16 `"40 to 44"', add
label define age2_lbl 17 `"45 to 49"', add
label define age2_lbl 18 `"50 to 54"', add
label define age2_lbl 19 `"55 to 59"', add
label define age2_lbl 20 `"60 to 64"', add
label define age2_lbl 21 `"65 to 69"', add
label define age2_lbl 22 `"70 to 74"', add
label define age2_lbl 23 `"75 to 79"', add
label define age2_lbl 24 `"80 to 84"', add
label define age2_lbl 25 `"85+"', add
label define age2_lbl 98 `"Unknown"', add
label values age2 age2_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label define sex_lbl 9 `"Unknown"', add
label values sex sex_lbl

label define marst_lbl 0 `"NIU (not in universe)"'
label define marst_lbl 1 `"Single/never married"', add
label define marst_lbl 2 `"Married/in union"', add
label define marst_lbl 3 `"Separated/divorced/spouse absent"', add
label define marst_lbl 4 `"Widowed"', add
label define marst_lbl 9 `"Unknown/missing"', add
label values marst marst_lbl

label define marstd_lbl 000 `"NIU (not in universe)"'
label define marstd_lbl 100 `"Single/never married"', add
label define marstd_lbl 110 `"Engaged"', add
label define marstd_lbl 111 `"Never married and never cohabited"', add
label define marstd_lbl 200 `"Married or consensual union"', add
label define marstd_lbl 210 `"Married, formally"', add
label define marstd_lbl 211 `"Married, civil"', add
label define marstd_lbl 212 `"Married, religious"', add
label define marstd_lbl 213 `"Married, civil and religious"', add
label define marstd_lbl 214 `"Married, civil or religious"', add
label define marstd_lbl 215 `"Married, traditional/customary"', add
label define marstd_lbl 216 `"Married, monogamous"', add
label define marstd_lbl 217 `"Married, polygamous"', add
label define marstd_lbl 219 `"Married, spouse absent (historical samples)"', add
label define marstd_lbl 220 `"Consensual union"', add
label define marstd_lbl 300 `"Separated/divorced/spouse absent"', add
label define marstd_lbl 310 `"Separated or divorced"', add
label define marstd_lbl 320 `"Separated or annulled"', add
label define marstd_lbl 330 `"Separated"', add
label define marstd_lbl 331 `"Separated legally"', add
label define marstd_lbl 332 `"Separated de facto"', add
label define marstd_lbl 333 `"Separated from marriage"', add
label define marstd_lbl 334 `"Separated from consensual union"', add
label define marstd_lbl 335 `"Separated from consensual union or marriage"', add
label define marstd_lbl 340 `"Annulled"', add
label define marstd_lbl 350 `"Divorced"', add
label define marstd_lbl 400 `"Widowed"', add
label define marstd_lbl 410 `"Widowed or divorced"', add
label define marstd_lbl 411 `"Widowed from consensual union or marriage"', add
label define marstd_lbl 412 `"Widowed from marriage"', add
label define marstd_lbl 413 `"Widowed from consensual union"', add
label define marstd_lbl 420 `"Widowed, divorced, or separated"', add
label define marstd_lbl 999 `"Unknown/missing"', add
label values marstd marstd_lbl

label define consens_lbl 1 `"Yes, in consensual union"'
label define consens_lbl 2 `"No, married"', add
label define consens_lbl 8 `"Unknown"', add
label define consens_lbl 9 `"NIU (not in universe)"', add
label values consens consens_lbl

label define polygam_lbl 00 `"NIU (not in universe)"'
label define polygam_lbl 01 `"No, in monogamous union"', add
label define polygam_lbl 02 `"Yes, in polygamous union"', add
label define polygam_lbl 03 `"Man in polygamous union"', add
label define polygam_lbl 04 `"Polygamous man, 2 wives"', add
label define polygam_lbl 05 `"Polygamous man, 3 or more wives"', add
label define polygam_lbl 06 `"Woman in polygamous union"', add
label define polygam_lbl 07 `"Polygamous marriage, 2 wives"', add
label define polygam_lbl 08 `"Polygamous marriage, 3 or more wives"', add
label define polygam_lbl 09 `"First wife"', add
label define polygam_lbl 10 `"Second wife"', add
label define polygam_lbl 11 `"Third or higher order wife"', add
label define polygam_lbl 99 `"Unknown/missing"', add
label values polygam polygam_lbl

label define agemarr_lbl 00 `"NIU (not in universe)"'
label define agemarr_lbl 10 `"10 or younger"', add
label define agemarr_lbl 11 `"11"', add
label define agemarr_lbl 12 `"12"', add
label define agemarr_lbl 13 `"13"', add
label define agemarr_lbl 14 `"14"', add
label define agemarr_lbl 15 `"15"', add
label define agemarr_lbl 16 `"16"', add
label define agemarr_lbl 17 `"17"', add
label define agemarr_lbl 18 `"18"', add
label define agemarr_lbl 19 `"19"', add
label define agemarr_lbl 20 `"20"', add
label define agemarr_lbl 21 `"21"', add
label define agemarr_lbl 22 `"22"', add
label define agemarr_lbl 23 `"23"', add
label define agemarr_lbl 24 `"24"', add
label define agemarr_lbl 25 `"25"', add
label define agemarr_lbl 26 `"26"', add
label define agemarr_lbl 27 `"27"', add
label define agemarr_lbl 28 `"28"', add
label define agemarr_lbl 29 `"29"', add
label define agemarr_lbl 30 `"30"', add
label define agemarr_lbl 31 `"31"', add
label define agemarr_lbl 32 `"32"', add
label define agemarr_lbl 33 `"33"', add
label define agemarr_lbl 34 `"34"', add
label define agemarr_lbl 35 `"35"', add
label define agemarr_lbl 36 `"36"', add
label define agemarr_lbl 37 `"37"', add
label define agemarr_lbl 38 `"38"', add
label define agemarr_lbl 39 `"39"', add
label define agemarr_lbl 40 `"40"', add
label define agemarr_lbl 41 `"41"', add
label define agemarr_lbl 42 `"42"', add
label define agemarr_lbl 43 `"43"', add
label define agemarr_lbl 44 `"44"', add
label define agemarr_lbl 45 `"45"', add
label define agemarr_lbl 46 `"46"', add
label define agemarr_lbl 47 `"47"', add
label define agemarr_lbl 48 `"48"', add
label define agemarr_lbl 49 `"49"', add
label define agemarr_lbl 50 `"50"', add
label define agemarr_lbl 51 `"51"', add
label define agemarr_lbl 52 `"52"', add
label define agemarr_lbl 53 `"53"', add
label define agemarr_lbl 54 `"54"', add
label define agemarr_lbl 55 `"55"', add
label define agemarr_lbl 56 `"56"', add
label define agemarr_lbl 57 `"57"', add
label define agemarr_lbl 58 `"58"', add
label define agemarr_lbl 59 `"59"', add
label define agemarr_lbl 60 `"60"', add
label define agemarr_lbl 61 `"61"', add
label define agemarr_lbl 62 `"62"', add
label define agemarr_lbl 63 `"63"', add
label define agemarr_lbl 64 `"64"', add
label define agemarr_lbl 65 `"65"', add
label define agemarr_lbl 66 `"66"', add
label define agemarr_lbl 67 `"67"', add
label define agemarr_lbl 68 `"68"', add
label define agemarr_lbl 69 `"69"', add
label define agemarr_lbl 70 `"70"', add
label define agemarr_lbl 71 `"71"', add
label define agemarr_lbl 72 `"72"', add
label define agemarr_lbl 73 `"73"', add
label define agemarr_lbl 74 `"74"', add
label define agemarr_lbl 75 `"75"', add
label define agemarr_lbl 76 `"76"', add
label define agemarr_lbl 77 `"77"', add
label define agemarr_lbl 78 `"78"', add
label define agemarr_lbl 79 `"79"', add
label define agemarr_lbl 80 `"80"', add
label define agemarr_lbl 81 `"81"', add
label define agemarr_lbl 82 `"82"', add
label define agemarr_lbl 83 `"83"', add
label define agemarr_lbl 84 `"84"', add
label define agemarr_lbl 85 `"85"', add
label define agemarr_lbl 86 `"86"', add
label define agemarr_lbl 87 `"87"', add
label define agemarr_lbl 88 `"88"', add
label define agemarr_lbl 89 `"89"', add
label define agemarr_lbl 90 `"90"', add
label define agemarr_lbl 91 `"91"', add
label define agemarr_lbl 92 `"92"', add
label define agemarr_lbl 93 `"93"', add
label define agemarr_lbl 94 `"94"', add
label define agemarr_lbl 95 `"95"', add
label define agemarr_lbl 96 `"96"', add
label define agemarr_lbl 97 `"97"', add
label define agemarr_lbl 98 `"98"', add
label define agemarr_lbl 99 `"Unknown"', add
label values agemarr agemarr_lbl

label define birthyr_lbl 0000 `"NIU (not in universe)"'
label define birthyr_lbl 1628 `"1628"', add
label define birthyr_lbl 1629 `"1629"', add
label define birthyr_lbl 1630 `"1630"', add
label define birthyr_lbl 1631 `"1631"', add
label define birthyr_lbl 1634 `"1634"', add
label define birthyr_lbl 1635 `"1635"', add
label define birthyr_lbl 1636 `"1636"', add
label define birthyr_lbl 1637 `"1637"', add
label define birthyr_lbl 1638 `"1638"', add
label define birthyr_lbl 1639 `"1639"', add
label define birthyr_lbl 1640 `"1640"', add
label define birthyr_lbl 1641 `"1641"', add
label define birthyr_lbl 1642 `"1642"', add
label define birthyr_lbl 1643 `"1643"', add
label define birthyr_lbl 1644 `"1644"', add
label define birthyr_lbl 1645 `"1645"', add
label define birthyr_lbl 1646 `"1646"', add
label define birthyr_lbl 1647 `"1647"', add
label define birthyr_lbl 1648 `"1648"', add
label define birthyr_lbl 1649 `"1649"', add
label define birthyr_lbl 1650 `"1650"', add
label define birthyr_lbl 1651 `"1651"', add
label define birthyr_lbl 1652 `"1652"', add
label define birthyr_lbl 1653 `"1653"', add
label define birthyr_lbl 1654 `"1654"', add
label define birthyr_lbl 1655 `"1655"', add
label define birthyr_lbl 1656 `"1656"', add
label define birthyr_lbl 1657 `"1657"', add
label define birthyr_lbl 1658 `"1658"', add
label define birthyr_lbl 1659 `"1659"', add
label define birthyr_lbl 1660 `"1660"', add
label define birthyr_lbl 1661 `"1661"', add
label define birthyr_lbl 1662 `"1662"', add
label define birthyr_lbl 1663 `"1663"', add
label define birthyr_lbl 1664 `"1664"', add
label define birthyr_lbl 1665 `"1665"', add
label define birthyr_lbl 1666 `"1666"', add
label define birthyr_lbl 1667 `"1667"', add
label define birthyr_lbl 1668 `"1668"', add
label define birthyr_lbl 1669 `"1669"', add
label define birthyr_lbl 1670 `"1670"', add
label define birthyr_lbl 1671 `"1671"', add
label define birthyr_lbl 1672 `"1672"', add
label define birthyr_lbl 1673 `"1673"', add
label define birthyr_lbl 1674 `"1674"', add
label define birthyr_lbl 1675 `"1675"', add
label define birthyr_lbl 1676 `"1676"', add
label define birthyr_lbl 1677 `"1677"', add
label define birthyr_lbl 1678 `"1678"', add
label define birthyr_lbl 1679 `"1679"', add
label define birthyr_lbl 1680 `"1680"', add
label define birthyr_lbl 1681 `"1681"', add
label define birthyr_lbl 1682 `"1682"', add
label define birthyr_lbl 1683 `"1683"', add
label define birthyr_lbl 1684 `"1684"', add
label define birthyr_lbl 1685 `"1685"', add
label define birthyr_lbl 1686 `"1686"', add
label define birthyr_lbl 1687 `"1687"', add
label define birthyr_lbl 1688 `"1688"', add
label define birthyr_lbl 1689 `"1689"', add
label define birthyr_lbl 1690 `"1690"', add
label define birthyr_lbl 1691 `"1691"', add
label define birthyr_lbl 1692 `"1692"', add
label define birthyr_lbl 1693 `"1693"', add
label define birthyr_lbl 1694 `"1694"', add
label define birthyr_lbl 1695 `"1695"', add
label define birthyr_lbl 1696 `"1696"', add
label define birthyr_lbl 1697 `"1697"', add
label define birthyr_lbl 1698 `"1698"', add
label define birthyr_lbl 1699 `"1699"', add
label define birthyr_lbl 1700 `"1700"', add
label define birthyr_lbl 1701 `"1701"', add
label define birthyr_lbl 1702 `"1702"', add
label define birthyr_lbl 1703 `"1703"', add
label define birthyr_lbl 1704 `"1704"', add
label define birthyr_lbl 1705 `"1705"', add
label define birthyr_lbl 1706 `"1706"', add
label define birthyr_lbl 1707 `"1707"', add
label define birthyr_lbl 1708 `"1708"', add
label define birthyr_lbl 1709 `"1709"', add
label define birthyr_lbl 1710 `"1710"', add
label define birthyr_lbl 1711 `"1711"', add
label define birthyr_lbl 1712 `"1712"', add
label define birthyr_lbl 1713 `"1713"', add
label define birthyr_lbl 1714 `"1714"', add
label define birthyr_lbl 1715 `"1715"', add
label define birthyr_lbl 1716 `"1716"', add
label define birthyr_lbl 1717 `"1717"', add
label define birthyr_lbl 1718 `"1718"', add
label define birthyr_lbl 1719 `"1719"', add
label define birthyr_lbl 1720 `"1720"', add
label define birthyr_lbl 1721 `"1721"', add
label define birthyr_lbl 1722 `"1722"', add
label define birthyr_lbl 1723 `"1723"', add
label define birthyr_lbl 1724 `"1724"', add
label define birthyr_lbl 1725 `"1725"', add
label define birthyr_lbl 1726 `"1726"', add
label define birthyr_lbl 1727 `"1727"', add
label define birthyr_lbl 1728 `"1728"', add
label define birthyr_lbl 1729 `"1729"', add
label define birthyr_lbl 1730 `"1730"', add
label define birthyr_lbl 1731 `"1731"', add
label define birthyr_lbl 1732 `"1732"', add
label define birthyr_lbl 1733 `"1733"', add
label define birthyr_lbl 1734 `"1734"', add
label define birthyr_lbl 1735 `"1735"', add
label define birthyr_lbl 1736 `"1736"', add
label define birthyr_lbl 1737 `"1737"', add
label define birthyr_lbl 1738 `"1738"', add
label define birthyr_lbl 1739 `"1739"', add
label define birthyr_lbl 1740 `"1740"', add
label define birthyr_lbl 1741 `"1741"', add
label define birthyr_lbl 1742 `"1742"', add
label define birthyr_lbl 1743 `"1743"', add
label define birthyr_lbl 1744 `"1744"', add
label define birthyr_lbl 1745 `"1745"', add
label define birthyr_lbl 1746 `"1746"', add
label define birthyr_lbl 1747 `"1747"', add
label define birthyr_lbl 1748 `"1748"', add
label define birthyr_lbl 1749 `"1749"', add
label define birthyr_lbl 1750 `"1750"', add
label define birthyr_lbl 1751 `"1751"', add
label define birthyr_lbl 1752 `"1752"', add
label define birthyr_lbl 1753 `"1753"', add
label define birthyr_lbl 1754 `"1754"', add
label define birthyr_lbl 1755 `"1755"', add
label define birthyr_lbl 1756 `"1756"', add
label define birthyr_lbl 1757 `"1757"', add
label define birthyr_lbl 1758 `"1758"', add
label define birthyr_lbl 1759 `"1759"', add
label define birthyr_lbl 1760 `"1760"', add
label define birthyr_lbl 1761 `"1761"', add
label define birthyr_lbl 1762 `"1762"', add
label define birthyr_lbl 1763 `"1763"', add
label define birthyr_lbl 1764 `"1764"', add
label define birthyr_lbl 1765 `"1765"', add
label define birthyr_lbl 1766 `"1766"', add
label define birthyr_lbl 1767 `"1767"', add
label define birthyr_lbl 1768 `"1768"', add
label define birthyr_lbl 1769 `"1769"', add
label define birthyr_lbl 1770 `"1770"', add
label define birthyr_lbl 1771 `"1771"', add
label define birthyr_lbl 1772 `"1772"', add
label define birthyr_lbl 1773 `"1773"', add
label define birthyr_lbl 1774 `"1774"', add
label define birthyr_lbl 1775 `"1775"', add
label define birthyr_lbl 1776 `"1776"', add
label define birthyr_lbl 1777 `"1777"', add
label define birthyr_lbl 1778 `"1778"', add
label define birthyr_lbl 1779 `"1779"', add
label define birthyr_lbl 1780 `"1780"', add
label define birthyr_lbl 1781 `"1781"', add
label define birthyr_lbl 1782 `"1782"', add
label define birthyr_lbl 1783 `"1783"', add
label define birthyr_lbl 1784 `"1784"', add
label define birthyr_lbl 1785 `"1785"', add
label define birthyr_lbl 1786 `"1786"', add
label define birthyr_lbl 1787 `"1787"', add
label define birthyr_lbl 1788 `"1788"', add
label define birthyr_lbl 1789 `"1789"', add
label define birthyr_lbl 1790 `"1790"', add
label define birthyr_lbl 1791 `"1791"', add
label define birthyr_lbl 1792 `"1792"', add
label define birthyr_lbl 1793 `"1793"', add
label define birthyr_lbl 1794 `"1794"', add
label define birthyr_lbl 1795 `"1795"', add
label define birthyr_lbl 1796 `"1796"', add
label define birthyr_lbl 1797 `"1797"', add
label define birthyr_lbl 1798 `"1798"', add
label define birthyr_lbl 1799 `"1799"', add
label define birthyr_lbl 1800 `"1800"', add
label define birthyr_lbl 1801 `"1801"', add
label define birthyr_lbl 1802 `"1802"', add
label define birthyr_lbl 1803 `"1803"', add
label define birthyr_lbl 1804 `"1804"', add
label define birthyr_lbl 1805 `"1805"', add
label define birthyr_lbl 1806 `"1806"', add
label define birthyr_lbl 1807 `"1807"', add
label define birthyr_lbl 1808 `"1808"', add
label define birthyr_lbl 1809 `"1809"', add
label define birthyr_lbl 1810 `"1810"', add
label define birthyr_lbl 1811 `"1811"', add
label define birthyr_lbl 1812 `"1812"', add
label define birthyr_lbl 1813 `"1813"', add
label define birthyr_lbl 1814 `"1814"', add
label define birthyr_lbl 1815 `"1815"', add
label define birthyr_lbl 1816 `"1816"', add
label define birthyr_lbl 1817 `"1817"', add
label define birthyr_lbl 1818 `"1818"', add
label define birthyr_lbl 1819 `"1819"', add
label define birthyr_lbl 1820 `"1820"', add
label define birthyr_lbl 1821 `"1821"', add
label define birthyr_lbl 1822 `"1822"', add
label define birthyr_lbl 1823 `"1823"', add
label define birthyr_lbl 1824 `"1824"', add
label define birthyr_lbl 1825 `"1825"', add
label define birthyr_lbl 1826 `"1826"', add
label define birthyr_lbl 1827 `"1827"', add
label define birthyr_lbl 1828 `"1828"', add
label define birthyr_lbl 1829 `"1829"', add
label define birthyr_lbl 1830 `"1830"', add
label define birthyr_lbl 1831 `"1831"', add
label define birthyr_lbl 1832 `"1832"', add
label define birthyr_lbl 1833 `"1833"', add
label define birthyr_lbl 1834 `"1834"', add
label define birthyr_lbl 1835 `"1835"', add
label define birthyr_lbl 1836 `"1836"', add
label define birthyr_lbl 1837 `"1837"', add
label define birthyr_lbl 1838 `"1838"', add
label define birthyr_lbl 1839 `"1839"', add
label define birthyr_lbl 1840 `"1840"', add
label define birthyr_lbl 1841 `"1841"', add
label define birthyr_lbl 1842 `"1842"', add
label define birthyr_lbl 1843 `"1843"', add
label define birthyr_lbl 1844 `"1844"', add
label define birthyr_lbl 1845 `"1845"', add
label define birthyr_lbl 1846 `"1846"', add
label define birthyr_lbl 1847 `"1847"', add
label define birthyr_lbl 1848 `"1848"', add
label define birthyr_lbl 1849 `"1849"', add
label define birthyr_lbl 1850 `"1850"', add
label define birthyr_lbl 1851 `"1851"', add
label define birthyr_lbl 1852 `"1852"', add
label define birthyr_lbl 1853 `"1853"', add
label define birthyr_lbl 1854 `"1854"', add
label define birthyr_lbl 1855 `"1855"', add
label define birthyr_lbl 1856 `"1856"', add
label define birthyr_lbl 1857 `"1857"', add
label define birthyr_lbl 1858 `"1858"', add
label define birthyr_lbl 1859 `"1859"', add
label define birthyr_lbl 1860 `"1860"', add
label define birthyr_lbl 1861 `"1861"', add
label define birthyr_lbl 1862 `"1862"', add
label define birthyr_lbl 1863 `"1863"', add
label define birthyr_lbl 1864 `"1864"', add
label define birthyr_lbl 1865 `"1865"', add
label define birthyr_lbl 1866 `"1866"', add
label define birthyr_lbl 1867 `"1867"', add
label define birthyr_lbl 1868 `"1868"', add
label define birthyr_lbl 1869 `"1869"', add
label define birthyr_lbl 1870 `"1870"', add
label define birthyr_lbl 1871 `"1871"', add
label define birthyr_lbl 1872 `"1872"', add
label define birthyr_lbl 1873 `"1873"', add
label define birthyr_lbl 1874 `"1874"', add
label define birthyr_lbl 1875 `"1875"', add
label define birthyr_lbl 1876 `"1876"', add
label define birthyr_lbl 1877 `"1877"', add
label define birthyr_lbl 1878 `"1878"', add
label define birthyr_lbl 1879 `"1879"', add
label define birthyr_lbl 1880 `"1880"', add
label define birthyr_lbl 1881 `"1881"', add
label define birthyr_lbl 1882 `"1882"', add
label define birthyr_lbl 1883 `"1883"', add
label define birthyr_lbl 1884 `"1884"', add
label define birthyr_lbl 1885 `"1885"', add
label define birthyr_lbl 1886 `"1886"', add
label define birthyr_lbl 1887 `"1887"', add
label define birthyr_lbl 1888 `"1888"', add
label define birthyr_lbl 1889 `"1889"', add
label define birthyr_lbl 1890 `"1890"', add
label define birthyr_lbl 1891 `"1891"', add
label define birthyr_lbl 1892 `"1892"', add
label define birthyr_lbl 1893 `"1893"', add
label define birthyr_lbl 1894 `"1894"', add
label define birthyr_lbl 1895 `"1895"', add
label define birthyr_lbl 1896 `"1896"', add
label define birthyr_lbl 1897 `"1897"', add
label define birthyr_lbl 1898 `"1898"', add
label define birthyr_lbl 1899 `"1899"', add
label define birthyr_lbl 1900 `"1900"', add
label define birthyr_lbl 1901 `"1901"', add
label define birthyr_lbl 1902 `"1902"', add
label define birthyr_lbl 1903 `"1903"', add
label define birthyr_lbl 1904 `"1904"', add
label define birthyr_lbl 1905 `"1905"', add
label define birthyr_lbl 1906 `"1906"', add
label define birthyr_lbl 1907 `"1907"', add
label define birthyr_lbl 1908 `"1908"', add
label define birthyr_lbl 1909 `"1909"', add
label define birthyr_lbl 1910 `"1910"', add
label define birthyr_lbl 1911 `"1911"', add
label define birthyr_lbl 1912 `"1912"', add
label define birthyr_lbl 1913 `"1913"', add
label define birthyr_lbl 1914 `"1914"', add
label define birthyr_lbl 1915 `"1915"', add
label define birthyr_lbl 1916 `"1916"', add
label define birthyr_lbl 1917 `"1917"', add
label define birthyr_lbl 1918 `"1918"', add
label define birthyr_lbl 1919 `"1919"', add
label define birthyr_lbl 1920 `"1920"', add
label define birthyr_lbl 1921 `"1921"', add
label define birthyr_lbl 1922 `"1922"', add
label define birthyr_lbl 1923 `"1923"', add
label define birthyr_lbl 1924 `"1924"', add
label define birthyr_lbl 1925 `"1925"', add
label define birthyr_lbl 1926 `"1926"', add
label define birthyr_lbl 1927 `"1927"', add
label define birthyr_lbl 1928 `"1928"', add
label define birthyr_lbl 1929 `"1929"', add
label define birthyr_lbl 1930 `"1930"', add
label define birthyr_lbl 1931 `"1931"', add
label define birthyr_lbl 1932 `"1932"', add
label define birthyr_lbl 1933 `"1933"', add
label define birthyr_lbl 1934 `"1934"', add
label define birthyr_lbl 1935 `"1935"', add
label define birthyr_lbl 1936 `"1936"', add
label define birthyr_lbl 1937 `"1937"', add
label define birthyr_lbl 1938 `"1938"', add
label define birthyr_lbl 1939 `"1939"', add
label define birthyr_lbl 1940 `"1940"', add
label define birthyr_lbl 1941 `"1941"', add
label define birthyr_lbl 1942 `"1942"', add
label define birthyr_lbl 1943 `"1943"', add
label define birthyr_lbl 1944 `"1944"', add
label define birthyr_lbl 1945 `"1945"', add
label define birthyr_lbl 1946 `"1946"', add
label define birthyr_lbl 1947 `"1947"', add
label define birthyr_lbl 1948 `"1948"', add
label define birthyr_lbl 1949 `"1949"', add
label define birthyr_lbl 1950 `"1950"', add
label define birthyr_lbl 1951 `"1951"', add
label define birthyr_lbl 1952 `"1952"', add
label define birthyr_lbl 1953 `"1953"', add
label define birthyr_lbl 1954 `"1954"', add
label define birthyr_lbl 1955 `"1955"', add
label define birthyr_lbl 1956 `"1956"', add
label define birthyr_lbl 1957 `"1957"', add
label define birthyr_lbl 1958 `"1958"', add
label define birthyr_lbl 1959 `"1959"', add
label define birthyr_lbl 1960 `"1960"', add
label define birthyr_lbl 1961 `"1961"', add
label define birthyr_lbl 1962 `"1962"', add
label define birthyr_lbl 1963 `"1963"', add
label define birthyr_lbl 1964 `"1964"', add
label define birthyr_lbl 1965 `"1965"', add
label define birthyr_lbl 1966 `"1966"', add
label define birthyr_lbl 1967 `"1967"', add
label define birthyr_lbl 1968 `"1968"', add
label define birthyr_lbl 1969 `"1969"', add
label define birthyr_lbl 1970 `"1970"', add
label define birthyr_lbl 1971 `"1971"', add
label define birthyr_lbl 1972 `"1972"', add
label define birthyr_lbl 1973 `"1973"', add
label define birthyr_lbl 1974 `"1974"', add
label define birthyr_lbl 1975 `"1975"', add
label define birthyr_lbl 1976 `"1976"', add
label define birthyr_lbl 1977 `"1977"', add
label define birthyr_lbl 1978 `"1978"', add
label define birthyr_lbl 1979 `"1979"', add
label define birthyr_lbl 1980 `"1980"', add
label define birthyr_lbl 1981 `"1981"', add
label define birthyr_lbl 1982 `"1982"', add
label define birthyr_lbl 1983 `"1983"', add
label define birthyr_lbl 1984 `"1984"', add
label define birthyr_lbl 1985 `"1985"', add
label define birthyr_lbl 1986 `"1986"', add
label define birthyr_lbl 1987 `"1987"', add
label define birthyr_lbl 1988 `"1988"', add
label define birthyr_lbl 1989 `"1989"', add
label define birthyr_lbl 1990 `"1990"', add
label define birthyr_lbl 1991 `"1991"', add
label define birthyr_lbl 1992 `"1992"', add
label define birthyr_lbl 1993 `"1993"', add
label define birthyr_lbl 1994 `"1994"', add
label define birthyr_lbl 1995 `"1995"', add
label define birthyr_lbl 1996 `"1996"', add
label define birthyr_lbl 1997 `"1997"', add
label define birthyr_lbl 1998 `"1998"', add
label define birthyr_lbl 1999 `"1999"', add
label define birthyr_lbl 2000 `"2000"', add
label define birthyr_lbl 2001 `"2001"', add
label define birthyr_lbl 2002 `"2002"', add
label define birthyr_lbl 2003 `"2003"', add
label define birthyr_lbl 2004 `"2004"', add
label define birthyr_lbl 2005 `"2005"', add
label define birthyr_lbl 2006 `"2006"', add
label define birthyr_lbl 2007 `"2007"', add
label define birthyr_lbl 2008 `"2008"', add
label define birthyr_lbl 2009 `"2009"', add
label define birthyr_lbl 2010 `"2010"', add
label define birthyr_lbl 2011 `"2011"', add
label define birthyr_lbl 2012 `"2012"', add
label define birthyr_lbl 2013 `"2013"', add
label define birthyr_lbl 2014 `"2014"', add
label define birthyr_lbl 2015 `"2015"', add
label define birthyr_lbl 2016 `"2016"', add
label define birthyr_lbl 2017 `"2017"', add
label define birthyr_lbl 2018 `"2018"', add
label define birthyr_lbl 2019 `"2019"', add
label define birthyr_lbl 2020 `"2020"', add
label define birthyr_lbl 9999 `"Unknown"', add
label values birthyr birthyr_lbl

label define birthmo_lbl 01 `"January"'
label define birthmo_lbl 02 `"February"', add
label define birthmo_lbl 03 `"March"', add
label define birthmo_lbl 04 `"April"', add
label define birthmo_lbl 05 `"May"', add
label define birthmo_lbl 06 `"June"', add
label define birthmo_lbl 07 `"July"', add
label define birthmo_lbl 08 `"August"', add
label define birthmo_lbl 09 `"September"', add
label define birthmo_lbl 10 `"October"', add
label define birthmo_lbl 11 `"November"', add
label define birthmo_lbl 12 `"December"', add
label define birthmo_lbl 98 `"Unknown"', add
label define birthmo_lbl 99 `"NIU (not in universe)"', add
label values birthmo birthmo_lbl

label define chborn_lbl 00 `"No children"'
label define chborn_lbl 01 `"1 child"', add
label define chborn_lbl 02 `"2 children"', add
label define chborn_lbl 03 `"3"', add
label define chborn_lbl 04 `"4"', add
label define chborn_lbl 05 `"5"', add
label define chborn_lbl 06 `"6"', add
label define chborn_lbl 07 `"7"', add
label define chborn_lbl 08 `"8"', add
label define chborn_lbl 09 `"9"', add
label define chborn_lbl 10 `"10"', add
label define chborn_lbl 11 `"11"', add
label define chborn_lbl 12 `"12"', add
label define chborn_lbl 13 `"13"', add
label define chborn_lbl 14 `"14"', add
label define chborn_lbl 15 `"15"', add
label define chborn_lbl 16 `"16"', add
label define chborn_lbl 17 `"17"', add
label define chborn_lbl 18 `"18"', add
label define chborn_lbl 19 `"19"', add
label define chborn_lbl 20 `"20"', add
label define chborn_lbl 21 `"21"', add
label define chborn_lbl 22 `"22"', add
label define chborn_lbl 23 `"23"', add
label define chborn_lbl 24 `"24"', add
label define chborn_lbl 25 `"25"', add
label define chborn_lbl 26 `"26"', add
label define chborn_lbl 27 `"27"', add
label define chborn_lbl 28 `"28"', add
label define chborn_lbl 29 `"29"', add
label define chborn_lbl 30 `"30+"', add
label define chborn_lbl 98 `"Unknown"', add
label define chborn_lbl 99 `"NIU (not in universe)"', add
label values chborn chborn_lbl

label define chsurv_lbl 00 `"No children"'
label define chsurv_lbl 01 `"1 child"', add
label define chsurv_lbl 02 `"2 children"', add
label define chsurv_lbl 03 `"3"', add
label define chsurv_lbl 04 `"4"', add
label define chsurv_lbl 05 `"5"', add
label define chsurv_lbl 06 `"6"', add
label define chsurv_lbl 07 `"7"', add
label define chsurv_lbl 08 `"8"', add
label define chsurv_lbl 09 `"9"', add
label define chsurv_lbl 10 `"10"', add
label define chsurv_lbl 11 `"11"', add
label define chsurv_lbl 12 `"12"', add
label define chsurv_lbl 13 `"13"', add
label define chsurv_lbl 14 `"14"', add
label define chsurv_lbl 15 `"15"', add
label define chsurv_lbl 16 `"16"', add
label define chsurv_lbl 17 `"17"', add
label define chsurv_lbl 18 `"18"', add
label define chsurv_lbl 19 `"19"', add
label define chsurv_lbl 20 `"20"', add
label define chsurv_lbl 21 `"21"', add
label define chsurv_lbl 22 `"22"', add
label define chsurv_lbl 23 `"23"', add
label define chsurv_lbl 24 `"24"', add
label define chsurv_lbl 25 `"25"', add
label define chsurv_lbl 26 `"26"', add
label define chsurv_lbl 27 `"27"', add
label define chsurv_lbl 28 `"28"', add
label define chsurv_lbl 29 `"29"', add
label define chsurv_lbl 30 `"30+"', add
label define chsurv_lbl 98 `"Unknown"', add
label define chsurv_lbl 99 `"NIU (not in universe)"', add
label values chsurv chsurv_lbl

label define chbornf_lbl 00 `"No children"'
label define chbornf_lbl 01 `"1 child"', add
label define chbornf_lbl 02 `"2 children"', add
label define chbornf_lbl 03 `"3"', add
label define chbornf_lbl 04 `"4"', add
label define chbornf_lbl 05 `"5"', add
label define chbornf_lbl 06 `"6"', add
label define chbornf_lbl 07 `"7"', add
label define chbornf_lbl 08 `"8"', add
label define chbornf_lbl 09 `"9"', add
label define chbornf_lbl 10 `"10"', add
label define chbornf_lbl 11 `"11"', add
label define chbornf_lbl 12 `"12"', add
label define chbornf_lbl 13 `"13"', add
label define chbornf_lbl 14 `"14"', add
label define chbornf_lbl 15 `"15"', add
label define chbornf_lbl 16 `"16"', add
label define chbornf_lbl 17 `"17"', add
label define chbornf_lbl 18 `"18"', add
label define chbornf_lbl 19 `"19"', add
label define chbornf_lbl 20 `"20"', add
label define chbornf_lbl 21 `"21"', add
label define chbornf_lbl 22 `"22"', add
label define chbornf_lbl 23 `"23"', add
label define chbornf_lbl 24 `"24"', add
label define chbornf_lbl 25 `"25"', add
label define chbornf_lbl 26 `"26"', add
label define chbornf_lbl 27 `"27"', add
label define chbornf_lbl 28 `"28"', add
label define chbornf_lbl 29 `"29"', add
label define chbornf_lbl 30 `"30+"', add
label define chbornf_lbl 98 `"Unknown"', add
label define chbornf_lbl 99 `"NIU (not in universe)"', add
label values chbornf chbornf_lbl

label define chbornm_lbl 00 `"No children"'
label define chbornm_lbl 01 `"1 child"', add
label define chbornm_lbl 02 `"2 children"', add
label define chbornm_lbl 03 `"3"', add
label define chbornm_lbl 04 `"4"', add
label define chbornm_lbl 05 `"5"', add
label define chbornm_lbl 06 `"6"', add
label define chbornm_lbl 07 `"7"', add
label define chbornm_lbl 08 `"8"', add
label define chbornm_lbl 09 `"9"', add
label define chbornm_lbl 10 `"10"', add
label define chbornm_lbl 11 `"11"', add
label define chbornm_lbl 12 `"12"', add
label define chbornm_lbl 13 `"13"', add
label define chbornm_lbl 14 `"14"', add
label define chbornm_lbl 15 `"15"', add
label define chbornm_lbl 16 `"16"', add
label define chbornm_lbl 17 `"17"', add
label define chbornm_lbl 18 `"18"', add
label define chbornm_lbl 19 `"19"', add
label define chbornm_lbl 20 `"20"', add
label define chbornm_lbl 21 `"21"', add
label define chbornm_lbl 22 `"22"', add
label define chbornm_lbl 23 `"23"', add
label define chbornm_lbl 24 `"24"', add
label define chbornm_lbl 25 `"25"', add
label define chbornm_lbl 26 `"26"', add
label define chbornm_lbl 27 `"27"', add
label define chbornm_lbl 28 `"28"', add
label define chbornm_lbl 29 `"29"', add
label define chbornm_lbl 30 `"30+"', add
label define chbornm_lbl 98 `"Unknown"', add
label define chbornm_lbl 99 `"NIU (not in universe)"', add
label values chbornm chbornm_lbl

label define chsurvf_lbl 00 `"No children"'
label define chsurvf_lbl 01 `"1 child"', add
label define chsurvf_lbl 02 `"2 children"', add
label define chsurvf_lbl 03 `"3"', add
label define chsurvf_lbl 04 `"4"', add
label define chsurvf_lbl 05 `"5"', add
label define chsurvf_lbl 06 `"6"', add
label define chsurvf_lbl 07 `"7"', add
label define chsurvf_lbl 08 `"8"', add
label define chsurvf_lbl 09 `"9"', add
label define chsurvf_lbl 10 `"10"', add
label define chsurvf_lbl 11 `"11"', add
label define chsurvf_lbl 12 `"12"', add
label define chsurvf_lbl 13 `"13"', add
label define chsurvf_lbl 14 `"14"', add
label define chsurvf_lbl 15 `"15"', add
label define chsurvf_lbl 16 `"16"', add
label define chsurvf_lbl 17 `"17"', add
label define chsurvf_lbl 18 `"18"', add
label define chsurvf_lbl 19 `"19"', add
label define chsurvf_lbl 20 `"20+"', add
label define chsurvf_lbl 98 `"Unknown"', add
label define chsurvf_lbl 99 `"NIU (not in universe)"', add
label values chsurvf chsurvf_lbl

label define chsurvm_lbl 00 `"No children"'
label define chsurvm_lbl 01 `"1 child"', add
label define chsurvm_lbl 02 `"2 children"', add
label define chsurvm_lbl 03 `"3"', add
label define chsurvm_lbl 04 `"4"', add
label define chsurvm_lbl 05 `"5"', add
label define chsurvm_lbl 06 `"6"', add
label define chsurvm_lbl 07 `"7"', add
label define chsurvm_lbl 08 `"8"', add
label define chsurvm_lbl 09 `"9"', add
label define chsurvm_lbl 10 `"10"', add
label define chsurvm_lbl 11 `"11"', add
label define chsurvm_lbl 12 `"12"', add
label define chsurvm_lbl 13 `"13"', add
label define chsurvm_lbl 14 `"14"', add
label define chsurvm_lbl 15 `"15"', add
label define chsurvm_lbl 16 `"16"', add
label define chsurvm_lbl 17 `"17"', add
label define chsurvm_lbl 18 `"18"', add
label define chsurvm_lbl 19 `"19"', add
label define chsurvm_lbl 20 `"20+"', add
label define chsurvm_lbl 98 `"Unknown"', add
label define chsurvm_lbl 99 `"NIU (not in universe)"', add
label values chsurvm chsurvm_lbl

label define lastbmo_lbl 01 `"January"'
label define lastbmo_lbl 02 `"February"', add
label define lastbmo_lbl 03 `"March"', add
label define lastbmo_lbl 04 `"April"', add
label define lastbmo_lbl 05 `"May"', add
label define lastbmo_lbl 06 `"June"', add
label define lastbmo_lbl 07 `"July"', add
label define lastbmo_lbl 08 `"August"', add
label define lastbmo_lbl 09 `"September"', add
label define lastbmo_lbl 10 `"October"', add
label define lastbmo_lbl 11 `"November"', add
label define lastbmo_lbl 12 `"December"', add
label define lastbmo_lbl 98 `"Unknown"', add
label define lastbmo_lbl 99 `"NIU (not in universe)"', add
label values lastbmo lastbmo_lbl

label define lastbyr_lbl 1900 `"1900"'
label define lastbyr_lbl 1901 `"1901"', add
label define lastbyr_lbl 1902 `"1902"', add
label define lastbyr_lbl 1903 `"1903"', add
label define lastbyr_lbl 1904 `"1904"', add
label define lastbyr_lbl 1905 `"1905"', add
label define lastbyr_lbl 1906 `"1906"', add
label define lastbyr_lbl 1907 `"1907"', add
label define lastbyr_lbl 1908 `"1908"', add
label define lastbyr_lbl 1909 `"1909"', add
label define lastbyr_lbl 1910 `"1910"', add
label define lastbyr_lbl 1911 `"1911"', add
label define lastbyr_lbl 1912 `"1912"', add
label define lastbyr_lbl 1913 `"1913"', add
label define lastbyr_lbl 1914 `"1914"', add
label define lastbyr_lbl 1915 `"1915"', add
label define lastbyr_lbl 1916 `"1916"', add
label define lastbyr_lbl 1917 `"1917"', add
label define lastbyr_lbl 1918 `"1918"', add
label define lastbyr_lbl 1919 `"1919"', add
label define lastbyr_lbl 1920 `"1920"', add
label define lastbyr_lbl 1921 `"1921"', add
label define lastbyr_lbl 1922 `"1922"', add
label define lastbyr_lbl 1923 `"1923"', add
label define lastbyr_lbl 1924 `"1924"', add
label define lastbyr_lbl 1925 `"1925"', add
label define lastbyr_lbl 1926 `"1926"', add
label define lastbyr_lbl 1927 `"1927"', add
label define lastbyr_lbl 1928 `"1928"', add
label define lastbyr_lbl 1929 `"1929"', add
label define lastbyr_lbl 1930 `"1930"', add
label define lastbyr_lbl 1931 `"1931"', add
label define lastbyr_lbl 1932 `"1932"', add
label define lastbyr_lbl 1933 `"1933"', add
label define lastbyr_lbl 1934 `"1934"', add
label define lastbyr_lbl 1935 `"1935"', add
label define lastbyr_lbl 1936 `"1936"', add
label define lastbyr_lbl 1937 `"1937"', add
label define lastbyr_lbl 1938 `"1938"', add
label define lastbyr_lbl 1939 `"1939"', add
label define lastbyr_lbl 1940 `"1940"', add
label define lastbyr_lbl 1941 `"1941"', add
label define lastbyr_lbl 1942 `"1942"', add
label define lastbyr_lbl 1943 `"1943"', add
label define lastbyr_lbl 1944 `"1944"', add
label define lastbyr_lbl 1945 `"1945"', add
label define lastbyr_lbl 1946 `"1946"', add
label define lastbyr_lbl 1947 `"1947"', add
label define lastbyr_lbl 1948 `"1948"', add
label define lastbyr_lbl 1949 `"1949"', add
label define lastbyr_lbl 1950 `"1950"', add
label define lastbyr_lbl 1951 `"1951"', add
label define lastbyr_lbl 1952 `"1952"', add
label define lastbyr_lbl 1953 `"1953"', add
label define lastbyr_lbl 1954 `"1954"', add
label define lastbyr_lbl 1955 `"1955"', add
label define lastbyr_lbl 1956 `"1956"', add
label define lastbyr_lbl 1957 `"1957"', add
label define lastbyr_lbl 1958 `"1958"', add
label define lastbyr_lbl 1959 `"1959"', add
label define lastbyr_lbl 1960 `"1960"', add
label define lastbyr_lbl 1961 `"1961"', add
label define lastbyr_lbl 1962 `"1962"', add
label define lastbyr_lbl 1963 `"1963"', add
label define lastbyr_lbl 1964 `"1964"', add
label define lastbyr_lbl 1965 `"1965"', add
label define lastbyr_lbl 1966 `"1966"', add
label define lastbyr_lbl 1967 `"1967"', add
label define lastbyr_lbl 1968 `"1968"', add
label define lastbyr_lbl 1969 `"1969"', add
label define lastbyr_lbl 1970 `"1970"', add
label define lastbyr_lbl 1971 `"1971"', add
label define lastbyr_lbl 1972 `"1972"', add
label define lastbyr_lbl 1973 `"1973"', add
label define lastbyr_lbl 1974 `"1974"', add
label define lastbyr_lbl 1975 `"1975"', add
label define lastbyr_lbl 1976 `"1976"', add
label define lastbyr_lbl 1977 `"1977"', add
label define lastbyr_lbl 1978 `"1978"', add
label define lastbyr_lbl 1979 `"1979"', add
label define lastbyr_lbl 1980 `"1980"', add
label define lastbyr_lbl 1981 `"1981"', add
label define lastbyr_lbl 1982 `"1982"', add
label define lastbyr_lbl 1983 `"1983"', add
label define lastbyr_lbl 1984 `"1984"', add
label define lastbyr_lbl 1985 `"1985"', add
label define lastbyr_lbl 1986 `"1986"', add
label define lastbyr_lbl 1987 `"1987"', add
label define lastbyr_lbl 1988 `"1988"', add
label define lastbyr_lbl 1989 `"1989"', add
label define lastbyr_lbl 1990 `"1990"', add
label define lastbyr_lbl 1991 `"1991"', add
label define lastbyr_lbl 1992 `"1992"', add
label define lastbyr_lbl 1993 `"1993"', add
label define lastbyr_lbl 1994 `"1994"', add
label define lastbyr_lbl 1995 `"1995"', add
label define lastbyr_lbl 1996 `"1996"', add
label define lastbyr_lbl 1997 `"1997"', add
label define lastbyr_lbl 1998 `"1998"', add
label define lastbyr_lbl 1999 `"1999"', add
label define lastbyr_lbl 2000 `"2000"', add
label define lastbyr_lbl 2001 `"2001"', add
label define lastbyr_lbl 2002 `"2002"', add
label define lastbyr_lbl 2003 `"2003"', add
label define lastbyr_lbl 2004 `"2004"', add
label define lastbyr_lbl 2005 `"2005"', add
label define lastbyr_lbl 2006 `"2006"', add
label define lastbyr_lbl 2007 `"2007"', add
label define lastbyr_lbl 2008 `"2008"', add
label define lastbyr_lbl 2009 `"2009"', add
label define lastbyr_lbl 2010 `"2010"', add
label define lastbyr_lbl 2011 `"2011"', add
label define lastbyr_lbl 2012 `"2012"', add
label define lastbyr_lbl 2013 `"2013"', add
label define lastbyr_lbl 2014 `"2014"', add
label define lastbyr_lbl 2015 `"2015"', add
label define lastbyr_lbl 2016 `"2016"', add
label define lastbyr_lbl 2017 `"2017"', add
label define lastbyr_lbl 2018 `"2018"', add
label define lastbyr_lbl 2019 `"2019"', add
label define lastbyr_lbl 2020 `"2020"', add
label define lastbyr_lbl 9998 `"Unknown"', add
label define lastbyr_lbl 9999 `"NIU (not in universe)"', add
label values lastbyr lastbyr_lbl

label define lastbsex_lbl 0 `"NIU (not in universe)"'
label define lastbsex_lbl 1 `"Male"', add
label define lastbsex_lbl 2 `"Female"', add
label define lastbsex_lbl 3 `"Both sexes (multiple births)"', add
label define lastbsex_lbl 9 `"Unknown"', add
label values lastbsex lastbsex_lbl

label define chdead_lbl 00 `"None"'
label define chdead_lbl 01 `"1"', add
label define chdead_lbl 02 `"2"', add
label define chdead_lbl 03 `"3"', add
label define chdead_lbl 04 `"4"', add
label define chdead_lbl 05 `"5"', add
label define chdead_lbl 06 `"6"', add
label define chdead_lbl 07 `"7"', add
label define chdead_lbl 08 `"8"', add
label define chdead_lbl 09 `"9"', add
label define chdead_lbl 10 `"10"', add
label define chdead_lbl 11 `"11"', add
label define chdead_lbl 12 `"12"', add
label define chdead_lbl 13 `"13"', add
label define chdead_lbl 14 `"14"', add
label define chdead_lbl 15 `"15"', add
label define chdead_lbl 16 `"16"', add
label define chdead_lbl 17 `"17"', add
label define chdead_lbl 18 `"18"', add
label define chdead_lbl 19 `"19"', add
label define chdead_lbl 20 `"20+"', add
label define chdead_lbl 98 `"Unknown/missing"', add
label define chdead_lbl 99 `"NIU (not in universe)"', add
label values chdead chdead_lbl

label define chdeadfem_lbl 00 `"None"'
label define chdeadfem_lbl 01 `"1"', add
label define chdeadfem_lbl 02 `"2"', add
label define chdeadfem_lbl 03 `"3"', add
label define chdeadfem_lbl 04 `"4"', add
label define chdeadfem_lbl 05 `"5"', add
label define chdeadfem_lbl 06 `"6"', add
label define chdeadfem_lbl 07 `"7"', add
label define chdeadfem_lbl 08 `"8"', add
label define chdeadfem_lbl 09 `"9"', add
label define chdeadfem_lbl 10 `"10"', add
label define chdeadfem_lbl 11 `"11"', add
label define chdeadfem_lbl 12 `"12"', add
label define chdeadfem_lbl 13 `"13"', add
label define chdeadfem_lbl 14 `"14"', add
label define chdeadfem_lbl 15 `"15"', add
label define chdeadfem_lbl 16 `"16"', add
label define chdeadfem_lbl 17 `"17"', add
label define chdeadfem_lbl 18 `"18"', add
label define chdeadfem_lbl 19 `"19"', add
label define chdeadfem_lbl 20 `"20+"', add
label define chdeadfem_lbl 98 `"Unknown"', add
label define chdeadfem_lbl 99 `"NIU (not in universe)"', add
label values chdeadfem chdeadfem_lbl

label define chdeadmale_lbl 00 `"None"'
label define chdeadmale_lbl 01 `"1"', add
label define chdeadmale_lbl 02 `"2"', add
label define chdeadmale_lbl 03 `"3"', add
label define chdeadmale_lbl 04 `"4"', add
label define chdeadmale_lbl 05 `"5"', add
label define chdeadmale_lbl 06 `"6"', add
label define chdeadmale_lbl 07 `"7"', add
label define chdeadmale_lbl 08 `"8"', add
label define chdeadmale_lbl 09 `"9"', add
label define chdeadmale_lbl 10 `"10"', add
label define chdeadmale_lbl 11 `"11"', add
label define chdeadmale_lbl 12 `"12"', add
label define chdeadmale_lbl 13 `"13"', add
label define chdeadmale_lbl 14 `"14"', add
label define chdeadmale_lbl 15 `"15"', add
label define chdeadmale_lbl 16 `"16"', add
label define chdeadmale_lbl 17 `"17"', add
label define chdeadmale_lbl 18 `"18"', add
label define chdeadmale_lbl 19 `"19"', add
label define chdeadmale_lbl 20 `"20+"', add
label define chdeadmale_lbl 98 `"Unknown"', add
label define chdeadmale_lbl 99 `"NIU (not in universe)"', add
label values chdeadmale chdeadmale_lbl

label define lastbmort_lbl 0 `"NIU (not in universe)"'
label define lastbmort_lbl 1 `"Alive"', add
label define lastbmort_lbl 2 `"Dead"', add
label define lastbmort_lbl 9 `"Unknown"', add
label values lastbmort lastbmort_lbl

label define mortmot_lbl 1 `"Alive"'
label define mortmot_lbl 2 `"Dead"', add
label define mortmot_lbl 7 `"Does not know"', add
label define mortmot_lbl 8 `"Missing"', add
label define mortmot_lbl 9 `"NIU (not in universe)"', add
label values mortmot mortmot_lbl

label define mortfat_lbl 1 `"Alive"'
label define mortfat_lbl 2 `"Dead"', add
label define mortfat_lbl 7 `"Does not know"', add
label define mortfat_lbl 8 `"Missing"', add
label define mortfat_lbl 9 `"NIU (not in universe)"', add
label values mortfat mortfat_lbl

label define homechild_lbl 00 `"0"'
label define homechild_lbl 01 `"1"', add
label define homechild_lbl 02 `"2"', add
label define homechild_lbl 03 `"3"', add
label define homechild_lbl 04 `"4"', add
label define homechild_lbl 05 `"5"', add
label define homechild_lbl 06 `"6"', add
label define homechild_lbl 07 `"7"', add
label define homechild_lbl 08 `"8"', add
label define homechild_lbl 09 `"9"', add
label define homechild_lbl 10 `"10"', add
label define homechild_lbl 11 `"11"', add
label define homechild_lbl 12 `"12"', add
label define homechild_lbl 13 `"13"', add
label define homechild_lbl 14 `"14"', add
label define homechild_lbl 15 `"15"', add
label define homechild_lbl 16 `"16"', add
label define homechild_lbl 17 `"17"', add
label define homechild_lbl 18 `"18"', add
label define homechild_lbl 19 `"19"', add
label define homechild_lbl 20 `"20+"', add
label define homechild_lbl 98 `"Unknown"', add
label define homechild_lbl 99 `"NIU (not in universe)"', add
label values homechild homechild_lbl

label define homefem_lbl 00 `"None"'
label define homefem_lbl 01 `"1"', add
label define homefem_lbl 02 `"2"', add
label define homefem_lbl 03 `"3"', add
label define homefem_lbl 04 `"4"', add
label define homefem_lbl 05 `"5"', add
label define homefem_lbl 06 `"6"', add
label define homefem_lbl 07 `"7"', add
label define homefem_lbl 08 `"8"', add
label define homefem_lbl 09 `"9"', add
label define homefem_lbl 10 `"10"', add
label define homefem_lbl 11 `"11"', add
label define homefem_lbl 12 `"12"', add
label define homefem_lbl 13 `"13"', add
label define homefem_lbl 14 `"14"', add
label define homefem_lbl 17 `"17"', add
label define homefem_lbl 20 `"20+"', add
label define homefem_lbl 98 `"Unknown"', add
label define homefem_lbl 99 `"NIU (not in universe)"', add
label values homefem homefem_lbl

label define homemale_lbl 00 `"None"'
label define homemale_lbl 01 `"1"', add
label define homemale_lbl 02 `"2"', add
label define homemale_lbl 03 `"3"', add
label define homemale_lbl 04 `"4"', add
label define homemale_lbl 05 `"5"', add
label define homemale_lbl 06 `"6"', add
label define homemale_lbl 07 `"7"', add
label define homemale_lbl 08 `"8"', add
label define homemale_lbl 09 `"9"', add
label define homemale_lbl 10 `"10"', add
label define homemale_lbl 11 `"11"', add
label define homemale_lbl 12 `"12"', add
label define homemale_lbl 13 `"13"', add
label define homemale_lbl 14 `"14"', add
label define homemale_lbl 15 `"15"', add
label define homemale_lbl 16 `"16"', add
label define homemale_lbl 17 `"17"', add
label define homemale_lbl 18 `"18"', add
label define homemale_lbl 19 `"19"', add
label define homemale_lbl 20 `"20+"', add
label define homemale_lbl 98 `"Unknown"', add
label define homemale_lbl 99 `"NIU (not in universe)"', add
label values homemale homemale_lbl

label define awaychild_lbl 00 `"0"'
label define awaychild_lbl 01 `"1"', add
label define awaychild_lbl 02 `"2"', add
label define awaychild_lbl 03 `"3"', add
label define awaychild_lbl 04 `"4"', add
label define awaychild_lbl 05 `"5"', add
label define awaychild_lbl 06 `"6"', add
label define awaychild_lbl 07 `"7"', add
label define awaychild_lbl 08 `"8"', add
label define awaychild_lbl 09 `"9"', add
label define awaychild_lbl 10 `"10"', add
label define awaychild_lbl 11 `"11"', add
label define awaychild_lbl 12 `"12"', add
label define awaychild_lbl 13 `"13"', add
label define awaychild_lbl 14 `"14"', add
label define awaychild_lbl 15 `"15"', add
label define awaychild_lbl 16 `"16"', add
label define awaychild_lbl 17 `"17"', add
label define awaychild_lbl 18 `"18"', add
label define awaychild_lbl 19 `"19"', add
label define awaychild_lbl 20 `"20"', add
label define awaychild_lbl 98 `"Unknown"', add
label define awaychild_lbl 99 `"NIU (not in universe)"', add
label values awaychild awaychild_lbl

label define awayfem_lbl 00 `"None"'
label define awayfem_lbl 01 `"1"', add
label define awayfem_lbl 02 `"2"', add
label define awayfem_lbl 03 `"3"', add
label define awayfem_lbl 04 `"4"', add
label define awayfem_lbl 05 `"5"', add
label define awayfem_lbl 06 `"6"', add
label define awayfem_lbl 07 `"7"', add
label define awayfem_lbl 08 `"8"', add
label define awayfem_lbl 09 `"9"', add
label define awayfem_lbl 10 `"10"', add
label define awayfem_lbl 11 `"11"', add
label define awayfem_lbl 12 `"12"', add
label define awayfem_lbl 13 `"13"', add
label define awayfem_lbl 14 `"14"', add
label define awayfem_lbl 15 `"15"', add
label define awayfem_lbl 16 `"16"', add
label define awayfem_lbl 17 `"17"', add
label define awayfem_lbl 18 `"18"', add
label define awayfem_lbl 19 `"19"', add
label define awayfem_lbl 20 `"20+"', add
label define awayfem_lbl 98 `"Unknown"', add
label define awayfem_lbl 99 `"NIU (not in universe)"', add
label values awayfem awayfem_lbl

label define awaymale_lbl 00 `"None"'
label define awaymale_lbl 01 `"1"', add
label define awaymale_lbl 02 `"2"', add
label define awaymale_lbl 03 `"3"', add
label define awaymale_lbl 04 `"4"', add
label define awaymale_lbl 05 `"5"', add
label define awaymale_lbl 06 `"6"', add
label define awaymale_lbl 07 `"7"', add
label define awaymale_lbl 08 `"8"', add
label define awaymale_lbl 09 `"9"', add
label define awaymale_lbl 10 `"10"', add
label define awaymale_lbl 11 `"11"', add
label define awaymale_lbl 12 `"12"', add
label define awaymale_lbl 13 `"13"', add
label define awaymale_lbl 14 `"14"', add
label define awaymale_lbl 15 `"15"', add
label define awaymale_lbl 16 `"16"', add
label define awaymale_lbl 17 `"17"', add
label define awaymale_lbl 18 `"18"', add
label define awaymale_lbl 19 `"19"', add
label define awaymale_lbl 20 `"20"', add
label define awaymale_lbl 98 `"Unknown"', add
label define awaymale_lbl 99 `"NIU (not in universe)"', add
label values awaymale awaymale_lbl

label define nativity_lbl 0 `"NIU (not in universe)"'
label define nativity_lbl 1 `"Native-born"', add
label define nativity_lbl 2 `"Foreign-born"', add
label define nativity_lbl 9 `"Unknown/missing"', add
label values nativity nativity_lbl

label define bplcountry_lbl 00000 `"NIU (not in universe)"'
label define bplcountry_lbl 10000 `"Africa"', add
label define bplcountry_lbl 11000 `"Eastern Africa"', add
label define bplcountry_lbl 11005 `"British Indian Ocean Territory"', add
label define bplcountry_lbl 11010 `"Burundi"', add
label define bplcountry_lbl 11020 `"Comoros"', add
label define bplcountry_lbl 11030 `"Djibouti"', add
label define bplcountry_lbl 11040 `"Eritrea"', add
label define bplcountry_lbl 11050 `"Ethiopia"', add
label define bplcountry_lbl 11051 `"Ethiopia (including Eritrea)"', add
label define bplcountry_lbl 11060 `"Kenya"', add
label define bplcountry_lbl 11070 `"Madagascar"', add
label define bplcountry_lbl 11080 `"Malawi"', add
label define bplcountry_lbl 11090 `"Mauritius"', add
label define bplcountry_lbl 11100 `"Mozambique"', add
label define bplcountry_lbl 11110 `"Reunion"', add
label define bplcountry_lbl 11120 `"Rwanda"', add
label define bplcountry_lbl 11130 `"Seychelles"', add
label define bplcountry_lbl 11140 `"Somalia"', add
label define bplcountry_lbl 11150 `"South Sudan"', add
label define bplcountry_lbl 11160 `"Uganda"', add
label define bplcountry_lbl 11170 `"Tanzania"', add
label define bplcountry_lbl 11180 `"Zambia"', add
label define bplcountry_lbl 11190 `"Zimbabwe"', add
label define bplcountry_lbl 11999 `"Eastern Africa, other or n.s."', add
label define bplcountry_lbl 12000 `"Middle Africa"', add
label define bplcountry_lbl 12010 `"Angola"', add
label define bplcountry_lbl 12020 `"Cameroon"', add
label define bplcountry_lbl 12030 `"Central African Republic"', add
label define bplcountry_lbl 12040 `"Chad"', add
label define bplcountry_lbl 12050 `"Congo (Republic of)"', add
label define bplcountry_lbl 12060 `"Democratic Republic of Congo"', add
label define bplcountry_lbl 12070 `"Equatorial Guinea"', add
label define bplcountry_lbl 12080 `"Gabon"', add
label define bplcountry_lbl 12090 `"Sao Tome and Principe"', add
label define bplcountry_lbl 12999 `"Middle Africa, other or n.s."', add
label define bplcountry_lbl 13000 `"Northern Africa"', add
label define bplcountry_lbl 13010 `"Algeria"', add
label define bplcountry_lbl 13011 `"Algeria/Tunisia"', add
label define bplcountry_lbl 13020 `"Egypt"', add
label define bplcountry_lbl 13021 `"Egypt/Sudan"', add
label define bplcountry_lbl 13030 `"Libya"', add
label define bplcountry_lbl 13040 `"Morocco"', add
label define bplcountry_lbl 13050 `"Sudan"', add
label define bplcountry_lbl 13060 `"Tunisia"', add
label define bplcountry_lbl 13070 `"Western Sahara"', add
label define bplcountry_lbl 13999 `"Northern Africa, other or n.s."', add
label define bplcountry_lbl 14000 `"Southern Africa"', add
label define bplcountry_lbl 14010 `"Botswana"', add
label define bplcountry_lbl 14020 `"Lesotho"', add
label define bplcountry_lbl 14030 `"Namibia"', add
label define bplcountry_lbl 14040 `"South Africa"', add
label define bplcountry_lbl 14050 `"Swaziland"', add
label define bplcountry_lbl 14999 `"Southern Africa, other or n.s."', add
label define bplcountry_lbl 15000 `"Western Africa"', add
label define bplcountry_lbl 15010 `"Benin"', add
label define bplcountry_lbl 15020 `"Burkina Faso"', add
label define bplcountry_lbl 15021 `"Upper Volta"', add
label define bplcountry_lbl 15030 `"Cape Verde"', add
label define bplcountry_lbl 15040 `"Ivory Coast"', add
label define bplcountry_lbl 15050 `"Gambia"', add
label define bplcountry_lbl 15060 `"Ghana"', add
label define bplcountry_lbl 15070 `"Guinea"', add
label define bplcountry_lbl 15080 `"Guinea-Bissau"', add
label define bplcountry_lbl 15081 `"Guinea-Bissau and Cape Verde"', add
label define bplcountry_lbl 15090 `"Liberia"', add
label define bplcountry_lbl 15100 `"Mali"', add
label define bplcountry_lbl 15110 `"Mauritania"', add
label define bplcountry_lbl 15120 `"Niger"', add
label define bplcountry_lbl 15130 `"Nigeria"', add
label define bplcountry_lbl 15140 `"St. Helena and Ascension"', add
label define bplcountry_lbl 15150 `"Senegal"', add
label define bplcountry_lbl 15160 `"Sierra Leone"', add
label define bplcountry_lbl 15170 `"Togo"', add
label define bplcountry_lbl 15180 `"Canary Islands"', add
label define bplcountry_lbl 15999 `"West Africa, other or n.s."', add
label define bplcountry_lbl 19999 `"Africa, other or n.s."', add
label define bplcountry_lbl 20000 `"Americas"', add
label define bplcountry_lbl 21000 `"Caribbean"', add
label define bplcountry_lbl 21010 `"Anguilla"', add
label define bplcountry_lbl 21020 `"Antigua-Barbuda"', add
label define bplcountry_lbl 21030 `"Aruba"', add
label define bplcountry_lbl 21040 `"Bahamas"', add
label define bplcountry_lbl 21050 `"Barbados"', add
label define bplcountry_lbl 21060 `"British Virgin Islands"', add
label define bplcountry_lbl 21070 `"Cayman Isles"', add
label define bplcountry_lbl 21080 `"Cuba"', add
label define bplcountry_lbl 21090 `"Dominica"', add
label define bplcountry_lbl 21100 `"Dominican Republic"', add
label define bplcountry_lbl 21110 `"Grenada"', add
label define bplcountry_lbl 21120 `"Guadeloupe"', add
label define bplcountry_lbl 21130 `"Haiti"', add
label define bplcountry_lbl 21140 `"Jamaica"', add
label define bplcountry_lbl 21150 `"Martinique"', add
label define bplcountry_lbl 21160 `"Montserrat"', add
label define bplcountry_lbl 21170 `"Netherlands Antilles"', add
label define bplcountry_lbl 21180 `"Puerto Rico"', add
label define bplcountry_lbl 21190 `"St. Kitts-Nevis"', add
label define bplcountry_lbl 21200 `"St. Croix"', add
label define bplcountry_lbl 21210 `"St. John"', add
label define bplcountry_lbl 21220 `"St. Lucia"', add
label define bplcountry_lbl 21230 `"St Thomas"', add
label define bplcountry_lbl 21240 `"St. Vincent"', add
label define bplcountry_lbl 21250 `"Trinidad and Tobago"', add
label define bplcountry_lbl 21260 `"Turks and Caicos"', add
label define bplcountry_lbl 21270 `"U.S. Virgin Islands"', add
label define bplcountry_lbl 21991 `"Caribbean commonwealth, n.s."', add
label define bplcountry_lbl 21999 `"Caribbean, other or n.s."', add
label define bplcountry_lbl 22000 `"Central America"', add
label define bplcountry_lbl 22010 `"Belize/British Honduras"', add
label define bplcountry_lbl 22020 `"Costa Rica"', add
label define bplcountry_lbl 22030 `"El Salvador"', add
label define bplcountry_lbl 22040 `"Guatemala"', add
label define bplcountry_lbl 22050 `"Honduras"', add
label define bplcountry_lbl 22060 `"Mexico"', add
label define bplcountry_lbl 22070 `"Nicaragua"', add
label define bplcountry_lbl 22080 `"Panama"', add
label define bplcountry_lbl 22081 `"Panama Canal Zone"', add
label define bplcountry_lbl 22999 `"Central America, other or n.s."', add
label define bplcountry_lbl 23000 `"South America"', add
label define bplcountry_lbl 23010 `"Argentina"', add
label define bplcountry_lbl 23020 `"Bolivia"', add
label define bplcountry_lbl 23030 `"Brazil"', add
label define bplcountry_lbl 23040 `"Chile"', add
label define bplcountry_lbl 23050 `"Colombia"', add
label define bplcountry_lbl 23060 `"Ecuador"', add
label define bplcountry_lbl 23070 `"Falkland Islands"', add
label define bplcountry_lbl 23080 `"French Guiana"', add
label define bplcountry_lbl 23090 `"Guyana/British Guiana"', add
label define bplcountry_lbl 23100 `"Paraguay"', add
label define bplcountry_lbl 23110 `"Peru"', add
label define bplcountry_lbl 23120 `"Suriname"', add
label define bplcountry_lbl 23130 `"Uruguay"', add
label define bplcountry_lbl 23140 `"Venezuela"', add
label define bplcountry_lbl 23999 `"South America, other or n.s."', add
label define bplcountry_lbl 24000 `"North America"', add
label define bplcountry_lbl 24010 `"Bermuda"', add
label define bplcountry_lbl 24020 `"Canada"', add
label define bplcountry_lbl 24030 `"Greenland"', add
label define bplcountry_lbl 24040 `"United States"', add
label define bplcountry_lbl 24999 `"North America, other or n.s."', add
label define bplcountry_lbl 29999 `"Americas, other or n.s."', add
label define bplcountry_lbl 30000 `"Asia"', add
label define bplcountry_lbl 31000 `"Eastern Asia"', add
label define bplcountry_lbl 31010 `"China"', add
label define bplcountry_lbl 31011 `"Hong Kong"', add
label define bplcountry_lbl 31012 `"Macau"', add
label define bplcountry_lbl 31013 `"Taiwan"', add
label define bplcountry_lbl 31020 `"Japan"', add
label define bplcountry_lbl 31030 `"Korea"', add
label define bplcountry_lbl 31031 `"Korea, DPR (North)"', add
label define bplcountry_lbl 31032 `"Korea, RO (South)"', add
label define bplcountry_lbl 31040 `"Mongolia"', add
label define bplcountry_lbl 31999 `"Eastern Asia, other or n.s."', add
label define bplcountry_lbl 32000 `"South-Central Asia"', add
label define bplcountry_lbl 32010 `"Afghanistan"', add
label define bplcountry_lbl 32020 `"Bangladesh"', add
label define bplcountry_lbl 32030 `"Bhutan"', add
label define bplcountry_lbl 32040 `"India"', add
label define bplcountry_lbl 32041 `"India/Pakistan"', add
label define bplcountry_lbl 32042 `"India/Pakistan/Bangladesh/Sri Lanka"', add
label define bplcountry_lbl 32050 `"Iran"', add
label define bplcountry_lbl 32060 `"Kazakhstan"', add
label define bplcountry_lbl 32070 `"Kyrgyzstan"', add
label define bplcountry_lbl 32080 `"Maldives"', add
label define bplcountry_lbl 32090 `"Nepal"', add
label define bplcountry_lbl 32100 `"Pakistan"', add
label define bplcountry_lbl 32101 `"Pakistan/Bangladesh"', add
label define bplcountry_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define bplcountry_lbl 32120 `"Tajikistan"', add
label define bplcountry_lbl 32130 `"Turkmenistan"', add
label define bplcountry_lbl 32140 `"Uzbekistan"', add
label define bplcountry_lbl 32999 `"South-Central Asia, other or n.s."', add
label define bplcountry_lbl 33000 `"South-Eastern Asia"', add
label define bplcountry_lbl 33010 `"Brunei"', add
label define bplcountry_lbl 33020 `"Cambodia (Kampuchea)"', add
label define bplcountry_lbl 33030 `"East Timor"', add
label define bplcountry_lbl 33040 `"Indonesia"', add
label define bplcountry_lbl 33050 `"Laos"', add
label define bplcountry_lbl 33060 `"Malaysia"', add
label define bplcountry_lbl 33070 `"Myanmar (Burma)"', add
label define bplcountry_lbl 33080 `"Philippines"', add
label define bplcountry_lbl 33090 `"Singapore"', add
label define bplcountry_lbl 33100 `"Thailand"', add
label define bplcountry_lbl 33110 `"Vietnam"', add
label define bplcountry_lbl 33999 `"South-Eastern Asia, other or n.s."', add
label define bplcountry_lbl 34000 `"Western Asia"', add
label define bplcountry_lbl 34010 `"Armenia"', add
label define bplcountry_lbl 34020 `"Azerbaijan"', add
label define bplcountry_lbl 34030 `"Bahrain"', add
label define bplcountry_lbl 34040 `"Cyprus"', add
label define bplcountry_lbl 34050 `"Georgia"', add
label define bplcountry_lbl 34051 `"Abkhazia"', add
label define bplcountry_lbl 34052 `"South Ossetia"', add
label define bplcountry_lbl 34060 `"Iraq"', add
label define bplcountry_lbl 34070 `"Israel"', add
label define bplcountry_lbl 34071 `"Israel/Palestine"', add
label define bplcountry_lbl 34080 `"Jordan"', add
label define bplcountry_lbl 34090 `"Kuwait"', add
label define bplcountry_lbl 34100 `"Lebanon"', add
label define bplcountry_lbl 34110 `"Palestine"', add
label define bplcountry_lbl 34111 `"West Bank"', add
label define bplcountry_lbl 34112 `"Gaza Strip"', add
label define bplcountry_lbl 34120 `"Oman"', add
label define bplcountry_lbl 34130 `"Qatar"', add
label define bplcountry_lbl 34140 `"Saudi Arabia"', add
label define bplcountry_lbl 34150 `"Syria"', add
label define bplcountry_lbl 34151 `"Syria/Lebanon"', add
label define bplcountry_lbl 34160 `"Turkey"', add
label define bplcountry_lbl 34170 `"United Arab Emirates"', add
label define bplcountry_lbl 34180 `"Yemen"', add
label define bplcountry_lbl 34991 `"Middle East"', add
label define bplcountry_lbl 34999 `"Western Asia, other or n.s."', add
label define bplcountry_lbl 39999 `"Asia, other or n.s."', add
label define bplcountry_lbl 40000 `"Europe"', add
label define bplcountry_lbl 41000 `"Eastern Europe"', add
label define bplcountry_lbl 41010 `"Belarus"', add
label define bplcountry_lbl 41020 `"Bulgaria"', add
label define bplcountry_lbl 41021 `"Bulgaria/Greece"', add
label define bplcountry_lbl 41030 `"Czech Republic/Czechoslovakia"', add
label define bplcountry_lbl 41040 `"Hungary"', add
label define bplcountry_lbl 41050 `"Poland"', add
label define bplcountry_lbl 41060 `"Moldova"', add
label define bplcountry_lbl 41070 `"Romania"', add
label define bplcountry_lbl 41080 `"Russia/USSR"', add
label define bplcountry_lbl 41090 `"Slovakia"', add
label define bplcountry_lbl 41100 `"Ukraine"', add
label define bplcountry_lbl 41991 `"Albania, Bulgaria, Czech, Hungary, Romania, Yugoslavia"', add
label define bplcountry_lbl 41992 `"Central-Eastern Europe"', add
label define bplcountry_lbl 41999 `"Eastern Europe, other or n.s."', add
label define bplcountry_lbl 42000 `"Northern Europe"', add
label define bplcountry_lbl 42010 `"Denmark"', add
label define bplcountry_lbl 42020 `"Estonia"', add
label define bplcountry_lbl 42030 `"Faroe Islands"', add
label define bplcountry_lbl 42040 `"Finland"', add
label define bplcountry_lbl 42050 `"Iceland"', add
label define bplcountry_lbl 42060 `"Ireland"', add
label define bplcountry_lbl 42070 `"Latvia"', add
label define bplcountry_lbl 42080 `"Lithuania"', add
label define bplcountry_lbl 42090 `"Norway"', add
label define bplcountry_lbl 42100 `"Svalbard and Jan Mayen Islands"', add
label define bplcountry_lbl 42110 `"Sweden"', add
label define bplcountry_lbl 42120 `"United Kingdom"', add
label define bplcountry_lbl 42999 `"Northern Europe, other or n.s."', add
label define bplcountry_lbl 43000 `"Southern Europe"', add
label define bplcountry_lbl 43010 `"Albania"', add
label define bplcountry_lbl 43020 `"Andorra"', add
label define bplcountry_lbl 43030 `"Bosnia and Herzegovina"', add
label define bplcountry_lbl 43040 `"Croatia"', add
label define bplcountry_lbl 43050 `"Gibraltar"', add
label define bplcountry_lbl 43060 `"Greece"', add
label define bplcountry_lbl 43070 `"Italy"', add
label define bplcountry_lbl 43071 `"Vatican City"', add
label define bplcountry_lbl 43080 `"Malta"', add
label define bplcountry_lbl 43090 `"Portugal"', add
label define bplcountry_lbl 43100 `"San Marino"', add
label define bplcountry_lbl 43110 `"Slovenia"', add
label define bplcountry_lbl 43120 `"Spain"', add
label define bplcountry_lbl 43121 `"Spain/Portugal"', add
label define bplcountry_lbl 43130 `"Macedonia"', add
label define bplcountry_lbl 43140 `"Yugoslavia"', add
label define bplcountry_lbl 43141 `"Montenegro"', add
label define bplcountry_lbl 43142 `"Serbia"', add
label define bplcountry_lbl 43143 `"Kosovo"', add
label define bplcountry_lbl 43144 `"Serbia and Montenegro"', add
label define bplcountry_lbl 43991 `"Gibraltar/Malta"', add
label define bplcountry_lbl 43992 `"Portugal/Greece"', add
label define bplcountry_lbl 43993 `"Italy, Holy See, San Marino"', add
label define bplcountry_lbl 43999 `"Southern Europe, other or n.s."', add
label define bplcountry_lbl 44000 `"Western Europe"', add
label define bplcountry_lbl 44010 `"Austria"', add
label define bplcountry_lbl 44020 `"Belgium"', add
label define bplcountry_lbl 44021 `"Belgium/Luxemburg"', add
label define bplcountry_lbl 44022 `"Belgium/Netherlands/Luxemburg"', add
label define bplcountry_lbl 44030 `"France"', add
label define bplcountry_lbl 44040 `"Germany"', add
label define bplcountry_lbl 44042 `"West Germany"', add
label define bplcountry_lbl 44043 `"Germany/Austria"', add
label define bplcountry_lbl 44044 `"Mecklenburg-Schwerin"', add
label define bplcountry_lbl 44050 `"Liechtenstein"', add
label define bplcountry_lbl 44060 `"Luxembourg"', add
label define bplcountry_lbl 44070 `"Monaco"', add
label define bplcountry_lbl 44080 `"Netherlands"', add
label define bplcountry_lbl 44090 `"Switzerland"', add
label define bplcountry_lbl 44991 `"Belgium, Denmark, Luxembourg, Netherlands"', add
label define bplcountry_lbl 44999 `"Western Europe, other or n.s."', add
label define bplcountry_lbl 49992 `"European Union"', add
label define bplcountry_lbl 49993 `"European Union (original 15)"', add
label define bplcountry_lbl 49994 `"Other European Union (not original 15)"', add
label define bplcountry_lbl 49999 `"Europe, other or n.s."', add
label define bplcountry_lbl 50000 `"Oceania"', add
label define bplcountry_lbl 51000 `"Australia and New Zealand"', add
label define bplcountry_lbl 51010 `"Australia"', add
label define bplcountry_lbl 51020 `"New Zealand"', add
label define bplcountry_lbl 51030 `"Norfolk Islands"', add
label define bplcountry_lbl 51999 `"Australia and New Zealand, n.s."', add
label define bplcountry_lbl 52000 `"Melanesia"', add
label define bplcountry_lbl 52010 `"Fiji"', add
label define bplcountry_lbl 52020 `"New Caledonia"', add
label define bplcountry_lbl 52030 `"Papua New Guinea"', add
label define bplcountry_lbl 52040 `"Solomon Islands"', add
label define bplcountry_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define bplcountry_lbl 52999 `"Melanesia, n.s."', add
label define bplcountry_lbl 53000 `"Micronesia"', add
label define bplcountry_lbl 53010 `"Kiribati"', add
label define bplcountry_lbl 53020 `"Marshall Islands"', add
label define bplcountry_lbl 53030 `"Nauru"', add
label define bplcountry_lbl 53040 `"Northern Mariana Isls."', add
label define bplcountry_lbl 53050 `"Palau"', add
label define bplcountry_lbl 53060 `"Federated States of Micronesia"', add
label define bplcountry_lbl 53999 `"Micronesia, other or n.s."', add
label define bplcountry_lbl 54000 `"Polynesia"', add
label define bplcountry_lbl 54010 `"Cook Islands"', add
label define bplcountry_lbl 54020 `"French Polynesia"', add
label define bplcountry_lbl 54030 `"Niue"', add
label define bplcountry_lbl 54040 `"Pitcairn Island"', add
label define bplcountry_lbl 54050 `"Western Samoa"', add
label define bplcountry_lbl 54060 `"Eastern Samoa"', add
label define bplcountry_lbl 54070 `"Tokelau"', add
label define bplcountry_lbl 54080 `"Tonga"', add
label define bplcountry_lbl 54090 `"Tuvalu"', add
label define bplcountry_lbl 54100 `"Wallis and Futuna Isls."', add
label define bplcountry_lbl 54999 `"Polynesia, other or n.s."', add
label define bplcountry_lbl 55000 `"U.S. Pacific Possessions"', add
label define bplcountry_lbl 55010 `"American Samoa"', add
label define bplcountry_lbl 55020 `"Baker Island"', add
label define bplcountry_lbl 55030 `"Guam"', add
label define bplcountry_lbl 55040 `"Howland Island"', add
label define bplcountry_lbl 55050 `"Johnston Atoll"', add
label define bplcountry_lbl 55060 `"Kingman Reef"', add
label define bplcountry_lbl 55070 `"Midway Islands"', add
label define bplcountry_lbl 55080 `"Wake Island"', add
label define bplcountry_lbl 55999 `"US Pacific, other or n.s."', add
label define bplcountry_lbl 59999 `"Oceania, other or n.s."', add
label define bplcountry_lbl 80000 `"AT SEA"', add
label define bplcountry_lbl 90000 `"Other countries n.s."', add
label define bplcountry_lbl 99999 `"Unknown"', add
label values bplcountry bplcountry_lbl

label define citizen_lbl 1 `"Citizen, not specified"'
label define citizen_lbl 2 `"Citizen by birth"', add
label define citizen_lbl 3 `"Naturalized citizen"', add
label define citizen_lbl 4 `"Not a citizen"', add
label define citizen_lbl 5 `"Without citizenship, stateless"', add
label define citizen_lbl 8 `"Unknown"', add
label define citizen_lbl 9 `"NIU (not in universe)"', add
label values citizen citizen_lbl

label define school_lbl 0 `"NIU (not in universe)"'
label define school_lbl 1 `"Yes"', add
label define school_lbl 2 `"No, not specified"', add
label define school_lbl 3 `"No, attended in the past"', add
label define school_lbl 4 `"No, never attended"', add
label define school_lbl 9 `"Unknown/missing"', add
label values school school_lbl

label define lit_lbl 0 `"NIU (not in universe)"'
label define lit_lbl 1 `"No, illiterate"', add
label define lit_lbl 2 `"Yes, literate"', add
label define lit_lbl 9 `"Unknown/missing"', add
label values lit lit_lbl

label define edattain_lbl 0 `"NIU (not in universe)"'
label define edattain_lbl 1 `"Less than primary completed"', add
label define edattain_lbl 2 `"Primary completed"', add
label define edattain_lbl 3 `"Secondary completed"', add
label define edattain_lbl 4 `"University completed"', add
label define edattain_lbl 9 `"Unknown"', add
label values edattain edattain_lbl

label define edattaind_lbl 000 `"NIU (not in universe)"'
label define edattaind_lbl 100 `"Less than primary completed (n.s.)"', add
label define edattaind_lbl 110 `"No schooling"', add
label define edattaind_lbl 120 `"Some primary completed"', add
label define edattaind_lbl 130 `"Primary (4 yrs) completed"', add
label define edattaind_lbl 211 `"Primary (5 yrs) completed"', add
label define edattaind_lbl 212 `"Primary (6 yrs) completed"', add
label define edattaind_lbl 221 `"Lower secondary general completed"', add
label define edattaind_lbl 222 `"Lower secondary technical completed"', add
label define edattaind_lbl 311 `"Secondary, general track completed"', add
label define edattaind_lbl 312 `"Some college completed"', add
label define edattaind_lbl 320 `"Secondary or post-secondary technical completed"', add
label define edattaind_lbl 321 `"Secondary, technical track completed"', add
label define edattaind_lbl 322 `"Post-secondary technical education"', add
label define edattaind_lbl 400 `"University completed"', add
label define edattaind_lbl 999 `"Unknown/missing"', add
label values edattaind edattaind_lbl

label define yrschool_lbl 00 `"None or pre-school"'
label define yrschool_lbl 01 `"1 year"', add
label define yrschool_lbl 02 `"2 years"', add
label define yrschool_lbl 03 `"3 years"', add
label define yrschool_lbl 04 `"4 years"', add
label define yrschool_lbl 05 `"5 years"', add
label define yrschool_lbl 06 `"6 years"', add
label define yrschool_lbl 07 `"7 years"', add
label define yrschool_lbl 08 `"8 years"', add
label define yrschool_lbl 09 `"9 years"', add
label define yrschool_lbl 10 `"10 years"', add
label define yrschool_lbl 11 `"11 years"', add
label define yrschool_lbl 12 `"12 years"', add
label define yrschool_lbl 13 `"13 years"', add
label define yrschool_lbl 14 `"14 years"', add
label define yrschool_lbl 15 `"15 years"', add
label define yrschool_lbl 16 `"16 years"', add
label define yrschool_lbl 17 `"17 years"', add
label define yrschool_lbl 18 `"18 years or more"', add
label define yrschool_lbl 90 `"Not specified"', add
label define yrschool_lbl 91 `"Some primary"', add
label define yrschool_lbl 92 `"Some technical after primary"', add
label define yrschool_lbl 93 `"Some secondary"', add
label define yrschool_lbl 94 `"Some tertiary"', add
label define yrschool_lbl 95 `"Adult literacy"', add
label define yrschool_lbl 96 `"Special education"', add
label define yrschool_lbl 98 `"Unknown/missing"', add
label define yrschool_lbl 99 `"NIU (not in universe)"', add
label values yrschool yrschool_lbl

label define educls_lbl 00 `"NIU (not in universe)"'
label define educls_lbl 10 `"None, preschool, or non-formal education"', add
label define educls_lbl 11 `"None"', add
label define educls_lbl 12 `"Preschool"', add
label define educls_lbl 13 `"Non-formal education"', add
label define educls_lbl 21 `"Standard 1"', add
label define educls_lbl 22 `"Standard 2"', add
label define educls_lbl 23 `"Standard 3"', add
label define educls_lbl 24 `"Standard 4"', add
label define educls_lbl 25 `"Standard 5"', add
label define educls_lbl 26 `"Standard 6"', add
label define educls_lbl 27 `"Standard 7"', add
label define educls_lbl 31 `"Diploma or certificate after primary"', add
label define educls_lbl 32 `"Vocational training after primary"', add
label define educls_lbl 41 `"Form 1 (form A)"', add
label define educls_lbl 42 `"Form 2 (form B)"', add
label define educls_lbl 43 `"Form 3 (form C)"', add
label define educls_lbl 44 `"Diploma or certificate after lower secondary"', add
label define educls_lbl 45 `"Vocational training after lower secondary"', add
label define educls_lbl 51 `"Form 4 (form D)"', add
label define educls_lbl 52 `"Form 5 (form E)"', add
label define educls_lbl 60 `"Post-secondary, non-university"', add
label define educls_lbl 61 `"Undergraduate or graduate studies"', add
label define educls_lbl 62 `"Undergraduate studies"', add
label define educls_lbl 63 `"Graduate studies"', add
label define educls_lbl 90 `"Other"', add
label values educls educls_lbl

label define empstat_lbl 0 `"NIU (not in universe)"'
label define empstat_lbl 1 `"Employed"', add
label define empstat_lbl 2 `"Unemployed"', add
label define empstat_lbl 3 `"Inactive"', add
label define empstat_lbl 9 `"Unknown/missing"', add
label values empstat empstat_lbl

label define empstatd_lbl 000 `"NIU (not in universe)"'
label define empstatd_lbl 100 `"Employed, not specified"', add
label define empstatd_lbl 110 `"At work"', add
label define empstatd_lbl 111 `"At work, and 'student'"', add
label define empstatd_lbl 112 `"At work, and 'housework'"', add
label define empstatd_lbl 113 `"At work, and 'seeking work'"', add
label define empstatd_lbl 114 `"At work, and 'retired'"', add
label define empstatd_lbl 115 `"At work, and 'no work'"', add
label define empstatd_lbl 116 `"At work, and other situation"', add
label define empstatd_lbl 117 `"At work, family holding, not specified"', add
label define empstatd_lbl 118 `"At work, family holding, not agricultural"', add
label define empstatd_lbl 119 `"At work, family holding, agricultural"', add
label define empstatd_lbl 120 `"Have job, not at work in reference period"', add
label define empstatd_lbl 130 `"Armed forces"', add
label define empstatd_lbl 131 `"Armed forces, at work"', add
label define empstatd_lbl 132 `"Armed forces, not at work in reference period"', add
label define empstatd_lbl 133 `"Military trainee"', add
label define empstatd_lbl 140 `"Marginally employed"', add
label define empstatd_lbl 200 `"Unemployed, not specified"', add
label define empstatd_lbl 201 `"Unemployed 6 or more months"', add
label define empstatd_lbl 202 `"Worked fewer than 6 months, permanent job"', add
label define empstatd_lbl 203 `"Worked fewer than 6 months, temporary job"', add
label define empstatd_lbl 210 `"Unemployed, experienced worker"', add
label define empstatd_lbl 220 `"Unemployed, new worker"', add
label define empstatd_lbl 230 `"No work available"', add
label define empstatd_lbl 240 `"Inactive unemployed"', add
label define empstatd_lbl 300 `"Inactive (not in labor force)"', add
label define empstatd_lbl 301 `"Unavailable jobseekers"', add
label define empstatd_lbl 302 `"Available potential jobseekers"', add
label define empstatd_lbl 310 `"Housework"', add
label define empstatd_lbl 320 `"Health reasons, unable to work, or disabled"', add
label define empstatd_lbl 321 `"Permanent disability"', add
label define empstatd_lbl 322 `"Temporary illness"', add
label define empstatd_lbl 323 `"Disabled or imprisoned"', add
label define empstatd_lbl 330 `"In school"', add
label define empstatd_lbl 340 `"Retirees and living on rent"', add
label define empstatd_lbl 341 `"Living on rents"', add
label define empstatd_lbl 342 `"Living on rents or pension"', add
label define empstatd_lbl 343 `"Retirees/pensioners"', add
label define empstatd_lbl 344 `"Retired"', add
label define empstatd_lbl 345 `"Pensioner"', add
label define empstatd_lbl 346 `"Non-retirement pension"', add
label define empstatd_lbl 347 `"Disability pension"', add
label define empstatd_lbl 348 `"Retired without benefits"', add
label define empstatd_lbl 350 `"Elderly"', add
label define empstatd_lbl 351 `"Elderly or disabled"', add
label define empstatd_lbl 360 `"Institutionalized"', add
label define empstatd_lbl 361 `"Prisoner"', add
label define empstatd_lbl 370 `"Intermittent worker"', add
label define empstatd_lbl 371 `"Not working, seasonal worker"', add
label define empstatd_lbl 372 `"Not working, occasional worker"', add
label define empstatd_lbl 380 `"Other income recipient"', add
label define empstatd_lbl 390 `"Inactive, other reasons"', add
label define empstatd_lbl 391 `"Too young to work"', add
label define empstatd_lbl 392 `"Dependent"', add
label define empstatd_lbl 999 `"Unknown/missing"', add
label values empstatd empstatd_lbl

label define labforce_lbl 1 `"No, not in the labor force"'
label define labforce_lbl 2 `"Yes, in the labor force"', add
label define labforce_lbl 8 `"Unknown"', add
label define labforce_lbl 9 `"NIU (not in universe)"', add
label values labforce labforce_lbl

label define occisco_lbl 01 `"Legislators, senior officials and managers"'
label define occisco_lbl 02 `"Professionals"', add
label define occisco_lbl 03 `"Technicians and associate professionals"', add
label define occisco_lbl 04 `"Clerks"', add
label define occisco_lbl 05 `"Service workers and shop and market sales"', add
label define occisco_lbl 06 `"Skilled agricultural and fishery workers"', add
label define occisco_lbl 07 `"Crafts and related trades workers"', add
label define occisco_lbl 08 `"Plant and machine operators and assemblers"', add
label define occisco_lbl 09 `"Elementary occupations"', add
label define occisco_lbl 10 `"Armed forces"', add
label define occisco_lbl 11 `"Other occupations, unspecified or n.e.c."', add
label define occisco_lbl 97 `"Response suppressed"', add
label define occisco_lbl 98 `"Unknown"', add
label define occisco_lbl 99 `"NIU (not in universe)"', add
label values occisco occisco_lbl

label define indgen_lbl 000 `"NIU (not in universe)"'
label define indgen_lbl 010 `"Agriculture, fishing, and forestry"', add
label define indgen_lbl 020 `"Mining and extraction"', add
label define indgen_lbl 030 `"Manufacturing"', add
label define indgen_lbl 040 `"Electricity, gas, water and waste management"', add
label define indgen_lbl 050 `"Construction"', add
label define indgen_lbl 060 `"Wholesale and retail trade"', add
label define indgen_lbl 070 `"Hotels and restaurants"', add
label define indgen_lbl 080 `"Transportation, storage, and communications"', add
label define indgen_lbl 090 `"Financial services and insurance"', add
label define indgen_lbl 100 `"Public administration and defense"', add
label define indgen_lbl 110 `"Services, not specified"', add
label define indgen_lbl 111 `"Business services and real estate"', add
label define indgen_lbl 112 `"Education"', add
label define indgen_lbl 113 `"Health and social work"', add
label define indgen_lbl 114 `"Other services"', add
label define indgen_lbl 120 `"Private household services"', add
label define indgen_lbl 130 `"Other industry, n.e.c."', add
label define indgen_lbl 998 `"Response suppressed"', add
label define indgen_lbl 999 `"Unknown"', add
label values indgen indgen_lbl

label define classwk_lbl 0 `"NIU (not in universe)"'
label define classwk_lbl 1 `"Self-employed"', add
label define classwk_lbl 2 `"Wage/salary worker"', add
label define classwk_lbl 3 `"Unpaid worker"', add
label define classwk_lbl 4 `"Other"', add
label define classwk_lbl 9 `"Unknown/missing"', add
label values classwk classwk_lbl

label define classwkd_lbl 000 `"NIU (not in universe)"'
label define classwkd_lbl 100 `"Self-employed"', add
label define classwkd_lbl 101 `"Self-employed, unincorporated"', add
label define classwkd_lbl 102 `"Self-employed, incorporated"', add
label define classwkd_lbl 110 `"Employer"', add
label define classwkd_lbl 111 `"Sharecropper, employer"', add
label define classwkd_lbl 120 `"Working on own account"', add
label define classwkd_lbl 121 `"Own account, agriculture"', add
label define classwkd_lbl 122 `"Domestic worker, self-employed"', add
label define classwkd_lbl 123 `"Subsistence worker, own consumption"', add
label define classwkd_lbl 124 `"Own account, other"', add
label define classwkd_lbl 125 `"Own account, without temporary/unpaid help"', add
label define classwkd_lbl 126 `"Own account, with temporary/unpaid help"', add
label define classwkd_lbl 130 `"Member of cooperative"', add
label define classwkd_lbl 140 `"Sharecropper"', add
label define classwkd_lbl 141 `"Sharecropper, self-employed"', add
label define classwkd_lbl 142 `"Sharecropper, employee"', add
label define classwkd_lbl 150 `"Kibbutz member"', add
label define classwkd_lbl 199 `"Self-employed, not specified"', add
label define classwkd_lbl 200 `"Wage/salary worker"', add
label define classwkd_lbl 201 `"Management"', add
label define classwkd_lbl 202 `"Non-management"', add
label define classwkd_lbl 203 `"White collar (non-manual)"', add
label define classwkd_lbl 204 `"Blue collar (manual)"', add
label define classwkd_lbl 205 `"White or blue collar"', add
label define classwkd_lbl 206 `"Day laborer"', add
label define classwkd_lbl 207 `"Employee, with a permanent job"', add
label define classwkd_lbl 208 `"Employee, occasional, temporary, contract"', add
label define classwkd_lbl 209 `"Employee without legal contract"', add
label define classwkd_lbl 210 `"Wage/salary worker, private employer"', add
label define classwkd_lbl 211 `"Apprentice"', add
label define classwkd_lbl 212 `"Religious worker"', add
label define classwkd_lbl 213 `"Wage/salary worker, non-profit, NGO"', add
label define classwkd_lbl 214 `"White collar, private"', add
label define classwkd_lbl 215 `"Blue collar, private"', add
label define classwkd_lbl 216 `"Paid family worker"', add
label define classwkd_lbl 217 `"Cooperative employee"', add
label define classwkd_lbl 220 `"Wage/salary worker, government or public sector"', add
label define classwkd_lbl 221 `"Federal, government employee"', add
label define classwkd_lbl 222 `"State government employee"', add
label define classwkd_lbl 223 `"Local government employee"', add
label define classwkd_lbl 224 `"White collar, public"', add
label define classwkd_lbl 225 `"Blue collar, public"', add
label define classwkd_lbl 226 `"Public companies"', add
label define classwkd_lbl 227 `"Civil servants, local collectives"', add
label define classwkd_lbl 230 `"Domestic worker (work for private household)"', add
label define classwkd_lbl 240 `"Seasonal migrant"', add
label define classwkd_lbl 241 `"Seasonal migrant, no broker"', add
label define classwkd_lbl 242 `"Seasonal migrant, uses broker"', add
label define classwkd_lbl 250 `"Other wage and salary"', add
label define classwkd_lbl 251 `"Canal zone/commission employee"', add
label define classwkd_lbl 252 `"Government employment/training program"', add
label define classwkd_lbl 253 `"Mixed state/private enterprise/parastatal"', add
label define classwkd_lbl 254 `"Government public work program"', add
label define classwkd_lbl 255 `"State enterprise employee"', add
label define classwkd_lbl 256 `"Coordinated and continuous collaboration job"', add
label define classwkd_lbl 300 `"Unpaid worker"', add
label define classwkd_lbl 310 `"Unpaid family worker"', add
label define classwkd_lbl 320 `"Apprentice, unpaid or unspecified"', add
label define classwkd_lbl 330 `"Trainee"', add
label define classwkd_lbl 340 `"Apprentice or trainee"', add
label define classwkd_lbl 350 `"Works for others without wage"', add
label define classwkd_lbl 400 `"Other"', add
label define classwkd_lbl 999 `"Unknown/missing"', add
label values classwkd classwkd_lbl

label define empsect_lbl 00 `"NIU (not in universe)"'
label define empsect_lbl 10 `"Public"', add
label define empsect_lbl 20 `"Private"', add
label define empsect_lbl 21 `"Private, not elsewhere classified"', add
label define empsect_lbl 22 `"Individual/family enterprise, and self-employed"', add
label define empsect_lbl 23 `"Foreign"', add
label define empsect_lbl 30 `"Mixed: public-private or parastatal"', add
label define empsect_lbl 40 `"Collective or cooperative"', add
label define empsect_lbl 50 `"Foreign government or non-governmental organization"', add
label define empsect_lbl 60 `"Other, unspecified"', add
label define empsect_lbl 61 `"Canal zone"', add
label define empsect_lbl 62 `"Faith-based organization"', add
label define empsect_lbl 63 `"Informal sector"', add
label define empsect_lbl 99 `"Unknown"', add
label values empsect empsect_lbl

label define migrate0_lbl 00 `"NIU (not in universe)"'
label define migrate0_lbl 10 `"Same major administrative unit"', add
label define migrate0_lbl 11 `"Same major, same minor administrative unit"', add
label define migrate0_lbl 12 `"Same minor administrative unit, same house"', add
label define migrate0_lbl 13 `"Same minor administrative unit, different house"', add
label define migrate0_lbl 14 `"Same major, different minor administrative unit"', add
label define migrate0_lbl 20 `"Different major administrative unit"', add
label define migrate0_lbl 30 `"Abroad"', add
label define migrate0_lbl 99 `"Unknown/missing"', add
label values migrate0 migrate0_lbl

label define migctry0_lbl 00000 `"NIU (not in universe)"'
label define migctry0_lbl 10000 `"AFRICA"', add
label define migctry0_lbl 11000 `"Eastern Africa"', add
label define migctry0_lbl 11010 `"Burundi"', add
label define migctry0_lbl 11020 `"Comoros"', add
label define migctry0_lbl 11030 `"Djibouti"', add
label define migctry0_lbl 11040 `"Eritrea"', add
label define migctry0_lbl 11050 `"Ethiopia"', add
label define migctry0_lbl 11060 `"Kenya"', add
label define migctry0_lbl 11070 `"Madagascar"', add
label define migctry0_lbl 11080 `"Malawi"', add
label define migctry0_lbl 11090 `"Mauritius"', add
label define migctry0_lbl 11100 `"Mozambique"', add
label define migctry0_lbl 11110 `"Reunion"', add
label define migctry0_lbl 11120 `"Rwanda"', add
label define migctry0_lbl 11130 `"Seychelles"', add
label define migctry0_lbl 11140 `"Somalia"', add
label define migctry0_lbl 11150 `"South Sudan"', add
label define migctry0_lbl 11160 `"Uganda"', add
label define migctry0_lbl 11170 `"Tanzania"', add
label define migctry0_lbl 11180 `"Zambia"', add
label define migctry0_lbl 11190 `"Zimbabwe"', add
label define migctry0_lbl 11999 `"Eastern Africa, n.s."', add
label define migctry0_lbl 12000 `"Middle Africa"', add
label define migctry0_lbl 12010 `"Angola"', add
label define migctry0_lbl 12020 `"Cameroon"', add
label define migctry0_lbl 12030 `"Central African Republic"', add
label define migctry0_lbl 12040 `"Chad"', add
label define migctry0_lbl 12050 `"Congo"', add
label define migctry0_lbl 12060 `"Democratic Republic of Congo"', add
label define migctry0_lbl 12070 `"Equatorial Guinea"', add
label define migctry0_lbl 12080 `"Gabon"', add
label define migctry0_lbl 12100 `"Sao Tome and Principe"', add
label define migctry0_lbl 12999 `"Middle Africa, n.s."', add
label define migctry0_lbl 13000 `"Northern Africa"', add
label define migctry0_lbl 13010 `"Algeria"', add
label define migctry0_lbl 13020 `"Egypt/United Arab Rep."', add
label define migctry0_lbl 13030 `"Libya"', add
label define migctry0_lbl 13040 `"Morocco"', add
label define migctry0_lbl 13050 `"Sudan"', add
label define migctry0_lbl 13060 `"Tunisia"', add
label define migctry0_lbl 13070 `"Western Sahara"', add
label define migctry0_lbl 13990 `"Northern Africa, n.s."', add
label define migctry0_lbl 14000 `"Southern Africa"', add
label define migctry0_lbl 14010 `"Botswana"', add
label define migctry0_lbl 14020 `"Lesotho"', add
label define migctry0_lbl 14030 `"Namibia"', add
label define migctry0_lbl 14040 `"South Africa"', add
label define migctry0_lbl 14050 `"Swaziland"', add
label define migctry0_lbl 14999 `"Southern Africa, n.s."', add
label define migctry0_lbl 15000 `"Western Africa"', add
label define migctry0_lbl 15010 `"Benin"', add
label define migctry0_lbl 15020 `"Burkina Faso"', add
label define migctry0_lbl 15150 `"Cape Verde"', add
label define migctry0_lbl 15040 `"Ivory Coast"', add
label define migctry0_lbl 15050 `"Gambia"', add
label define migctry0_lbl 15060 `"Ghana"', add
label define migctry0_lbl 15070 `"Guinea"', add
label define migctry0_lbl 15080 `"Guinea-Bissau"', add
label define migctry0_lbl 15090 `"Liberia"', add
label define migctry0_lbl 15100 `"Mali"', add
label define migctry0_lbl 15110 `"Mauritania"', add
label define migctry0_lbl 15120 `"Niger"', add
label define migctry0_lbl 15130 `"Nigeria"', add
label define migctry0_lbl 15140 `"St. Helena and Ascension"', add
label define migctry0_lbl 15160 `"Sierra Leone"', add
label define migctry0_lbl 15170 `"Togo"', add
label define migctry0_lbl 19999 `"Africa, n.s."', add
label define migctry0_lbl 20000 `"AMERICAS"', add
label define migctry0_lbl 21000 `"Caribbean"', add
label define migctry0_lbl 21010 `"Anguilla"', add
label define migctry0_lbl 21020 `"Antigua-Barbuda"', add
label define migctry0_lbl 21030 `"Aruba"', add
label define migctry0_lbl 21040 `"Bahamas"', add
label define migctry0_lbl 21050 `"Barbados"', add
label define migctry0_lbl 21060 `"British Virgin Islands"', add
label define migctry0_lbl 21070 `"Cayman Isles"', add
label define migctry0_lbl 21080 `"Cuba"', add
label define migctry0_lbl 21090 `"Dominica"', add
label define migctry0_lbl 21100 `"Dominican Republic"', add
label define migctry0_lbl 21110 `"Grenada"', add
label define migctry0_lbl 21120 `"Guadeloupe"', add
label define migctry0_lbl 21130 `"Haiti"', add
label define migctry0_lbl 21140 `"Jamaica"', add
label define migctry0_lbl 21150 `"Martinique"', add
label define migctry0_lbl 21160 `"Montserrat"', add
label define migctry0_lbl 21170 `"Netherlands Antilles"', add
label define migctry0_lbl 21180 `"Puerto Rico"', add
label define migctry0_lbl 21190 `"St. Kitts-Nevis"', add
label define migctry0_lbl 21200 `"St. Croix"', add
label define migctry0_lbl 21210 `"St. John"', add
label define migctry0_lbl 21220 `"St. Lucia"', add
label define migctry0_lbl 21230 `"St. Thomas"', add
label define migctry0_lbl 21240 `"St. Vincent and the Grenadines"', add
label define migctry0_lbl 21250 `"Trinidad and Tobago"', add
label define migctry0_lbl 21260 `"Turks and Caicos"', add
label define migctry0_lbl 21270 `"U.S. Virgin Islands"', add
label define migctry0_lbl 21999 `"Caribbean, n.s."', add
label define migctry0_lbl 22000 `"Central America"', add
label define migctry0_lbl 22010 `"Belize/British Honduras"', add
label define migctry0_lbl 22020 `"Costa Rica"', add
label define migctry0_lbl 22030 `"El Salvador"', add
label define migctry0_lbl 22040 `"Guatemala"', add
label define migctry0_lbl 22050 `"Honduras"', add
label define migctry0_lbl 22060 `"Mexico"', add
label define migctry0_lbl 22070 `"Nicaragua"', add
label define migctry0_lbl 22080 `"Panama"', add
label define migctry0_lbl 22081 `"Panama Canal Zone"', add
label define migctry0_lbl 22999 `"Central America, n.s."', add
label define migctry0_lbl 23000 `"South America"', add
label define migctry0_lbl 23010 `"Argentina"', add
label define migctry0_lbl 23020 `"Bolivia"', add
label define migctry0_lbl 23030 `"Brazil"', add
label define migctry0_lbl 23040 `"Chile"', add
label define migctry0_lbl 23050 `"Colombia"', add
label define migctry0_lbl 23060 `"Ecuador"', add
label define migctry0_lbl 23070 `"Falkland Islands"', add
label define migctry0_lbl 23080 `"French Guiana"', add
label define migctry0_lbl 23090 `"Guyana/British Guiana"', add
label define migctry0_lbl 23100 `"Paraguay"', add
label define migctry0_lbl 23110 `"Peru"', add
label define migctry0_lbl 23120 `"Suriname"', add
label define migctry0_lbl 23130 `"Uruguay"', add
label define migctry0_lbl 23140 `"Venezuela"', add
label define migctry0_lbl 23990 `"South America, n.s."', add
label define migctry0_lbl 23991 `"Central and Latin America"', add
label define migctry0_lbl 24000 `"North America"', add
label define migctry0_lbl 24010 `"Bermuda"', add
label define migctry0_lbl 24020 `"Canada"', add
label define migctry0_lbl 24030 `"Greenland"', add
label define migctry0_lbl 24040 `"Saint Pierre and Miquelon"', add
label define migctry0_lbl 24050 `"United States"', add
label define migctry0_lbl 24051 `"U.S. Outlying Areas and Territories"', add
label define migctry0_lbl 24999 `"U.S.A, Canada, Mexico"', add
label define migctry0_lbl 29999 `"Americas, n.s."', add
label define migctry0_lbl 30000 `"ASIA"', add
label define migctry0_lbl 31000 `"Eastern Asia"', add
label define migctry0_lbl 31010 `"China"', add
label define migctry0_lbl 31011 `"Hong Kong"', add
label define migctry0_lbl 31012 `"Macau"', add
label define migctry0_lbl 31013 `"Taiwan"', add
label define migctry0_lbl 31020 `"Japan"', add
label define migctry0_lbl 31030 `"Korea"', add
label define migctry0_lbl 31031 `"Korea, DPR (North)"', add
label define migctry0_lbl 31032 `"Korea, RO (South)"', add
label define migctry0_lbl 31040 `"Mongolia"', add
label define migctry0_lbl 32000 `"South-Central Asia"', add
label define migctry0_lbl 32010 `"Afghanistan"', add
label define migctry0_lbl 32020 `"Bangladesh"', add
label define migctry0_lbl 32030 `"Bhutan"', add
label define migctry0_lbl 32040 `"India"', add
label define migctry0_lbl 32041 `"India, Pakistan, Bangladesh, Sri Lanka"', add
label define migctry0_lbl 32050 `"Iran"', add
label define migctry0_lbl 32060 `"Kazakhstan"', add
label define migctry0_lbl 32070 `"Kyrgyzstan"', add
label define migctry0_lbl 32080 `"Maldives"', add
label define migctry0_lbl 32090 `"Nepal"', add
label define migctry0_lbl 32100 `"Pakistan"', add
label define migctry0_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define migctry0_lbl 32120 `"Tajikistan"', add
label define migctry0_lbl 32130 `"Turkmenistan"', add
label define migctry0_lbl 32140 `"Uzbekistan"', add
label define migctry0_lbl 33000 `"South-Eastern Asia"', add
label define migctry0_lbl 33010 `"Brunei"', add
label define migctry0_lbl 33020 `"Cambodia (Kampuchea)"', add
label define migctry0_lbl 33040 `"Indonesia"', add
label define migctry0_lbl 33050 `"Laos"', add
label define migctry0_lbl 33060 `"Malaysia"', add
label define migctry0_lbl 33061 `"Malaysia and Singapore"', add
label define migctry0_lbl 33070 `"Myanmar (Burma)"', add
label define migctry0_lbl 33080 `"Philippines"', add
label define migctry0_lbl 33090 `"Singapore"', add
label define migctry0_lbl 33100 `"Thailand"', add
label define migctry0_lbl 33110 `"Vietnam"', add
label define migctry0_lbl 34000 `"Western Asia"', add
label define migctry0_lbl 34010 `"Armenia"', add
label define migctry0_lbl 34020 `"Azerbaijan"', add
label define migctry0_lbl 34030 `"Bahrain"', add
label define migctry0_lbl 34040 `"Cyprus"', add
label define migctry0_lbl 34050 `"Georgia"', add
label define migctry0_lbl 34060 `"Iraq"', add
label define migctry0_lbl 34070 `"Israel"', add
label define migctry0_lbl 34080 `"Jordan"', add
label define migctry0_lbl 34090 `"Kuwait"', add
label define migctry0_lbl 34100 `"Lebanon"', add
label define migctry0_lbl 34110 `"Palestine"', add
label define migctry0_lbl 34120 `"Oman"', add
label define migctry0_lbl 34130 `"Qatar"', add
label define migctry0_lbl 34140 `"Saudi Arabia"', add
label define migctry0_lbl 34150 `"Syria"', add
label define migctry0_lbl 34160 `"Turkey"', add
label define migctry0_lbl 34170 `"United Arab Emirates"', add
label define migctry0_lbl 34180 `"Yemen"', add
label define migctry0_lbl 34190 `"Middle East, not specified"', add
label define migctry0_lbl 34191 `"Arabia"', add
label define migctry0_lbl 34192 `"Other Arab countries"', add
label define migctry0_lbl 34199 `"Gulf countries"', add
label define migctry0_lbl 39999 `"Asia, n.s."', add
label define migctry0_lbl 40000 `"EUROPE"', add
label define migctry0_lbl 41000 `"Eastern Europe"', add
label define migctry0_lbl 41010 `"Belarus"', add
label define migctry0_lbl 41020 `"Bulgaria"', add
label define migctry0_lbl 41021 `"Albania/Bulgaria/Romania"', add
label define migctry0_lbl 41030 `"Czech Republic"', add
label define migctry0_lbl 41031 `"Czechoslovakia/Yugoslavia"', add
label define migctry0_lbl 41040 `"Hungary"', add
label define migctry0_lbl 41050 `"Poland"', add
label define migctry0_lbl 41060 `"Moldova"', add
label define migctry0_lbl 41070 `"Romania"', add
label define migctry0_lbl 41080 `"Russia/USSR"', add
label define migctry0_lbl 41090 `"Slovakia"', add
label define migctry0_lbl 41100 `"Ukraine"', add
label define migctry0_lbl 41999 `"Eastern Europe, n.s."', add
label define migctry0_lbl 42000 `"Northern Europe"', add
label define migctry0_lbl 42010 `"Denmark"', add
label define migctry0_lbl 42020 `"Estonia"', add
label define migctry0_lbl 42030 `"Faroe Islands"', add
label define migctry0_lbl 42040 `"Finland"', add
label define migctry0_lbl 42050 `"Iceland"', add
label define migctry0_lbl 42060 `"Ireland"', add
label define migctry0_lbl 42070 `"Latvia"', add
label define migctry0_lbl 42080 `"Lithuania"', add
label define migctry0_lbl 42090 `"Norway"', add
label define migctry0_lbl 42110 `"Sweden"', add
label define migctry0_lbl 42120 `"United Kingdom"', add
label define migctry0_lbl 42199 `"Scandinavia"', add
label define migctry0_lbl 43000 `"Southern Europe"', add
label define migctry0_lbl 43010 `"Albania"', add
label define migctry0_lbl 43020 `"Andorra"', add
label define migctry0_lbl 43030 `"Bosnia"', add
label define migctry0_lbl 43040 `"Croatia"', add
label define migctry0_lbl 43050 `"Gibraltar"', add
label define migctry0_lbl 43060 `"Greece"', add
label define migctry0_lbl 43070 `"Italy"', add
label define migctry0_lbl 43080 `"Malta"', add
label define migctry0_lbl 43090 `"Portugal"', add
label define migctry0_lbl 43100 `"San Marino"', add
label define migctry0_lbl 43110 `"Slovenia"', add
label define migctry0_lbl 43120 `"Spain"', add
label define migctry0_lbl 43130 `"Macedonia"', add
label define migctry0_lbl 43140 `"Yugoslavia"', add
label define migctry0_lbl 43141 `"Montenegro"', add
label define migctry0_lbl 43142 `"Serbia"', add
label define migctry0_lbl 43143 `"Serbia and Montenegro"', add
label define migctry0_lbl 43999 `"Southern Europe, n.s."', add
label define migctry0_lbl 44000 `"Western Europe"', add
label define migctry0_lbl 44010 `"Austria"', add
label define migctry0_lbl 44020 `"Belgium"', add
label define migctry0_lbl 44021 `"Belgium/Luxemburg"', add
label define migctry0_lbl 44022 `"Benelux (Belgium/Netherlands/Luxemburg)"', add
label define migctry0_lbl 44030 `"France"', add
label define migctry0_lbl 44040 `"Germany"', add
label define migctry0_lbl 44050 `"Liechtenstein"', add
label define migctry0_lbl 44060 `"Luxembourg"', add
label define migctry0_lbl 44070 `"Monaco"', add
label define migctry0_lbl 44080 `"Netherlands"', add
label define migctry0_lbl 44090 `"Switzerland"', add
label define migctry0_lbl 49999 `"Europe, n.s."', add
label define migctry0_lbl 50000 `"OCEANIA"', add
label define migctry0_lbl 51000 `"Australia and New Zealand"', add
label define migctry0_lbl 51010 `"Australia"', add
label define migctry0_lbl 51020 `"New Zealand"', add
label define migctry0_lbl 51021 `"New Zealand/New Guinea"', add
label define migctry0_lbl 51030 `"Norfolk Islands"', add
label define migctry0_lbl 51999 `"Australia and New Zealand, n.s."', add
label define migctry0_lbl 52000 `"Melanesia"', add
label define migctry0_lbl 52010 `"Fiji"', add
label define migctry0_lbl 52020 `"New Caledonia"', add
label define migctry0_lbl 52030 `"Papua New Guinea"', add
label define migctry0_lbl 52040 `"Solomon Islands"', add
label define migctry0_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define migctry0_lbl 53000 `"Micronesia"', add
label define migctry0_lbl 53010 `"Kiribati"', add
label define migctry0_lbl 53020 `"Marshall Islands"', add
label define migctry0_lbl 53030 `"Nauru"', add
label define migctry0_lbl 53040 `"Northern Mariana Isls."', add
label define migctry0_lbl 53050 `"Palau"', add
label define migctry0_lbl 53999 `"Micronesia, n.e.c."', add
label define migctry0_lbl 54000 `"Polynesia"', add
label define migctry0_lbl 54010 `"Cook Islands"', add
label define migctry0_lbl 54020 `"French Polynesia"', add
label define migctry0_lbl 54030 `"Niue"', add
label define migctry0_lbl 54040 `"Pitcairn Island"', add
label define migctry0_lbl 54050 `"Samoa"', add
label define migctry0_lbl 54060 `"Tokelau"', add
label define migctry0_lbl 54070 `"Tonga"', add
label define migctry0_lbl 54080 `"Tuvalu"', add
label define migctry0_lbl 54090 `"Wallis and Futuna Isls."', add
label define migctry0_lbl 59999 `"Oceania, n.s."', add
label define migctry0_lbl 60000 `"OTHER, unspecified or unclassifiable"', add
label define migctry0_lbl 90000 `"Non-migrants (International)"', add
label define migctry0_lbl 99998 `"Response suppressed"', add
label define migctry0_lbl 99999 `"UNKNOWN"', add
label values migctry0 migctry0_lbl

label define migyrs1_lbl 00 `"Less than 1 year"'
label define migyrs1_lbl 01 `"1 year (or 1 year or less)"', add
label define migyrs1_lbl 02 `"2 years"', add
label define migyrs1_lbl 03 `"3"', add
label define migyrs1_lbl 04 `"4"', add
label define migyrs1_lbl 05 `"5"', add
label define migyrs1_lbl 06 `"6"', add
label define migyrs1_lbl 07 `"7"', add
label define migyrs1_lbl 08 `"8"', add
label define migyrs1_lbl 09 `"9"', add
label define migyrs1_lbl 10 `"10"', add
label define migyrs1_lbl 11 `"11"', add
label define migyrs1_lbl 12 `"12"', add
label define migyrs1_lbl 13 `"13"', add
label define migyrs1_lbl 14 `"14"', add
label define migyrs1_lbl 15 `"15"', add
label define migyrs1_lbl 16 `"16"', add
label define migyrs1_lbl 17 `"17"', add
label define migyrs1_lbl 18 `"18"', add
label define migyrs1_lbl 19 `"19"', add
label define migyrs1_lbl 20 `"20"', add
label define migyrs1_lbl 21 `"21"', add
label define migyrs1_lbl 22 `"22"', add
label define migyrs1_lbl 23 `"23"', add
label define migyrs1_lbl 24 `"24"', add
label define migyrs1_lbl 25 `"25"', add
label define migyrs1_lbl 26 `"26"', add
label define migyrs1_lbl 27 `"27"', add
label define migyrs1_lbl 28 `"28"', add
label define migyrs1_lbl 29 `"29"', add
label define migyrs1_lbl 30 `"30"', add
label define migyrs1_lbl 31 `"31"', add
label define migyrs1_lbl 32 `"32"', add
label define migyrs1_lbl 33 `"33"', add
label define migyrs1_lbl 34 `"34"', add
label define migyrs1_lbl 35 `"35"', add
label define migyrs1_lbl 36 `"36"', add
label define migyrs1_lbl 37 `"37"', add
label define migyrs1_lbl 38 `"38"', add
label define migyrs1_lbl 39 `"39"', add
label define migyrs1_lbl 40 `"40"', add
label define migyrs1_lbl 41 `"41"', add
label define migyrs1_lbl 42 `"42"', add
label define migyrs1_lbl 43 `"43"', add
label define migyrs1_lbl 44 `"44"', add
label define migyrs1_lbl 45 `"45"', add
label define migyrs1_lbl 46 `"46"', add
label define migyrs1_lbl 47 `"47"', add
label define migyrs1_lbl 48 `"48"', add
label define migyrs1_lbl 49 `"49"', add
label define migyrs1_lbl 50 `"50"', add
label define migyrs1_lbl 51 `"51"', add
label define migyrs1_lbl 52 `"52"', add
label define migyrs1_lbl 53 `"53"', add
label define migyrs1_lbl 54 `"54"', add
label define migyrs1_lbl 55 `"55"', add
label define migyrs1_lbl 56 `"56"', add
label define migyrs1_lbl 57 `"57"', add
label define migyrs1_lbl 58 `"58"', add
label define migyrs1_lbl 59 `"59"', add
label define migyrs1_lbl 60 `"60"', add
label define migyrs1_lbl 61 `"61"', add
label define migyrs1_lbl 62 `"62"', add
label define migyrs1_lbl 63 `"63"', add
label define migyrs1_lbl 64 `"64"', add
label define migyrs1_lbl 65 `"65"', add
label define migyrs1_lbl 66 `"66"', add
label define migyrs1_lbl 67 `"67"', add
label define migyrs1_lbl 68 `"68"', add
label define migyrs1_lbl 69 `"69"', add
label define migyrs1_lbl 70 `"70"', add
label define migyrs1_lbl 71 `"71"', add
label define migyrs1_lbl 72 `"72"', add
label define migyrs1_lbl 73 `"73"', add
label define migyrs1_lbl 74 `"74"', add
label define migyrs1_lbl 75 `"75"', add
label define migyrs1_lbl 76 `"76"', add
label define migyrs1_lbl 77 `"77"', add
label define migyrs1_lbl 78 `"78"', add
label define migyrs1_lbl 79 `"79"', add
label define migyrs1_lbl 80 `"80"', add
label define migyrs1_lbl 81 `"81"', add
label define migyrs1_lbl 82 `"82"', add
label define migyrs1_lbl 83 `"83"', add
label define migyrs1_lbl 84 `"84"', add
label define migyrs1_lbl 85 `"85"', add
label define migyrs1_lbl 86 `"86"', add
label define migyrs1_lbl 87 `"87"', add
label define migyrs1_lbl 88 `"88"', add
label define migyrs1_lbl 89 `"89"', add
label define migyrs1_lbl 90 `"90"', add
label define migyrs1_lbl 91 `"91"', add
label define migyrs1_lbl 92 `"92"', add
label define migyrs1_lbl 93 `"93"', add
label define migyrs1_lbl 94 `"94"', add
label define migyrs1_lbl 95 `"95+ years"', add
label define migyrs1_lbl 96 `"Less than 5 years"', add
label define migyrs1_lbl 97 `"More than 5 years"', add
label define migyrs1_lbl 98 `"Unknown"', add
label define migyrs1_lbl 99 `"NIU (not in universe)"', add
label values migyrs1 migyrs1_lbl

label define disabled_lbl 0 `"NIU (not in universe)"'
label define disabled_lbl 1 `"Yes, disabled"', add
label define disabled_lbl 2 `"No, not disabled"', add
label define disabled_lbl 9 `"Unknown"', add
label values disabled disabled_lbl

label define disemp_lbl 1 `"Disabled"'
label define disemp_lbl 2 `"Not disabled"', add
label define disemp_lbl 8 `"Unknown"', add
label define disemp_lbl 9 `"NIU (not in universe)"', add
label values disemp disemp_lbl

label define disblnd_lbl 0 `"NIU (not in universe)"'
label define disblnd_lbl 1 `"Yes"', add
label define disblnd_lbl 2 `"No"', add
label define disblnd_lbl 9 `"Unknown"', add
label values disblnd disblnd_lbl

label define disdeaf_lbl 0 `"NIU (not in universe)"'
label define disdeaf_lbl 1 `"Yes"', add
label define disdeaf_lbl 2 `"No"', add
label define disdeaf_lbl 9 `"Unknown"', add
label values disdeaf disdeaf_lbl

label define dismute_lbl 0 `"NIU (not in universe)"'
label define dismute_lbl 1 `"Yes"', add
label define dismute_lbl 2 `"No"', add
label define dismute_lbl 9 `"Unknown"', add
label values dismute dismute_lbl

label define dislowr_lbl 0 `"NIU (not in universe)"'
label define dislowr_lbl 1 `"Yes"', add
label define dislowr_lbl 2 `"No"', add
label define dislowr_lbl 9 `"Unknown"', add
label values dislowr dislowr_lbl

label define dismntl_lbl 0 `"NIU (not in universe)"'
label define dismntl_lbl 1 `"Yes"', add
label define dismntl_lbl 2 `"No"', add
label define dismntl_lbl 9 `"Unknown"', add
label values dismntl dismntl_lbl

label define dispsyc_lbl 0 `"NIU (not in universe)"'
label define dispsyc_lbl 1 `"Yes"', add
label define dispsyc_lbl 2 `"No"', add
label define dispsyc_lbl 9 `"Unknown"', add
label values dispsyc dispsyc_lbl

label define disorig_lbl 00 `"NIU (not in universe)"'
label define disorig_lbl 10 `"Congenital, since birth"', add
label define disorig_lbl 20 `"Disease"', add
label define disorig_lbl 21 `"Polio, infant paralysis"', add
label define disorig_lbl 22 `"Parkinsons"', add
label define disorig_lbl 23 `"Sclerosis"', add
label define disorig_lbl 24 `"Stroke"', add
label define disorig_lbl 25 `"Epilepsy"', add
label define disorig_lbl 26 `"Hanson disease"', add
label define disorig_lbl 29 `"Other disease"', add
label define disorig_lbl 30 `"Accident"', add
label define disorig_lbl 31 `"Work accident"', add
label define disorig_lbl 32 `"Transport accident"', add
label define disorig_lbl 33 `"Animal accident"', add
label define disorig_lbl 34 `"Sports, athletic, or playing accident"', add
label define disorig_lbl 39 `"Other accident"', add
label define disorig_lbl 40 `"Other"', add
label define disorig_lbl 41 `"Aging"', add
label define disorig_lbl 42 `"Mental infirmity"', add
label define disorig_lbl 43 `"War injury"', add
label define disorig_lbl 44 `"Genocide"', add
label define disorig_lbl 45 `"Anti-personnel mine or unexploded ordnance (UXO)"', add
label define disorig_lbl 46 `"Domestic violence"', add
label define disorig_lbl 47 `"Violence of delinquency"', add
label define disorig_lbl 48 `"Other form of violence"', add
label define disorig_lbl 49 `"Witchcraft"', add
label define disorig_lbl 50 `"Other cause, n.e.c."', add
label define disorig_lbl 70 `"Multiple causes"', add
label define disorig_lbl 90 `"No disability"', add
label define disorig_lbl 99 `"Unknown"', add
label values disorig disorig_lbl

label define ls1996a_status_lbl 1 `"Present"'
label define ls1996a_status_lbl 2 `"Visitor"', add
label define ls1996a_status_lbl 3 `"Member elsewhere in Lesotho"', add
label define ls1996a_status_lbl 4 `"Member in South Africa"', add
label define ls1996a_status_lbl 5 `"Outside Lesotho or South Africa"', add
label values ls1996a_status ls1996a_status_lbl

label define ls1996a_rescntry_lbl 01 `"South Africa"'
label define ls1996a_rescntry_lbl 02 `"Others"', add
label define ls1996a_rescntry_lbl 98 `"Unknown"', add
label define ls1996a_rescntry_lbl 99 `"NIU (not in universe)"', add
label values ls1996a_rescntry ls1996a_rescntry_lbl

label define ls1996a_absdur_lbl 0 `"0"'
label define ls1996a_absdur_lbl 1 `"1"', add
label define ls1996a_absdur_lbl 2 `"2"', add
label define ls1996a_absdur_lbl 3 `"3"', add
label define ls1996a_absdur_lbl 4 `"4"', add
label define ls1996a_absdur_lbl 5 `"5"', add
label define ls1996a_absdur_lbl 9 `"NIU (not in universe)"', add
label values ls1996a_absdur ls1996a_absdur_lbl

label define ls1996a_splive_lbl 1 `"Alive"'
label define ls1996a_splive_lbl 2 `"Not alive"', add
label define ls1996a_splive_lbl 8 `"Unknown"', add
label define ls1996a_splive_lbl 9 `"NIU (not in universe)"', add
label values ls1996a_splive ls1996a_splive_lbl

label define ls1996a_citizen_lbl 1 `"Lesotho"'
label define ls1996a_citizen_lbl 2 `"South Africa"', add
label define ls1996a_citizen_lbl 3 `"Other countries in Africa"', add
label define ls1996a_citizen_lbl 4 `"Europe"', add
label define ls1996a_citizen_lbl 5 `"Others"', add
label values ls1996a_citizen ls1996a_citizen_lbl

label define ls1996a_bpl_lbl 01 `"Butha Buthe"'
label define ls1996a_bpl_lbl 02 `"Leribe"', add
label define ls1996a_bpl_lbl 03 `"Berea"', add
label define ls1996a_bpl_lbl 04 `"Maseru"', add
label define ls1996a_bpl_lbl 05 `"Mafeteng"', add
label define ls1996a_bpl_lbl 06 `"Mohale's Hoek"', add
label define ls1996a_bpl_lbl 07 `"Quthing"', add
label define ls1996a_bpl_lbl 08 `"Qacha's Nek"', add
label define ls1996a_bpl_lbl 09 `"Mokhotlong"', add
label define ls1996a_bpl_lbl 10 `"Thaba Tseka"', add
label define ls1996a_bpl_lbl 11 `"Same village"', add
label define ls1996a_bpl_lbl 12 `"Different village, same district"', add
label define ls1996a_bpl_lbl 13 `"South Africa"', add
label define ls1996a_bpl_lbl 14 `"Other Countries"', add
label values ls1996a_bpl ls1996a_bpl_lbl

label define ls1996a_res10yr_lbl 01 `"Butha Buthe"'
label define ls1996a_res10yr_lbl 02 `"Leribe"', add
label define ls1996a_res10yr_lbl 03 `"Berea"', add
label define ls1996a_res10yr_lbl 04 `"Maseru"', add
label define ls1996a_res10yr_lbl 05 `"Mafeteng"', add
label define ls1996a_res10yr_lbl 06 `"Mohale's Hoek"', add
label define ls1996a_res10yr_lbl 07 `"Quthing"', add
label define ls1996a_res10yr_lbl 08 `"Qacha's Nek"', add
label define ls1996a_res10yr_lbl 09 `"Mokhotlong"', add
label define ls1996a_res10yr_lbl 10 `"Thaba Tseka"', add
label define ls1996a_res10yr_lbl 11 `"Same village"', add
label define ls1996a_res10yr_lbl 12 `"Different village, same district"', add
label define ls1996a_res10yr_lbl 13 `"Republic of South Africa"', add
label define ls1996a_res10yr_lbl 14 `"Other countries"', add
label define ls1996a_res10yr_lbl 99 `"NIU (not in universe)"', add
label values ls1996a_res10yr ls1996a_res10yr_lbl

label define ls1996a_resdur_lbl 00 `"Not moved or less than 1 year"'
label define ls1996a_resdur_lbl 01 `"1 year"', add
label define ls1996a_resdur_lbl 02 `"2 years"', add
label define ls1996a_resdur_lbl 03 `"3"', add
label define ls1996a_resdur_lbl 04 `"4"', add
label define ls1996a_resdur_lbl 05 `"5"', add
label define ls1996a_resdur_lbl 06 `"6"', add
label define ls1996a_resdur_lbl 07 `"7"', add
label define ls1996a_resdur_lbl 08 `"8"', add
label define ls1996a_resdur_lbl 09 `"9"', add
label define ls1996a_resdur_lbl 10 `"10"', add
label define ls1996a_resdur_lbl 99 `"NIU (not in universe)"', add
label values ls1996a_resdur ls1996a_resdur_lbl

label define ls1996a_school_lbl 1 `"Never attended"'
label define ls1996a_school_lbl 2 `"Still attending"', add
label define ls1996a_school_lbl 3 `"Left school"', add
label define ls1996a_school_lbl 9 `"NIU (not in universe)"', add
label values ls1996a_school ls1996a_school_lbl

label define ls1996a_edattain_lbl 01 `"Standard 1"'
label define ls1996a_edattain_lbl 02 `"Standard 2"', add
label define ls1996a_edattain_lbl 03 `"Standard 3"', add
label define ls1996a_edattain_lbl 04 `"Standard 4"', add
label define ls1996a_edattain_lbl 05 `"Standard 5"', add
label define ls1996a_edattain_lbl 06 `"Standard 6"', add
label define ls1996a_edattain_lbl 07 `"Standard 7"', add
label define ls1996a_edattain_lbl 11 `"Form A"', add
label define ls1996a_edattain_lbl 12 `"Form B"', add
label define ls1996a_edattain_lbl 13 `"Form C"', add
label define ls1996a_edattain_lbl 14 `"Form D "', add
label define ls1996a_edattain_lbl 15 `"Form E "', add
label define ls1996a_edattain_lbl 20 `"Diploma or certificate after primary "', add
label define ls1996a_edattain_lbl 21 `"Vocational training after primary "', add
label define ls1996a_edattain_lbl 22 `"Diploma or certificate after secondary "', add
label define ls1996a_edattain_lbl 23 `"Vocational training after secondary"', add
label define ls1996a_edattain_lbl 24 `"Diploma or certificate after high school "', add
label define ls1996a_edattain_lbl 25 `"Vocational training after high school "', add
label define ls1996a_edattain_lbl 26 `"Graduate or post graduate"', add
label define ls1996a_edattain_lbl 90 `"Others"', add
label define ls1996a_edattain_lbl 99 `"NIU (not in universe)"', add
label values ls1996a_edattain ls1996a_edattain_lbl

label define ls1996a_activity_lbl 10 `"Employer"'
label define ls1996a_activity_lbl 20 `"Own account"', add
label define ls1996a_activity_lbl 31 `"Wage or salary earner"', add
label define ls1996a_activity_lbl 32 `"Casual worker"', add
label define ls1996a_activity_lbl 40 `"Unpaid family worker"', add
label define ls1996a_activity_lbl 50 `"Job seeking"', add
label define ls1996a_activity_lbl 55 `"Job seeking for first job "', add
label define ls1996a_activity_lbl 60 `"Homemaker"', add
label define ls1996a_activity_lbl 70 `"Retired"', add
label define ls1996a_activity_lbl 80 `"Student"', add
label define ls1996a_activity_lbl 90 `"Disabled"', add
label define ls1996a_activity_lbl 95 `"Others"', add
label define ls1996a_activity_lbl 98 `"Unknown"', add
label define ls1996a_activity_lbl 99 `"NIU (not in universe)"', add
label values ls1996a_activity ls1996a_activity_lbl

label define ls1996a_empstat12_lbl 15 `"Employer or own account"'
label define ls1996a_empstat12_lbl 31 `"Wage or salary earner"', add
label define ls1996a_empstat12_lbl 32 `"Casual worker"', add
label define ls1996a_empstat12_lbl 40 `"Unpaid family worker"', add
label define ls1996a_empstat12_lbl 50 `"Job seeking"', add
label define ls1996a_empstat12_lbl 55 `"Job seeking for first job "', add
label define ls1996a_empstat12_lbl 60 `"Homemaker"', add
label define ls1996a_empstat12_lbl 80 `"Student"', add
label define ls1996a_empstat12_lbl 95 `"Others"', add
label define ls1996a_empstat12_lbl 99 `"NIU (not in universe)"', add
label values ls1996a_empstat12 ls1996a_empstat12_lbl

label define ls1996a_sector_lbl 1 `"Government"'
label define ls1996a_sector_lbl 2 `"Parastatal"', add
label define ls1996a_sector_lbl 3 `"Private"', add
label define ls1996a_sector_lbl 4 `"Republic of South Africa"', add
label define ls1996a_sector_lbl 5 `"Others"', add
label define ls1996a_sector_lbl 9 `"NIU (not in universe)"', add
label values ls1996a_sector ls1996a_sector_lbl

label define ls1996a_occ_lbl 002 `"Architects, engineers and related technicians (academic)"'
label define ls1996a_occ_lbl 003 `"Engineers not elsewhere classified "', add
label define ls1996a_occ_lbl 006 `"Medical, dental, veterinary and related workers (academic)"', add
label define ls1996a_occ_lbl 007 `"Professional nurses"', add
label define ls1996a_occ_lbl 008 `"Statisticians, mathematicians, system analysts and related technicians"', add
label define ls1996a_occ_lbl 010 `"Members of the armed forces"', add
label define ls1996a_occ_lbl 011 `"Accountants"', add
label define ls1996a_occ_lbl 012 `"Jurists"', add
label define ls1996a_occ_lbl 013 `"Teachers"', add
label define ls1996a_occ_lbl 014 `"Workers in religion"', add
label define ls1996a_occ_lbl 017 `"Composers  and performing artists"', add
label define ls1996a_occ_lbl 019 `"Professional, technical and related workers not elsewhere classified"', add
label define ls1996a_occ_lbl 020 `"Legislative officials and government administrators"', add
label define ls1996a_occ_lbl 021 `"Managers"', add
label define ls1996a_occ_lbl 030 `"Clerical supervisors"', add
label define ls1996a_occ_lbl 031 `"Government executive officials"', add
label define ls1996a_occ_lbl 032 `"Stenographers, typists and card and tape punching machine operators"', add
label define ls1996a_occ_lbl 033 `"Bookkeepers, cashiers and related workers"', add
label define ls1996a_occ_lbl 034 `"Computing machine operators"', add
label define ls1996a_occ_lbl 035 `"Transport and communications supervisors"', add
label define ls1996a_occ_lbl 036 `"Transport conductors"', add
label define ls1996a_occ_lbl 039 `"Clerical and related worker not elsewhere classified "', add
label define ls1996a_occ_lbl 040 `"Managers [wholesale and retail trade]"', add
label define ls1996a_occ_lbl 041 `"Working proprietors [wholesale and retail trade]"', add
label define ls1996a_occ_lbl 044 `"Insurance, real estate, securities and business services sales and auctioneers"', add
label define ls1996a_occ_lbl 045 `"Salesmen, shop assistants and related workers"', add
label define ls1996a_occ_lbl 046 `"Sales workers not elsewhere classified"', add
label define ls1996a_occ_lbl 050 `"Managers (catering and lodging services)"', add
label define ls1996a_occ_lbl 053 `"Cooks, waiters, bartenders and related workers"', add
label define ls1996a_occ_lbl 054 `"Maids and related housekeeping service workers not elsewhere classified"', add
label define ls1996a_occ_lbl 055 `"Building caretakers, charworkers, cleaners and related workers"', add
label define ls1996a_occ_lbl 056 `"Launderers, dry-cleaners and pressers"', add
label define ls1996a_occ_lbl 057 `"Hairdressers, barbers, beauticians and related workers  "', add
label define ls1996a_occ_lbl 058 `"Protective service workers"', add
label define ls1996a_occ_lbl 059 `"Service workers not elsewhere classified"', add
label define ls1996a_occ_lbl 061 `"Farmers"', add
label define ls1996a_occ_lbl 062 `"Agricultural and animal husbandry workers"', add
label define ls1996a_occ_lbl 065 `"Herdboys"', add
label define ls1996a_occ_lbl 066 `"Agricultural, animal husbandry, and forestry workers, not elsewhere classified"', add
label define ls1996a_occ_lbl 070 `"Production supervisors and general foremen"', add
label define ls1996a_occ_lbl 071 `"Miners, quarrymen, well drillers and related workers"', add
label define ls1996a_occ_lbl 072 `"Metal processors"', add
label define ls1996a_occ_lbl 074 `"Chemical processors and related workers"', add
label define ls1996a_occ_lbl 075 `"Spinners, weavers, knitters, dyers and related workers"', add
label define ls1996a_occ_lbl 077 `"Food and beverage processors"', add
label define ls1996a_occ_lbl 079 `"Tailors and dressmakers "', add
label define ls1996a_occ_lbl 080 `"Shoemakers and leather goods makers"', add
label define ls1996a_occ_lbl 083 `"Blacksmiths, toolmakers and machine-tool operators"', add
label define ls1996a_occ_lbl 084 `"Machinery fitters, machine assemblers and precision instrument makers (except electrical)"', add
label define ls1996a_occ_lbl 085 `"Electrical fitters and related electrical and electronics workers"', add
label define ls1996a_occ_lbl 087 `"Plumbers, welders, sheet metal and structural metal preparers and erectors"', add
label define ls1996a_occ_lbl 092 `"Printers and related workers"', add
label define ls1996a_occ_lbl 093 `"Painters"', add
label define ls1996a_occ_lbl 095 `"Bricklayers, carpenters and other construction workers"', add
label define ls1996a_occ_lbl 097 `"Material-handl ing and related equipment operators, dockers and freight handlers"', add
label define ls1996a_occ_lbl 098 `"Transport equipment operators"', add
label define ls1996a_occ_lbl 099 `"Laborers, not elsewhere classified"', add
label define ls1996a_occ_lbl 998 `"Unknown"', add
label define ls1996a_occ_lbl 999 `"NIU (not in universe)"', add
label values ls1996a_occ ls1996a_occ_lbl

label define ls1996a_wkloc1_lbl 01 `"Butha Buthe"'
label define ls1996a_wkloc1_lbl 02 `"Leribe"', add
label define ls1996a_wkloc1_lbl 03 `"Berea"', add
label define ls1996a_wkloc1_lbl 04 `"Maseru"', add
label define ls1996a_wkloc1_lbl 05 `"Mafeteng"', add
label define ls1996a_wkloc1_lbl 06 `"Mohale's Hoek"', add
label define ls1996a_wkloc1_lbl 07 `"Quthing"', add
label define ls1996a_wkloc1_lbl 08 `"Qacha's Nek"', add
label define ls1996a_wkloc1_lbl 09 `"Mokhotlong"', add
label define ls1996a_wkloc1_lbl 10 `"Thaba Tseka"', add
label define ls1996a_wkloc1_lbl 11 `"Same village"', add
label define ls1996a_wkloc1_lbl 12 `"Different village"', add
label define ls1996a_wkloc1_lbl 13 `"South Africa"', add
label define ls1996a_wkloc1_lbl 14 `"Other countries"', add
label define ls1996a_wkloc1_lbl 98 `"Unknown"', add
label define ls1996a_wkloc1_lbl 99 `"NIU (not in universe)"', add
label values ls1996a_wkloc1 ls1996a_wkloc1_lbl

label define ls1996a_wkloc2_lbl 01 `"Butha Buthe"'
label define ls1996a_wkloc2_lbl 02 `"Hlotse"', add
label define ls1996a_wkloc2_lbl 03 `"Maputsoe"', add
label define ls1996a_wkloc2_lbl 04 `"Teyateyaneng"', add
label define ls1996a_wkloc2_lbl 05 `"Maseru"', add
label define ls1996a_wkloc2_lbl 06 `"Mafeteng"', add
label define ls1996a_wkloc2_lbl 07 `"Mohale's Hoek"', add
label define ls1996a_wkloc2_lbl 08 `"Moyeni"', add
label define ls1996a_wkloc2_lbl 09 `"Qacha's Nek"', add
label define ls1996a_wkloc2_lbl 10 `"Mokhotlong"', add
label define ls1996a_wkloc2_lbl 11 `"Thaba Tseka"', add
label define ls1996a_wkloc2_lbl 12 `"South Africa"', add
label define ls1996a_wkloc2_lbl 13 `"Other countries"', add
label define ls1996a_wkloc2_lbl 99 `"NIU (not in universe)"', add
label values ls1996a_wkloc2 ls1996a_wkloc2_lbl

label define ls1996a_wklocza_lbl 1 `"No, never worked in South Africa"'
label define ls1996a_wklocza_lbl 2 `"Yes, worked"', add
label define ls1996a_wklocza_lbl 3 `"Yes, working"', add
label define ls1996a_wklocza_lbl 9 `"NIU (not in universe)"', add
label values ls1996a_wklocza ls1996a_wklocza_lbl

label define ls1996a_wkdurza_lbl 00 `"Less than one year"'
label define ls1996a_wkdurza_lbl 01 `"1 year"', add
label define ls1996a_wkdurza_lbl 02 `"2 years"', add
label define ls1996a_wkdurza_lbl 03 `"3"', add
label define ls1996a_wkdurza_lbl 04 `"4"', add
label define ls1996a_wkdurza_lbl 05 `"5"', add
label define ls1996a_wkdurza_lbl 06 `"6"', add
label define ls1996a_wkdurza_lbl 07 `"7"', add
label define ls1996a_wkdurza_lbl 08 `"8"', add
label define ls1996a_wkdurza_lbl 09 `"9"', add
label define ls1996a_wkdurza_lbl 10 `"10"', add
label define ls1996a_wkdurza_lbl 99 `"NIU (not in universe)"', add
label values ls1996a_wkdurza ls1996a_wkdurza_lbl

label define ls2006a_status_lbl 1 `"Present"'
label define ls2006a_status_lbl 2 `"Visitor"', add
label define ls2006a_status_lbl 3 `"Elsewhere in Lesotho"', add
label define ls2006a_status_lbl 4 `"Member in South Africa"', add
label define ls2006a_status_lbl 5 `"Outside Lesotho and South Africa"', add
label values ls2006a_status ls2006a_status_lbl

label define ls2006a_rescntry_lbl 10 `"Lesotho "'
label define ls2006a_rescntry_lbl 15 `"South Africa"', add
label define ls2006a_rescntry_lbl 85 `"Other country"', add
label values ls2006a_rescntry ls2006a_rescntry_lbl

label define ls2006a_absdur_lbl 00 `"Less than 1 year"'
label define ls2006a_absdur_lbl 01 `"1 year"', add
label define ls2006a_absdur_lbl 02 `"2 years"', add
label define ls2006a_absdur_lbl 03 `"3"', add
label define ls2006a_absdur_lbl 04 `"4"', add
label define ls2006a_absdur_lbl 05 `"5"', add
label define ls2006a_absdur_lbl 06 `"6 to 9"', add
label define ls2006a_absdur_lbl 10 `"10+"', add
label define ls2006a_absdur_lbl 99 `"NIU (not in universe)"', add
label values ls2006a_absdur ls2006a_absdur_lbl

label define ls2006a_citizen_lbl 10 `"Lesotho"'
label define ls2006a_citizen_lbl 15 `"South Africa"', add
label define ls2006a_citizen_lbl 65 `"Other Africa"', add
label define ls2006a_citizen_lbl 75 `"Asia"', add
label define ls2006a_citizen_lbl 85 `"Other country"', add
label values ls2006a_citizen ls2006a_citizen_lbl

label define ls2006a_bpl_lbl 01 `"Botha-Bothe"'
label define ls2006a_bpl_lbl 02 `"Leribe"', add
label define ls2006a_bpl_lbl 03 `"Berea"', add
label define ls2006a_bpl_lbl 04 `"Maseru"', add
label define ls2006a_bpl_lbl 05 `"Mafeteng"', add
label define ls2006a_bpl_lbl 06 `"Mohale's Hoek"', add
label define ls2006a_bpl_lbl 07 `"Quthing"', add
label define ls2006a_bpl_lbl 08 `"Qacha's Nek"', add
label define ls2006a_bpl_lbl 09 `"Mokhotlong"', add
label define ls2006a_bpl_lbl 10 `"Thaba-Tseka"', add
label define ls2006a_bpl_lbl 11 `"Same village"', add
label define ls2006a_bpl_lbl 12 `"Different village, this district"', add
label define ls2006a_bpl_lbl 13 `"South Africa"', add
label define ls2006a_bpl_lbl 14 `"Others"', add
label values ls2006a_bpl ls2006a_bpl_lbl

label define ls2006a_res10yr_lbl 00 `"NIU (not in universe) "'
label define ls2006a_res10yr_lbl 01 `"Botha-Bothe"', add
label define ls2006a_res10yr_lbl 02 `"Leribe"', add
label define ls2006a_res10yr_lbl 03 `"Berea"', add
label define ls2006a_res10yr_lbl 04 `"Maseru"', add
label define ls2006a_res10yr_lbl 05 `"Mafeteng"', add
label define ls2006a_res10yr_lbl 06 `"Mohale's Hoek"', add
label define ls2006a_res10yr_lbl 07 `"Quthing"', add
label define ls2006a_res10yr_lbl 08 `"Qacha's Nek"', add
label define ls2006a_res10yr_lbl 09 `"Mokhotlong"', add
label define ls2006a_res10yr_lbl 10 `"Thaba-Tseka"', add
label define ls2006a_res10yr_lbl 11 `"Same village"', add
label define ls2006a_res10yr_lbl 12 `"Different village, this district"', add
label define ls2006a_res10yr_lbl 13 `"South Africa"', add
label define ls2006a_res10yr_lbl 14 `"Other countries"', add
label values ls2006a_res10yr ls2006a_res10yr_lbl

label define ls2006a_resdur_lbl 00 `"Less than 1 year"'
label define ls2006a_resdur_lbl 01 `"1 year"', add
label define ls2006a_resdur_lbl 02 `"2 years"', add
label define ls2006a_resdur_lbl 03 `"3"', add
label define ls2006a_resdur_lbl 04 `"4"', add
label define ls2006a_resdur_lbl 05 `"5"', add
label define ls2006a_resdur_lbl 06 `"6"', add
label define ls2006a_resdur_lbl 07 `"7"', add
label define ls2006a_resdur_lbl 08 `"8"', add
label define ls2006a_resdur_lbl 09 `"9"', add
label define ls2006a_resdur_lbl 10 `"10"', add
label define ls2006a_resdur_lbl 11 `"11"', add
label define ls2006a_resdur_lbl 12 `"12"', add
label define ls2006a_resdur_lbl 13 `"13"', add
label define ls2006a_resdur_lbl 14 `"14"', add
label define ls2006a_resdur_lbl 15 `"15"', add
label define ls2006a_resdur_lbl 16 `"16"', add
label define ls2006a_resdur_lbl 17 `"17"', add
label define ls2006a_resdur_lbl 18 `"18"', add
label define ls2006a_resdur_lbl 19 `"19"', add
label define ls2006a_resdur_lbl 20 `"20"', add
label define ls2006a_resdur_lbl 21 `"21"', add
label define ls2006a_resdur_lbl 22 `"22"', add
label define ls2006a_resdur_lbl 23 `"23"', add
label define ls2006a_resdur_lbl 24 `"24"', add
label define ls2006a_resdur_lbl 25 `"25"', add
label define ls2006a_resdur_lbl 26 `"26"', add
label define ls2006a_resdur_lbl 27 `"27"', add
label define ls2006a_resdur_lbl 28 `"28"', add
label define ls2006a_resdur_lbl 29 `"29"', add
label define ls2006a_resdur_lbl 30 `"30"', add
label define ls2006a_resdur_lbl 31 `"31"', add
label define ls2006a_resdur_lbl 32 `"32"', add
label define ls2006a_resdur_lbl 33 `"33"', add
label define ls2006a_resdur_lbl 34 `"34"', add
label define ls2006a_resdur_lbl 35 `"35"', add
label define ls2006a_resdur_lbl 36 `"36"', add
label define ls2006a_resdur_lbl 37 `"37"', add
label define ls2006a_resdur_lbl 38 `"38"', add
label define ls2006a_resdur_lbl 39 `"39"', add
label define ls2006a_resdur_lbl 40 `"40"', add
label define ls2006a_resdur_lbl 41 `"41"', add
label define ls2006a_resdur_lbl 42 `"42"', add
label define ls2006a_resdur_lbl 43 `"43"', add
label define ls2006a_resdur_lbl 44 `"44"', add
label define ls2006a_resdur_lbl 45 `"45"', add
label define ls2006a_resdur_lbl 46 `"46"', add
label define ls2006a_resdur_lbl 47 `"47"', add
label define ls2006a_resdur_lbl 48 `"48"', add
label define ls2006a_resdur_lbl 49 `"49"', add
label define ls2006a_resdur_lbl 50 `"50"', add
label define ls2006a_resdur_lbl 51 `"51"', add
label define ls2006a_resdur_lbl 52 `"52"', add
label define ls2006a_resdur_lbl 53 `"53"', add
label define ls2006a_resdur_lbl 54 `"54"', add
label define ls2006a_resdur_lbl 55 `"55"', add
label define ls2006a_resdur_lbl 56 `"56"', add
label define ls2006a_resdur_lbl 57 `"57"', add
label define ls2006a_resdur_lbl 58 `"58"', add
label define ls2006a_resdur_lbl 59 `"59"', add
label define ls2006a_resdur_lbl 60 `"60"', add
label define ls2006a_resdur_lbl 61 `"61"', add
label define ls2006a_resdur_lbl 62 `"62"', add
label define ls2006a_resdur_lbl 63 `"63"', add
label define ls2006a_resdur_lbl 64 `"64"', add
label define ls2006a_resdur_lbl 65 `"65"', add
label define ls2006a_resdur_lbl 66 `"66"', add
label define ls2006a_resdur_lbl 67 `"67"', add
label define ls2006a_resdur_lbl 68 `"68"', add
label define ls2006a_resdur_lbl 69 `"69"', add
label define ls2006a_resdur_lbl 70 `"70"', add
label define ls2006a_resdur_lbl 71 `"71"', add
label define ls2006a_resdur_lbl 72 `"72"', add
label define ls2006a_resdur_lbl 73 `"73"', add
label define ls2006a_resdur_lbl 74 `"74"', add
label define ls2006a_resdur_lbl 75 `"75"', add
label define ls2006a_resdur_lbl 76 `"76"', add
label define ls2006a_resdur_lbl 77 `"77"', add
label define ls2006a_resdur_lbl 78 `"78"', add
label define ls2006a_resdur_lbl 79 `"79"', add
label define ls2006a_resdur_lbl 80 `"80"', add
label define ls2006a_resdur_lbl 81 `"81"', add
label define ls2006a_resdur_lbl 82 `"82"', add
label define ls2006a_resdur_lbl 83 `"83"', add
label define ls2006a_resdur_lbl 84 `"84"', add
label define ls2006a_resdur_lbl 85 `"85"', add
label define ls2006a_resdur_lbl 86 `"86"', add
label define ls2006a_resdur_lbl 87 `"87"', add
label define ls2006a_resdur_lbl 88 `"88"', add
label define ls2006a_resdur_lbl 89 `"89+"', add
label values ls2006a_resdur ls2006a_resdur_lbl

label define ls2006a_school_lbl 0 `"NIU (not in universe)"'
label define ls2006a_school_lbl 1 `"No, never attended"', add
label define ls2006a_school_lbl 2 `"Yes, still attending"', add
label define ls2006a_school_lbl 3 `"Left school"', add
label values ls2006a_school ls2006a_school_lbl

label define ls2006a_edattain_lbl 00 `"Pre-school"'
label define ls2006a_edattain_lbl 01 `"Standard 1"', add
label define ls2006a_edattain_lbl 02 `"Standard 2"', add
label define ls2006a_edattain_lbl 03 `"Standard 3"', add
label define ls2006a_edattain_lbl 04 `"Standard 4"', add
label define ls2006a_edattain_lbl 05 `"Standard 5"', add
label define ls2006a_edattain_lbl 06 `"Standard 6"', add
label define ls2006a_edattain_lbl 07 `"Standard 7"', add
label define ls2006a_edattain_lbl 11 `"Form 1"', add
label define ls2006a_edattain_lbl 12 `"Form 2"', add
label define ls2006a_edattain_lbl 13 `"Form 3"', add
label define ls2006a_edattain_lbl 14 `"Form 4"', add
label define ls2006a_edattain_lbl 15 `"Form 5"', add
label define ls2006a_edattain_lbl 20 `"Diploma or certificate after primary"', add
label define ls2006a_edattain_lbl 21 `"Vocational training after primary"', add
label define ls2006a_edattain_lbl 22 `"Diploma or certificate after secondary"', add
label define ls2006a_edattain_lbl 23 `"Vocational training after secondary"', add
label define ls2006a_edattain_lbl 24 `"Diploma or certificate after high school"', add
label define ls2006a_edattain_lbl 25 `"Vocational training after high school"', add
label define ls2006a_edattain_lbl 26 `"Graduate"', add
label define ls2006a_edattain_lbl 27 `"Post graduate"', add
label define ls2006a_edattain_lbl 28 `"Non-formal education"', add
label define ls2006a_edattain_lbl 30 `"Other"', add
label define ls2006a_edattain_lbl 29 `"None"', add
label define ls2006a_edattain_lbl 99 `"NIU (not in universe)"', add
label values ls2006a_edattain ls2006a_edattain_lbl

label define ls2006a_lit_lbl 1 `"Yes, with ease"'
label define ls2006a_lit_lbl 2 `"Yes, with difficulty"', add
label define ls2006a_lit_lbl 3 `"Illiterate, not at all"', add
label define ls2006a_lit_lbl 4 `"Blind"', add
label define ls2006a_lit_lbl 5 `"No card with required language"', add
label define ls2006a_lit_lbl 6 `"Pre-school"', add
label define ls2006a_lit_lbl 9 `"NIU (not in universe)"', add
label values ls2006a_lit ls2006a_lit_lbl

label define ls2006a_activity_lbl 00 `"NIU (not in universe) "'
label define ls2006a_activity_lbl 10 `"Employer"', add
label define ls2006a_activity_lbl 20 `"Own account worker or farmer"', add
label define ls2006a_activity_lbl 31 `"Regular wages or salary earner"', add
label define ls2006a_activity_lbl 32 `"Casual worker"', add
label define ls2006a_activity_lbl 40 `"Unpaid family worker"', add
label define ls2006a_activity_lbl 50 `"Job seeking"', add
label define ls2006a_activity_lbl 55 `"Job seeking for the first time"', add
label define ls2006a_activity_lbl 60 `"Homemaker"', add
label define ls2006a_activity_lbl 65 `"Housewife"', add
label define ls2006a_activity_lbl 70 `"Retired"', add
label define ls2006a_activity_lbl 80 `"Student"', add
label define ls2006a_activity_lbl 90 `"Disabled"', add
label define ls2006a_activity_lbl 95 `"Other"', add
label define ls2006a_activity_lbl 99 `"Unknown"', add
label values ls2006a_activity ls2006a_activity_lbl

label define ls2006a_empstat12_lbl 00 `"NIU (not in universe)"'
label define ls2006a_empstat12_lbl 20 `"Own account worker, farmer or employer"', add
label define ls2006a_empstat12_lbl 31 `"Regular wages or salary earner"', add
label define ls2006a_empstat12_lbl 32 `"Casual worker"', add
label define ls2006a_empstat12_lbl 40 `"Unpaid family worker or homemaker"', add
label define ls2006a_empstat12_lbl 50 `"Job seeking"', add
label define ls2006a_empstat12_lbl 55 `"Job seeking for the first time"', add
label define ls2006a_empstat12_lbl 65 `"Housewife"', add
label define ls2006a_empstat12_lbl 80 `"Student"', add
label define ls2006a_empstat12_lbl 95 `"Other"', add
label define ls2006a_empstat12_lbl 99 `"Unknown"', add
label values ls2006a_empstat12 ls2006a_empstat12_lbl

label define ls2006a_classwk_lbl 1 `"Government"'
label define ls2006a_classwk_lbl 2 `"Parastatal"', add
label define ls2006a_classwk_lbl 3 `"Private"', add
label define ls2006a_classwk_lbl 4 `"South Africa"', add
label define ls2006a_classwk_lbl 5 `"Other"', add
label define ls2006a_classwk_lbl 8 `"Job seeking"', add
label define ls2006a_classwk_lbl 9 `"NIU (not in universe)"', add
label values ls2006a_classwk ls2006a_classwk_lbl

label define ls2006a_occ_lbl 00 `"NIU (not in universe)"'
label define ls2006a_occ_lbl 01 `"Armed forces"', add
label define ls2006a_occ_lbl 11 `"Legislators and senior officials"', add
label define ls2006a_occ_lbl 12 `"Corporate managers"', add
label define ls2006a_occ_lbl 13 `"General managers"', add
label define ls2006a_occ_lbl 21 `"Physical mathematical and engineering scientists"', add
label define ls2006a_occ_lbl 22 `"Life science and health professionals"', add
label define ls2006a_occ_lbl 23 `"Teaching professionals"', add
label define ls2006a_occ_lbl 24 `"Other professionals"', add
label define ls2006a_occ_lbl 31 `"Physical and engineer science associate professionals"', add
label define ls2006a_occ_lbl 32 `"Life science and health associate professionals"', add
label define ls2006a_occ_lbl 33 `"Teaching associate professionals"', add
label define ls2006a_occ_lbl 34 `"Other associate professionals"', add
label define ls2006a_occ_lbl 41 `"Office clerks"', add
label define ls2006a_occ_lbl 42 `"Customer services clerks"', add
label define ls2006a_occ_lbl 51 `"Personal and protective services workers"', add
label define ls2006a_occ_lbl 52 `"Models, salespersons and demonstrators"', add
label define ls2006a_occ_lbl 61 `"Market-oriented skilled ag and fish workers"', add
label define ls2006a_occ_lbl 62 `"Subsistence agricultural and fishery workers"', add
label define ls2006a_occ_lbl 71 `"Extraction and building trades workers"', add
label define ls2006a_occ_lbl 72 `"Metal, machinery, and related trades"', add
label define ls2006a_occ_lbl 73 `"Precision, handicraft, printing, and related occupations"', add
label define ls2006a_occ_lbl 74 `"Other craft and related trades workers"', add
label define ls2006a_occ_lbl 81 `"Stationary-plant and related operators"', add
label define ls2006a_occ_lbl 82 `"Machine operators and assemblers"', add
label define ls2006a_occ_lbl 83 `"Drivers and mobile plant operators"', add
label define ls2006a_occ_lbl 91 `"Sales and services elementary occupations"', add
label define ls2006a_occ_lbl 92 `"Agriculture, fishery, and related laborers"', add
label define ls2006a_occ_lbl 93 `"Laborers in mining, construction, manufacture, and transport"', add
label define ls2006a_occ_lbl 98 `"Job seeking"', add
label values ls2006a_occ ls2006a_occ_lbl

label define ls2006a_ind_lbl 00 `"NIU (not in universe)"'
label define ls2006a_ind_lbl 01 `"Agriculture"', add
label define ls2006a_ind_lbl 02 `"Fishing"', add
label define ls2006a_ind_lbl 03 `"Mining or quarrying"', add
label define ls2006a_ind_lbl 04 `"Manufacturing or processing"', add
label define ls2006a_ind_lbl 05 `"Electricity"', add
label define ls2006a_ind_lbl 06 `"Construction"', add
label define ls2006a_ind_lbl 07 `"Wholesale and retail, repair of motor vehicles, personal and household goods"', add
label define ls2006a_ind_lbl 08 `"Hotels  and restaurants"', add
label define ls2006a_ind_lbl 09 `"Transport, storage and communication"', add
label define ls2006a_ind_lbl 10 `"Financial intermediation"', add
label define ls2006a_ind_lbl 11 `"Real estate, renting  and business activities"', add
label define ls2006a_ind_lbl 12 `"Public administration, defense, comp. social service"', add
label define ls2006a_ind_lbl 13 `"Education"', add
label define ls2006a_ind_lbl 14 `"Health and social work"', add
label define ls2006a_ind_lbl 15 `"Other community, social and personal services"', add
label define ls2006a_ind_lbl 16 `"Private households"', add
label define ls2006a_ind_lbl 17 `"Extra territorial organizations bodies"', add
label define ls2006a_ind_lbl 88 `"Job seeking"', add
label values ls2006a_ind ls2006a_ind_lbl

label define ls2006a_wkloc_lbl 00 `"NIU (not in universe)"'
label define ls2006a_wkloc_lbl 01 `"Butha-Buthe"', add
label define ls2006a_wkloc_lbl 02 `"Leribe"', add
label define ls2006a_wkloc_lbl 03 `"Berea"', add
label define ls2006a_wkloc_lbl 04 `"Maseru"', add
label define ls2006a_wkloc_lbl 05 `"Mafeteng"', add
label define ls2006a_wkloc_lbl 06 `"Mohale's Hoek"', add
label define ls2006a_wkloc_lbl 07 `"Quthing"', add
label define ls2006a_wkloc_lbl 08 `"Qacha's Nek"', add
label define ls2006a_wkloc_lbl 09 `"Mokhotlong"', add
label define ls2006a_wkloc_lbl 10 `"Thaba-Tseka"', add
label define ls2006a_wkloc_lbl 11 `"Same village "', add
label define ls2006a_wkloc_lbl 12 `"Different village in the same district "', add
label define ls2006a_wkloc_lbl 13 `"South Africa"', add
label define ls2006a_wkloc_lbl 14 `"Other countries"', add
label define ls2006a_wkloc_lbl 88 `"Job seeking"', add
label values ls2006a_wkloc ls2006a_wkloc_lbl

label define ls2006a_wkurb_lbl 00 `"NIU (not in universe)"'
label define ls2006a_wkurb_lbl 01 `"Butha-Buthe"', add
label define ls2006a_wkurb_lbl 02 `"Hlotse"', add
label define ls2006a_wkurb_lbl 03 `"Maputsoe"', add
label define ls2006a_wkurb_lbl 04 `"Teyateyaneng"', add
label define ls2006a_wkurb_lbl 05 `"Maseru"', add
label define ls2006a_wkurb_lbl 06 `"Semonkong"', add
label define ls2006a_wkurb_lbl 07 `"Mafeteng"', add
label define ls2006a_wkurb_lbl 08 `"Mohale's Hoek"', add
label define ls2006a_wkurb_lbl 09 `"Moyeni"', add
label define ls2006a_wkurb_lbl 10 `"Qacha's Nek"', add
label define ls2006a_wkurb_lbl 11 `"Mokhotlong"', add
label define ls2006a_wkurb_lbl 12 `"Thaha-Tseka "', add
label define ls2006a_wkurb_lbl 13 `"South Africa"', add
label define ls2006a_wkurb_lbl 14 `"Other countries"', add
label define ls2006a_wkurb_lbl 88 `"Job seeking"', add
label values ls2006a_wkurb ls2006a_wkurb_lbl

label define ls2006a_work10yr_lbl 0 `"NIU (not in universe)"'
label define ls2006a_work10yr_lbl 1 `"Never worked"', add
label define ls2006a_work10yr_lbl 2 `"Worked in the past"', add
label define ls2006a_work10yr_lbl 3 `"Presently working in South Africa"', add
label define ls2006a_work10yr_lbl 8 `"Not applicable"', add
label define ls2006a_work10yr_lbl 9 `"Unknown "', add
label values ls2006a_work10yr ls2006a_work10yr_lbl

label define ls2006a_workdur_lbl 00 `"Less than 1 year "'
label define ls2006a_workdur_lbl 01 `"1 year"', add
label define ls2006a_workdur_lbl 02 `"2 years"', add
label define ls2006a_workdur_lbl 03 `"3"', add
label define ls2006a_workdur_lbl 04 `"4"', add
label define ls2006a_workdur_lbl 05 `"5"', add
label define ls2006a_workdur_lbl 06 `"6"', add
label define ls2006a_workdur_lbl 07 `"7"', add
label define ls2006a_workdur_lbl 08 `"8"', add
label define ls2006a_workdur_lbl 09 `"9"', add
label define ls2006a_workdur_lbl 10 `"10"', add
label define ls2006a_workdur_lbl 11 `"11"', add
label define ls2006a_workdur_lbl 12 `"12"', add
label define ls2006a_workdur_lbl 13 `"13"', add
label define ls2006a_workdur_lbl 14 `"14"', add
label define ls2006a_workdur_lbl 15 `"15 to 19"', add
label define ls2006a_workdur_lbl 20 `"20+"', add
label define ls2006a_workdur_lbl 98 `"Unknown "', add
label define ls2006a_workdur_lbl 99 `"NIU (not in universe)"', add
label values ls2006a_workdur ls2006a_workdur_lbl

label define famsize_head_lbl 0001 `"1 family member present"'
label define famsize_head_lbl 0002 `"2 family members present"', add
label define famsize_head_lbl 0003 `"3 family members present"', add
label define famsize_head_lbl 0004 `"4"', add
label define famsize_head_lbl 0005 `"5"', add
label define famsize_head_lbl 0006 `"6"', add
label define famsize_head_lbl 0007 `"7"', add
label define famsize_head_lbl 0008 `"8"', add
label define famsize_head_lbl 0009 `"9"', add
label define famsize_head_lbl 0010 `"10"', add
label define famsize_head_lbl 0011 `"11"', add
label define famsize_head_lbl 0012 `"12"', add
label define famsize_head_lbl 0013 `"13"', add
label define famsize_head_lbl 0014 `"14"', add
label define famsize_head_lbl 0015 `"15"', add
label define famsize_head_lbl 0016 `"16"', add
label define famsize_head_lbl 0017 `"17"', add
label define famsize_head_lbl 0018 `"18"', add
label define famsize_head_lbl 0019 `"19"', add
label define famsize_head_lbl 0020 `"20"', add
label define famsize_head_lbl 0021 `"21"', add
label define famsize_head_lbl 0022 `"22"', add
label define famsize_head_lbl 0023 `"23"', add
label define famsize_head_lbl 0024 `"24"', add
label define famsize_head_lbl 0025 `"25"', add
label define famsize_head_lbl 0026 `"26"', add
label define famsize_head_lbl 0027 `"27"', add
label define famsize_head_lbl 0028 `"28"', add
label define famsize_head_lbl 0029 `"29"', add
label define famsize_head_lbl 0030 `"30"', add
label define famsize_head_lbl 0031 `"31"', add
label define famsize_head_lbl 0032 `"32"', add
label define famsize_head_lbl 0033 `"33"', add
label define famsize_head_lbl 0034 `"34"', add
label define famsize_head_lbl 0035 `"35"', add
label define famsize_head_lbl 0036 `"36"', add
label define famsize_head_lbl 0037 `"37"', add
label define famsize_head_lbl 0038 `"38"', add
label define famsize_head_lbl 0039 `"39"', add
label define famsize_head_lbl 0040 `"40"', add
label define famsize_head_lbl 0041 `"41"', add
label define famsize_head_lbl 0042 `"42"', add
label define famsize_head_lbl 0043 `"43"', add
label define famsize_head_lbl 0044 `"44"', add
label define famsize_head_lbl 0045 `"45"', add
label define famsize_head_lbl 0046 `"46"', add
label define famsize_head_lbl 0047 `"47"', add
label define famsize_head_lbl 0048 `"48"', add
label define famsize_head_lbl 0049 `"49"', add
label define famsize_head_lbl 0050 `"50"', add
label define famsize_head_lbl 0051 `"51"', add
label define famsize_head_lbl 0052 `"52"', add
label define famsize_head_lbl 0053 `"53"', add
label define famsize_head_lbl 0054 `"54"', add
label define famsize_head_lbl 0055 `"55"', add
label define famsize_head_lbl 0056 `"56"', add
label define famsize_head_lbl 0057 `"57"', add
label define famsize_head_lbl 0058 `"58"', add
label define famsize_head_lbl 0059 `"59"', add
label define famsize_head_lbl 0060 `"60"', add
label define famsize_head_lbl 0061 `"61"', add
label define famsize_head_lbl 0062 `"62"', add
label define famsize_head_lbl 0063 `"63"', add
label define famsize_head_lbl 0064 `"64"', add
label define famsize_head_lbl 0065 `"65"', add
label define famsize_head_lbl 0066 `"66"', add
label define famsize_head_lbl 0067 `"67"', add
label define famsize_head_lbl 0068 `"68"', add
label define famsize_head_lbl 0069 `"69"', add
label define famsize_head_lbl 0070 `"70"', add
label define famsize_head_lbl 0071 `"71"', add
label define famsize_head_lbl 0072 `"72"', add
label define famsize_head_lbl 0073 `"73"', add
label define famsize_head_lbl 0074 `"74"', add
label define famsize_head_lbl 0075 `"75"', add
label define famsize_head_lbl 0076 `"76"', add
label define famsize_head_lbl 0077 `"77"', add
label define famsize_head_lbl 0078 `"78"', add
label define famsize_head_lbl 0079 `"79"', add
label define famsize_head_lbl 0080 `"80"', add
label define famsize_head_lbl 0081 `"81"', add
label define famsize_head_lbl 0082 `"82"', add
label define famsize_head_lbl 0083 `"83"', add
label define famsize_head_lbl 0084 `"84"', add
label define famsize_head_lbl 0085 `"85"', add
label define famsize_head_lbl 0086 `"86"', add
label define famsize_head_lbl 0087 `"87"', add
label define famsize_head_lbl 0088 `"88"', add
label define famsize_head_lbl 0089 `"89"', add
label define famsize_head_lbl 0090 `"90"', add
label define famsize_head_lbl 0091 `"91"', add
label define famsize_head_lbl 0092 `"92"', add
label define famsize_head_lbl 0093 `"93"', add
label define famsize_head_lbl 0094 `"94"', add
label define famsize_head_lbl 0095 `"95"', add
label define famsize_head_lbl 0096 `"96"', add
label define famsize_head_lbl 0097 `"97"', add
label define famsize_head_lbl 0098 `"98"', add
label define famsize_head_lbl 0099 `"99 or more persons"', add
label values famsize_head famsize_head_lbl

label define famsize_mom_lbl 0001 `"1 family member present"'
label define famsize_mom_lbl 0002 `"2 family members present"', add
label define famsize_mom_lbl 0003 `"3 family members present"', add
label define famsize_mom_lbl 0004 `"4"', add
label define famsize_mom_lbl 0005 `"5"', add
label define famsize_mom_lbl 0006 `"6"', add
label define famsize_mom_lbl 0007 `"7"', add
label define famsize_mom_lbl 0008 `"8"', add
label define famsize_mom_lbl 0009 `"9"', add
label define famsize_mom_lbl 0010 `"10"', add
label define famsize_mom_lbl 0011 `"11"', add
label define famsize_mom_lbl 0012 `"12"', add
label define famsize_mom_lbl 0013 `"13"', add
label define famsize_mom_lbl 0014 `"14"', add
label define famsize_mom_lbl 0015 `"15"', add
label define famsize_mom_lbl 0016 `"16"', add
label define famsize_mom_lbl 0017 `"17"', add
label define famsize_mom_lbl 0018 `"18"', add
label define famsize_mom_lbl 0019 `"19"', add
label define famsize_mom_lbl 0020 `"20"', add
label define famsize_mom_lbl 0021 `"21"', add
label define famsize_mom_lbl 0022 `"22"', add
label define famsize_mom_lbl 0023 `"23"', add
label define famsize_mom_lbl 0024 `"24"', add
label define famsize_mom_lbl 0025 `"25"', add
label define famsize_mom_lbl 0026 `"26"', add
label define famsize_mom_lbl 0027 `"27"', add
label define famsize_mom_lbl 0028 `"28"', add
label define famsize_mom_lbl 0029 `"29"', add
label define famsize_mom_lbl 0030 `"30"', add
label define famsize_mom_lbl 0031 `"31"', add
label define famsize_mom_lbl 0032 `"32"', add
label define famsize_mom_lbl 0033 `"33"', add
label define famsize_mom_lbl 0034 `"34"', add
label define famsize_mom_lbl 0035 `"35"', add
label define famsize_mom_lbl 0036 `"36"', add
label define famsize_mom_lbl 0037 `"37"', add
label define famsize_mom_lbl 0038 `"38"', add
label define famsize_mom_lbl 0039 `"39"', add
label define famsize_mom_lbl 0040 `"40"', add
label define famsize_mom_lbl 0041 `"41"', add
label define famsize_mom_lbl 0042 `"42"', add
label define famsize_mom_lbl 0043 `"43"', add
label define famsize_mom_lbl 0044 `"44"', add
label define famsize_mom_lbl 0045 `"45"', add
label define famsize_mom_lbl 0046 `"46"', add
label define famsize_mom_lbl 0047 `"47"', add
label define famsize_mom_lbl 0048 `"48"', add
label define famsize_mom_lbl 0049 `"49"', add
label define famsize_mom_lbl 0050 `"50"', add
label define famsize_mom_lbl 0051 `"51"', add
label define famsize_mom_lbl 0052 `"52"', add
label define famsize_mom_lbl 0053 `"53"', add
label define famsize_mom_lbl 0054 `"54"', add
label define famsize_mom_lbl 0055 `"55"', add
label define famsize_mom_lbl 0056 `"56"', add
label define famsize_mom_lbl 0057 `"57"', add
label define famsize_mom_lbl 0058 `"58"', add
label define famsize_mom_lbl 0059 `"59"', add
label define famsize_mom_lbl 0060 `"60"', add
label define famsize_mom_lbl 0061 `"61"', add
label define famsize_mom_lbl 0062 `"62"', add
label define famsize_mom_lbl 0063 `"63"', add
label define famsize_mom_lbl 0064 `"64"', add
label define famsize_mom_lbl 0065 `"65"', add
label define famsize_mom_lbl 0066 `"66"', add
label define famsize_mom_lbl 0067 `"67"', add
label define famsize_mom_lbl 0068 `"68"', add
label define famsize_mom_lbl 0069 `"69"', add
label define famsize_mom_lbl 0070 `"70"', add
label define famsize_mom_lbl 0071 `"71"', add
label define famsize_mom_lbl 0072 `"72"', add
label define famsize_mom_lbl 0073 `"73"', add
label define famsize_mom_lbl 0074 `"74"', add
label define famsize_mom_lbl 0075 `"75"', add
label define famsize_mom_lbl 0076 `"76"', add
label define famsize_mom_lbl 0077 `"77"', add
label define famsize_mom_lbl 0078 `"78"', add
label define famsize_mom_lbl 0079 `"79"', add
label define famsize_mom_lbl 0080 `"80"', add
label define famsize_mom_lbl 0081 `"81"', add
label define famsize_mom_lbl 0082 `"82"', add
label define famsize_mom_lbl 0083 `"83"', add
label define famsize_mom_lbl 0084 `"84"', add
label define famsize_mom_lbl 0085 `"85"', add
label define famsize_mom_lbl 0086 `"86"', add
label define famsize_mom_lbl 0087 `"87"', add
label define famsize_mom_lbl 0088 `"88"', add
label define famsize_mom_lbl 0089 `"89"', add
label define famsize_mom_lbl 0090 `"90"', add
label define famsize_mom_lbl 0091 `"91"', add
label define famsize_mom_lbl 0092 `"92"', add
label define famsize_mom_lbl 0093 `"93"', add
label define famsize_mom_lbl 0094 `"94"', add
label define famsize_mom_lbl 0095 `"95"', add
label define famsize_mom_lbl 0096 `"96"', add
label define famsize_mom_lbl 0097 `"97"', add
label define famsize_mom_lbl 0098 `"98"', add
label define famsize_mom_lbl 0099 `"99 or more persons"', add
label values famsize_mom famsize_mom_lbl

label define famsize_pop_lbl 0001 `"1 family member present"'
label define famsize_pop_lbl 0002 `"2 family members present"', add
label define famsize_pop_lbl 0003 `"3 family members present"', add
label define famsize_pop_lbl 0004 `"4"', add
label define famsize_pop_lbl 0005 `"5"', add
label define famsize_pop_lbl 0006 `"6"', add
label define famsize_pop_lbl 0007 `"7"', add
label define famsize_pop_lbl 0008 `"8"', add
label define famsize_pop_lbl 0009 `"9"', add
label define famsize_pop_lbl 0010 `"10"', add
label define famsize_pop_lbl 0011 `"11"', add
label define famsize_pop_lbl 0012 `"12"', add
label define famsize_pop_lbl 0013 `"13"', add
label define famsize_pop_lbl 0014 `"14"', add
label define famsize_pop_lbl 0015 `"15"', add
label define famsize_pop_lbl 0016 `"16"', add
label define famsize_pop_lbl 0017 `"17"', add
label define famsize_pop_lbl 0018 `"18"', add
label define famsize_pop_lbl 0019 `"19"', add
label define famsize_pop_lbl 0020 `"20"', add
label define famsize_pop_lbl 0021 `"21"', add
label define famsize_pop_lbl 0022 `"22"', add
label define famsize_pop_lbl 0023 `"23"', add
label define famsize_pop_lbl 0024 `"24"', add
label define famsize_pop_lbl 0025 `"25"', add
label define famsize_pop_lbl 0026 `"26"', add
label define famsize_pop_lbl 0027 `"27"', add
label define famsize_pop_lbl 0028 `"28"', add
label define famsize_pop_lbl 0029 `"29"', add
label define famsize_pop_lbl 0030 `"30"', add
label define famsize_pop_lbl 0031 `"31"', add
label define famsize_pop_lbl 0032 `"32"', add
label define famsize_pop_lbl 0033 `"33"', add
label define famsize_pop_lbl 0034 `"34"', add
label define famsize_pop_lbl 0035 `"35"', add
label define famsize_pop_lbl 0036 `"36"', add
label define famsize_pop_lbl 0037 `"37"', add
label define famsize_pop_lbl 0038 `"38"', add
label define famsize_pop_lbl 0039 `"39"', add
label define famsize_pop_lbl 0040 `"40"', add
label define famsize_pop_lbl 0041 `"41"', add
label define famsize_pop_lbl 0042 `"42"', add
label define famsize_pop_lbl 0043 `"43"', add
label define famsize_pop_lbl 0044 `"44"', add
label define famsize_pop_lbl 0045 `"45"', add
label define famsize_pop_lbl 0046 `"46"', add
label define famsize_pop_lbl 0047 `"47"', add
label define famsize_pop_lbl 0048 `"48"', add
label define famsize_pop_lbl 0049 `"49"', add
label define famsize_pop_lbl 0050 `"50"', add
label define famsize_pop_lbl 0051 `"51"', add
label define famsize_pop_lbl 0052 `"52"', add
label define famsize_pop_lbl 0053 `"53"', add
label define famsize_pop_lbl 0054 `"54"', add
label define famsize_pop_lbl 0055 `"55"', add
label define famsize_pop_lbl 0056 `"56"', add
label define famsize_pop_lbl 0057 `"57"', add
label define famsize_pop_lbl 0058 `"58"', add
label define famsize_pop_lbl 0059 `"59"', add
label define famsize_pop_lbl 0060 `"60"', add
label define famsize_pop_lbl 0061 `"61"', add
label define famsize_pop_lbl 0062 `"62"', add
label define famsize_pop_lbl 0063 `"63"', add
label define famsize_pop_lbl 0064 `"64"', add
label define famsize_pop_lbl 0065 `"65"', add
label define famsize_pop_lbl 0066 `"66"', add
label define famsize_pop_lbl 0067 `"67"', add
label define famsize_pop_lbl 0068 `"68"', add
label define famsize_pop_lbl 0069 `"69"', add
label define famsize_pop_lbl 0070 `"70"', add
label define famsize_pop_lbl 0071 `"71"', add
label define famsize_pop_lbl 0072 `"72"', add
label define famsize_pop_lbl 0073 `"73"', add
label define famsize_pop_lbl 0074 `"74"', add
label define famsize_pop_lbl 0075 `"75"', add
label define famsize_pop_lbl 0076 `"76"', add
label define famsize_pop_lbl 0077 `"77"', add
label define famsize_pop_lbl 0078 `"78"', add
label define famsize_pop_lbl 0079 `"79"', add
label define famsize_pop_lbl 0080 `"80"', add
label define famsize_pop_lbl 0081 `"81"', add
label define famsize_pop_lbl 0082 `"82"', add
label define famsize_pop_lbl 0083 `"83"', add
label define famsize_pop_lbl 0084 `"84"', add
label define famsize_pop_lbl 0085 `"85"', add
label define famsize_pop_lbl 0086 `"86"', add
label define famsize_pop_lbl 0087 `"87"', add
label define famsize_pop_lbl 0088 `"88"', add
label define famsize_pop_lbl 0089 `"89"', add
label define famsize_pop_lbl 0090 `"90"', add
label define famsize_pop_lbl 0091 `"91"', add
label define famsize_pop_lbl 0092 `"92"', add
label define famsize_pop_lbl 0093 `"93"', add
label define famsize_pop_lbl 0094 `"94"', add
label define famsize_pop_lbl 0095 `"95"', add
label define famsize_pop_lbl 0096 `"96"', add
label define famsize_pop_lbl 0097 `"97"', add
label define famsize_pop_lbl 0098 `"98"', add
label define famsize_pop_lbl 0099 `"99 or more persons"', add
label values famsize_pop famsize_pop_lbl

label define famsize_sp_lbl 0001 `"1 family member present"'
label define famsize_sp_lbl 0002 `"2 family members present"', add
label define famsize_sp_lbl 0003 `"3 family members present"', add
label define famsize_sp_lbl 0004 `"4"', add
label define famsize_sp_lbl 0005 `"5"', add
label define famsize_sp_lbl 0006 `"6"', add
label define famsize_sp_lbl 0007 `"7"', add
label define famsize_sp_lbl 0008 `"8"', add
label define famsize_sp_lbl 0009 `"9"', add
label define famsize_sp_lbl 0010 `"10"', add
label define famsize_sp_lbl 0011 `"11"', add
label define famsize_sp_lbl 0012 `"12"', add
label define famsize_sp_lbl 0013 `"13"', add
label define famsize_sp_lbl 0014 `"14"', add
label define famsize_sp_lbl 0015 `"15"', add
label define famsize_sp_lbl 0016 `"16"', add
label define famsize_sp_lbl 0017 `"17"', add
label define famsize_sp_lbl 0018 `"18"', add
label define famsize_sp_lbl 0019 `"19"', add
label define famsize_sp_lbl 0020 `"20"', add
label define famsize_sp_lbl 0021 `"21"', add
label define famsize_sp_lbl 0022 `"22"', add
label define famsize_sp_lbl 0023 `"23"', add
label define famsize_sp_lbl 0024 `"24"', add
label define famsize_sp_lbl 0025 `"25"', add
label define famsize_sp_lbl 0026 `"26"', add
label define famsize_sp_lbl 0027 `"27"', add
label define famsize_sp_lbl 0028 `"28"', add
label define famsize_sp_lbl 0029 `"29"', add
label define famsize_sp_lbl 0030 `"30"', add
label define famsize_sp_lbl 0031 `"31"', add
label define famsize_sp_lbl 0032 `"32"', add
label define famsize_sp_lbl 0033 `"33"', add
label define famsize_sp_lbl 0034 `"34"', add
label define famsize_sp_lbl 0035 `"35"', add
label define famsize_sp_lbl 0036 `"36"', add
label define famsize_sp_lbl 0037 `"37"', add
label define famsize_sp_lbl 0038 `"38"', add
label define famsize_sp_lbl 0039 `"39"', add
label define famsize_sp_lbl 0040 `"40"', add
label define famsize_sp_lbl 0041 `"41"', add
label define famsize_sp_lbl 0042 `"42"', add
label define famsize_sp_lbl 0043 `"43"', add
label define famsize_sp_lbl 0044 `"44"', add
label define famsize_sp_lbl 0045 `"45"', add
label define famsize_sp_lbl 0046 `"46"', add
label define famsize_sp_lbl 0047 `"47"', add
label define famsize_sp_lbl 0048 `"48"', add
label define famsize_sp_lbl 0049 `"49"', add
label define famsize_sp_lbl 0050 `"50"', add
label define famsize_sp_lbl 0051 `"51"', add
label define famsize_sp_lbl 0052 `"52"', add
label define famsize_sp_lbl 0053 `"53"', add
label define famsize_sp_lbl 0054 `"54"', add
label define famsize_sp_lbl 0055 `"55"', add
label define famsize_sp_lbl 0056 `"56"', add
label define famsize_sp_lbl 0057 `"57"', add
label define famsize_sp_lbl 0058 `"58"', add
label define famsize_sp_lbl 0059 `"59"', add
label define famsize_sp_lbl 0060 `"60"', add
label define famsize_sp_lbl 0061 `"61"', add
label define famsize_sp_lbl 0062 `"62"', add
label define famsize_sp_lbl 0063 `"63"', add
label define famsize_sp_lbl 0064 `"64"', add
label define famsize_sp_lbl 0065 `"65"', add
label define famsize_sp_lbl 0066 `"66"', add
label define famsize_sp_lbl 0067 `"67"', add
label define famsize_sp_lbl 0068 `"68"', add
label define famsize_sp_lbl 0069 `"69"', add
label define famsize_sp_lbl 0070 `"70"', add
label define famsize_sp_lbl 0071 `"71"', add
label define famsize_sp_lbl 0072 `"72"', add
label define famsize_sp_lbl 0073 `"73"', add
label define famsize_sp_lbl 0074 `"74"', add
label define famsize_sp_lbl 0075 `"75"', add
label define famsize_sp_lbl 0076 `"76"', add
label define famsize_sp_lbl 0077 `"77"', add
label define famsize_sp_lbl 0078 `"78"', add
label define famsize_sp_lbl 0079 `"79"', add
label define famsize_sp_lbl 0080 `"80"', add
label define famsize_sp_lbl 0081 `"81"', add
label define famsize_sp_lbl 0082 `"82"', add
label define famsize_sp_lbl 0083 `"83"', add
label define famsize_sp_lbl 0084 `"84"', add
label define famsize_sp_lbl 0085 `"85"', add
label define famsize_sp_lbl 0086 `"86"', add
label define famsize_sp_lbl 0087 `"87"', add
label define famsize_sp_lbl 0088 `"88"', add
label define famsize_sp_lbl 0089 `"89"', add
label define famsize_sp_lbl 0090 `"90"', add
label define famsize_sp_lbl 0091 `"91"', add
label define famsize_sp_lbl 0092 `"92"', add
label define famsize_sp_lbl 0093 `"93"', add
label define famsize_sp_lbl 0094 `"94"', add
label define famsize_sp_lbl 0095 `"95"', add
label define famsize_sp_lbl 0096 `"96"', add
label define famsize_sp_lbl 0097 `"97"', add
label define famsize_sp_lbl 0098 `"98"', add
label define famsize_sp_lbl 0099 `"99 or more persons"', add
label values famsize_sp famsize_sp_lbl

label define nchild_head_lbl 00 `"0"'
label define nchild_head_lbl 01 `"1"', add
label define nchild_head_lbl 02 `"2"', add
label define nchild_head_lbl 03 `"3"', add
label define nchild_head_lbl 04 `"4"', add
label define nchild_head_lbl 05 `"5"', add
label define nchild_head_lbl 06 `"6"', add
label define nchild_head_lbl 07 `"7"', add
label define nchild_head_lbl 08 `"8"', add
label define nchild_head_lbl 09 `"9 or more children in household"', add
label values nchild_head nchild_head_lbl

label define nchild_mom_lbl 00 `"0"'
label define nchild_mom_lbl 01 `"1"', add
label define nchild_mom_lbl 02 `"2"', add
label define nchild_mom_lbl 03 `"3"', add
label define nchild_mom_lbl 04 `"4"', add
label define nchild_mom_lbl 05 `"5"', add
label define nchild_mom_lbl 06 `"6"', add
label define nchild_mom_lbl 07 `"7"', add
label define nchild_mom_lbl 08 `"8"', add
label define nchild_mom_lbl 09 `"9 or more children in household"', add
label values nchild_mom nchild_mom_lbl

label define nchild_pop_lbl 00 `"0"'
label define nchild_pop_lbl 01 `"1"', add
label define nchild_pop_lbl 02 `"2"', add
label define nchild_pop_lbl 03 `"3"', add
label define nchild_pop_lbl 04 `"4"', add
label define nchild_pop_lbl 05 `"5"', add
label define nchild_pop_lbl 06 `"6"', add
label define nchild_pop_lbl 07 `"7"', add
label define nchild_pop_lbl 08 `"8"', add
label define nchild_pop_lbl 09 `"9 or more children in household"', add
label values nchild_pop nchild_pop_lbl

label define nchild_sp_lbl 00 `"0"'
label define nchild_sp_lbl 01 `"1"', add
label define nchild_sp_lbl 02 `"2"', add
label define nchild_sp_lbl 03 `"3"', add
label define nchild_sp_lbl 04 `"4"', add
label define nchild_sp_lbl 05 `"5"', add
label define nchild_sp_lbl 06 `"6"', add
label define nchild_sp_lbl 07 `"7"', add
label define nchild_sp_lbl 08 `"8"', add
label define nchild_sp_lbl 09 `"9 or more children in household"', add
label values nchild_sp nchild_sp_lbl

label define nchlt5_head_lbl 00 `"0"'
label define nchlt5_head_lbl 01 `"1"', add
label define nchlt5_head_lbl 02 `"2"', add
label define nchlt5_head_lbl 03 `"3"', add
label define nchlt5_head_lbl 04 `"4"', add
label define nchlt5_head_lbl 05 `"5"', add
label define nchlt5_head_lbl 06 `"6"', add
label define nchlt5_head_lbl 07 `"7"', add
label define nchlt5_head_lbl 08 `"8"', add
label define nchlt5_head_lbl 09 `"9 or more own children under age 5 in household"', add
label define nchlt5_head_lbl 98 `"One or more children have unknown age"', add
label values nchlt5_head nchlt5_head_lbl

label define nchlt5_mom_lbl 00 `"0"'
label define nchlt5_mom_lbl 01 `"1"', add
label define nchlt5_mom_lbl 02 `"2"', add
label define nchlt5_mom_lbl 03 `"3"', add
label define nchlt5_mom_lbl 04 `"4"', add
label define nchlt5_mom_lbl 05 `"5"', add
label define nchlt5_mom_lbl 06 `"6"', add
label define nchlt5_mom_lbl 07 `"7"', add
label define nchlt5_mom_lbl 08 `"8"', add
label define nchlt5_mom_lbl 09 `"9 or more own children under age 5 in household"', add
label define nchlt5_mom_lbl 98 `"One or more children have unknown age"', add
label values nchlt5_mom nchlt5_mom_lbl

label define nchlt5_pop_lbl 00 `"0"'
label define nchlt5_pop_lbl 01 `"1"', add
label define nchlt5_pop_lbl 02 `"2"', add
label define nchlt5_pop_lbl 03 `"3"', add
label define nchlt5_pop_lbl 04 `"4"', add
label define nchlt5_pop_lbl 05 `"5"', add
label define nchlt5_pop_lbl 06 `"6"', add
label define nchlt5_pop_lbl 07 `"7"', add
label define nchlt5_pop_lbl 08 `"8"', add
label define nchlt5_pop_lbl 09 `"9 or more own children under age 5 in household"', add
label define nchlt5_pop_lbl 98 `"One or more children have unknown age"', add
label values nchlt5_pop nchlt5_pop_lbl

label define nchlt5_sp_lbl 00 `"0"'
label define nchlt5_sp_lbl 01 `"1"', add
label define nchlt5_sp_lbl 02 `"2"', add
label define nchlt5_sp_lbl 03 `"3"', add
label define nchlt5_sp_lbl 04 `"4"', add
label define nchlt5_sp_lbl 05 `"5"', add
label define nchlt5_sp_lbl 06 `"6"', add
label define nchlt5_sp_lbl 07 `"7"', add
label define nchlt5_sp_lbl 08 `"8"', add
label define nchlt5_sp_lbl 09 `"9 or more own children under age 5 in household"', add
label define nchlt5_sp_lbl 98 `"One or more children have unknown age"', add
label values nchlt5_sp nchlt5_sp_lbl

label define eldch_head_lbl 00 `"0"'
label define eldch_head_lbl 01 `"1"', add
label define eldch_head_lbl 02 `"2"', add
label define eldch_head_lbl 03 `"3"', add
label define eldch_head_lbl 04 `"4"', add
label define eldch_head_lbl 05 `"5"', add
label define eldch_head_lbl 06 `"6"', add
label define eldch_head_lbl 07 `"7"', add
label define eldch_head_lbl 08 `"8"', add
label define eldch_head_lbl 09 `"9"', add
label define eldch_head_lbl 10 `"10"', add
label define eldch_head_lbl 11 `"11"', add
label define eldch_head_lbl 12 `"12"', add
label define eldch_head_lbl 13 `"13"', add
label define eldch_head_lbl 14 `"14"', add
label define eldch_head_lbl 15 `"15"', add
label define eldch_head_lbl 16 `"16"', add
label define eldch_head_lbl 17 `"17"', add
label define eldch_head_lbl 18 `"18"', add
label define eldch_head_lbl 19 `"19"', add
label define eldch_head_lbl 20 `"20"', add
label define eldch_head_lbl 21 `"21"', add
label define eldch_head_lbl 22 `"22"', add
label define eldch_head_lbl 23 `"23"', add
label define eldch_head_lbl 24 `"24"', add
label define eldch_head_lbl 25 `"25"', add
label define eldch_head_lbl 26 `"26"', add
label define eldch_head_lbl 27 `"27"', add
label define eldch_head_lbl 28 `"28"', add
label define eldch_head_lbl 29 `"29"', add
label define eldch_head_lbl 30 `"30"', add
label define eldch_head_lbl 31 `"31"', add
label define eldch_head_lbl 32 `"32"', add
label define eldch_head_lbl 33 `"33"', add
label define eldch_head_lbl 34 `"34"', add
label define eldch_head_lbl 35 `"35"', add
label define eldch_head_lbl 36 `"36"', add
label define eldch_head_lbl 37 `"37"', add
label define eldch_head_lbl 38 `"38"', add
label define eldch_head_lbl 39 `"39"', add
label define eldch_head_lbl 40 `"40"', add
label define eldch_head_lbl 41 `"41"', add
label define eldch_head_lbl 42 `"42"', add
label define eldch_head_lbl 43 `"43"', add
label define eldch_head_lbl 44 `"44"', add
label define eldch_head_lbl 45 `"45"', add
label define eldch_head_lbl 46 `"46"', add
label define eldch_head_lbl 47 `"47"', add
label define eldch_head_lbl 48 `"48"', add
label define eldch_head_lbl 49 `"49"', add
label define eldch_head_lbl 50 `"50 or older"', add
label define eldch_head_lbl 98 `"One or more children have unknown age"', add
label define eldch_head_lbl 99 `"No own child in household"', add
label values eldch_head eldch_head_lbl

label define eldch_mom_lbl 00 `"0"'
label define eldch_mom_lbl 01 `"1"', add
label define eldch_mom_lbl 02 `"2"', add
label define eldch_mom_lbl 03 `"3"', add
label define eldch_mom_lbl 04 `"4"', add
label define eldch_mom_lbl 05 `"5"', add
label define eldch_mom_lbl 06 `"6"', add
label define eldch_mom_lbl 07 `"7"', add
label define eldch_mom_lbl 08 `"8"', add
label define eldch_mom_lbl 09 `"9"', add
label define eldch_mom_lbl 10 `"10"', add
label define eldch_mom_lbl 11 `"11"', add
label define eldch_mom_lbl 12 `"12"', add
label define eldch_mom_lbl 13 `"13"', add
label define eldch_mom_lbl 14 `"14"', add
label define eldch_mom_lbl 15 `"15"', add
label define eldch_mom_lbl 16 `"16"', add
label define eldch_mom_lbl 17 `"17"', add
label define eldch_mom_lbl 18 `"18"', add
label define eldch_mom_lbl 19 `"19"', add
label define eldch_mom_lbl 20 `"20"', add
label define eldch_mom_lbl 21 `"21"', add
label define eldch_mom_lbl 22 `"22"', add
label define eldch_mom_lbl 23 `"23"', add
label define eldch_mom_lbl 24 `"24"', add
label define eldch_mom_lbl 25 `"25"', add
label define eldch_mom_lbl 26 `"26"', add
label define eldch_mom_lbl 27 `"27"', add
label define eldch_mom_lbl 28 `"28"', add
label define eldch_mom_lbl 29 `"29"', add
label define eldch_mom_lbl 30 `"30"', add
label define eldch_mom_lbl 31 `"31"', add
label define eldch_mom_lbl 32 `"32"', add
label define eldch_mom_lbl 33 `"33"', add
label define eldch_mom_lbl 34 `"34"', add
label define eldch_mom_lbl 35 `"35"', add
label define eldch_mom_lbl 36 `"36"', add
label define eldch_mom_lbl 37 `"37"', add
label define eldch_mom_lbl 38 `"38"', add
label define eldch_mom_lbl 39 `"39"', add
label define eldch_mom_lbl 40 `"40"', add
label define eldch_mom_lbl 41 `"41"', add
label define eldch_mom_lbl 42 `"42"', add
label define eldch_mom_lbl 43 `"43"', add
label define eldch_mom_lbl 44 `"44"', add
label define eldch_mom_lbl 45 `"45"', add
label define eldch_mom_lbl 46 `"46"', add
label define eldch_mom_lbl 47 `"47"', add
label define eldch_mom_lbl 48 `"48"', add
label define eldch_mom_lbl 49 `"49"', add
label define eldch_mom_lbl 50 `"50 or older"', add
label define eldch_mom_lbl 98 `"One or more children have unknown age"', add
label define eldch_mom_lbl 99 `"No own child in household"', add
label values eldch_mom eldch_mom_lbl

label define eldch_pop_lbl 00 `"0"'
label define eldch_pop_lbl 01 `"1"', add
label define eldch_pop_lbl 02 `"2"', add
label define eldch_pop_lbl 03 `"3"', add
label define eldch_pop_lbl 04 `"4"', add
label define eldch_pop_lbl 05 `"5"', add
label define eldch_pop_lbl 06 `"6"', add
label define eldch_pop_lbl 07 `"7"', add
label define eldch_pop_lbl 08 `"8"', add
label define eldch_pop_lbl 09 `"9"', add
label define eldch_pop_lbl 10 `"10"', add
label define eldch_pop_lbl 11 `"11"', add
label define eldch_pop_lbl 12 `"12"', add
label define eldch_pop_lbl 13 `"13"', add
label define eldch_pop_lbl 14 `"14"', add
label define eldch_pop_lbl 15 `"15"', add
label define eldch_pop_lbl 16 `"16"', add
label define eldch_pop_lbl 17 `"17"', add
label define eldch_pop_lbl 18 `"18"', add
label define eldch_pop_lbl 19 `"19"', add
label define eldch_pop_lbl 20 `"20"', add
label define eldch_pop_lbl 21 `"21"', add
label define eldch_pop_lbl 22 `"22"', add
label define eldch_pop_lbl 23 `"23"', add
label define eldch_pop_lbl 24 `"24"', add
label define eldch_pop_lbl 25 `"25"', add
label define eldch_pop_lbl 26 `"26"', add
label define eldch_pop_lbl 27 `"27"', add
label define eldch_pop_lbl 28 `"28"', add
label define eldch_pop_lbl 29 `"29"', add
label define eldch_pop_lbl 30 `"30"', add
label define eldch_pop_lbl 31 `"31"', add
label define eldch_pop_lbl 32 `"32"', add
label define eldch_pop_lbl 33 `"33"', add
label define eldch_pop_lbl 34 `"34"', add
label define eldch_pop_lbl 35 `"35"', add
label define eldch_pop_lbl 36 `"36"', add
label define eldch_pop_lbl 37 `"37"', add
label define eldch_pop_lbl 38 `"38"', add
label define eldch_pop_lbl 39 `"39"', add
label define eldch_pop_lbl 40 `"40"', add
label define eldch_pop_lbl 41 `"41"', add
label define eldch_pop_lbl 42 `"42"', add
label define eldch_pop_lbl 43 `"43"', add
label define eldch_pop_lbl 44 `"44"', add
label define eldch_pop_lbl 45 `"45"', add
label define eldch_pop_lbl 46 `"46"', add
label define eldch_pop_lbl 47 `"47"', add
label define eldch_pop_lbl 48 `"48"', add
label define eldch_pop_lbl 49 `"49"', add
label define eldch_pop_lbl 50 `"50 or older"', add
label define eldch_pop_lbl 98 `"One or more children have unknown age"', add
label define eldch_pop_lbl 99 `"No own child in household"', add
label values eldch_pop eldch_pop_lbl

label define eldch_sp_lbl 00 `"0"'
label define eldch_sp_lbl 01 `"1"', add
label define eldch_sp_lbl 02 `"2"', add
label define eldch_sp_lbl 03 `"3"', add
label define eldch_sp_lbl 04 `"4"', add
label define eldch_sp_lbl 05 `"5"', add
label define eldch_sp_lbl 06 `"6"', add
label define eldch_sp_lbl 07 `"7"', add
label define eldch_sp_lbl 08 `"8"', add
label define eldch_sp_lbl 09 `"9"', add
label define eldch_sp_lbl 10 `"10"', add
label define eldch_sp_lbl 11 `"11"', add
label define eldch_sp_lbl 12 `"12"', add
label define eldch_sp_lbl 13 `"13"', add
label define eldch_sp_lbl 14 `"14"', add
label define eldch_sp_lbl 15 `"15"', add
label define eldch_sp_lbl 16 `"16"', add
label define eldch_sp_lbl 17 `"17"', add
label define eldch_sp_lbl 18 `"18"', add
label define eldch_sp_lbl 19 `"19"', add
label define eldch_sp_lbl 20 `"20"', add
label define eldch_sp_lbl 21 `"21"', add
label define eldch_sp_lbl 22 `"22"', add
label define eldch_sp_lbl 23 `"23"', add
label define eldch_sp_lbl 24 `"24"', add
label define eldch_sp_lbl 25 `"25"', add
label define eldch_sp_lbl 26 `"26"', add
label define eldch_sp_lbl 27 `"27"', add
label define eldch_sp_lbl 28 `"28"', add
label define eldch_sp_lbl 29 `"29"', add
label define eldch_sp_lbl 30 `"30"', add
label define eldch_sp_lbl 31 `"31"', add
label define eldch_sp_lbl 32 `"32"', add
label define eldch_sp_lbl 33 `"33"', add
label define eldch_sp_lbl 34 `"34"', add
label define eldch_sp_lbl 35 `"35"', add
label define eldch_sp_lbl 36 `"36"', add
label define eldch_sp_lbl 37 `"37"', add
label define eldch_sp_lbl 38 `"38"', add
label define eldch_sp_lbl 39 `"39"', add
label define eldch_sp_lbl 40 `"40"', add
label define eldch_sp_lbl 41 `"41"', add
label define eldch_sp_lbl 42 `"42"', add
label define eldch_sp_lbl 43 `"43"', add
label define eldch_sp_lbl 44 `"44"', add
label define eldch_sp_lbl 45 `"45"', add
label define eldch_sp_lbl 46 `"46"', add
label define eldch_sp_lbl 47 `"47"', add
label define eldch_sp_lbl 48 `"48"', add
label define eldch_sp_lbl 49 `"49"', add
label define eldch_sp_lbl 50 `"50 or older"', add
label define eldch_sp_lbl 98 `"One or more children have unknown age"', add
label define eldch_sp_lbl 99 `"No own child in household"', add
label values eldch_sp eldch_sp_lbl

label define yngch_head_lbl 00 `"0"'
label define yngch_head_lbl 01 `"1"', add
label define yngch_head_lbl 02 `"2"', add
label define yngch_head_lbl 03 `"3"', add
label define yngch_head_lbl 04 `"4"', add
label define yngch_head_lbl 05 `"5"', add
label define yngch_head_lbl 06 `"6"', add
label define yngch_head_lbl 07 `"7"', add
label define yngch_head_lbl 08 `"8"', add
label define yngch_head_lbl 09 `"9"', add
label define yngch_head_lbl 10 `"10"', add
label define yngch_head_lbl 11 `"11"', add
label define yngch_head_lbl 12 `"12"', add
label define yngch_head_lbl 13 `"13"', add
label define yngch_head_lbl 14 `"14"', add
label define yngch_head_lbl 15 `"15"', add
label define yngch_head_lbl 16 `"16"', add
label define yngch_head_lbl 17 `"17"', add
label define yngch_head_lbl 18 `"18"', add
label define yngch_head_lbl 19 `"19"', add
label define yngch_head_lbl 20 `"20"', add
label define yngch_head_lbl 21 `"21"', add
label define yngch_head_lbl 22 `"22"', add
label define yngch_head_lbl 23 `"23"', add
label define yngch_head_lbl 24 `"24"', add
label define yngch_head_lbl 25 `"25"', add
label define yngch_head_lbl 26 `"26"', add
label define yngch_head_lbl 27 `"27"', add
label define yngch_head_lbl 28 `"28"', add
label define yngch_head_lbl 29 `"29"', add
label define yngch_head_lbl 30 `"30"', add
label define yngch_head_lbl 31 `"31"', add
label define yngch_head_lbl 32 `"32"', add
label define yngch_head_lbl 33 `"33"', add
label define yngch_head_lbl 34 `"34"', add
label define yngch_head_lbl 35 `"35"', add
label define yngch_head_lbl 36 `"36"', add
label define yngch_head_lbl 37 `"37"', add
label define yngch_head_lbl 38 `"38"', add
label define yngch_head_lbl 39 `"39"', add
label define yngch_head_lbl 40 `"40"', add
label define yngch_head_lbl 41 `"41"', add
label define yngch_head_lbl 42 `"42"', add
label define yngch_head_lbl 43 `"43"', add
label define yngch_head_lbl 44 `"44"', add
label define yngch_head_lbl 45 `"45"', add
label define yngch_head_lbl 46 `"46"', add
label define yngch_head_lbl 47 `"47"', add
label define yngch_head_lbl 48 `"48"', add
label define yngch_head_lbl 49 `"49"', add
label define yngch_head_lbl 50 `"50 or older"', add
label define yngch_head_lbl 98 `"One or more children have unknown age"', add
label define yngch_head_lbl 99 `"No own child in household"', add
label values yngch_head yngch_head_lbl

label define yngch_mom_lbl 00 `"0"'
label define yngch_mom_lbl 01 `"1"', add
label define yngch_mom_lbl 02 `"2"', add
label define yngch_mom_lbl 03 `"3"', add
label define yngch_mom_lbl 04 `"4"', add
label define yngch_mom_lbl 05 `"5"', add
label define yngch_mom_lbl 06 `"6"', add
label define yngch_mom_lbl 07 `"7"', add
label define yngch_mom_lbl 08 `"8"', add
label define yngch_mom_lbl 09 `"9"', add
label define yngch_mom_lbl 10 `"10"', add
label define yngch_mom_lbl 11 `"11"', add
label define yngch_mom_lbl 12 `"12"', add
label define yngch_mom_lbl 13 `"13"', add
label define yngch_mom_lbl 14 `"14"', add
label define yngch_mom_lbl 15 `"15"', add
label define yngch_mom_lbl 16 `"16"', add
label define yngch_mom_lbl 17 `"17"', add
label define yngch_mom_lbl 18 `"18"', add
label define yngch_mom_lbl 19 `"19"', add
label define yngch_mom_lbl 20 `"20"', add
label define yngch_mom_lbl 21 `"21"', add
label define yngch_mom_lbl 22 `"22"', add
label define yngch_mom_lbl 23 `"23"', add
label define yngch_mom_lbl 24 `"24"', add
label define yngch_mom_lbl 25 `"25"', add
label define yngch_mom_lbl 26 `"26"', add
label define yngch_mom_lbl 27 `"27"', add
label define yngch_mom_lbl 28 `"28"', add
label define yngch_mom_lbl 29 `"29"', add
label define yngch_mom_lbl 30 `"30"', add
label define yngch_mom_lbl 31 `"31"', add
label define yngch_mom_lbl 32 `"32"', add
label define yngch_mom_lbl 33 `"33"', add
label define yngch_mom_lbl 34 `"34"', add
label define yngch_mom_lbl 35 `"35"', add
label define yngch_mom_lbl 36 `"36"', add
label define yngch_mom_lbl 37 `"37"', add
label define yngch_mom_lbl 38 `"38"', add
label define yngch_mom_lbl 39 `"39"', add
label define yngch_mom_lbl 40 `"40"', add
label define yngch_mom_lbl 41 `"41"', add
label define yngch_mom_lbl 42 `"42"', add
label define yngch_mom_lbl 43 `"43"', add
label define yngch_mom_lbl 44 `"44"', add
label define yngch_mom_lbl 45 `"45"', add
label define yngch_mom_lbl 46 `"46"', add
label define yngch_mom_lbl 47 `"47"', add
label define yngch_mom_lbl 48 `"48"', add
label define yngch_mom_lbl 49 `"49"', add
label define yngch_mom_lbl 50 `"50 or older"', add
label define yngch_mom_lbl 98 `"One or more children have unknown age"', add
label define yngch_mom_lbl 99 `"No own child in household"', add
label values yngch_mom yngch_mom_lbl

label define yngch_pop_lbl 00 `"0"'
label define yngch_pop_lbl 01 `"1"', add
label define yngch_pop_lbl 02 `"2"', add
label define yngch_pop_lbl 03 `"3"', add
label define yngch_pop_lbl 04 `"4"', add
label define yngch_pop_lbl 05 `"5"', add
label define yngch_pop_lbl 06 `"6"', add
label define yngch_pop_lbl 07 `"7"', add
label define yngch_pop_lbl 08 `"8"', add
label define yngch_pop_lbl 09 `"9"', add
label define yngch_pop_lbl 10 `"10"', add
label define yngch_pop_lbl 11 `"11"', add
label define yngch_pop_lbl 12 `"12"', add
label define yngch_pop_lbl 13 `"13"', add
label define yngch_pop_lbl 14 `"14"', add
label define yngch_pop_lbl 15 `"15"', add
label define yngch_pop_lbl 16 `"16"', add
label define yngch_pop_lbl 17 `"17"', add
label define yngch_pop_lbl 18 `"18"', add
label define yngch_pop_lbl 19 `"19"', add
label define yngch_pop_lbl 20 `"20"', add
label define yngch_pop_lbl 21 `"21"', add
label define yngch_pop_lbl 22 `"22"', add
label define yngch_pop_lbl 23 `"23"', add
label define yngch_pop_lbl 24 `"24"', add
label define yngch_pop_lbl 25 `"25"', add
label define yngch_pop_lbl 26 `"26"', add
label define yngch_pop_lbl 27 `"27"', add
label define yngch_pop_lbl 28 `"28"', add
label define yngch_pop_lbl 29 `"29"', add
label define yngch_pop_lbl 30 `"30"', add
label define yngch_pop_lbl 31 `"31"', add
label define yngch_pop_lbl 32 `"32"', add
label define yngch_pop_lbl 33 `"33"', add
label define yngch_pop_lbl 34 `"34"', add
label define yngch_pop_lbl 35 `"35"', add
label define yngch_pop_lbl 36 `"36"', add
label define yngch_pop_lbl 37 `"37"', add
label define yngch_pop_lbl 38 `"38"', add
label define yngch_pop_lbl 39 `"39"', add
label define yngch_pop_lbl 40 `"40"', add
label define yngch_pop_lbl 41 `"41"', add
label define yngch_pop_lbl 42 `"42"', add
label define yngch_pop_lbl 43 `"43"', add
label define yngch_pop_lbl 44 `"44"', add
label define yngch_pop_lbl 45 `"45"', add
label define yngch_pop_lbl 46 `"46"', add
label define yngch_pop_lbl 47 `"47"', add
label define yngch_pop_lbl 48 `"48"', add
label define yngch_pop_lbl 49 `"49"', add
label define yngch_pop_lbl 50 `"50 or older"', add
label define yngch_pop_lbl 98 `"One or more children have unknown age"', add
label define yngch_pop_lbl 99 `"No own child in household"', add
label values yngch_pop yngch_pop_lbl

label define yngch_sp_lbl 00 `"0"'
label define yngch_sp_lbl 01 `"1"', add
label define yngch_sp_lbl 02 `"2"', add
label define yngch_sp_lbl 03 `"3"', add
label define yngch_sp_lbl 04 `"4"', add
label define yngch_sp_lbl 05 `"5"', add
label define yngch_sp_lbl 06 `"6"', add
label define yngch_sp_lbl 07 `"7"', add
label define yngch_sp_lbl 08 `"8"', add
label define yngch_sp_lbl 09 `"9"', add
label define yngch_sp_lbl 10 `"10"', add
label define yngch_sp_lbl 11 `"11"', add
label define yngch_sp_lbl 12 `"12"', add
label define yngch_sp_lbl 13 `"13"', add
label define yngch_sp_lbl 14 `"14"', add
label define yngch_sp_lbl 15 `"15"', add
label define yngch_sp_lbl 16 `"16"', add
label define yngch_sp_lbl 17 `"17"', add
label define yngch_sp_lbl 18 `"18"', add
label define yngch_sp_lbl 19 `"19"', add
label define yngch_sp_lbl 20 `"20"', add
label define yngch_sp_lbl 21 `"21"', add
label define yngch_sp_lbl 22 `"22"', add
label define yngch_sp_lbl 23 `"23"', add
label define yngch_sp_lbl 24 `"24"', add
label define yngch_sp_lbl 25 `"25"', add
label define yngch_sp_lbl 26 `"26"', add
label define yngch_sp_lbl 27 `"27"', add
label define yngch_sp_lbl 28 `"28"', add
label define yngch_sp_lbl 29 `"29"', add
label define yngch_sp_lbl 30 `"30"', add
label define yngch_sp_lbl 31 `"31"', add
label define yngch_sp_lbl 32 `"32"', add
label define yngch_sp_lbl 33 `"33"', add
label define yngch_sp_lbl 34 `"34"', add
label define yngch_sp_lbl 35 `"35"', add
label define yngch_sp_lbl 36 `"36"', add
label define yngch_sp_lbl 37 `"37"', add
label define yngch_sp_lbl 38 `"38"', add
label define yngch_sp_lbl 39 `"39"', add
label define yngch_sp_lbl 40 `"40"', add
label define yngch_sp_lbl 41 `"41"', add
label define yngch_sp_lbl 42 `"42"', add
label define yngch_sp_lbl 43 `"43"', add
label define yngch_sp_lbl 44 `"44"', add
label define yngch_sp_lbl 45 `"45"', add
label define yngch_sp_lbl 46 `"46"', add
label define yngch_sp_lbl 47 `"47"', add
label define yngch_sp_lbl 48 `"48"', add
label define yngch_sp_lbl 49 `"49"', add
label define yngch_sp_lbl 50 `"50 or older"', add
label define yngch_sp_lbl 98 `"One or more children have unknown age"', add
label define yngch_sp_lbl 99 `"No own child in household"', add
label values yngch_sp yngch_sp_lbl

label define relate_head_lbl 1 `"Head"'
label define relate_head_lbl 2 `"Spouse/partner"', add
label define relate_head_lbl 3 `"Child"', add
label define relate_head_lbl 4 `"Other relative"', add
label define relate_head_lbl 5 `"Non-relative"', add
label define relate_head_lbl 6 `"Other relative or non-relative"', add
label define relate_head_lbl 9 `"Unknown"', add
label values relate_head relate_head_lbl

label define relate_mom_lbl 1 `"Head"'
label define relate_mom_lbl 2 `"Spouse/partner"', add
label define relate_mom_lbl 3 `"Child"', add
label define relate_mom_lbl 4 `"Other relative"', add
label define relate_mom_lbl 5 `"Non-relative"', add
label define relate_mom_lbl 6 `"Other relative or non-relative"', add
label define relate_mom_lbl 9 `"Unknown"', add
label values relate_mom relate_mom_lbl

label define relate_pop_lbl 1 `"Head"'
label define relate_pop_lbl 2 `"Spouse/partner"', add
label define relate_pop_lbl 3 `"Child"', add
label define relate_pop_lbl 4 `"Other relative"', add
label define relate_pop_lbl 5 `"Non-relative"', add
label define relate_pop_lbl 6 `"Other relative or non-relative"', add
label define relate_pop_lbl 9 `"Unknown"', add
label values relate_pop relate_pop_lbl

label define relate_sp_lbl 1 `"Head"'
label define relate_sp_lbl 2 `"Spouse/partner"', add
label define relate_sp_lbl 3 `"Child"', add
label define relate_sp_lbl 4 `"Other relative"', add
label define relate_sp_lbl 5 `"Non-relative"', add
label define relate_sp_lbl 6 `"Other relative or non-relative"', add
label define relate_sp_lbl 9 `"Unknown"', add
label values relate_sp relate_sp_lbl

label define related_head_lbl 1000 `"Head"'
label define related_head_lbl 2000 `"Spouse/partner"', add
label define related_head_lbl 2100 `"Spouse"', add
label define related_head_lbl 2200 `"Unmarried partner"', add
label define related_head_lbl 2210 `"Civil union"', add
label define related_head_lbl 2300 `"Same-sex spouse/partner"', add
label define related_head_lbl 3000 `"Child"', add
label define related_head_lbl 3100 `"Biological child"', add
label define related_head_lbl 3200 `"Adopted child"', add
label define related_head_lbl 3300 `"Stepchild"', add
label define related_head_lbl 3400 `"Child/child-in-law"', add
label define related_head_lbl 3500 `"Child/child-in-law/grandchild"', add
label define related_head_lbl 3600 `"Child of unmarried partner"', add
label define related_head_lbl 4000 `"Other relative"', add
label define related_head_lbl 4100 `"Grandchild"', add
label define related_head_lbl 4110 `"Grandchild or great grandchild"', add
label define related_head_lbl 4120 `"Great grandchild"', add
label define related_head_lbl 4130 `"Great-great grandchild"', add
label define related_head_lbl 4200 `"Parent/parent-in-law"', add
label define related_head_lbl 4210 `"Parent"', add
label define related_head_lbl 4211 `"Stepparent"', add
label define related_head_lbl 4220 `"Parent-in-law"', add
label define related_head_lbl 4300 `"Child-in-law"', add
label define related_head_lbl 4301 `"Daughter-in-law"', add
label define related_head_lbl 4302 `"Spouse/partner of child"', add
label define related_head_lbl 4310 `"Unmarried partner of child"', add
label define related_head_lbl 4400 `"Sibling/sibling-in-law"', add
label define related_head_lbl 4410 `"Sibling"', add
label define related_head_lbl 4420 `"Stepsibling"', add
label define related_head_lbl 4430 `"Sibling-in-law"', add
label define related_head_lbl 4431 `"Sibling of spouse/partner"', add
label define related_head_lbl 4432 `"Spouse/partner of sibling"', add
label define related_head_lbl 4500 `"Grandparent"', add
label define related_head_lbl 4510 `"Great grandparent"', add
label define related_head_lbl 4600 `"Parent/grandparent/ascendant"', add
label define related_head_lbl 4700 `"Aunt/uncle"', add
label define related_head_lbl 4800 `"Other specified relative"', add
label define related_head_lbl 4810 `"Nephew/niece"', add
label define related_head_lbl 4820 `"Cousin"', add
label define related_head_lbl 4830 `"Sibling's sibling-in-law"', add
label define related_head_lbl 4900 `"Other relative, not elsewhere classified"', add
label define related_head_lbl 4910 `"Other relative with same family name"', add
label define related_head_lbl 4920 `"Other relative with different family name"', add
label define related_head_lbl 4930 `"Other relative, not specified (secondary family)"', add
label define related_head_lbl 5000 `"Non-relative"', add
label define related_head_lbl 5100 `"Friend/guest/visitor/partner"', add
label define related_head_lbl 5110 `"Partner/friend"', add
label define related_head_lbl 5111 `"Friend"', add
label define related_head_lbl 5112 `"Partner/roommate"', add
label define related_head_lbl 5113 `"Housemate/roommate"', add
label define related_head_lbl 5120 `"Visitor"', add
label define related_head_lbl 5130 `"Ex-spouse"', add
label define related_head_lbl 5140 `"Godparent"', add
label define related_head_lbl 5150 `"Godchild"', add
label define related_head_lbl 5200 `"Employee"', add
label define related_head_lbl 5210 `"Domestic employee"', add
label define related_head_lbl 5220 `"Relative of employee, n.s."', add
label define related_head_lbl 5221 `"Spouse of servant"', add
label define related_head_lbl 5222 `"Child of servant"', add
label define related_head_lbl 5223 `"Other relative of servant"', add
label define related_head_lbl 5300 `"Roomer/boarder/lodger/foster child"', add
label define related_head_lbl 5310 `"Boarder"', add
label define related_head_lbl 5311 `"Boarder or guest"', add
label define related_head_lbl 5320 `"Lodger"', add
label define related_head_lbl 5330 `"Foster child"', add
label define related_head_lbl 5340 `"Tutored/foster child"', add
label define related_head_lbl 5350 `"Tutored child"', add
label define related_head_lbl 5400 `"Employee, boarder, or guest"', add
label define related_head_lbl 5500 `"Other specified non-relative"', add
label define related_head_lbl 5510 `"Agregado"', add
label define related_head_lbl 5520 `"Temporary resident, guest"', add
label define related_head_lbl 5600 `"Group quarters"', add
label define related_head_lbl 5610 `"Group quarters, non-inmates"', add
label define related_head_lbl 5620 `"Institutional inmates"', add
label define related_head_lbl 5900 `"Non-relative, n.e.c."', add
label define related_head_lbl 6000 `"Other relative or non-relative"', add
label define related_head_lbl 9999 `"Unknown"', add
label values related_head related_head_lbl

label define related_mom_lbl 1000 `"Head"'
label define related_mom_lbl 2000 `"Spouse/partner"', add
label define related_mom_lbl 2100 `"Spouse"', add
label define related_mom_lbl 2200 `"Unmarried partner"', add
label define related_mom_lbl 2210 `"Civil union"', add
label define related_mom_lbl 2300 `"Same-sex spouse/partner"', add
label define related_mom_lbl 3000 `"Child"', add
label define related_mom_lbl 3100 `"Biological child"', add
label define related_mom_lbl 3200 `"Adopted child"', add
label define related_mom_lbl 3300 `"Stepchild"', add
label define related_mom_lbl 3400 `"Child/child-in-law"', add
label define related_mom_lbl 3500 `"Child/child-in-law/grandchild"', add
label define related_mom_lbl 3600 `"Child of unmarried partner"', add
label define related_mom_lbl 4000 `"Other relative"', add
label define related_mom_lbl 4100 `"Grandchild"', add
label define related_mom_lbl 4110 `"Grandchild or great grandchild"', add
label define related_mom_lbl 4120 `"Great grandchild"', add
label define related_mom_lbl 4130 `"Great-great grandchild"', add
label define related_mom_lbl 4200 `"Parent/parent-in-law"', add
label define related_mom_lbl 4210 `"Parent"', add
label define related_mom_lbl 4211 `"Stepparent"', add
label define related_mom_lbl 4220 `"Parent-in-law"', add
label define related_mom_lbl 4300 `"Child-in-law"', add
label define related_mom_lbl 4301 `"Daughter-in-law"', add
label define related_mom_lbl 4302 `"Spouse/partner of child"', add
label define related_mom_lbl 4310 `"Unmarried partner of child"', add
label define related_mom_lbl 4400 `"Sibling/sibling-in-law"', add
label define related_mom_lbl 4410 `"Sibling"', add
label define related_mom_lbl 4420 `"Stepsibling"', add
label define related_mom_lbl 4430 `"Sibling-in-law"', add
label define related_mom_lbl 4431 `"Sibling of spouse/partner"', add
label define related_mom_lbl 4432 `"Spouse/partner of sibling"', add
label define related_mom_lbl 4500 `"Grandparent"', add
label define related_mom_lbl 4510 `"Great grandparent"', add
label define related_mom_lbl 4600 `"Parent/grandparent/ascendant"', add
label define related_mom_lbl 4700 `"Aunt/uncle"', add
label define related_mom_lbl 4800 `"Other specified relative"', add
label define related_mom_lbl 4810 `"Nephew/niece"', add
label define related_mom_lbl 4820 `"Cousin"', add
label define related_mom_lbl 4830 `"Sibling's sibling-in-law"', add
label define related_mom_lbl 4900 `"Other relative, not elsewhere classified"', add
label define related_mom_lbl 4910 `"Other relative with same family name"', add
label define related_mom_lbl 4920 `"Other relative with different family name"', add
label define related_mom_lbl 4930 `"Other relative, not specified (secondary family)"', add
label define related_mom_lbl 5000 `"Non-relative"', add
label define related_mom_lbl 5100 `"Friend/guest/visitor/partner"', add
label define related_mom_lbl 5110 `"Partner/friend"', add
label define related_mom_lbl 5111 `"Friend"', add
label define related_mom_lbl 5112 `"Partner/roommate"', add
label define related_mom_lbl 5113 `"Housemate/roommate"', add
label define related_mom_lbl 5120 `"Visitor"', add
label define related_mom_lbl 5130 `"Ex-spouse"', add
label define related_mom_lbl 5140 `"Godparent"', add
label define related_mom_lbl 5150 `"Godchild"', add
label define related_mom_lbl 5200 `"Employee"', add
label define related_mom_lbl 5210 `"Domestic employee"', add
label define related_mom_lbl 5220 `"Relative of employee, n.s."', add
label define related_mom_lbl 5221 `"Spouse of servant"', add
label define related_mom_lbl 5222 `"Child of servant"', add
label define related_mom_lbl 5223 `"Other relative of servant"', add
label define related_mom_lbl 5300 `"Roomer/boarder/lodger/foster child"', add
label define related_mom_lbl 5310 `"Boarder"', add
label define related_mom_lbl 5311 `"Boarder or guest"', add
label define related_mom_lbl 5320 `"Lodger"', add
label define related_mom_lbl 5330 `"Foster child"', add
label define related_mom_lbl 5340 `"Tutored/foster child"', add
label define related_mom_lbl 5350 `"Tutored child"', add
label define related_mom_lbl 5400 `"Employee, boarder, or guest"', add
label define related_mom_lbl 5500 `"Other specified non-relative"', add
label define related_mom_lbl 5510 `"Agregado"', add
label define related_mom_lbl 5520 `"Temporary resident, guest"', add
label define related_mom_lbl 5600 `"Group quarters"', add
label define related_mom_lbl 5610 `"Group quarters, non-inmates"', add
label define related_mom_lbl 5620 `"Institutional inmates"', add
label define related_mom_lbl 5900 `"Non-relative, n.e.c."', add
label define related_mom_lbl 6000 `"Other relative or non-relative"', add
label define related_mom_lbl 9999 `"Unknown"', add
label values related_mom related_mom_lbl

label define related_pop_lbl 1000 `"Head"'
label define related_pop_lbl 2000 `"Spouse/partner"', add
label define related_pop_lbl 2100 `"Spouse"', add
label define related_pop_lbl 2200 `"Unmarried partner"', add
label define related_pop_lbl 2210 `"Civil union"', add
label define related_pop_lbl 2300 `"Same-sex spouse/partner"', add
label define related_pop_lbl 3000 `"Child"', add
label define related_pop_lbl 3100 `"Biological child"', add
label define related_pop_lbl 3200 `"Adopted child"', add
label define related_pop_lbl 3300 `"Stepchild"', add
label define related_pop_lbl 3400 `"Child/child-in-law"', add
label define related_pop_lbl 3500 `"Child/child-in-law/grandchild"', add
label define related_pop_lbl 3600 `"Child of unmarried partner"', add
label define related_pop_lbl 4000 `"Other relative"', add
label define related_pop_lbl 4100 `"Grandchild"', add
label define related_pop_lbl 4110 `"Grandchild or great grandchild"', add
label define related_pop_lbl 4120 `"Great grandchild"', add
label define related_pop_lbl 4130 `"Great-great grandchild"', add
label define related_pop_lbl 4200 `"Parent/parent-in-law"', add
label define related_pop_lbl 4210 `"Parent"', add
label define related_pop_lbl 4211 `"Stepparent"', add
label define related_pop_lbl 4220 `"Parent-in-law"', add
label define related_pop_lbl 4300 `"Child-in-law"', add
label define related_pop_lbl 4301 `"Daughter-in-law"', add
label define related_pop_lbl 4302 `"Spouse/partner of child"', add
label define related_pop_lbl 4310 `"Unmarried partner of child"', add
label define related_pop_lbl 4400 `"Sibling/sibling-in-law"', add
label define related_pop_lbl 4410 `"Sibling"', add
label define related_pop_lbl 4420 `"Stepsibling"', add
label define related_pop_lbl 4430 `"Sibling-in-law"', add
label define related_pop_lbl 4431 `"Sibling of spouse/partner"', add
label define related_pop_lbl 4432 `"Spouse/partner of sibling"', add
label define related_pop_lbl 4500 `"Grandparent"', add
label define related_pop_lbl 4510 `"Great grandparent"', add
label define related_pop_lbl 4600 `"Parent/grandparent/ascendant"', add
label define related_pop_lbl 4700 `"Aunt/uncle"', add
label define related_pop_lbl 4800 `"Other specified relative"', add
label define related_pop_lbl 4810 `"Nephew/niece"', add
label define related_pop_lbl 4820 `"Cousin"', add
label define related_pop_lbl 4830 `"Sibling's sibling-in-law"', add
label define related_pop_lbl 4900 `"Other relative, not elsewhere classified"', add
label define related_pop_lbl 4910 `"Other relative with same family name"', add
label define related_pop_lbl 4920 `"Other relative with different family name"', add
label define related_pop_lbl 4930 `"Other relative, not specified (secondary family)"', add
label define related_pop_lbl 5000 `"Non-relative"', add
label define related_pop_lbl 5100 `"Friend/guest/visitor/partner"', add
label define related_pop_lbl 5110 `"Partner/friend"', add
label define related_pop_lbl 5111 `"Friend"', add
label define related_pop_lbl 5112 `"Partner/roommate"', add
label define related_pop_lbl 5113 `"Housemate/roommate"', add
label define related_pop_lbl 5120 `"Visitor"', add
label define related_pop_lbl 5130 `"Ex-spouse"', add
label define related_pop_lbl 5140 `"Godparent"', add
label define related_pop_lbl 5150 `"Godchild"', add
label define related_pop_lbl 5200 `"Employee"', add
label define related_pop_lbl 5210 `"Domestic employee"', add
label define related_pop_lbl 5220 `"Relative of employee, n.s."', add
label define related_pop_lbl 5221 `"Spouse of servant"', add
label define related_pop_lbl 5222 `"Child of servant"', add
label define related_pop_lbl 5223 `"Other relative of servant"', add
label define related_pop_lbl 5300 `"Roomer/boarder/lodger/foster child"', add
label define related_pop_lbl 5310 `"Boarder"', add
label define related_pop_lbl 5311 `"Boarder or guest"', add
label define related_pop_lbl 5320 `"Lodger"', add
label define related_pop_lbl 5330 `"Foster child"', add
label define related_pop_lbl 5340 `"Tutored/foster child"', add
label define related_pop_lbl 5350 `"Tutored child"', add
label define related_pop_lbl 5400 `"Employee, boarder, or guest"', add
label define related_pop_lbl 5500 `"Other specified non-relative"', add
label define related_pop_lbl 5510 `"Agregado"', add
label define related_pop_lbl 5520 `"Temporary resident, guest"', add
label define related_pop_lbl 5600 `"Group quarters"', add
label define related_pop_lbl 5610 `"Group quarters, non-inmates"', add
label define related_pop_lbl 5620 `"Institutional inmates"', add
label define related_pop_lbl 5900 `"Non-relative, n.e.c."', add
label define related_pop_lbl 6000 `"Other relative or non-relative"', add
label define related_pop_lbl 9999 `"Unknown"', add
label values related_pop related_pop_lbl

label define related_sp_lbl 1000 `"Head"'
label define related_sp_lbl 2000 `"Spouse/partner"', add
label define related_sp_lbl 2100 `"Spouse"', add
label define related_sp_lbl 2200 `"Unmarried partner"', add
label define related_sp_lbl 2210 `"Civil union"', add
label define related_sp_lbl 2300 `"Same-sex spouse/partner"', add
label define related_sp_lbl 3000 `"Child"', add
label define related_sp_lbl 3100 `"Biological child"', add
label define related_sp_lbl 3200 `"Adopted child"', add
label define related_sp_lbl 3300 `"Stepchild"', add
label define related_sp_lbl 3400 `"Child/child-in-law"', add
label define related_sp_lbl 3500 `"Child/child-in-law/grandchild"', add
label define related_sp_lbl 3600 `"Child of unmarried partner"', add
label define related_sp_lbl 4000 `"Other relative"', add
label define related_sp_lbl 4100 `"Grandchild"', add
label define related_sp_lbl 4110 `"Grandchild or great grandchild"', add
label define related_sp_lbl 4120 `"Great grandchild"', add
label define related_sp_lbl 4130 `"Great-great grandchild"', add
label define related_sp_lbl 4200 `"Parent/parent-in-law"', add
label define related_sp_lbl 4210 `"Parent"', add
label define related_sp_lbl 4211 `"Stepparent"', add
label define related_sp_lbl 4220 `"Parent-in-law"', add
label define related_sp_lbl 4300 `"Child-in-law"', add
label define related_sp_lbl 4301 `"Daughter-in-law"', add
label define related_sp_lbl 4302 `"Spouse/partner of child"', add
label define related_sp_lbl 4310 `"Unmarried partner of child"', add
label define related_sp_lbl 4400 `"Sibling/sibling-in-law"', add
label define related_sp_lbl 4410 `"Sibling"', add
label define related_sp_lbl 4420 `"Stepsibling"', add
label define related_sp_lbl 4430 `"Sibling-in-law"', add
label define related_sp_lbl 4431 `"Sibling of spouse/partner"', add
label define related_sp_lbl 4432 `"Spouse/partner of sibling"', add
label define related_sp_lbl 4500 `"Grandparent"', add
label define related_sp_lbl 4510 `"Great grandparent"', add
label define related_sp_lbl 4600 `"Parent/grandparent/ascendant"', add
label define related_sp_lbl 4700 `"Aunt/uncle"', add
label define related_sp_lbl 4800 `"Other specified relative"', add
label define related_sp_lbl 4810 `"Nephew/niece"', add
label define related_sp_lbl 4820 `"Cousin"', add
label define related_sp_lbl 4830 `"Sibling's sibling-in-law"', add
label define related_sp_lbl 4900 `"Other relative, not elsewhere classified"', add
label define related_sp_lbl 4910 `"Other relative with same family name"', add
label define related_sp_lbl 4920 `"Other relative with different family name"', add
label define related_sp_lbl 4930 `"Other relative, not specified (secondary family)"', add
label define related_sp_lbl 5000 `"Non-relative"', add
label define related_sp_lbl 5100 `"Friend/guest/visitor/partner"', add
label define related_sp_lbl 5110 `"Partner/friend"', add
label define related_sp_lbl 5111 `"Friend"', add
label define related_sp_lbl 5112 `"Partner/roommate"', add
label define related_sp_lbl 5113 `"Housemate/roommate"', add
label define related_sp_lbl 5120 `"Visitor"', add
label define related_sp_lbl 5130 `"Ex-spouse"', add
label define related_sp_lbl 5140 `"Godparent"', add
label define related_sp_lbl 5150 `"Godchild"', add
label define related_sp_lbl 5200 `"Employee"', add
label define related_sp_lbl 5210 `"Domestic employee"', add
label define related_sp_lbl 5220 `"Relative of employee, n.s."', add
label define related_sp_lbl 5221 `"Spouse of servant"', add
label define related_sp_lbl 5222 `"Child of servant"', add
label define related_sp_lbl 5223 `"Other relative of servant"', add
label define related_sp_lbl 5300 `"Roomer/boarder/lodger/foster child"', add
label define related_sp_lbl 5310 `"Boarder"', add
label define related_sp_lbl 5311 `"Boarder or guest"', add
label define related_sp_lbl 5320 `"Lodger"', add
label define related_sp_lbl 5330 `"Foster child"', add
label define related_sp_lbl 5340 `"Tutored/foster child"', add
label define related_sp_lbl 5350 `"Tutored child"', add
label define related_sp_lbl 5400 `"Employee, boarder, or guest"', add
label define related_sp_lbl 5500 `"Other specified non-relative"', add
label define related_sp_lbl 5510 `"Agregado"', add
label define related_sp_lbl 5520 `"Temporary resident, guest"', add
label define related_sp_lbl 5600 `"Group quarters"', add
label define related_sp_lbl 5610 `"Group quarters, non-inmates"', add
label define related_sp_lbl 5620 `"Institutional inmates"', add
label define related_sp_lbl 5900 `"Non-relative, n.e.c."', add
label define related_sp_lbl 6000 `"Other relative or non-relative"', add
label define related_sp_lbl 9999 `"Unknown"', add
label values related_sp related_sp_lbl

label define age_head_lbl 000 `"Less than 1 year"'
label define age_head_lbl 001 `"1 year"', add
label define age_head_lbl 002 `"2 years"', add
label define age_head_lbl 003 `"3"', add
label define age_head_lbl 004 `"4"', add
label define age_head_lbl 005 `"5"', add
label define age_head_lbl 006 `"6"', add
label define age_head_lbl 007 `"7"', add
label define age_head_lbl 008 `"8"', add
label define age_head_lbl 009 `"9"', add
label define age_head_lbl 010 `"10"', add
label define age_head_lbl 011 `"11"', add
label define age_head_lbl 012 `"12"', add
label define age_head_lbl 013 `"13"', add
label define age_head_lbl 014 `"14"', add
label define age_head_lbl 015 `"15"', add
label define age_head_lbl 016 `"16"', add
label define age_head_lbl 017 `"17"', add
label define age_head_lbl 018 `"18"', add
label define age_head_lbl 019 `"19"', add
label define age_head_lbl 020 `"20"', add
label define age_head_lbl 021 `"21"', add
label define age_head_lbl 022 `"22"', add
label define age_head_lbl 023 `"23"', add
label define age_head_lbl 024 `"24"', add
label define age_head_lbl 025 `"25"', add
label define age_head_lbl 026 `"26"', add
label define age_head_lbl 027 `"27"', add
label define age_head_lbl 028 `"28"', add
label define age_head_lbl 029 `"29"', add
label define age_head_lbl 030 `"30"', add
label define age_head_lbl 031 `"31"', add
label define age_head_lbl 032 `"32"', add
label define age_head_lbl 033 `"33"', add
label define age_head_lbl 034 `"34"', add
label define age_head_lbl 035 `"35"', add
label define age_head_lbl 036 `"36"', add
label define age_head_lbl 037 `"37"', add
label define age_head_lbl 038 `"38"', add
label define age_head_lbl 039 `"39"', add
label define age_head_lbl 040 `"40"', add
label define age_head_lbl 041 `"41"', add
label define age_head_lbl 042 `"42"', add
label define age_head_lbl 043 `"43"', add
label define age_head_lbl 044 `"44"', add
label define age_head_lbl 045 `"45"', add
label define age_head_lbl 046 `"46"', add
label define age_head_lbl 047 `"47"', add
label define age_head_lbl 048 `"48"', add
label define age_head_lbl 049 `"49"', add
label define age_head_lbl 050 `"50"', add
label define age_head_lbl 051 `"51"', add
label define age_head_lbl 052 `"52"', add
label define age_head_lbl 053 `"53"', add
label define age_head_lbl 054 `"54"', add
label define age_head_lbl 055 `"55"', add
label define age_head_lbl 056 `"56"', add
label define age_head_lbl 057 `"57"', add
label define age_head_lbl 058 `"58"', add
label define age_head_lbl 059 `"59"', add
label define age_head_lbl 060 `"60"', add
label define age_head_lbl 061 `"61"', add
label define age_head_lbl 062 `"62"', add
label define age_head_lbl 063 `"63"', add
label define age_head_lbl 064 `"64"', add
label define age_head_lbl 065 `"65"', add
label define age_head_lbl 066 `"66"', add
label define age_head_lbl 067 `"67"', add
label define age_head_lbl 068 `"68"', add
label define age_head_lbl 069 `"69"', add
label define age_head_lbl 070 `"70"', add
label define age_head_lbl 071 `"71"', add
label define age_head_lbl 072 `"72"', add
label define age_head_lbl 073 `"73"', add
label define age_head_lbl 074 `"74"', add
label define age_head_lbl 075 `"75"', add
label define age_head_lbl 076 `"76"', add
label define age_head_lbl 077 `"77"', add
label define age_head_lbl 078 `"78"', add
label define age_head_lbl 079 `"79"', add
label define age_head_lbl 080 `"80"', add
label define age_head_lbl 081 `"81"', add
label define age_head_lbl 082 `"82"', add
label define age_head_lbl 083 `"83"', add
label define age_head_lbl 084 `"84"', add
label define age_head_lbl 085 `"85"', add
label define age_head_lbl 086 `"86"', add
label define age_head_lbl 087 `"87"', add
label define age_head_lbl 088 `"88"', add
label define age_head_lbl 089 `"89"', add
label define age_head_lbl 090 `"90"', add
label define age_head_lbl 091 `"91"', add
label define age_head_lbl 092 `"92"', add
label define age_head_lbl 093 `"93"', add
label define age_head_lbl 094 `"94"', add
label define age_head_lbl 095 `"95"', add
label define age_head_lbl 096 `"96"', add
label define age_head_lbl 097 `"97"', add
label define age_head_lbl 098 `"98"', add
label define age_head_lbl 099 `"99"', add
label define age_head_lbl 100 `"100+"', add
label define age_head_lbl 999 `"Not reported/missing"', add
label values age_head age_head_lbl

label define age_mom_lbl 000 `"Less than 1 year"'
label define age_mom_lbl 001 `"1 year"', add
label define age_mom_lbl 002 `"2 years"', add
label define age_mom_lbl 003 `"3"', add
label define age_mom_lbl 004 `"4"', add
label define age_mom_lbl 005 `"5"', add
label define age_mom_lbl 006 `"6"', add
label define age_mom_lbl 007 `"7"', add
label define age_mom_lbl 008 `"8"', add
label define age_mom_lbl 009 `"9"', add
label define age_mom_lbl 010 `"10"', add
label define age_mom_lbl 011 `"11"', add
label define age_mom_lbl 012 `"12"', add
label define age_mom_lbl 013 `"13"', add
label define age_mom_lbl 014 `"14"', add
label define age_mom_lbl 015 `"15"', add
label define age_mom_lbl 016 `"16"', add
label define age_mom_lbl 017 `"17"', add
label define age_mom_lbl 018 `"18"', add
label define age_mom_lbl 019 `"19"', add
label define age_mom_lbl 020 `"20"', add
label define age_mom_lbl 021 `"21"', add
label define age_mom_lbl 022 `"22"', add
label define age_mom_lbl 023 `"23"', add
label define age_mom_lbl 024 `"24"', add
label define age_mom_lbl 025 `"25"', add
label define age_mom_lbl 026 `"26"', add
label define age_mom_lbl 027 `"27"', add
label define age_mom_lbl 028 `"28"', add
label define age_mom_lbl 029 `"29"', add
label define age_mom_lbl 030 `"30"', add
label define age_mom_lbl 031 `"31"', add
label define age_mom_lbl 032 `"32"', add
label define age_mom_lbl 033 `"33"', add
label define age_mom_lbl 034 `"34"', add
label define age_mom_lbl 035 `"35"', add
label define age_mom_lbl 036 `"36"', add
label define age_mom_lbl 037 `"37"', add
label define age_mom_lbl 038 `"38"', add
label define age_mom_lbl 039 `"39"', add
label define age_mom_lbl 040 `"40"', add
label define age_mom_lbl 041 `"41"', add
label define age_mom_lbl 042 `"42"', add
label define age_mom_lbl 043 `"43"', add
label define age_mom_lbl 044 `"44"', add
label define age_mom_lbl 045 `"45"', add
label define age_mom_lbl 046 `"46"', add
label define age_mom_lbl 047 `"47"', add
label define age_mom_lbl 048 `"48"', add
label define age_mom_lbl 049 `"49"', add
label define age_mom_lbl 050 `"50"', add
label define age_mom_lbl 051 `"51"', add
label define age_mom_lbl 052 `"52"', add
label define age_mom_lbl 053 `"53"', add
label define age_mom_lbl 054 `"54"', add
label define age_mom_lbl 055 `"55"', add
label define age_mom_lbl 056 `"56"', add
label define age_mom_lbl 057 `"57"', add
label define age_mom_lbl 058 `"58"', add
label define age_mom_lbl 059 `"59"', add
label define age_mom_lbl 060 `"60"', add
label define age_mom_lbl 061 `"61"', add
label define age_mom_lbl 062 `"62"', add
label define age_mom_lbl 063 `"63"', add
label define age_mom_lbl 064 `"64"', add
label define age_mom_lbl 065 `"65"', add
label define age_mom_lbl 066 `"66"', add
label define age_mom_lbl 067 `"67"', add
label define age_mom_lbl 068 `"68"', add
label define age_mom_lbl 069 `"69"', add
label define age_mom_lbl 070 `"70"', add
label define age_mom_lbl 071 `"71"', add
label define age_mom_lbl 072 `"72"', add
label define age_mom_lbl 073 `"73"', add
label define age_mom_lbl 074 `"74"', add
label define age_mom_lbl 075 `"75"', add
label define age_mom_lbl 076 `"76"', add
label define age_mom_lbl 077 `"77"', add
label define age_mom_lbl 078 `"78"', add
label define age_mom_lbl 079 `"79"', add
label define age_mom_lbl 080 `"80"', add
label define age_mom_lbl 081 `"81"', add
label define age_mom_lbl 082 `"82"', add
label define age_mom_lbl 083 `"83"', add
label define age_mom_lbl 084 `"84"', add
label define age_mom_lbl 085 `"85"', add
label define age_mom_lbl 086 `"86"', add
label define age_mom_lbl 087 `"87"', add
label define age_mom_lbl 088 `"88"', add
label define age_mom_lbl 089 `"89"', add
label define age_mom_lbl 090 `"90"', add
label define age_mom_lbl 091 `"91"', add
label define age_mom_lbl 092 `"92"', add
label define age_mom_lbl 093 `"93"', add
label define age_mom_lbl 094 `"94"', add
label define age_mom_lbl 095 `"95"', add
label define age_mom_lbl 096 `"96"', add
label define age_mom_lbl 097 `"97"', add
label define age_mom_lbl 098 `"98"', add
label define age_mom_lbl 099 `"99"', add
label define age_mom_lbl 100 `"100+"', add
label define age_mom_lbl 999 `"Not reported/missing"', add
label values age_mom age_mom_lbl

label define age_pop_lbl 000 `"Less than 1 year"'
label define age_pop_lbl 001 `"1 year"', add
label define age_pop_lbl 002 `"2 years"', add
label define age_pop_lbl 003 `"3"', add
label define age_pop_lbl 004 `"4"', add
label define age_pop_lbl 005 `"5"', add
label define age_pop_lbl 006 `"6"', add
label define age_pop_lbl 007 `"7"', add
label define age_pop_lbl 008 `"8"', add
label define age_pop_lbl 009 `"9"', add
label define age_pop_lbl 010 `"10"', add
label define age_pop_lbl 011 `"11"', add
label define age_pop_lbl 012 `"12"', add
label define age_pop_lbl 013 `"13"', add
label define age_pop_lbl 014 `"14"', add
label define age_pop_lbl 015 `"15"', add
label define age_pop_lbl 016 `"16"', add
label define age_pop_lbl 017 `"17"', add
label define age_pop_lbl 018 `"18"', add
label define age_pop_lbl 019 `"19"', add
label define age_pop_lbl 020 `"20"', add
label define age_pop_lbl 021 `"21"', add
label define age_pop_lbl 022 `"22"', add
label define age_pop_lbl 023 `"23"', add
label define age_pop_lbl 024 `"24"', add
label define age_pop_lbl 025 `"25"', add
label define age_pop_lbl 026 `"26"', add
label define age_pop_lbl 027 `"27"', add
label define age_pop_lbl 028 `"28"', add
label define age_pop_lbl 029 `"29"', add
label define age_pop_lbl 030 `"30"', add
label define age_pop_lbl 031 `"31"', add
label define age_pop_lbl 032 `"32"', add
label define age_pop_lbl 033 `"33"', add
label define age_pop_lbl 034 `"34"', add
label define age_pop_lbl 035 `"35"', add
label define age_pop_lbl 036 `"36"', add
label define age_pop_lbl 037 `"37"', add
label define age_pop_lbl 038 `"38"', add
label define age_pop_lbl 039 `"39"', add
label define age_pop_lbl 040 `"40"', add
label define age_pop_lbl 041 `"41"', add
label define age_pop_lbl 042 `"42"', add
label define age_pop_lbl 043 `"43"', add
label define age_pop_lbl 044 `"44"', add
label define age_pop_lbl 045 `"45"', add
label define age_pop_lbl 046 `"46"', add
label define age_pop_lbl 047 `"47"', add
label define age_pop_lbl 048 `"48"', add
label define age_pop_lbl 049 `"49"', add
label define age_pop_lbl 050 `"50"', add
label define age_pop_lbl 051 `"51"', add
label define age_pop_lbl 052 `"52"', add
label define age_pop_lbl 053 `"53"', add
label define age_pop_lbl 054 `"54"', add
label define age_pop_lbl 055 `"55"', add
label define age_pop_lbl 056 `"56"', add
label define age_pop_lbl 057 `"57"', add
label define age_pop_lbl 058 `"58"', add
label define age_pop_lbl 059 `"59"', add
label define age_pop_lbl 060 `"60"', add
label define age_pop_lbl 061 `"61"', add
label define age_pop_lbl 062 `"62"', add
label define age_pop_lbl 063 `"63"', add
label define age_pop_lbl 064 `"64"', add
label define age_pop_lbl 065 `"65"', add
label define age_pop_lbl 066 `"66"', add
label define age_pop_lbl 067 `"67"', add
label define age_pop_lbl 068 `"68"', add
label define age_pop_lbl 069 `"69"', add
label define age_pop_lbl 070 `"70"', add
label define age_pop_lbl 071 `"71"', add
label define age_pop_lbl 072 `"72"', add
label define age_pop_lbl 073 `"73"', add
label define age_pop_lbl 074 `"74"', add
label define age_pop_lbl 075 `"75"', add
label define age_pop_lbl 076 `"76"', add
label define age_pop_lbl 077 `"77"', add
label define age_pop_lbl 078 `"78"', add
label define age_pop_lbl 079 `"79"', add
label define age_pop_lbl 080 `"80"', add
label define age_pop_lbl 081 `"81"', add
label define age_pop_lbl 082 `"82"', add
label define age_pop_lbl 083 `"83"', add
label define age_pop_lbl 084 `"84"', add
label define age_pop_lbl 085 `"85"', add
label define age_pop_lbl 086 `"86"', add
label define age_pop_lbl 087 `"87"', add
label define age_pop_lbl 088 `"88"', add
label define age_pop_lbl 089 `"89"', add
label define age_pop_lbl 090 `"90"', add
label define age_pop_lbl 091 `"91"', add
label define age_pop_lbl 092 `"92"', add
label define age_pop_lbl 093 `"93"', add
label define age_pop_lbl 094 `"94"', add
label define age_pop_lbl 095 `"95"', add
label define age_pop_lbl 096 `"96"', add
label define age_pop_lbl 097 `"97"', add
label define age_pop_lbl 098 `"98"', add
label define age_pop_lbl 099 `"99"', add
label define age_pop_lbl 100 `"100+"', add
label define age_pop_lbl 999 `"Not reported/missing"', add
label values age_pop age_pop_lbl

label define age_sp_lbl 000 `"Less than 1 year"'
label define age_sp_lbl 001 `"1 year"', add
label define age_sp_lbl 002 `"2 years"', add
label define age_sp_lbl 003 `"3"', add
label define age_sp_lbl 004 `"4"', add
label define age_sp_lbl 005 `"5"', add
label define age_sp_lbl 006 `"6"', add
label define age_sp_lbl 007 `"7"', add
label define age_sp_lbl 008 `"8"', add
label define age_sp_lbl 009 `"9"', add
label define age_sp_lbl 010 `"10"', add
label define age_sp_lbl 011 `"11"', add
label define age_sp_lbl 012 `"12"', add
label define age_sp_lbl 013 `"13"', add
label define age_sp_lbl 014 `"14"', add
label define age_sp_lbl 015 `"15"', add
label define age_sp_lbl 016 `"16"', add
label define age_sp_lbl 017 `"17"', add
label define age_sp_lbl 018 `"18"', add
label define age_sp_lbl 019 `"19"', add
label define age_sp_lbl 020 `"20"', add
label define age_sp_lbl 021 `"21"', add
label define age_sp_lbl 022 `"22"', add
label define age_sp_lbl 023 `"23"', add
label define age_sp_lbl 024 `"24"', add
label define age_sp_lbl 025 `"25"', add
label define age_sp_lbl 026 `"26"', add
label define age_sp_lbl 027 `"27"', add
label define age_sp_lbl 028 `"28"', add
label define age_sp_lbl 029 `"29"', add
label define age_sp_lbl 030 `"30"', add
label define age_sp_lbl 031 `"31"', add
label define age_sp_lbl 032 `"32"', add
label define age_sp_lbl 033 `"33"', add
label define age_sp_lbl 034 `"34"', add
label define age_sp_lbl 035 `"35"', add
label define age_sp_lbl 036 `"36"', add
label define age_sp_lbl 037 `"37"', add
label define age_sp_lbl 038 `"38"', add
label define age_sp_lbl 039 `"39"', add
label define age_sp_lbl 040 `"40"', add
label define age_sp_lbl 041 `"41"', add
label define age_sp_lbl 042 `"42"', add
label define age_sp_lbl 043 `"43"', add
label define age_sp_lbl 044 `"44"', add
label define age_sp_lbl 045 `"45"', add
label define age_sp_lbl 046 `"46"', add
label define age_sp_lbl 047 `"47"', add
label define age_sp_lbl 048 `"48"', add
label define age_sp_lbl 049 `"49"', add
label define age_sp_lbl 050 `"50"', add
label define age_sp_lbl 051 `"51"', add
label define age_sp_lbl 052 `"52"', add
label define age_sp_lbl 053 `"53"', add
label define age_sp_lbl 054 `"54"', add
label define age_sp_lbl 055 `"55"', add
label define age_sp_lbl 056 `"56"', add
label define age_sp_lbl 057 `"57"', add
label define age_sp_lbl 058 `"58"', add
label define age_sp_lbl 059 `"59"', add
label define age_sp_lbl 060 `"60"', add
label define age_sp_lbl 061 `"61"', add
label define age_sp_lbl 062 `"62"', add
label define age_sp_lbl 063 `"63"', add
label define age_sp_lbl 064 `"64"', add
label define age_sp_lbl 065 `"65"', add
label define age_sp_lbl 066 `"66"', add
label define age_sp_lbl 067 `"67"', add
label define age_sp_lbl 068 `"68"', add
label define age_sp_lbl 069 `"69"', add
label define age_sp_lbl 070 `"70"', add
label define age_sp_lbl 071 `"71"', add
label define age_sp_lbl 072 `"72"', add
label define age_sp_lbl 073 `"73"', add
label define age_sp_lbl 074 `"74"', add
label define age_sp_lbl 075 `"75"', add
label define age_sp_lbl 076 `"76"', add
label define age_sp_lbl 077 `"77"', add
label define age_sp_lbl 078 `"78"', add
label define age_sp_lbl 079 `"79"', add
label define age_sp_lbl 080 `"80"', add
label define age_sp_lbl 081 `"81"', add
label define age_sp_lbl 082 `"82"', add
label define age_sp_lbl 083 `"83"', add
label define age_sp_lbl 084 `"84"', add
label define age_sp_lbl 085 `"85"', add
label define age_sp_lbl 086 `"86"', add
label define age_sp_lbl 087 `"87"', add
label define age_sp_lbl 088 `"88"', add
label define age_sp_lbl 089 `"89"', add
label define age_sp_lbl 090 `"90"', add
label define age_sp_lbl 091 `"91"', add
label define age_sp_lbl 092 `"92"', add
label define age_sp_lbl 093 `"93"', add
label define age_sp_lbl 094 `"94"', add
label define age_sp_lbl 095 `"95"', add
label define age_sp_lbl 096 `"96"', add
label define age_sp_lbl 097 `"97"', add
label define age_sp_lbl 098 `"98"', add
label define age_sp_lbl 099 `"99"', add
label define age_sp_lbl 100 `"100+"', add
label define age_sp_lbl 999 `"Not reported/missing"', add
label values age_sp age_sp_lbl

label define sex_head_lbl 1 `"Male"'
label define sex_head_lbl 2 `"Female"', add
label define sex_head_lbl 9 `"Unknown"', add
label values sex_head sex_head_lbl

label define sex_mom_lbl 1 `"Male"'
label define sex_mom_lbl 2 `"Female"', add
label define sex_mom_lbl 9 `"Unknown"', add
label values sex_mom sex_mom_lbl

label define sex_pop_lbl 1 `"Male"'
label define sex_pop_lbl 2 `"Female"', add
label define sex_pop_lbl 9 `"Unknown"', add
label values sex_pop sex_pop_lbl

label define sex_sp_lbl 1 `"Male"'
label define sex_sp_lbl 2 `"Female"', add
label define sex_sp_lbl 9 `"Unknown"', add
label values sex_sp sex_sp_lbl

label define marst_head_lbl 0 `"NIU (not in universe)"'
label define marst_head_lbl 1 `"Single/never married"', add
label define marst_head_lbl 2 `"Married/in union"', add
label define marst_head_lbl 3 `"Separated/divorced/spouse absent"', add
label define marst_head_lbl 4 `"Widowed"', add
label define marst_head_lbl 9 `"Unknown/missing"', add
label values marst_head marst_head_lbl

label define marst_mom_lbl 0 `"NIU (not in universe)"'
label define marst_mom_lbl 1 `"Single/never married"', add
label define marst_mom_lbl 2 `"Married/in union"', add
label define marst_mom_lbl 3 `"Separated/divorced/spouse absent"', add
label define marst_mom_lbl 4 `"Widowed"', add
label define marst_mom_lbl 9 `"Unknown/missing"', add
label values marst_mom marst_mom_lbl

label define marst_pop_lbl 0 `"NIU (not in universe)"'
label define marst_pop_lbl 1 `"Single/never married"', add
label define marst_pop_lbl 2 `"Married/in union"', add
label define marst_pop_lbl 3 `"Separated/divorced/spouse absent"', add
label define marst_pop_lbl 4 `"Widowed"', add
label define marst_pop_lbl 9 `"Unknown/missing"', add
label values marst_pop marst_pop_lbl

label define marst_sp_lbl 0 `"NIU (not in universe)"'
label define marst_sp_lbl 1 `"Single/never married"', add
label define marst_sp_lbl 2 `"Married/in union"', add
label define marst_sp_lbl 3 `"Separated/divorced/spouse absent"', add
label define marst_sp_lbl 4 `"Widowed"', add
label define marst_sp_lbl 9 `"Unknown/missing"', add
label values marst_sp marst_sp_lbl

label define marstd_head_lbl 000 `"NIU (not in universe)"'
label define marstd_head_lbl 100 `"Single/never married"', add
label define marstd_head_lbl 110 `"Engaged"', add
label define marstd_head_lbl 111 `"Never married and never cohabited"', add
label define marstd_head_lbl 200 `"Married or consensual union"', add
label define marstd_head_lbl 210 `"Married, formally"', add
label define marstd_head_lbl 211 `"Married, civil"', add
label define marstd_head_lbl 212 `"Married, religious"', add
label define marstd_head_lbl 213 `"Married, civil and religious"', add
label define marstd_head_lbl 214 `"Married, civil or religious"', add
label define marstd_head_lbl 215 `"Married, traditional/customary"', add
label define marstd_head_lbl 216 `"Married, monogamous"', add
label define marstd_head_lbl 217 `"Married, polygamous"', add
label define marstd_head_lbl 219 `"Married, spouse absent (historical samples)"', add
label define marstd_head_lbl 220 `"Consensual union"', add
label define marstd_head_lbl 300 `"Separated/divorced/spouse absent"', add
label define marstd_head_lbl 310 `"Separated or divorced"', add
label define marstd_head_lbl 320 `"Separated or annulled"', add
label define marstd_head_lbl 330 `"Separated"', add
label define marstd_head_lbl 331 `"Separated legally"', add
label define marstd_head_lbl 332 `"Separated de facto"', add
label define marstd_head_lbl 333 `"Separated from marriage"', add
label define marstd_head_lbl 334 `"Separated from consensual union"', add
label define marstd_head_lbl 335 `"Separated from consensual union or marriage"', add
label define marstd_head_lbl 340 `"Annulled"', add
label define marstd_head_lbl 350 `"Divorced"', add
label define marstd_head_lbl 400 `"Widowed"', add
label define marstd_head_lbl 410 `"Widowed or divorced"', add
label define marstd_head_lbl 411 `"Widowed from consensual union or marriage"', add
label define marstd_head_lbl 412 `"Widowed from marriage"', add
label define marstd_head_lbl 413 `"Widowed from consensual union"', add
label define marstd_head_lbl 420 `"Widowed, divorced, or separated"', add
label define marstd_head_lbl 999 `"Unknown/missing"', add
label values marstd_head marstd_head_lbl

label define marstd_mom_lbl 000 `"NIU (not in universe)"'
label define marstd_mom_lbl 100 `"Single/never married"', add
label define marstd_mom_lbl 110 `"Engaged"', add
label define marstd_mom_lbl 111 `"Never married and never cohabited"', add
label define marstd_mom_lbl 200 `"Married or consensual union"', add
label define marstd_mom_lbl 210 `"Married, formally"', add
label define marstd_mom_lbl 211 `"Married, civil"', add
label define marstd_mom_lbl 212 `"Married, religious"', add
label define marstd_mom_lbl 213 `"Married, civil and religious"', add
label define marstd_mom_lbl 214 `"Married, civil or religious"', add
label define marstd_mom_lbl 215 `"Married, traditional/customary"', add
label define marstd_mom_lbl 216 `"Married, monogamous"', add
label define marstd_mom_lbl 217 `"Married, polygamous"', add
label define marstd_mom_lbl 219 `"Married, spouse absent (historical samples)"', add
label define marstd_mom_lbl 220 `"Consensual union"', add
label define marstd_mom_lbl 300 `"Separated/divorced/spouse absent"', add
label define marstd_mom_lbl 310 `"Separated or divorced"', add
label define marstd_mom_lbl 320 `"Separated or annulled"', add
label define marstd_mom_lbl 330 `"Separated"', add
label define marstd_mom_lbl 331 `"Separated legally"', add
label define marstd_mom_lbl 332 `"Separated de facto"', add
label define marstd_mom_lbl 333 `"Separated from marriage"', add
label define marstd_mom_lbl 334 `"Separated from consensual union"', add
label define marstd_mom_lbl 335 `"Separated from consensual union or marriage"', add
label define marstd_mom_lbl 340 `"Annulled"', add
label define marstd_mom_lbl 350 `"Divorced"', add
label define marstd_mom_lbl 400 `"Widowed"', add
label define marstd_mom_lbl 410 `"Widowed or divorced"', add
label define marstd_mom_lbl 411 `"Widowed from consensual union or marriage"', add
label define marstd_mom_lbl 412 `"Widowed from marriage"', add
label define marstd_mom_lbl 413 `"Widowed from consensual union"', add
label define marstd_mom_lbl 420 `"Widowed, divorced, or separated"', add
label define marstd_mom_lbl 999 `"Unknown/missing"', add
label values marstd_mom marstd_mom_lbl

label define marstd_pop_lbl 000 `"NIU (not in universe)"'
label define marstd_pop_lbl 100 `"Single/never married"', add
label define marstd_pop_lbl 110 `"Engaged"', add
label define marstd_pop_lbl 111 `"Never married and never cohabited"', add
label define marstd_pop_lbl 200 `"Married or consensual union"', add
label define marstd_pop_lbl 210 `"Married, formally"', add
label define marstd_pop_lbl 211 `"Married, civil"', add
label define marstd_pop_lbl 212 `"Married, religious"', add
label define marstd_pop_lbl 213 `"Married, civil and religious"', add
label define marstd_pop_lbl 214 `"Married, civil or religious"', add
label define marstd_pop_lbl 215 `"Married, traditional/customary"', add
label define marstd_pop_lbl 216 `"Married, monogamous"', add
label define marstd_pop_lbl 217 `"Married, polygamous"', add
label define marstd_pop_lbl 219 `"Married, spouse absent (historical samples)"', add
label define marstd_pop_lbl 220 `"Consensual union"', add
label define marstd_pop_lbl 300 `"Separated/divorced/spouse absent"', add
label define marstd_pop_lbl 310 `"Separated or divorced"', add
label define marstd_pop_lbl 320 `"Separated or annulled"', add
label define marstd_pop_lbl 330 `"Separated"', add
label define marstd_pop_lbl 331 `"Separated legally"', add
label define marstd_pop_lbl 332 `"Separated de facto"', add
label define marstd_pop_lbl 333 `"Separated from marriage"', add
label define marstd_pop_lbl 334 `"Separated from consensual union"', add
label define marstd_pop_lbl 335 `"Separated from consensual union or marriage"', add
label define marstd_pop_lbl 340 `"Annulled"', add
label define marstd_pop_lbl 350 `"Divorced"', add
label define marstd_pop_lbl 400 `"Widowed"', add
label define marstd_pop_lbl 410 `"Widowed or divorced"', add
label define marstd_pop_lbl 411 `"Widowed from consensual union or marriage"', add
label define marstd_pop_lbl 412 `"Widowed from marriage"', add
label define marstd_pop_lbl 413 `"Widowed from consensual union"', add
label define marstd_pop_lbl 420 `"Widowed, divorced, or separated"', add
label define marstd_pop_lbl 999 `"Unknown/missing"', add
label values marstd_pop marstd_pop_lbl

label define marstd_sp_lbl 000 `"NIU (not in universe)"'
label define marstd_sp_lbl 100 `"Single/never married"', add
label define marstd_sp_lbl 110 `"Engaged"', add
label define marstd_sp_lbl 111 `"Never married and never cohabited"', add
label define marstd_sp_lbl 200 `"Married or consensual union"', add
label define marstd_sp_lbl 210 `"Married, formally"', add
label define marstd_sp_lbl 211 `"Married, civil"', add
label define marstd_sp_lbl 212 `"Married, religious"', add
label define marstd_sp_lbl 213 `"Married, civil and religious"', add
label define marstd_sp_lbl 214 `"Married, civil or religious"', add
label define marstd_sp_lbl 215 `"Married, traditional/customary"', add
label define marstd_sp_lbl 216 `"Married, monogamous"', add
label define marstd_sp_lbl 217 `"Married, polygamous"', add
label define marstd_sp_lbl 219 `"Married, spouse absent (historical samples)"', add
label define marstd_sp_lbl 220 `"Consensual union"', add
label define marstd_sp_lbl 300 `"Separated/divorced/spouse absent"', add
label define marstd_sp_lbl 310 `"Separated or divorced"', add
label define marstd_sp_lbl 320 `"Separated or annulled"', add
label define marstd_sp_lbl 330 `"Separated"', add
label define marstd_sp_lbl 331 `"Separated legally"', add
label define marstd_sp_lbl 332 `"Separated de facto"', add
label define marstd_sp_lbl 333 `"Separated from marriage"', add
label define marstd_sp_lbl 334 `"Separated from consensual union"', add
label define marstd_sp_lbl 335 `"Separated from consensual union or marriage"', add
label define marstd_sp_lbl 340 `"Annulled"', add
label define marstd_sp_lbl 350 `"Divorced"', add
label define marstd_sp_lbl 400 `"Widowed"', add
label define marstd_sp_lbl 410 `"Widowed or divorced"', add
label define marstd_sp_lbl 411 `"Widowed from consensual union or marriage"', add
label define marstd_sp_lbl 412 `"Widowed from marriage"', add
label define marstd_sp_lbl 413 `"Widowed from consensual union"', add
label define marstd_sp_lbl 420 `"Widowed, divorced, or separated"', add
label define marstd_sp_lbl 999 `"Unknown/missing"', add
label values marstd_sp marstd_sp_lbl

label define birthyr_head_lbl 0000 `"NIU (not in universe)"'
label define birthyr_head_lbl 1628 `"1628"', add
label define birthyr_head_lbl 1629 `"1629"', add
label define birthyr_head_lbl 1630 `"1630"', add
label define birthyr_head_lbl 1631 `"1631"', add
label define birthyr_head_lbl 1634 `"1634"', add
label define birthyr_head_lbl 1635 `"1635"', add
label define birthyr_head_lbl 1636 `"1636"', add
label define birthyr_head_lbl 1637 `"1637"', add
label define birthyr_head_lbl 1638 `"1638"', add
label define birthyr_head_lbl 1639 `"1639"', add
label define birthyr_head_lbl 1640 `"1640"', add
label define birthyr_head_lbl 1641 `"1641"', add
label define birthyr_head_lbl 1642 `"1642"', add
label define birthyr_head_lbl 1643 `"1643"', add
label define birthyr_head_lbl 1644 `"1644"', add
label define birthyr_head_lbl 1645 `"1645"', add
label define birthyr_head_lbl 1646 `"1646"', add
label define birthyr_head_lbl 1647 `"1647"', add
label define birthyr_head_lbl 1648 `"1648"', add
label define birthyr_head_lbl 1649 `"1649"', add
label define birthyr_head_lbl 1650 `"1650"', add
label define birthyr_head_lbl 1651 `"1651"', add
label define birthyr_head_lbl 1652 `"1652"', add
label define birthyr_head_lbl 1653 `"1653"', add
label define birthyr_head_lbl 1654 `"1654"', add
label define birthyr_head_lbl 1655 `"1655"', add
label define birthyr_head_lbl 1656 `"1656"', add
label define birthyr_head_lbl 1657 `"1657"', add
label define birthyr_head_lbl 1658 `"1658"', add
label define birthyr_head_lbl 1659 `"1659"', add
label define birthyr_head_lbl 1660 `"1660"', add
label define birthyr_head_lbl 1661 `"1661"', add
label define birthyr_head_lbl 1662 `"1662"', add
label define birthyr_head_lbl 1663 `"1663"', add
label define birthyr_head_lbl 1664 `"1664"', add
label define birthyr_head_lbl 1665 `"1665"', add
label define birthyr_head_lbl 1666 `"1666"', add
label define birthyr_head_lbl 1667 `"1667"', add
label define birthyr_head_lbl 1668 `"1668"', add
label define birthyr_head_lbl 1669 `"1669"', add
label define birthyr_head_lbl 1670 `"1670"', add
label define birthyr_head_lbl 1671 `"1671"', add
label define birthyr_head_lbl 1672 `"1672"', add
label define birthyr_head_lbl 1673 `"1673"', add
label define birthyr_head_lbl 1674 `"1674"', add
label define birthyr_head_lbl 1675 `"1675"', add
label define birthyr_head_lbl 1676 `"1676"', add
label define birthyr_head_lbl 1677 `"1677"', add
label define birthyr_head_lbl 1678 `"1678"', add
label define birthyr_head_lbl 1679 `"1679"', add
label define birthyr_head_lbl 1680 `"1680"', add
label define birthyr_head_lbl 1681 `"1681"', add
label define birthyr_head_lbl 1682 `"1682"', add
label define birthyr_head_lbl 1683 `"1683"', add
label define birthyr_head_lbl 1684 `"1684"', add
label define birthyr_head_lbl 1685 `"1685"', add
label define birthyr_head_lbl 1686 `"1686"', add
label define birthyr_head_lbl 1687 `"1687"', add
label define birthyr_head_lbl 1688 `"1688"', add
label define birthyr_head_lbl 1689 `"1689"', add
label define birthyr_head_lbl 1690 `"1690"', add
label define birthyr_head_lbl 1691 `"1691"', add
label define birthyr_head_lbl 1692 `"1692"', add
label define birthyr_head_lbl 1693 `"1693"', add
label define birthyr_head_lbl 1694 `"1694"', add
label define birthyr_head_lbl 1695 `"1695"', add
label define birthyr_head_lbl 1696 `"1696"', add
label define birthyr_head_lbl 1697 `"1697"', add
label define birthyr_head_lbl 1698 `"1698"', add
label define birthyr_head_lbl 1699 `"1699"', add
label define birthyr_head_lbl 1700 `"1700"', add
label define birthyr_head_lbl 1701 `"1701"', add
label define birthyr_head_lbl 1702 `"1702"', add
label define birthyr_head_lbl 1703 `"1703"', add
label define birthyr_head_lbl 1704 `"1704"', add
label define birthyr_head_lbl 1705 `"1705"', add
label define birthyr_head_lbl 1706 `"1706"', add
label define birthyr_head_lbl 1707 `"1707"', add
label define birthyr_head_lbl 1708 `"1708"', add
label define birthyr_head_lbl 1709 `"1709"', add
label define birthyr_head_lbl 1710 `"1710"', add
label define birthyr_head_lbl 1711 `"1711"', add
label define birthyr_head_lbl 1712 `"1712"', add
label define birthyr_head_lbl 1713 `"1713"', add
label define birthyr_head_lbl 1714 `"1714"', add
label define birthyr_head_lbl 1715 `"1715"', add
label define birthyr_head_lbl 1716 `"1716"', add
label define birthyr_head_lbl 1717 `"1717"', add
label define birthyr_head_lbl 1718 `"1718"', add
label define birthyr_head_lbl 1719 `"1719"', add
label define birthyr_head_lbl 1720 `"1720"', add
label define birthyr_head_lbl 1721 `"1721"', add
label define birthyr_head_lbl 1722 `"1722"', add
label define birthyr_head_lbl 1723 `"1723"', add
label define birthyr_head_lbl 1724 `"1724"', add
label define birthyr_head_lbl 1725 `"1725"', add
label define birthyr_head_lbl 1726 `"1726"', add
label define birthyr_head_lbl 1727 `"1727"', add
label define birthyr_head_lbl 1728 `"1728"', add
label define birthyr_head_lbl 1729 `"1729"', add
label define birthyr_head_lbl 1730 `"1730"', add
label define birthyr_head_lbl 1731 `"1731"', add
label define birthyr_head_lbl 1732 `"1732"', add
label define birthyr_head_lbl 1733 `"1733"', add
label define birthyr_head_lbl 1734 `"1734"', add
label define birthyr_head_lbl 1735 `"1735"', add
label define birthyr_head_lbl 1736 `"1736"', add
label define birthyr_head_lbl 1737 `"1737"', add
label define birthyr_head_lbl 1738 `"1738"', add
label define birthyr_head_lbl 1739 `"1739"', add
label define birthyr_head_lbl 1740 `"1740"', add
label define birthyr_head_lbl 1741 `"1741"', add
label define birthyr_head_lbl 1742 `"1742"', add
label define birthyr_head_lbl 1743 `"1743"', add
label define birthyr_head_lbl 1744 `"1744"', add
label define birthyr_head_lbl 1745 `"1745"', add
label define birthyr_head_lbl 1746 `"1746"', add
label define birthyr_head_lbl 1747 `"1747"', add
label define birthyr_head_lbl 1748 `"1748"', add
label define birthyr_head_lbl 1749 `"1749"', add
label define birthyr_head_lbl 1750 `"1750"', add
label define birthyr_head_lbl 1751 `"1751"', add
label define birthyr_head_lbl 1752 `"1752"', add
label define birthyr_head_lbl 1753 `"1753"', add
label define birthyr_head_lbl 1754 `"1754"', add
label define birthyr_head_lbl 1755 `"1755"', add
label define birthyr_head_lbl 1756 `"1756"', add
label define birthyr_head_lbl 1757 `"1757"', add
label define birthyr_head_lbl 1758 `"1758"', add
label define birthyr_head_lbl 1759 `"1759"', add
label define birthyr_head_lbl 1760 `"1760"', add
label define birthyr_head_lbl 1761 `"1761"', add
label define birthyr_head_lbl 1762 `"1762"', add
label define birthyr_head_lbl 1763 `"1763"', add
label define birthyr_head_lbl 1764 `"1764"', add
label define birthyr_head_lbl 1765 `"1765"', add
label define birthyr_head_lbl 1766 `"1766"', add
label define birthyr_head_lbl 1767 `"1767"', add
label define birthyr_head_lbl 1768 `"1768"', add
label define birthyr_head_lbl 1769 `"1769"', add
label define birthyr_head_lbl 1770 `"1770"', add
label define birthyr_head_lbl 1771 `"1771"', add
label define birthyr_head_lbl 1772 `"1772"', add
label define birthyr_head_lbl 1773 `"1773"', add
label define birthyr_head_lbl 1774 `"1774"', add
label define birthyr_head_lbl 1775 `"1775"', add
label define birthyr_head_lbl 1776 `"1776"', add
label define birthyr_head_lbl 1777 `"1777"', add
label define birthyr_head_lbl 1778 `"1778"', add
label define birthyr_head_lbl 1779 `"1779"', add
label define birthyr_head_lbl 1780 `"1780"', add
label define birthyr_head_lbl 1781 `"1781"', add
label define birthyr_head_lbl 1782 `"1782"', add
label define birthyr_head_lbl 1783 `"1783"', add
label define birthyr_head_lbl 1784 `"1784"', add
label define birthyr_head_lbl 1785 `"1785"', add
label define birthyr_head_lbl 1786 `"1786"', add
label define birthyr_head_lbl 1787 `"1787"', add
label define birthyr_head_lbl 1788 `"1788"', add
label define birthyr_head_lbl 1789 `"1789"', add
label define birthyr_head_lbl 1790 `"1790"', add
label define birthyr_head_lbl 1791 `"1791"', add
label define birthyr_head_lbl 1792 `"1792"', add
label define birthyr_head_lbl 1793 `"1793"', add
label define birthyr_head_lbl 1794 `"1794"', add
label define birthyr_head_lbl 1795 `"1795"', add
label define birthyr_head_lbl 1796 `"1796"', add
label define birthyr_head_lbl 1797 `"1797"', add
label define birthyr_head_lbl 1798 `"1798"', add
label define birthyr_head_lbl 1799 `"1799"', add
label define birthyr_head_lbl 1800 `"1800"', add
label define birthyr_head_lbl 1801 `"1801"', add
label define birthyr_head_lbl 1802 `"1802"', add
label define birthyr_head_lbl 1803 `"1803"', add
label define birthyr_head_lbl 1804 `"1804"', add
label define birthyr_head_lbl 1805 `"1805"', add
label define birthyr_head_lbl 1806 `"1806"', add
label define birthyr_head_lbl 1807 `"1807"', add
label define birthyr_head_lbl 1808 `"1808"', add
label define birthyr_head_lbl 1809 `"1809"', add
label define birthyr_head_lbl 1810 `"1810"', add
label define birthyr_head_lbl 1811 `"1811"', add
label define birthyr_head_lbl 1812 `"1812"', add
label define birthyr_head_lbl 1813 `"1813"', add
label define birthyr_head_lbl 1814 `"1814"', add
label define birthyr_head_lbl 1815 `"1815"', add
label define birthyr_head_lbl 1816 `"1816"', add
label define birthyr_head_lbl 1817 `"1817"', add
label define birthyr_head_lbl 1818 `"1818"', add
label define birthyr_head_lbl 1819 `"1819"', add
label define birthyr_head_lbl 1820 `"1820"', add
label define birthyr_head_lbl 1821 `"1821"', add
label define birthyr_head_lbl 1822 `"1822"', add
label define birthyr_head_lbl 1823 `"1823"', add
label define birthyr_head_lbl 1824 `"1824"', add
label define birthyr_head_lbl 1825 `"1825"', add
label define birthyr_head_lbl 1826 `"1826"', add
label define birthyr_head_lbl 1827 `"1827"', add
label define birthyr_head_lbl 1828 `"1828"', add
label define birthyr_head_lbl 1829 `"1829"', add
label define birthyr_head_lbl 1830 `"1830"', add
label define birthyr_head_lbl 1831 `"1831"', add
label define birthyr_head_lbl 1832 `"1832"', add
label define birthyr_head_lbl 1833 `"1833"', add
label define birthyr_head_lbl 1834 `"1834"', add
label define birthyr_head_lbl 1835 `"1835"', add
label define birthyr_head_lbl 1836 `"1836"', add
label define birthyr_head_lbl 1837 `"1837"', add
label define birthyr_head_lbl 1838 `"1838"', add
label define birthyr_head_lbl 1839 `"1839"', add
label define birthyr_head_lbl 1840 `"1840"', add
label define birthyr_head_lbl 1841 `"1841"', add
label define birthyr_head_lbl 1842 `"1842"', add
label define birthyr_head_lbl 1843 `"1843"', add
label define birthyr_head_lbl 1844 `"1844"', add
label define birthyr_head_lbl 1845 `"1845"', add
label define birthyr_head_lbl 1846 `"1846"', add
label define birthyr_head_lbl 1847 `"1847"', add
label define birthyr_head_lbl 1848 `"1848"', add
label define birthyr_head_lbl 1849 `"1849"', add
label define birthyr_head_lbl 1850 `"1850"', add
label define birthyr_head_lbl 1851 `"1851"', add
label define birthyr_head_lbl 1852 `"1852"', add
label define birthyr_head_lbl 1853 `"1853"', add
label define birthyr_head_lbl 1854 `"1854"', add
label define birthyr_head_lbl 1855 `"1855"', add
label define birthyr_head_lbl 1856 `"1856"', add
label define birthyr_head_lbl 1857 `"1857"', add
label define birthyr_head_lbl 1858 `"1858"', add
label define birthyr_head_lbl 1859 `"1859"', add
label define birthyr_head_lbl 1860 `"1860"', add
label define birthyr_head_lbl 1861 `"1861"', add
label define birthyr_head_lbl 1862 `"1862"', add
label define birthyr_head_lbl 1863 `"1863"', add
label define birthyr_head_lbl 1864 `"1864"', add
label define birthyr_head_lbl 1865 `"1865"', add
label define birthyr_head_lbl 1866 `"1866"', add
label define birthyr_head_lbl 1867 `"1867"', add
label define birthyr_head_lbl 1868 `"1868"', add
label define birthyr_head_lbl 1869 `"1869"', add
label define birthyr_head_lbl 1870 `"1870"', add
label define birthyr_head_lbl 1871 `"1871"', add
label define birthyr_head_lbl 1872 `"1872"', add
label define birthyr_head_lbl 1873 `"1873"', add
label define birthyr_head_lbl 1874 `"1874"', add
label define birthyr_head_lbl 1875 `"1875"', add
label define birthyr_head_lbl 1876 `"1876"', add
label define birthyr_head_lbl 1877 `"1877"', add
label define birthyr_head_lbl 1878 `"1878"', add
label define birthyr_head_lbl 1879 `"1879"', add
label define birthyr_head_lbl 1880 `"1880"', add
label define birthyr_head_lbl 1881 `"1881"', add
label define birthyr_head_lbl 1882 `"1882"', add
label define birthyr_head_lbl 1883 `"1883"', add
label define birthyr_head_lbl 1884 `"1884"', add
label define birthyr_head_lbl 1885 `"1885"', add
label define birthyr_head_lbl 1886 `"1886"', add
label define birthyr_head_lbl 1887 `"1887"', add
label define birthyr_head_lbl 1888 `"1888"', add
label define birthyr_head_lbl 1889 `"1889"', add
label define birthyr_head_lbl 1890 `"1890"', add
label define birthyr_head_lbl 1891 `"1891"', add
label define birthyr_head_lbl 1892 `"1892"', add
label define birthyr_head_lbl 1893 `"1893"', add
label define birthyr_head_lbl 1894 `"1894"', add
label define birthyr_head_lbl 1895 `"1895"', add
label define birthyr_head_lbl 1896 `"1896"', add
label define birthyr_head_lbl 1897 `"1897"', add
label define birthyr_head_lbl 1898 `"1898"', add
label define birthyr_head_lbl 1899 `"1899"', add
label define birthyr_head_lbl 1900 `"1900"', add
label define birthyr_head_lbl 1901 `"1901"', add
label define birthyr_head_lbl 1902 `"1902"', add
label define birthyr_head_lbl 1903 `"1903"', add
label define birthyr_head_lbl 1904 `"1904"', add
label define birthyr_head_lbl 1905 `"1905"', add
label define birthyr_head_lbl 1906 `"1906"', add
label define birthyr_head_lbl 1907 `"1907"', add
label define birthyr_head_lbl 1908 `"1908"', add
label define birthyr_head_lbl 1909 `"1909"', add
label define birthyr_head_lbl 1910 `"1910"', add
label define birthyr_head_lbl 1911 `"1911"', add
label define birthyr_head_lbl 1912 `"1912"', add
label define birthyr_head_lbl 1913 `"1913"', add
label define birthyr_head_lbl 1914 `"1914"', add
label define birthyr_head_lbl 1915 `"1915"', add
label define birthyr_head_lbl 1916 `"1916"', add
label define birthyr_head_lbl 1917 `"1917"', add
label define birthyr_head_lbl 1918 `"1918"', add
label define birthyr_head_lbl 1919 `"1919"', add
label define birthyr_head_lbl 1920 `"1920"', add
label define birthyr_head_lbl 1921 `"1921"', add
label define birthyr_head_lbl 1922 `"1922"', add
label define birthyr_head_lbl 1923 `"1923"', add
label define birthyr_head_lbl 1924 `"1924"', add
label define birthyr_head_lbl 1925 `"1925"', add
label define birthyr_head_lbl 1926 `"1926"', add
label define birthyr_head_lbl 1927 `"1927"', add
label define birthyr_head_lbl 1928 `"1928"', add
label define birthyr_head_lbl 1929 `"1929"', add
label define birthyr_head_lbl 1930 `"1930"', add
label define birthyr_head_lbl 1931 `"1931"', add
label define birthyr_head_lbl 1932 `"1932"', add
label define birthyr_head_lbl 1933 `"1933"', add
label define birthyr_head_lbl 1934 `"1934"', add
label define birthyr_head_lbl 1935 `"1935"', add
label define birthyr_head_lbl 1936 `"1936"', add
label define birthyr_head_lbl 1937 `"1937"', add
label define birthyr_head_lbl 1938 `"1938"', add
label define birthyr_head_lbl 1939 `"1939"', add
label define birthyr_head_lbl 1940 `"1940"', add
label define birthyr_head_lbl 1941 `"1941"', add
label define birthyr_head_lbl 1942 `"1942"', add
label define birthyr_head_lbl 1943 `"1943"', add
label define birthyr_head_lbl 1944 `"1944"', add
label define birthyr_head_lbl 1945 `"1945"', add
label define birthyr_head_lbl 1946 `"1946"', add
label define birthyr_head_lbl 1947 `"1947"', add
label define birthyr_head_lbl 1948 `"1948"', add
label define birthyr_head_lbl 1949 `"1949"', add
label define birthyr_head_lbl 1950 `"1950"', add
label define birthyr_head_lbl 1951 `"1951"', add
label define birthyr_head_lbl 1952 `"1952"', add
label define birthyr_head_lbl 1953 `"1953"', add
label define birthyr_head_lbl 1954 `"1954"', add
label define birthyr_head_lbl 1955 `"1955"', add
label define birthyr_head_lbl 1956 `"1956"', add
label define birthyr_head_lbl 1957 `"1957"', add
label define birthyr_head_lbl 1958 `"1958"', add
label define birthyr_head_lbl 1959 `"1959"', add
label define birthyr_head_lbl 1960 `"1960"', add
label define birthyr_head_lbl 1961 `"1961"', add
label define birthyr_head_lbl 1962 `"1962"', add
label define birthyr_head_lbl 1963 `"1963"', add
label define birthyr_head_lbl 1964 `"1964"', add
label define birthyr_head_lbl 1965 `"1965"', add
label define birthyr_head_lbl 1966 `"1966"', add
label define birthyr_head_lbl 1967 `"1967"', add
label define birthyr_head_lbl 1968 `"1968"', add
label define birthyr_head_lbl 1969 `"1969"', add
label define birthyr_head_lbl 1970 `"1970"', add
label define birthyr_head_lbl 1971 `"1971"', add
label define birthyr_head_lbl 1972 `"1972"', add
label define birthyr_head_lbl 1973 `"1973"', add
label define birthyr_head_lbl 1974 `"1974"', add
label define birthyr_head_lbl 1975 `"1975"', add
label define birthyr_head_lbl 1976 `"1976"', add
label define birthyr_head_lbl 1977 `"1977"', add
label define birthyr_head_lbl 1978 `"1978"', add
label define birthyr_head_lbl 1979 `"1979"', add
label define birthyr_head_lbl 1980 `"1980"', add
label define birthyr_head_lbl 1981 `"1981"', add
label define birthyr_head_lbl 1982 `"1982"', add
label define birthyr_head_lbl 1983 `"1983"', add
label define birthyr_head_lbl 1984 `"1984"', add
label define birthyr_head_lbl 1985 `"1985"', add
label define birthyr_head_lbl 1986 `"1986"', add
label define birthyr_head_lbl 1987 `"1987"', add
label define birthyr_head_lbl 1988 `"1988"', add
label define birthyr_head_lbl 1989 `"1989"', add
label define birthyr_head_lbl 1990 `"1990"', add
label define birthyr_head_lbl 1991 `"1991"', add
label define birthyr_head_lbl 1992 `"1992"', add
label define birthyr_head_lbl 1993 `"1993"', add
label define birthyr_head_lbl 1994 `"1994"', add
label define birthyr_head_lbl 1995 `"1995"', add
label define birthyr_head_lbl 1996 `"1996"', add
label define birthyr_head_lbl 1997 `"1997"', add
label define birthyr_head_lbl 1998 `"1998"', add
label define birthyr_head_lbl 1999 `"1999"', add
label define birthyr_head_lbl 2000 `"2000"', add
label define birthyr_head_lbl 2001 `"2001"', add
label define birthyr_head_lbl 2002 `"2002"', add
label define birthyr_head_lbl 2003 `"2003"', add
label define birthyr_head_lbl 2004 `"2004"', add
label define birthyr_head_lbl 2005 `"2005"', add
label define birthyr_head_lbl 2006 `"2006"', add
label define birthyr_head_lbl 2007 `"2007"', add
label define birthyr_head_lbl 2008 `"2008"', add
label define birthyr_head_lbl 2009 `"2009"', add
label define birthyr_head_lbl 2010 `"2010"', add
label define birthyr_head_lbl 2011 `"2011"', add
label define birthyr_head_lbl 2012 `"2012"', add
label define birthyr_head_lbl 2013 `"2013"', add
label define birthyr_head_lbl 2014 `"2014"', add
label define birthyr_head_lbl 2015 `"2015"', add
label define birthyr_head_lbl 2016 `"2016"', add
label define birthyr_head_lbl 2017 `"2017"', add
label define birthyr_head_lbl 2018 `"2018"', add
label define birthyr_head_lbl 2019 `"2019"', add
label define birthyr_head_lbl 2020 `"2020"', add
label define birthyr_head_lbl 9999 `"Unknown"', add
label values birthyr_head birthyr_head_lbl

label define birthyr_mom_lbl 0000 `"NIU (not in universe)"'
label define birthyr_mom_lbl 1628 `"1628"', add
label define birthyr_mom_lbl 1629 `"1629"', add
label define birthyr_mom_lbl 1630 `"1630"', add
label define birthyr_mom_lbl 1631 `"1631"', add
label define birthyr_mom_lbl 1634 `"1634"', add
label define birthyr_mom_lbl 1635 `"1635"', add
label define birthyr_mom_lbl 1636 `"1636"', add
label define birthyr_mom_lbl 1637 `"1637"', add
label define birthyr_mom_lbl 1638 `"1638"', add
label define birthyr_mom_lbl 1639 `"1639"', add
label define birthyr_mom_lbl 1640 `"1640"', add
label define birthyr_mom_lbl 1641 `"1641"', add
label define birthyr_mom_lbl 1642 `"1642"', add
label define birthyr_mom_lbl 1643 `"1643"', add
label define birthyr_mom_lbl 1644 `"1644"', add
label define birthyr_mom_lbl 1645 `"1645"', add
label define birthyr_mom_lbl 1646 `"1646"', add
label define birthyr_mom_lbl 1647 `"1647"', add
label define birthyr_mom_lbl 1648 `"1648"', add
label define birthyr_mom_lbl 1649 `"1649"', add
label define birthyr_mom_lbl 1650 `"1650"', add
label define birthyr_mom_lbl 1651 `"1651"', add
label define birthyr_mom_lbl 1652 `"1652"', add
label define birthyr_mom_lbl 1653 `"1653"', add
label define birthyr_mom_lbl 1654 `"1654"', add
label define birthyr_mom_lbl 1655 `"1655"', add
label define birthyr_mom_lbl 1656 `"1656"', add
label define birthyr_mom_lbl 1657 `"1657"', add
label define birthyr_mom_lbl 1658 `"1658"', add
label define birthyr_mom_lbl 1659 `"1659"', add
label define birthyr_mom_lbl 1660 `"1660"', add
label define birthyr_mom_lbl 1661 `"1661"', add
label define birthyr_mom_lbl 1662 `"1662"', add
label define birthyr_mom_lbl 1663 `"1663"', add
label define birthyr_mom_lbl 1664 `"1664"', add
label define birthyr_mom_lbl 1665 `"1665"', add
label define birthyr_mom_lbl 1666 `"1666"', add
label define birthyr_mom_lbl 1667 `"1667"', add
label define birthyr_mom_lbl 1668 `"1668"', add
label define birthyr_mom_lbl 1669 `"1669"', add
label define birthyr_mom_lbl 1670 `"1670"', add
label define birthyr_mom_lbl 1671 `"1671"', add
label define birthyr_mom_lbl 1672 `"1672"', add
label define birthyr_mom_lbl 1673 `"1673"', add
label define birthyr_mom_lbl 1674 `"1674"', add
label define birthyr_mom_lbl 1675 `"1675"', add
label define birthyr_mom_lbl 1676 `"1676"', add
label define birthyr_mom_lbl 1677 `"1677"', add
label define birthyr_mom_lbl 1678 `"1678"', add
label define birthyr_mom_lbl 1679 `"1679"', add
label define birthyr_mom_lbl 1680 `"1680"', add
label define birthyr_mom_lbl 1681 `"1681"', add
label define birthyr_mom_lbl 1682 `"1682"', add
label define birthyr_mom_lbl 1683 `"1683"', add
label define birthyr_mom_lbl 1684 `"1684"', add
label define birthyr_mom_lbl 1685 `"1685"', add
label define birthyr_mom_lbl 1686 `"1686"', add
label define birthyr_mom_lbl 1687 `"1687"', add
label define birthyr_mom_lbl 1688 `"1688"', add
label define birthyr_mom_lbl 1689 `"1689"', add
label define birthyr_mom_lbl 1690 `"1690"', add
label define birthyr_mom_lbl 1691 `"1691"', add
label define birthyr_mom_lbl 1692 `"1692"', add
label define birthyr_mom_lbl 1693 `"1693"', add
label define birthyr_mom_lbl 1694 `"1694"', add
label define birthyr_mom_lbl 1695 `"1695"', add
label define birthyr_mom_lbl 1696 `"1696"', add
label define birthyr_mom_lbl 1697 `"1697"', add
label define birthyr_mom_lbl 1698 `"1698"', add
label define birthyr_mom_lbl 1699 `"1699"', add
label define birthyr_mom_lbl 1700 `"1700"', add
label define birthyr_mom_lbl 1701 `"1701"', add
label define birthyr_mom_lbl 1702 `"1702"', add
label define birthyr_mom_lbl 1703 `"1703"', add
label define birthyr_mom_lbl 1704 `"1704"', add
label define birthyr_mom_lbl 1705 `"1705"', add
label define birthyr_mom_lbl 1706 `"1706"', add
label define birthyr_mom_lbl 1707 `"1707"', add
label define birthyr_mom_lbl 1708 `"1708"', add
label define birthyr_mom_lbl 1709 `"1709"', add
label define birthyr_mom_lbl 1710 `"1710"', add
label define birthyr_mom_lbl 1711 `"1711"', add
label define birthyr_mom_lbl 1712 `"1712"', add
label define birthyr_mom_lbl 1713 `"1713"', add
label define birthyr_mom_lbl 1714 `"1714"', add
label define birthyr_mom_lbl 1715 `"1715"', add
label define birthyr_mom_lbl 1716 `"1716"', add
label define birthyr_mom_lbl 1717 `"1717"', add
label define birthyr_mom_lbl 1718 `"1718"', add
label define birthyr_mom_lbl 1719 `"1719"', add
label define birthyr_mom_lbl 1720 `"1720"', add
label define birthyr_mom_lbl 1721 `"1721"', add
label define birthyr_mom_lbl 1722 `"1722"', add
label define birthyr_mom_lbl 1723 `"1723"', add
label define birthyr_mom_lbl 1724 `"1724"', add
label define birthyr_mom_lbl 1725 `"1725"', add
label define birthyr_mom_lbl 1726 `"1726"', add
label define birthyr_mom_lbl 1727 `"1727"', add
label define birthyr_mom_lbl 1728 `"1728"', add
label define birthyr_mom_lbl 1729 `"1729"', add
label define birthyr_mom_lbl 1730 `"1730"', add
label define birthyr_mom_lbl 1731 `"1731"', add
label define birthyr_mom_lbl 1732 `"1732"', add
label define birthyr_mom_lbl 1733 `"1733"', add
label define birthyr_mom_lbl 1734 `"1734"', add
label define birthyr_mom_lbl 1735 `"1735"', add
label define birthyr_mom_lbl 1736 `"1736"', add
label define birthyr_mom_lbl 1737 `"1737"', add
label define birthyr_mom_lbl 1738 `"1738"', add
label define birthyr_mom_lbl 1739 `"1739"', add
label define birthyr_mom_lbl 1740 `"1740"', add
label define birthyr_mom_lbl 1741 `"1741"', add
label define birthyr_mom_lbl 1742 `"1742"', add
label define birthyr_mom_lbl 1743 `"1743"', add
label define birthyr_mom_lbl 1744 `"1744"', add
label define birthyr_mom_lbl 1745 `"1745"', add
label define birthyr_mom_lbl 1746 `"1746"', add
label define birthyr_mom_lbl 1747 `"1747"', add
label define birthyr_mom_lbl 1748 `"1748"', add
label define birthyr_mom_lbl 1749 `"1749"', add
label define birthyr_mom_lbl 1750 `"1750"', add
label define birthyr_mom_lbl 1751 `"1751"', add
label define birthyr_mom_lbl 1752 `"1752"', add
label define birthyr_mom_lbl 1753 `"1753"', add
label define birthyr_mom_lbl 1754 `"1754"', add
label define birthyr_mom_lbl 1755 `"1755"', add
label define birthyr_mom_lbl 1756 `"1756"', add
label define birthyr_mom_lbl 1757 `"1757"', add
label define birthyr_mom_lbl 1758 `"1758"', add
label define birthyr_mom_lbl 1759 `"1759"', add
label define birthyr_mom_lbl 1760 `"1760"', add
label define birthyr_mom_lbl 1761 `"1761"', add
label define birthyr_mom_lbl 1762 `"1762"', add
label define birthyr_mom_lbl 1763 `"1763"', add
label define birthyr_mom_lbl 1764 `"1764"', add
label define birthyr_mom_lbl 1765 `"1765"', add
label define birthyr_mom_lbl 1766 `"1766"', add
label define birthyr_mom_lbl 1767 `"1767"', add
label define birthyr_mom_lbl 1768 `"1768"', add
label define birthyr_mom_lbl 1769 `"1769"', add
label define birthyr_mom_lbl 1770 `"1770"', add
label define birthyr_mom_lbl 1771 `"1771"', add
label define birthyr_mom_lbl 1772 `"1772"', add
label define birthyr_mom_lbl 1773 `"1773"', add
label define birthyr_mom_lbl 1774 `"1774"', add
label define birthyr_mom_lbl 1775 `"1775"', add
label define birthyr_mom_lbl 1776 `"1776"', add
label define birthyr_mom_lbl 1777 `"1777"', add
label define birthyr_mom_lbl 1778 `"1778"', add
label define birthyr_mom_lbl 1779 `"1779"', add
label define birthyr_mom_lbl 1780 `"1780"', add
label define birthyr_mom_lbl 1781 `"1781"', add
label define birthyr_mom_lbl 1782 `"1782"', add
label define birthyr_mom_lbl 1783 `"1783"', add
label define birthyr_mom_lbl 1784 `"1784"', add
label define birthyr_mom_lbl 1785 `"1785"', add
label define birthyr_mom_lbl 1786 `"1786"', add
label define birthyr_mom_lbl 1787 `"1787"', add
label define birthyr_mom_lbl 1788 `"1788"', add
label define birthyr_mom_lbl 1789 `"1789"', add
label define birthyr_mom_lbl 1790 `"1790"', add
label define birthyr_mom_lbl 1791 `"1791"', add
label define birthyr_mom_lbl 1792 `"1792"', add
label define birthyr_mom_lbl 1793 `"1793"', add
label define birthyr_mom_lbl 1794 `"1794"', add
label define birthyr_mom_lbl 1795 `"1795"', add
label define birthyr_mom_lbl 1796 `"1796"', add
label define birthyr_mom_lbl 1797 `"1797"', add
label define birthyr_mom_lbl 1798 `"1798"', add
label define birthyr_mom_lbl 1799 `"1799"', add
label define birthyr_mom_lbl 1800 `"1800"', add
label define birthyr_mom_lbl 1801 `"1801"', add
label define birthyr_mom_lbl 1802 `"1802"', add
label define birthyr_mom_lbl 1803 `"1803"', add
label define birthyr_mom_lbl 1804 `"1804"', add
label define birthyr_mom_lbl 1805 `"1805"', add
label define birthyr_mom_lbl 1806 `"1806"', add
label define birthyr_mom_lbl 1807 `"1807"', add
label define birthyr_mom_lbl 1808 `"1808"', add
label define birthyr_mom_lbl 1809 `"1809"', add
label define birthyr_mom_lbl 1810 `"1810"', add
label define birthyr_mom_lbl 1811 `"1811"', add
label define birthyr_mom_lbl 1812 `"1812"', add
label define birthyr_mom_lbl 1813 `"1813"', add
label define birthyr_mom_lbl 1814 `"1814"', add
label define birthyr_mom_lbl 1815 `"1815"', add
label define birthyr_mom_lbl 1816 `"1816"', add
label define birthyr_mom_lbl 1817 `"1817"', add
label define birthyr_mom_lbl 1818 `"1818"', add
label define birthyr_mom_lbl 1819 `"1819"', add
label define birthyr_mom_lbl 1820 `"1820"', add
label define birthyr_mom_lbl 1821 `"1821"', add
label define birthyr_mom_lbl 1822 `"1822"', add
label define birthyr_mom_lbl 1823 `"1823"', add
label define birthyr_mom_lbl 1824 `"1824"', add
label define birthyr_mom_lbl 1825 `"1825"', add
label define birthyr_mom_lbl 1826 `"1826"', add
label define birthyr_mom_lbl 1827 `"1827"', add
label define birthyr_mom_lbl 1828 `"1828"', add
label define birthyr_mom_lbl 1829 `"1829"', add
label define birthyr_mom_lbl 1830 `"1830"', add
label define birthyr_mom_lbl 1831 `"1831"', add
label define birthyr_mom_lbl 1832 `"1832"', add
label define birthyr_mom_lbl 1833 `"1833"', add
label define birthyr_mom_lbl 1834 `"1834"', add
label define birthyr_mom_lbl 1835 `"1835"', add
label define birthyr_mom_lbl 1836 `"1836"', add
label define birthyr_mom_lbl 1837 `"1837"', add
label define birthyr_mom_lbl 1838 `"1838"', add
label define birthyr_mom_lbl 1839 `"1839"', add
label define birthyr_mom_lbl 1840 `"1840"', add
label define birthyr_mom_lbl 1841 `"1841"', add
label define birthyr_mom_lbl 1842 `"1842"', add
label define birthyr_mom_lbl 1843 `"1843"', add
label define birthyr_mom_lbl 1844 `"1844"', add
label define birthyr_mom_lbl 1845 `"1845"', add
label define birthyr_mom_lbl 1846 `"1846"', add
label define birthyr_mom_lbl 1847 `"1847"', add
label define birthyr_mom_lbl 1848 `"1848"', add
label define birthyr_mom_lbl 1849 `"1849"', add
label define birthyr_mom_lbl 1850 `"1850"', add
label define birthyr_mom_lbl 1851 `"1851"', add
label define birthyr_mom_lbl 1852 `"1852"', add
label define birthyr_mom_lbl 1853 `"1853"', add
label define birthyr_mom_lbl 1854 `"1854"', add
label define birthyr_mom_lbl 1855 `"1855"', add
label define birthyr_mom_lbl 1856 `"1856"', add
label define birthyr_mom_lbl 1857 `"1857"', add
label define birthyr_mom_lbl 1858 `"1858"', add
label define birthyr_mom_lbl 1859 `"1859"', add
label define birthyr_mom_lbl 1860 `"1860"', add
label define birthyr_mom_lbl 1861 `"1861"', add
label define birthyr_mom_lbl 1862 `"1862"', add
label define birthyr_mom_lbl 1863 `"1863"', add
label define birthyr_mom_lbl 1864 `"1864"', add
label define birthyr_mom_lbl 1865 `"1865"', add
label define birthyr_mom_lbl 1866 `"1866"', add
label define birthyr_mom_lbl 1867 `"1867"', add
label define birthyr_mom_lbl 1868 `"1868"', add
label define birthyr_mom_lbl 1869 `"1869"', add
label define birthyr_mom_lbl 1870 `"1870"', add
label define birthyr_mom_lbl 1871 `"1871"', add
label define birthyr_mom_lbl 1872 `"1872"', add
label define birthyr_mom_lbl 1873 `"1873"', add
label define birthyr_mom_lbl 1874 `"1874"', add
label define birthyr_mom_lbl 1875 `"1875"', add
label define birthyr_mom_lbl 1876 `"1876"', add
label define birthyr_mom_lbl 1877 `"1877"', add
label define birthyr_mom_lbl 1878 `"1878"', add
label define birthyr_mom_lbl 1879 `"1879"', add
label define birthyr_mom_lbl 1880 `"1880"', add
label define birthyr_mom_lbl 1881 `"1881"', add
label define birthyr_mom_lbl 1882 `"1882"', add
label define birthyr_mom_lbl 1883 `"1883"', add
label define birthyr_mom_lbl 1884 `"1884"', add
label define birthyr_mom_lbl 1885 `"1885"', add
label define birthyr_mom_lbl 1886 `"1886"', add
label define birthyr_mom_lbl 1887 `"1887"', add
label define birthyr_mom_lbl 1888 `"1888"', add
label define birthyr_mom_lbl 1889 `"1889"', add
label define birthyr_mom_lbl 1890 `"1890"', add
label define birthyr_mom_lbl 1891 `"1891"', add
label define birthyr_mom_lbl 1892 `"1892"', add
label define birthyr_mom_lbl 1893 `"1893"', add
label define birthyr_mom_lbl 1894 `"1894"', add
label define birthyr_mom_lbl 1895 `"1895"', add
label define birthyr_mom_lbl 1896 `"1896"', add
label define birthyr_mom_lbl 1897 `"1897"', add
label define birthyr_mom_lbl 1898 `"1898"', add
label define birthyr_mom_lbl 1899 `"1899"', add
label define birthyr_mom_lbl 1900 `"1900"', add
label define birthyr_mom_lbl 1901 `"1901"', add
label define birthyr_mom_lbl 1902 `"1902"', add
label define birthyr_mom_lbl 1903 `"1903"', add
label define birthyr_mom_lbl 1904 `"1904"', add
label define birthyr_mom_lbl 1905 `"1905"', add
label define birthyr_mom_lbl 1906 `"1906"', add
label define birthyr_mom_lbl 1907 `"1907"', add
label define birthyr_mom_lbl 1908 `"1908"', add
label define birthyr_mom_lbl 1909 `"1909"', add
label define birthyr_mom_lbl 1910 `"1910"', add
label define birthyr_mom_lbl 1911 `"1911"', add
label define birthyr_mom_lbl 1912 `"1912"', add
label define birthyr_mom_lbl 1913 `"1913"', add
label define birthyr_mom_lbl 1914 `"1914"', add
label define birthyr_mom_lbl 1915 `"1915"', add
label define birthyr_mom_lbl 1916 `"1916"', add
label define birthyr_mom_lbl 1917 `"1917"', add
label define birthyr_mom_lbl 1918 `"1918"', add
label define birthyr_mom_lbl 1919 `"1919"', add
label define birthyr_mom_lbl 1920 `"1920"', add
label define birthyr_mom_lbl 1921 `"1921"', add
label define birthyr_mom_lbl 1922 `"1922"', add
label define birthyr_mom_lbl 1923 `"1923"', add
label define birthyr_mom_lbl 1924 `"1924"', add
label define birthyr_mom_lbl 1925 `"1925"', add
label define birthyr_mom_lbl 1926 `"1926"', add
label define birthyr_mom_lbl 1927 `"1927"', add
label define birthyr_mom_lbl 1928 `"1928"', add
label define birthyr_mom_lbl 1929 `"1929"', add
label define birthyr_mom_lbl 1930 `"1930"', add
label define birthyr_mom_lbl 1931 `"1931"', add
label define birthyr_mom_lbl 1932 `"1932"', add
label define birthyr_mom_lbl 1933 `"1933"', add
label define birthyr_mom_lbl 1934 `"1934"', add
label define birthyr_mom_lbl 1935 `"1935"', add
label define birthyr_mom_lbl 1936 `"1936"', add
label define birthyr_mom_lbl 1937 `"1937"', add
label define birthyr_mom_lbl 1938 `"1938"', add
label define birthyr_mom_lbl 1939 `"1939"', add
label define birthyr_mom_lbl 1940 `"1940"', add
label define birthyr_mom_lbl 1941 `"1941"', add
label define birthyr_mom_lbl 1942 `"1942"', add
label define birthyr_mom_lbl 1943 `"1943"', add
label define birthyr_mom_lbl 1944 `"1944"', add
label define birthyr_mom_lbl 1945 `"1945"', add
label define birthyr_mom_lbl 1946 `"1946"', add
label define birthyr_mom_lbl 1947 `"1947"', add
label define birthyr_mom_lbl 1948 `"1948"', add
label define birthyr_mom_lbl 1949 `"1949"', add
label define birthyr_mom_lbl 1950 `"1950"', add
label define birthyr_mom_lbl 1951 `"1951"', add
label define birthyr_mom_lbl 1952 `"1952"', add
label define birthyr_mom_lbl 1953 `"1953"', add
label define birthyr_mom_lbl 1954 `"1954"', add
label define birthyr_mom_lbl 1955 `"1955"', add
label define birthyr_mom_lbl 1956 `"1956"', add
label define birthyr_mom_lbl 1957 `"1957"', add
label define birthyr_mom_lbl 1958 `"1958"', add
label define birthyr_mom_lbl 1959 `"1959"', add
label define birthyr_mom_lbl 1960 `"1960"', add
label define birthyr_mom_lbl 1961 `"1961"', add
label define birthyr_mom_lbl 1962 `"1962"', add
label define birthyr_mom_lbl 1963 `"1963"', add
label define birthyr_mom_lbl 1964 `"1964"', add
label define birthyr_mom_lbl 1965 `"1965"', add
label define birthyr_mom_lbl 1966 `"1966"', add
label define birthyr_mom_lbl 1967 `"1967"', add
label define birthyr_mom_lbl 1968 `"1968"', add
label define birthyr_mom_lbl 1969 `"1969"', add
label define birthyr_mom_lbl 1970 `"1970"', add
label define birthyr_mom_lbl 1971 `"1971"', add
label define birthyr_mom_lbl 1972 `"1972"', add
label define birthyr_mom_lbl 1973 `"1973"', add
label define birthyr_mom_lbl 1974 `"1974"', add
label define birthyr_mom_lbl 1975 `"1975"', add
label define birthyr_mom_lbl 1976 `"1976"', add
label define birthyr_mom_lbl 1977 `"1977"', add
label define birthyr_mom_lbl 1978 `"1978"', add
label define birthyr_mom_lbl 1979 `"1979"', add
label define birthyr_mom_lbl 1980 `"1980"', add
label define birthyr_mom_lbl 1981 `"1981"', add
label define birthyr_mom_lbl 1982 `"1982"', add
label define birthyr_mom_lbl 1983 `"1983"', add
label define birthyr_mom_lbl 1984 `"1984"', add
label define birthyr_mom_lbl 1985 `"1985"', add
label define birthyr_mom_lbl 1986 `"1986"', add
label define birthyr_mom_lbl 1987 `"1987"', add
label define birthyr_mom_lbl 1988 `"1988"', add
label define birthyr_mom_lbl 1989 `"1989"', add
label define birthyr_mom_lbl 1990 `"1990"', add
label define birthyr_mom_lbl 1991 `"1991"', add
label define birthyr_mom_lbl 1992 `"1992"', add
label define birthyr_mom_lbl 1993 `"1993"', add
label define birthyr_mom_lbl 1994 `"1994"', add
label define birthyr_mom_lbl 1995 `"1995"', add
label define birthyr_mom_lbl 1996 `"1996"', add
label define birthyr_mom_lbl 1997 `"1997"', add
label define birthyr_mom_lbl 1998 `"1998"', add
label define birthyr_mom_lbl 1999 `"1999"', add
label define birthyr_mom_lbl 2000 `"2000"', add
label define birthyr_mom_lbl 2001 `"2001"', add
label define birthyr_mom_lbl 2002 `"2002"', add
label define birthyr_mom_lbl 2003 `"2003"', add
label define birthyr_mom_lbl 2004 `"2004"', add
label define birthyr_mom_lbl 2005 `"2005"', add
label define birthyr_mom_lbl 2006 `"2006"', add
label define birthyr_mom_lbl 2007 `"2007"', add
label define birthyr_mom_lbl 2008 `"2008"', add
label define birthyr_mom_lbl 2009 `"2009"', add
label define birthyr_mom_lbl 2010 `"2010"', add
label define birthyr_mom_lbl 2011 `"2011"', add
label define birthyr_mom_lbl 2012 `"2012"', add
label define birthyr_mom_lbl 2013 `"2013"', add
label define birthyr_mom_lbl 2014 `"2014"', add
label define birthyr_mom_lbl 2015 `"2015"', add
label define birthyr_mom_lbl 2016 `"2016"', add
label define birthyr_mom_lbl 2017 `"2017"', add
label define birthyr_mom_lbl 2018 `"2018"', add
label define birthyr_mom_lbl 2019 `"2019"', add
label define birthyr_mom_lbl 2020 `"2020"', add
label define birthyr_mom_lbl 9999 `"Unknown"', add
label values birthyr_mom birthyr_mom_lbl

label define birthyr_pop_lbl 0000 `"NIU (not in universe)"'
label define birthyr_pop_lbl 1628 `"1628"', add
label define birthyr_pop_lbl 1629 `"1629"', add
label define birthyr_pop_lbl 1630 `"1630"', add
label define birthyr_pop_lbl 1631 `"1631"', add
label define birthyr_pop_lbl 1634 `"1634"', add
label define birthyr_pop_lbl 1635 `"1635"', add
label define birthyr_pop_lbl 1636 `"1636"', add
label define birthyr_pop_lbl 1637 `"1637"', add
label define birthyr_pop_lbl 1638 `"1638"', add
label define birthyr_pop_lbl 1639 `"1639"', add
label define birthyr_pop_lbl 1640 `"1640"', add
label define birthyr_pop_lbl 1641 `"1641"', add
label define birthyr_pop_lbl 1642 `"1642"', add
label define birthyr_pop_lbl 1643 `"1643"', add
label define birthyr_pop_lbl 1644 `"1644"', add
label define birthyr_pop_lbl 1645 `"1645"', add
label define birthyr_pop_lbl 1646 `"1646"', add
label define birthyr_pop_lbl 1647 `"1647"', add
label define birthyr_pop_lbl 1648 `"1648"', add
label define birthyr_pop_lbl 1649 `"1649"', add
label define birthyr_pop_lbl 1650 `"1650"', add
label define birthyr_pop_lbl 1651 `"1651"', add
label define birthyr_pop_lbl 1652 `"1652"', add
label define birthyr_pop_lbl 1653 `"1653"', add
label define birthyr_pop_lbl 1654 `"1654"', add
label define birthyr_pop_lbl 1655 `"1655"', add
label define birthyr_pop_lbl 1656 `"1656"', add
label define birthyr_pop_lbl 1657 `"1657"', add
label define birthyr_pop_lbl 1658 `"1658"', add
label define birthyr_pop_lbl 1659 `"1659"', add
label define birthyr_pop_lbl 1660 `"1660"', add
label define birthyr_pop_lbl 1661 `"1661"', add
label define birthyr_pop_lbl 1662 `"1662"', add
label define birthyr_pop_lbl 1663 `"1663"', add
label define birthyr_pop_lbl 1664 `"1664"', add
label define birthyr_pop_lbl 1665 `"1665"', add
label define birthyr_pop_lbl 1666 `"1666"', add
label define birthyr_pop_lbl 1667 `"1667"', add
label define birthyr_pop_lbl 1668 `"1668"', add
label define birthyr_pop_lbl 1669 `"1669"', add
label define birthyr_pop_lbl 1670 `"1670"', add
label define birthyr_pop_lbl 1671 `"1671"', add
label define birthyr_pop_lbl 1672 `"1672"', add
label define birthyr_pop_lbl 1673 `"1673"', add
label define birthyr_pop_lbl 1674 `"1674"', add
label define birthyr_pop_lbl 1675 `"1675"', add
label define birthyr_pop_lbl 1676 `"1676"', add
label define birthyr_pop_lbl 1677 `"1677"', add
label define birthyr_pop_lbl 1678 `"1678"', add
label define birthyr_pop_lbl 1679 `"1679"', add
label define birthyr_pop_lbl 1680 `"1680"', add
label define birthyr_pop_lbl 1681 `"1681"', add
label define birthyr_pop_lbl 1682 `"1682"', add
label define birthyr_pop_lbl 1683 `"1683"', add
label define birthyr_pop_lbl 1684 `"1684"', add
label define birthyr_pop_lbl 1685 `"1685"', add
label define birthyr_pop_lbl 1686 `"1686"', add
label define birthyr_pop_lbl 1687 `"1687"', add
label define birthyr_pop_lbl 1688 `"1688"', add
label define birthyr_pop_lbl 1689 `"1689"', add
label define birthyr_pop_lbl 1690 `"1690"', add
label define birthyr_pop_lbl 1691 `"1691"', add
label define birthyr_pop_lbl 1692 `"1692"', add
label define birthyr_pop_lbl 1693 `"1693"', add
label define birthyr_pop_lbl 1694 `"1694"', add
label define birthyr_pop_lbl 1695 `"1695"', add
label define birthyr_pop_lbl 1696 `"1696"', add
label define birthyr_pop_lbl 1697 `"1697"', add
label define birthyr_pop_lbl 1698 `"1698"', add
label define birthyr_pop_lbl 1699 `"1699"', add
label define birthyr_pop_lbl 1700 `"1700"', add
label define birthyr_pop_lbl 1701 `"1701"', add
label define birthyr_pop_lbl 1702 `"1702"', add
label define birthyr_pop_lbl 1703 `"1703"', add
label define birthyr_pop_lbl 1704 `"1704"', add
label define birthyr_pop_lbl 1705 `"1705"', add
label define birthyr_pop_lbl 1706 `"1706"', add
label define birthyr_pop_lbl 1707 `"1707"', add
label define birthyr_pop_lbl 1708 `"1708"', add
label define birthyr_pop_lbl 1709 `"1709"', add
label define birthyr_pop_lbl 1710 `"1710"', add
label define birthyr_pop_lbl 1711 `"1711"', add
label define birthyr_pop_lbl 1712 `"1712"', add
label define birthyr_pop_lbl 1713 `"1713"', add
label define birthyr_pop_lbl 1714 `"1714"', add
label define birthyr_pop_lbl 1715 `"1715"', add
label define birthyr_pop_lbl 1716 `"1716"', add
label define birthyr_pop_lbl 1717 `"1717"', add
label define birthyr_pop_lbl 1718 `"1718"', add
label define birthyr_pop_lbl 1719 `"1719"', add
label define birthyr_pop_lbl 1720 `"1720"', add
label define birthyr_pop_lbl 1721 `"1721"', add
label define birthyr_pop_lbl 1722 `"1722"', add
label define birthyr_pop_lbl 1723 `"1723"', add
label define birthyr_pop_lbl 1724 `"1724"', add
label define birthyr_pop_lbl 1725 `"1725"', add
label define birthyr_pop_lbl 1726 `"1726"', add
label define birthyr_pop_lbl 1727 `"1727"', add
label define birthyr_pop_lbl 1728 `"1728"', add
label define birthyr_pop_lbl 1729 `"1729"', add
label define birthyr_pop_lbl 1730 `"1730"', add
label define birthyr_pop_lbl 1731 `"1731"', add
label define birthyr_pop_lbl 1732 `"1732"', add
label define birthyr_pop_lbl 1733 `"1733"', add
label define birthyr_pop_lbl 1734 `"1734"', add
label define birthyr_pop_lbl 1735 `"1735"', add
label define birthyr_pop_lbl 1736 `"1736"', add
label define birthyr_pop_lbl 1737 `"1737"', add
label define birthyr_pop_lbl 1738 `"1738"', add
label define birthyr_pop_lbl 1739 `"1739"', add
label define birthyr_pop_lbl 1740 `"1740"', add
label define birthyr_pop_lbl 1741 `"1741"', add
label define birthyr_pop_lbl 1742 `"1742"', add
label define birthyr_pop_lbl 1743 `"1743"', add
label define birthyr_pop_lbl 1744 `"1744"', add
label define birthyr_pop_lbl 1745 `"1745"', add
label define birthyr_pop_lbl 1746 `"1746"', add
label define birthyr_pop_lbl 1747 `"1747"', add
label define birthyr_pop_lbl 1748 `"1748"', add
label define birthyr_pop_lbl 1749 `"1749"', add
label define birthyr_pop_lbl 1750 `"1750"', add
label define birthyr_pop_lbl 1751 `"1751"', add
label define birthyr_pop_lbl 1752 `"1752"', add
label define birthyr_pop_lbl 1753 `"1753"', add
label define birthyr_pop_lbl 1754 `"1754"', add
label define birthyr_pop_lbl 1755 `"1755"', add
label define birthyr_pop_lbl 1756 `"1756"', add
label define birthyr_pop_lbl 1757 `"1757"', add
label define birthyr_pop_lbl 1758 `"1758"', add
label define birthyr_pop_lbl 1759 `"1759"', add
label define birthyr_pop_lbl 1760 `"1760"', add
label define birthyr_pop_lbl 1761 `"1761"', add
label define birthyr_pop_lbl 1762 `"1762"', add
label define birthyr_pop_lbl 1763 `"1763"', add
label define birthyr_pop_lbl 1764 `"1764"', add
label define birthyr_pop_lbl 1765 `"1765"', add
label define birthyr_pop_lbl 1766 `"1766"', add
label define birthyr_pop_lbl 1767 `"1767"', add
label define birthyr_pop_lbl 1768 `"1768"', add
label define birthyr_pop_lbl 1769 `"1769"', add
label define birthyr_pop_lbl 1770 `"1770"', add
label define birthyr_pop_lbl 1771 `"1771"', add
label define birthyr_pop_lbl 1772 `"1772"', add
label define birthyr_pop_lbl 1773 `"1773"', add
label define birthyr_pop_lbl 1774 `"1774"', add
label define birthyr_pop_lbl 1775 `"1775"', add
label define birthyr_pop_lbl 1776 `"1776"', add
label define birthyr_pop_lbl 1777 `"1777"', add
label define birthyr_pop_lbl 1778 `"1778"', add
label define birthyr_pop_lbl 1779 `"1779"', add
label define birthyr_pop_lbl 1780 `"1780"', add
label define birthyr_pop_lbl 1781 `"1781"', add
label define birthyr_pop_lbl 1782 `"1782"', add
label define birthyr_pop_lbl 1783 `"1783"', add
label define birthyr_pop_lbl 1784 `"1784"', add
label define birthyr_pop_lbl 1785 `"1785"', add
label define birthyr_pop_lbl 1786 `"1786"', add
label define birthyr_pop_lbl 1787 `"1787"', add
label define birthyr_pop_lbl 1788 `"1788"', add
label define birthyr_pop_lbl 1789 `"1789"', add
label define birthyr_pop_lbl 1790 `"1790"', add
label define birthyr_pop_lbl 1791 `"1791"', add
label define birthyr_pop_lbl 1792 `"1792"', add
label define birthyr_pop_lbl 1793 `"1793"', add
label define birthyr_pop_lbl 1794 `"1794"', add
label define birthyr_pop_lbl 1795 `"1795"', add
label define birthyr_pop_lbl 1796 `"1796"', add
label define birthyr_pop_lbl 1797 `"1797"', add
label define birthyr_pop_lbl 1798 `"1798"', add
label define birthyr_pop_lbl 1799 `"1799"', add
label define birthyr_pop_lbl 1800 `"1800"', add
label define birthyr_pop_lbl 1801 `"1801"', add
label define birthyr_pop_lbl 1802 `"1802"', add
label define birthyr_pop_lbl 1803 `"1803"', add
label define birthyr_pop_lbl 1804 `"1804"', add
label define birthyr_pop_lbl 1805 `"1805"', add
label define birthyr_pop_lbl 1806 `"1806"', add
label define birthyr_pop_lbl 1807 `"1807"', add
label define birthyr_pop_lbl 1808 `"1808"', add
label define birthyr_pop_lbl 1809 `"1809"', add
label define birthyr_pop_lbl 1810 `"1810"', add
label define birthyr_pop_lbl 1811 `"1811"', add
label define birthyr_pop_lbl 1812 `"1812"', add
label define birthyr_pop_lbl 1813 `"1813"', add
label define birthyr_pop_lbl 1814 `"1814"', add
label define birthyr_pop_lbl 1815 `"1815"', add
label define birthyr_pop_lbl 1816 `"1816"', add
label define birthyr_pop_lbl 1817 `"1817"', add
label define birthyr_pop_lbl 1818 `"1818"', add
label define birthyr_pop_lbl 1819 `"1819"', add
label define birthyr_pop_lbl 1820 `"1820"', add
label define birthyr_pop_lbl 1821 `"1821"', add
label define birthyr_pop_lbl 1822 `"1822"', add
label define birthyr_pop_lbl 1823 `"1823"', add
label define birthyr_pop_lbl 1824 `"1824"', add
label define birthyr_pop_lbl 1825 `"1825"', add
label define birthyr_pop_lbl 1826 `"1826"', add
label define birthyr_pop_lbl 1827 `"1827"', add
label define birthyr_pop_lbl 1828 `"1828"', add
label define birthyr_pop_lbl 1829 `"1829"', add
label define birthyr_pop_lbl 1830 `"1830"', add
label define birthyr_pop_lbl 1831 `"1831"', add
label define birthyr_pop_lbl 1832 `"1832"', add
label define birthyr_pop_lbl 1833 `"1833"', add
label define birthyr_pop_lbl 1834 `"1834"', add
label define birthyr_pop_lbl 1835 `"1835"', add
label define birthyr_pop_lbl 1836 `"1836"', add
label define birthyr_pop_lbl 1837 `"1837"', add
label define birthyr_pop_lbl 1838 `"1838"', add
label define birthyr_pop_lbl 1839 `"1839"', add
label define birthyr_pop_lbl 1840 `"1840"', add
label define birthyr_pop_lbl 1841 `"1841"', add
label define birthyr_pop_lbl 1842 `"1842"', add
label define birthyr_pop_lbl 1843 `"1843"', add
label define birthyr_pop_lbl 1844 `"1844"', add
label define birthyr_pop_lbl 1845 `"1845"', add
label define birthyr_pop_lbl 1846 `"1846"', add
label define birthyr_pop_lbl 1847 `"1847"', add
label define birthyr_pop_lbl 1848 `"1848"', add
label define birthyr_pop_lbl 1849 `"1849"', add
label define birthyr_pop_lbl 1850 `"1850"', add
label define birthyr_pop_lbl 1851 `"1851"', add
label define birthyr_pop_lbl 1852 `"1852"', add
label define birthyr_pop_lbl 1853 `"1853"', add
label define birthyr_pop_lbl 1854 `"1854"', add
label define birthyr_pop_lbl 1855 `"1855"', add
label define birthyr_pop_lbl 1856 `"1856"', add
label define birthyr_pop_lbl 1857 `"1857"', add
label define birthyr_pop_lbl 1858 `"1858"', add
label define birthyr_pop_lbl 1859 `"1859"', add
label define birthyr_pop_lbl 1860 `"1860"', add
label define birthyr_pop_lbl 1861 `"1861"', add
label define birthyr_pop_lbl 1862 `"1862"', add
label define birthyr_pop_lbl 1863 `"1863"', add
label define birthyr_pop_lbl 1864 `"1864"', add
label define birthyr_pop_lbl 1865 `"1865"', add
label define birthyr_pop_lbl 1866 `"1866"', add
label define birthyr_pop_lbl 1867 `"1867"', add
label define birthyr_pop_lbl 1868 `"1868"', add
label define birthyr_pop_lbl 1869 `"1869"', add
label define birthyr_pop_lbl 1870 `"1870"', add
label define birthyr_pop_lbl 1871 `"1871"', add
label define birthyr_pop_lbl 1872 `"1872"', add
label define birthyr_pop_lbl 1873 `"1873"', add
label define birthyr_pop_lbl 1874 `"1874"', add
label define birthyr_pop_lbl 1875 `"1875"', add
label define birthyr_pop_lbl 1876 `"1876"', add
label define birthyr_pop_lbl 1877 `"1877"', add
label define birthyr_pop_lbl 1878 `"1878"', add
label define birthyr_pop_lbl 1879 `"1879"', add
label define birthyr_pop_lbl 1880 `"1880"', add
label define birthyr_pop_lbl 1881 `"1881"', add
label define birthyr_pop_lbl 1882 `"1882"', add
label define birthyr_pop_lbl 1883 `"1883"', add
label define birthyr_pop_lbl 1884 `"1884"', add
label define birthyr_pop_lbl 1885 `"1885"', add
label define birthyr_pop_lbl 1886 `"1886"', add
label define birthyr_pop_lbl 1887 `"1887"', add
label define birthyr_pop_lbl 1888 `"1888"', add
label define birthyr_pop_lbl 1889 `"1889"', add
label define birthyr_pop_lbl 1890 `"1890"', add
label define birthyr_pop_lbl 1891 `"1891"', add
label define birthyr_pop_lbl 1892 `"1892"', add
label define birthyr_pop_lbl 1893 `"1893"', add
label define birthyr_pop_lbl 1894 `"1894"', add
label define birthyr_pop_lbl 1895 `"1895"', add
label define birthyr_pop_lbl 1896 `"1896"', add
label define birthyr_pop_lbl 1897 `"1897"', add
label define birthyr_pop_lbl 1898 `"1898"', add
label define birthyr_pop_lbl 1899 `"1899"', add
label define birthyr_pop_lbl 1900 `"1900"', add
label define birthyr_pop_lbl 1901 `"1901"', add
label define birthyr_pop_lbl 1902 `"1902"', add
label define birthyr_pop_lbl 1903 `"1903"', add
label define birthyr_pop_lbl 1904 `"1904"', add
label define birthyr_pop_lbl 1905 `"1905"', add
label define birthyr_pop_lbl 1906 `"1906"', add
label define birthyr_pop_lbl 1907 `"1907"', add
label define birthyr_pop_lbl 1908 `"1908"', add
label define birthyr_pop_lbl 1909 `"1909"', add
label define birthyr_pop_lbl 1910 `"1910"', add
label define birthyr_pop_lbl 1911 `"1911"', add
label define birthyr_pop_lbl 1912 `"1912"', add
label define birthyr_pop_lbl 1913 `"1913"', add
label define birthyr_pop_lbl 1914 `"1914"', add
label define birthyr_pop_lbl 1915 `"1915"', add
label define birthyr_pop_lbl 1916 `"1916"', add
label define birthyr_pop_lbl 1917 `"1917"', add
label define birthyr_pop_lbl 1918 `"1918"', add
label define birthyr_pop_lbl 1919 `"1919"', add
label define birthyr_pop_lbl 1920 `"1920"', add
label define birthyr_pop_lbl 1921 `"1921"', add
label define birthyr_pop_lbl 1922 `"1922"', add
label define birthyr_pop_lbl 1923 `"1923"', add
label define birthyr_pop_lbl 1924 `"1924"', add
label define birthyr_pop_lbl 1925 `"1925"', add
label define birthyr_pop_lbl 1926 `"1926"', add
label define birthyr_pop_lbl 1927 `"1927"', add
label define birthyr_pop_lbl 1928 `"1928"', add
label define birthyr_pop_lbl 1929 `"1929"', add
label define birthyr_pop_lbl 1930 `"1930"', add
label define birthyr_pop_lbl 1931 `"1931"', add
label define birthyr_pop_lbl 1932 `"1932"', add
label define birthyr_pop_lbl 1933 `"1933"', add
label define birthyr_pop_lbl 1934 `"1934"', add
label define birthyr_pop_lbl 1935 `"1935"', add
label define birthyr_pop_lbl 1936 `"1936"', add
label define birthyr_pop_lbl 1937 `"1937"', add
label define birthyr_pop_lbl 1938 `"1938"', add
label define birthyr_pop_lbl 1939 `"1939"', add
label define birthyr_pop_lbl 1940 `"1940"', add
label define birthyr_pop_lbl 1941 `"1941"', add
label define birthyr_pop_lbl 1942 `"1942"', add
label define birthyr_pop_lbl 1943 `"1943"', add
label define birthyr_pop_lbl 1944 `"1944"', add
label define birthyr_pop_lbl 1945 `"1945"', add
label define birthyr_pop_lbl 1946 `"1946"', add
label define birthyr_pop_lbl 1947 `"1947"', add
label define birthyr_pop_lbl 1948 `"1948"', add
label define birthyr_pop_lbl 1949 `"1949"', add
label define birthyr_pop_lbl 1950 `"1950"', add
label define birthyr_pop_lbl 1951 `"1951"', add
label define birthyr_pop_lbl 1952 `"1952"', add
label define birthyr_pop_lbl 1953 `"1953"', add
label define birthyr_pop_lbl 1954 `"1954"', add
label define birthyr_pop_lbl 1955 `"1955"', add
label define birthyr_pop_lbl 1956 `"1956"', add
label define birthyr_pop_lbl 1957 `"1957"', add
label define birthyr_pop_lbl 1958 `"1958"', add
label define birthyr_pop_lbl 1959 `"1959"', add
label define birthyr_pop_lbl 1960 `"1960"', add
label define birthyr_pop_lbl 1961 `"1961"', add
label define birthyr_pop_lbl 1962 `"1962"', add
label define birthyr_pop_lbl 1963 `"1963"', add
label define birthyr_pop_lbl 1964 `"1964"', add
label define birthyr_pop_lbl 1965 `"1965"', add
label define birthyr_pop_lbl 1966 `"1966"', add
label define birthyr_pop_lbl 1967 `"1967"', add
label define birthyr_pop_lbl 1968 `"1968"', add
label define birthyr_pop_lbl 1969 `"1969"', add
label define birthyr_pop_lbl 1970 `"1970"', add
label define birthyr_pop_lbl 1971 `"1971"', add
label define birthyr_pop_lbl 1972 `"1972"', add
label define birthyr_pop_lbl 1973 `"1973"', add
label define birthyr_pop_lbl 1974 `"1974"', add
label define birthyr_pop_lbl 1975 `"1975"', add
label define birthyr_pop_lbl 1976 `"1976"', add
label define birthyr_pop_lbl 1977 `"1977"', add
label define birthyr_pop_lbl 1978 `"1978"', add
label define birthyr_pop_lbl 1979 `"1979"', add
label define birthyr_pop_lbl 1980 `"1980"', add
label define birthyr_pop_lbl 1981 `"1981"', add
label define birthyr_pop_lbl 1982 `"1982"', add
label define birthyr_pop_lbl 1983 `"1983"', add
label define birthyr_pop_lbl 1984 `"1984"', add
label define birthyr_pop_lbl 1985 `"1985"', add
label define birthyr_pop_lbl 1986 `"1986"', add
label define birthyr_pop_lbl 1987 `"1987"', add
label define birthyr_pop_lbl 1988 `"1988"', add
label define birthyr_pop_lbl 1989 `"1989"', add
label define birthyr_pop_lbl 1990 `"1990"', add
label define birthyr_pop_lbl 1991 `"1991"', add
label define birthyr_pop_lbl 1992 `"1992"', add
label define birthyr_pop_lbl 1993 `"1993"', add
label define birthyr_pop_lbl 1994 `"1994"', add
label define birthyr_pop_lbl 1995 `"1995"', add
label define birthyr_pop_lbl 1996 `"1996"', add
label define birthyr_pop_lbl 1997 `"1997"', add
label define birthyr_pop_lbl 1998 `"1998"', add
label define birthyr_pop_lbl 1999 `"1999"', add
label define birthyr_pop_lbl 2000 `"2000"', add
label define birthyr_pop_lbl 2001 `"2001"', add
label define birthyr_pop_lbl 2002 `"2002"', add
label define birthyr_pop_lbl 2003 `"2003"', add
label define birthyr_pop_lbl 2004 `"2004"', add
label define birthyr_pop_lbl 2005 `"2005"', add
label define birthyr_pop_lbl 2006 `"2006"', add
label define birthyr_pop_lbl 2007 `"2007"', add
label define birthyr_pop_lbl 2008 `"2008"', add
label define birthyr_pop_lbl 2009 `"2009"', add
label define birthyr_pop_lbl 2010 `"2010"', add
label define birthyr_pop_lbl 2011 `"2011"', add
label define birthyr_pop_lbl 2012 `"2012"', add
label define birthyr_pop_lbl 2013 `"2013"', add
label define birthyr_pop_lbl 2014 `"2014"', add
label define birthyr_pop_lbl 2015 `"2015"', add
label define birthyr_pop_lbl 2016 `"2016"', add
label define birthyr_pop_lbl 2017 `"2017"', add
label define birthyr_pop_lbl 2018 `"2018"', add
label define birthyr_pop_lbl 2019 `"2019"', add
label define birthyr_pop_lbl 2020 `"2020"', add
label define birthyr_pop_lbl 9999 `"Unknown"', add
label values birthyr_pop birthyr_pop_lbl

label define birthyr_sp_lbl 0000 `"NIU (not in universe)"'
label define birthyr_sp_lbl 1628 `"1628"', add
label define birthyr_sp_lbl 1629 `"1629"', add
label define birthyr_sp_lbl 1630 `"1630"', add
label define birthyr_sp_lbl 1631 `"1631"', add
label define birthyr_sp_lbl 1634 `"1634"', add
label define birthyr_sp_lbl 1635 `"1635"', add
label define birthyr_sp_lbl 1636 `"1636"', add
label define birthyr_sp_lbl 1637 `"1637"', add
label define birthyr_sp_lbl 1638 `"1638"', add
label define birthyr_sp_lbl 1639 `"1639"', add
label define birthyr_sp_lbl 1640 `"1640"', add
label define birthyr_sp_lbl 1641 `"1641"', add
label define birthyr_sp_lbl 1642 `"1642"', add
label define birthyr_sp_lbl 1643 `"1643"', add
label define birthyr_sp_lbl 1644 `"1644"', add
label define birthyr_sp_lbl 1645 `"1645"', add
label define birthyr_sp_lbl 1646 `"1646"', add
label define birthyr_sp_lbl 1647 `"1647"', add
label define birthyr_sp_lbl 1648 `"1648"', add
label define birthyr_sp_lbl 1649 `"1649"', add
label define birthyr_sp_lbl 1650 `"1650"', add
label define birthyr_sp_lbl 1651 `"1651"', add
label define birthyr_sp_lbl 1652 `"1652"', add
label define birthyr_sp_lbl 1653 `"1653"', add
label define birthyr_sp_lbl 1654 `"1654"', add
label define birthyr_sp_lbl 1655 `"1655"', add
label define birthyr_sp_lbl 1656 `"1656"', add
label define birthyr_sp_lbl 1657 `"1657"', add
label define birthyr_sp_lbl 1658 `"1658"', add
label define birthyr_sp_lbl 1659 `"1659"', add
label define birthyr_sp_lbl 1660 `"1660"', add
label define birthyr_sp_lbl 1661 `"1661"', add
label define birthyr_sp_lbl 1662 `"1662"', add
label define birthyr_sp_lbl 1663 `"1663"', add
label define birthyr_sp_lbl 1664 `"1664"', add
label define birthyr_sp_lbl 1665 `"1665"', add
label define birthyr_sp_lbl 1666 `"1666"', add
label define birthyr_sp_lbl 1667 `"1667"', add
label define birthyr_sp_lbl 1668 `"1668"', add
label define birthyr_sp_lbl 1669 `"1669"', add
label define birthyr_sp_lbl 1670 `"1670"', add
label define birthyr_sp_lbl 1671 `"1671"', add
label define birthyr_sp_lbl 1672 `"1672"', add
label define birthyr_sp_lbl 1673 `"1673"', add
label define birthyr_sp_lbl 1674 `"1674"', add
label define birthyr_sp_lbl 1675 `"1675"', add
label define birthyr_sp_lbl 1676 `"1676"', add
label define birthyr_sp_lbl 1677 `"1677"', add
label define birthyr_sp_lbl 1678 `"1678"', add
label define birthyr_sp_lbl 1679 `"1679"', add
label define birthyr_sp_lbl 1680 `"1680"', add
label define birthyr_sp_lbl 1681 `"1681"', add
label define birthyr_sp_lbl 1682 `"1682"', add
label define birthyr_sp_lbl 1683 `"1683"', add
label define birthyr_sp_lbl 1684 `"1684"', add
label define birthyr_sp_lbl 1685 `"1685"', add
label define birthyr_sp_lbl 1686 `"1686"', add
label define birthyr_sp_lbl 1687 `"1687"', add
label define birthyr_sp_lbl 1688 `"1688"', add
label define birthyr_sp_lbl 1689 `"1689"', add
label define birthyr_sp_lbl 1690 `"1690"', add
label define birthyr_sp_lbl 1691 `"1691"', add
label define birthyr_sp_lbl 1692 `"1692"', add
label define birthyr_sp_lbl 1693 `"1693"', add
label define birthyr_sp_lbl 1694 `"1694"', add
label define birthyr_sp_lbl 1695 `"1695"', add
label define birthyr_sp_lbl 1696 `"1696"', add
label define birthyr_sp_lbl 1697 `"1697"', add
label define birthyr_sp_lbl 1698 `"1698"', add
label define birthyr_sp_lbl 1699 `"1699"', add
label define birthyr_sp_lbl 1700 `"1700"', add
label define birthyr_sp_lbl 1701 `"1701"', add
label define birthyr_sp_lbl 1702 `"1702"', add
label define birthyr_sp_lbl 1703 `"1703"', add
label define birthyr_sp_lbl 1704 `"1704"', add
label define birthyr_sp_lbl 1705 `"1705"', add
label define birthyr_sp_lbl 1706 `"1706"', add
label define birthyr_sp_lbl 1707 `"1707"', add
label define birthyr_sp_lbl 1708 `"1708"', add
label define birthyr_sp_lbl 1709 `"1709"', add
label define birthyr_sp_lbl 1710 `"1710"', add
label define birthyr_sp_lbl 1711 `"1711"', add
label define birthyr_sp_lbl 1712 `"1712"', add
label define birthyr_sp_lbl 1713 `"1713"', add
label define birthyr_sp_lbl 1714 `"1714"', add
label define birthyr_sp_lbl 1715 `"1715"', add
label define birthyr_sp_lbl 1716 `"1716"', add
label define birthyr_sp_lbl 1717 `"1717"', add
label define birthyr_sp_lbl 1718 `"1718"', add
label define birthyr_sp_lbl 1719 `"1719"', add
label define birthyr_sp_lbl 1720 `"1720"', add
label define birthyr_sp_lbl 1721 `"1721"', add
label define birthyr_sp_lbl 1722 `"1722"', add
label define birthyr_sp_lbl 1723 `"1723"', add
label define birthyr_sp_lbl 1724 `"1724"', add
label define birthyr_sp_lbl 1725 `"1725"', add
label define birthyr_sp_lbl 1726 `"1726"', add
label define birthyr_sp_lbl 1727 `"1727"', add
label define birthyr_sp_lbl 1728 `"1728"', add
label define birthyr_sp_lbl 1729 `"1729"', add
label define birthyr_sp_lbl 1730 `"1730"', add
label define birthyr_sp_lbl 1731 `"1731"', add
label define birthyr_sp_lbl 1732 `"1732"', add
label define birthyr_sp_lbl 1733 `"1733"', add
label define birthyr_sp_lbl 1734 `"1734"', add
label define birthyr_sp_lbl 1735 `"1735"', add
label define birthyr_sp_lbl 1736 `"1736"', add
label define birthyr_sp_lbl 1737 `"1737"', add
label define birthyr_sp_lbl 1738 `"1738"', add
label define birthyr_sp_lbl 1739 `"1739"', add
label define birthyr_sp_lbl 1740 `"1740"', add
label define birthyr_sp_lbl 1741 `"1741"', add
label define birthyr_sp_lbl 1742 `"1742"', add
label define birthyr_sp_lbl 1743 `"1743"', add
label define birthyr_sp_lbl 1744 `"1744"', add
label define birthyr_sp_lbl 1745 `"1745"', add
label define birthyr_sp_lbl 1746 `"1746"', add
label define birthyr_sp_lbl 1747 `"1747"', add
label define birthyr_sp_lbl 1748 `"1748"', add
label define birthyr_sp_lbl 1749 `"1749"', add
label define birthyr_sp_lbl 1750 `"1750"', add
label define birthyr_sp_lbl 1751 `"1751"', add
label define birthyr_sp_lbl 1752 `"1752"', add
label define birthyr_sp_lbl 1753 `"1753"', add
label define birthyr_sp_lbl 1754 `"1754"', add
label define birthyr_sp_lbl 1755 `"1755"', add
label define birthyr_sp_lbl 1756 `"1756"', add
label define birthyr_sp_lbl 1757 `"1757"', add
label define birthyr_sp_lbl 1758 `"1758"', add
label define birthyr_sp_lbl 1759 `"1759"', add
label define birthyr_sp_lbl 1760 `"1760"', add
label define birthyr_sp_lbl 1761 `"1761"', add
label define birthyr_sp_lbl 1762 `"1762"', add
label define birthyr_sp_lbl 1763 `"1763"', add
label define birthyr_sp_lbl 1764 `"1764"', add
label define birthyr_sp_lbl 1765 `"1765"', add
label define birthyr_sp_lbl 1766 `"1766"', add
label define birthyr_sp_lbl 1767 `"1767"', add
label define birthyr_sp_lbl 1768 `"1768"', add
label define birthyr_sp_lbl 1769 `"1769"', add
label define birthyr_sp_lbl 1770 `"1770"', add
label define birthyr_sp_lbl 1771 `"1771"', add
label define birthyr_sp_lbl 1772 `"1772"', add
label define birthyr_sp_lbl 1773 `"1773"', add
label define birthyr_sp_lbl 1774 `"1774"', add
label define birthyr_sp_lbl 1775 `"1775"', add
label define birthyr_sp_lbl 1776 `"1776"', add
label define birthyr_sp_lbl 1777 `"1777"', add
label define birthyr_sp_lbl 1778 `"1778"', add
label define birthyr_sp_lbl 1779 `"1779"', add
label define birthyr_sp_lbl 1780 `"1780"', add
label define birthyr_sp_lbl 1781 `"1781"', add
label define birthyr_sp_lbl 1782 `"1782"', add
label define birthyr_sp_lbl 1783 `"1783"', add
label define birthyr_sp_lbl 1784 `"1784"', add
label define birthyr_sp_lbl 1785 `"1785"', add
label define birthyr_sp_lbl 1786 `"1786"', add
label define birthyr_sp_lbl 1787 `"1787"', add
label define birthyr_sp_lbl 1788 `"1788"', add
label define birthyr_sp_lbl 1789 `"1789"', add
label define birthyr_sp_lbl 1790 `"1790"', add
label define birthyr_sp_lbl 1791 `"1791"', add
label define birthyr_sp_lbl 1792 `"1792"', add
label define birthyr_sp_lbl 1793 `"1793"', add
label define birthyr_sp_lbl 1794 `"1794"', add
label define birthyr_sp_lbl 1795 `"1795"', add
label define birthyr_sp_lbl 1796 `"1796"', add
label define birthyr_sp_lbl 1797 `"1797"', add
label define birthyr_sp_lbl 1798 `"1798"', add
label define birthyr_sp_lbl 1799 `"1799"', add
label define birthyr_sp_lbl 1800 `"1800"', add
label define birthyr_sp_lbl 1801 `"1801"', add
label define birthyr_sp_lbl 1802 `"1802"', add
label define birthyr_sp_lbl 1803 `"1803"', add
label define birthyr_sp_lbl 1804 `"1804"', add
label define birthyr_sp_lbl 1805 `"1805"', add
label define birthyr_sp_lbl 1806 `"1806"', add
label define birthyr_sp_lbl 1807 `"1807"', add
label define birthyr_sp_lbl 1808 `"1808"', add
label define birthyr_sp_lbl 1809 `"1809"', add
label define birthyr_sp_lbl 1810 `"1810"', add
label define birthyr_sp_lbl 1811 `"1811"', add
label define birthyr_sp_lbl 1812 `"1812"', add
label define birthyr_sp_lbl 1813 `"1813"', add
label define birthyr_sp_lbl 1814 `"1814"', add
label define birthyr_sp_lbl 1815 `"1815"', add
label define birthyr_sp_lbl 1816 `"1816"', add
label define birthyr_sp_lbl 1817 `"1817"', add
label define birthyr_sp_lbl 1818 `"1818"', add
label define birthyr_sp_lbl 1819 `"1819"', add
label define birthyr_sp_lbl 1820 `"1820"', add
label define birthyr_sp_lbl 1821 `"1821"', add
label define birthyr_sp_lbl 1822 `"1822"', add
label define birthyr_sp_lbl 1823 `"1823"', add
label define birthyr_sp_lbl 1824 `"1824"', add
label define birthyr_sp_lbl 1825 `"1825"', add
label define birthyr_sp_lbl 1826 `"1826"', add
label define birthyr_sp_lbl 1827 `"1827"', add
label define birthyr_sp_lbl 1828 `"1828"', add
label define birthyr_sp_lbl 1829 `"1829"', add
label define birthyr_sp_lbl 1830 `"1830"', add
label define birthyr_sp_lbl 1831 `"1831"', add
label define birthyr_sp_lbl 1832 `"1832"', add
label define birthyr_sp_lbl 1833 `"1833"', add
label define birthyr_sp_lbl 1834 `"1834"', add
label define birthyr_sp_lbl 1835 `"1835"', add
label define birthyr_sp_lbl 1836 `"1836"', add
label define birthyr_sp_lbl 1837 `"1837"', add
label define birthyr_sp_lbl 1838 `"1838"', add
label define birthyr_sp_lbl 1839 `"1839"', add
label define birthyr_sp_lbl 1840 `"1840"', add
label define birthyr_sp_lbl 1841 `"1841"', add
label define birthyr_sp_lbl 1842 `"1842"', add
label define birthyr_sp_lbl 1843 `"1843"', add
label define birthyr_sp_lbl 1844 `"1844"', add
label define birthyr_sp_lbl 1845 `"1845"', add
label define birthyr_sp_lbl 1846 `"1846"', add
label define birthyr_sp_lbl 1847 `"1847"', add
label define birthyr_sp_lbl 1848 `"1848"', add
label define birthyr_sp_lbl 1849 `"1849"', add
label define birthyr_sp_lbl 1850 `"1850"', add
label define birthyr_sp_lbl 1851 `"1851"', add
label define birthyr_sp_lbl 1852 `"1852"', add
label define birthyr_sp_lbl 1853 `"1853"', add
label define birthyr_sp_lbl 1854 `"1854"', add
label define birthyr_sp_lbl 1855 `"1855"', add
label define birthyr_sp_lbl 1856 `"1856"', add
label define birthyr_sp_lbl 1857 `"1857"', add
label define birthyr_sp_lbl 1858 `"1858"', add
label define birthyr_sp_lbl 1859 `"1859"', add
label define birthyr_sp_lbl 1860 `"1860"', add
label define birthyr_sp_lbl 1861 `"1861"', add
label define birthyr_sp_lbl 1862 `"1862"', add
label define birthyr_sp_lbl 1863 `"1863"', add
label define birthyr_sp_lbl 1864 `"1864"', add
label define birthyr_sp_lbl 1865 `"1865"', add
label define birthyr_sp_lbl 1866 `"1866"', add
label define birthyr_sp_lbl 1867 `"1867"', add
label define birthyr_sp_lbl 1868 `"1868"', add
label define birthyr_sp_lbl 1869 `"1869"', add
label define birthyr_sp_lbl 1870 `"1870"', add
label define birthyr_sp_lbl 1871 `"1871"', add
label define birthyr_sp_lbl 1872 `"1872"', add
label define birthyr_sp_lbl 1873 `"1873"', add
label define birthyr_sp_lbl 1874 `"1874"', add
label define birthyr_sp_lbl 1875 `"1875"', add
label define birthyr_sp_lbl 1876 `"1876"', add
label define birthyr_sp_lbl 1877 `"1877"', add
label define birthyr_sp_lbl 1878 `"1878"', add
label define birthyr_sp_lbl 1879 `"1879"', add
label define birthyr_sp_lbl 1880 `"1880"', add
label define birthyr_sp_lbl 1881 `"1881"', add
label define birthyr_sp_lbl 1882 `"1882"', add
label define birthyr_sp_lbl 1883 `"1883"', add
label define birthyr_sp_lbl 1884 `"1884"', add
label define birthyr_sp_lbl 1885 `"1885"', add
label define birthyr_sp_lbl 1886 `"1886"', add
label define birthyr_sp_lbl 1887 `"1887"', add
label define birthyr_sp_lbl 1888 `"1888"', add
label define birthyr_sp_lbl 1889 `"1889"', add
label define birthyr_sp_lbl 1890 `"1890"', add
label define birthyr_sp_lbl 1891 `"1891"', add
label define birthyr_sp_lbl 1892 `"1892"', add
label define birthyr_sp_lbl 1893 `"1893"', add
label define birthyr_sp_lbl 1894 `"1894"', add
label define birthyr_sp_lbl 1895 `"1895"', add
label define birthyr_sp_lbl 1896 `"1896"', add
label define birthyr_sp_lbl 1897 `"1897"', add
label define birthyr_sp_lbl 1898 `"1898"', add
label define birthyr_sp_lbl 1899 `"1899"', add
label define birthyr_sp_lbl 1900 `"1900"', add
label define birthyr_sp_lbl 1901 `"1901"', add
label define birthyr_sp_lbl 1902 `"1902"', add
label define birthyr_sp_lbl 1903 `"1903"', add
label define birthyr_sp_lbl 1904 `"1904"', add
label define birthyr_sp_lbl 1905 `"1905"', add
label define birthyr_sp_lbl 1906 `"1906"', add
label define birthyr_sp_lbl 1907 `"1907"', add
label define birthyr_sp_lbl 1908 `"1908"', add
label define birthyr_sp_lbl 1909 `"1909"', add
label define birthyr_sp_lbl 1910 `"1910"', add
label define birthyr_sp_lbl 1911 `"1911"', add
label define birthyr_sp_lbl 1912 `"1912"', add
label define birthyr_sp_lbl 1913 `"1913"', add
label define birthyr_sp_lbl 1914 `"1914"', add
label define birthyr_sp_lbl 1915 `"1915"', add
label define birthyr_sp_lbl 1916 `"1916"', add
label define birthyr_sp_lbl 1917 `"1917"', add
label define birthyr_sp_lbl 1918 `"1918"', add
label define birthyr_sp_lbl 1919 `"1919"', add
label define birthyr_sp_lbl 1920 `"1920"', add
label define birthyr_sp_lbl 1921 `"1921"', add
label define birthyr_sp_lbl 1922 `"1922"', add
label define birthyr_sp_lbl 1923 `"1923"', add
label define birthyr_sp_lbl 1924 `"1924"', add
label define birthyr_sp_lbl 1925 `"1925"', add
label define birthyr_sp_lbl 1926 `"1926"', add
label define birthyr_sp_lbl 1927 `"1927"', add
label define birthyr_sp_lbl 1928 `"1928"', add
label define birthyr_sp_lbl 1929 `"1929"', add
label define birthyr_sp_lbl 1930 `"1930"', add
label define birthyr_sp_lbl 1931 `"1931"', add
label define birthyr_sp_lbl 1932 `"1932"', add
label define birthyr_sp_lbl 1933 `"1933"', add
label define birthyr_sp_lbl 1934 `"1934"', add
label define birthyr_sp_lbl 1935 `"1935"', add
label define birthyr_sp_lbl 1936 `"1936"', add
label define birthyr_sp_lbl 1937 `"1937"', add
label define birthyr_sp_lbl 1938 `"1938"', add
label define birthyr_sp_lbl 1939 `"1939"', add
label define birthyr_sp_lbl 1940 `"1940"', add
label define birthyr_sp_lbl 1941 `"1941"', add
label define birthyr_sp_lbl 1942 `"1942"', add
label define birthyr_sp_lbl 1943 `"1943"', add
label define birthyr_sp_lbl 1944 `"1944"', add
label define birthyr_sp_lbl 1945 `"1945"', add
label define birthyr_sp_lbl 1946 `"1946"', add
label define birthyr_sp_lbl 1947 `"1947"', add
label define birthyr_sp_lbl 1948 `"1948"', add
label define birthyr_sp_lbl 1949 `"1949"', add
label define birthyr_sp_lbl 1950 `"1950"', add
label define birthyr_sp_lbl 1951 `"1951"', add
label define birthyr_sp_lbl 1952 `"1952"', add
label define birthyr_sp_lbl 1953 `"1953"', add
label define birthyr_sp_lbl 1954 `"1954"', add
label define birthyr_sp_lbl 1955 `"1955"', add
label define birthyr_sp_lbl 1956 `"1956"', add
label define birthyr_sp_lbl 1957 `"1957"', add
label define birthyr_sp_lbl 1958 `"1958"', add
label define birthyr_sp_lbl 1959 `"1959"', add
label define birthyr_sp_lbl 1960 `"1960"', add
label define birthyr_sp_lbl 1961 `"1961"', add
label define birthyr_sp_lbl 1962 `"1962"', add
label define birthyr_sp_lbl 1963 `"1963"', add
label define birthyr_sp_lbl 1964 `"1964"', add
label define birthyr_sp_lbl 1965 `"1965"', add
label define birthyr_sp_lbl 1966 `"1966"', add
label define birthyr_sp_lbl 1967 `"1967"', add
label define birthyr_sp_lbl 1968 `"1968"', add
label define birthyr_sp_lbl 1969 `"1969"', add
label define birthyr_sp_lbl 1970 `"1970"', add
label define birthyr_sp_lbl 1971 `"1971"', add
label define birthyr_sp_lbl 1972 `"1972"', add
label define birthyr_sp_lbl 1973 `"1973"', add
label define birthyr_sp_lbl 1974 `"1974"', add
label define birthyr_sp_lbl 1975 `"1975"', add
label define birthyr_sp_lbl 1976 `"1976"', add
label define birthyr_sp_lbl 1977 `"1977"', add
label define birthyr_sp_lbl 1978 `"1978"', add
label define birthyr_sp_lbl 1979 `"1979"', add
label define birthyr_sp_lbl 1980 `"1980"', add
label define birthyr_sp_lbl 1981 `"1981"', add
label define birthyr_sp_lbl 1982 `"1982"', add
label define birthyr_sp_lbl 1983 `"1983"', add
label define birthyr_sp_lbl 1984 `"1984"', add
label define birthyr_sp_lbl 1985 `"1985"', add
label define birthyr_sp_lbl 1986 `"1986"', add
label define birthyr_sp_lbl 1987 `"1987"', add
label define birthyr_sp_lbl 1988 `"1988"', add
label define birthyr_sp_lbl 1989 `"1989"', add
label define birthyr_sp_lbl 1990 `"1990"', add
label define birthyr_sp_lbl 1991 `"1991"', add
label define birthyr_sp_lbl 1992 `"1992"', add
label define birthyr_sp_lbl 1993 `"1993"', add
label define birthyr_sp_lbl 1994 `"1994"', add
label define birthyr_sp_lbl 1995 `"1995"', add
label define birthyr_sp_lbl 1996 `"1996"', add
label define birthyr_sp_lbl 1997 `"1997"', add
label define birthyr_sp_lbl 1998 `"1998"', add
label define birthyr_sp_lbl 1999 `"1999"', add
label define birthyr_sp_lbl 2000 `"2000"', add
label define birthyr_sp_lbl 2001 `"2001"', add
label define birthyr_sp_lbl 2002 `"2002"', add
label define birthyr_sp_lbl 2003 `"2003"', add
label define birthyr_sp_lbl 2004 `"2004"', add
label define birthyr_sp_lbl 2005 `"2005"', add
label define birthyr_sp_lbl 2006 `"2006"', add
label define birthyr_sp_lbl 2007 `"2007"', add
label define birthyr_sp_lbl 2008 `"2008"', add
label define birthyr_sp_lbl 2009 `"2009"', add
label define birthyr_sp_lbl 2010 `"2010"', add
label define birthyr_sp_lbl 2011 `"2011"', add
label define birthyr_sp_lbl 2012 `"2012"', add
label define birthyr_sp_lbl 2013 `"2013"', add
label define birthyr_sp_lbl 2014 `"2014"', add
label define birthyr_sp_lbl 2015 `"2015"', add
label define birthyr_sp_lbl 2016 `"2016"', add
label define birthyr_sp_lbl 2017 `"2017"', add
label define birthyr_sp_lbl 2018 `"2018"', add
label define birthyr_sp_lbl 2019 `"2019"', add
label define birthyr_sp_lbl 2020 `"2020"', add
label define birthyr_sp_lbl 9999 `"Unknown"', add
label values birthyr_sp birthyr_sp_lbl

label define birthmo_head_lbl 01 `"January"'
label define birthmo_head_lbl 02 `"February"', add
label define birthmo_head_lbl 03 `"March"', add
label define birthmo_head_lbl 04 `"April"', add
label define birthmo_head_lbl 05 `"May"', add
label define birthmo_head_lbl 06 `"June"', add
label define birthmo_head_lbl 07 `"July"', add
label define birthmo_head_lbl 08 `"August"', add
label define birthmo_head_lbl 09 `"September"', add
label define birthmo_head_lbl 10 `"October"', add
label define birthmo_head_lbl 11 `"November"', add
label define birthmo_head_lbl 12 `"December"', add
label define birthmo_head_lbl 98 `"Unknown"', add
label define birthmo_head_lbl 99 `"NIU (not in universe)"', add
label values birthmo_head birthmo_head_lbl

label define birthmo_mom_lbl 01 `"January"'
label define birthmo_mom_lbl 02 `"February"', add
label define birthmo_mom_lbl 03 `"March"', add
label define birthmo_mom_lbl 04 `"April"', add
label define birthmo_mom_lbl 05 `"May"', add
label define birthmo_mom_lbl 06 `"June"', add
label define birthmo_mom_lbl 07 `"July"', add
label define birthmo_mom_lbl 08 `"August"', add
label define birthmo_mom_lbl 09 `"September"', add
label define birthmo_mom_lbl 10 `"October"', add
label define birthmo_mom_lbl 11 `"November"', add
label define birthmo_mom_lbl 12 `"December"', add
label define birthmo_mom_lbl 98 `"Unknown"', add
label define birthmo_mom_lbl 99 `"NIU (not in universe)"', add
label values birthmo_mom birthmo_mom_lbl

label define birthmo_pop_lbl 01 `"January"'
label define birthmo_pop_lbl 02 `"February"', add
label define birthmo_pop_lbl 03 `"March"', add
label define birthmo_pop_lbl 04 `"April"', add
label define birthmo_pop_lbl 05 `"May"', add
label define birthmo_pop_lbl 06 `"June"', add
label define birthmo_pop_lbl 07 `"July"', add
label define birthmo_pop_lbl 08 `"August"', add
label define birthmo_pop_lbl 09 `"September"', add
label define birthmo_pop_lbl 10 `"October"', add
label define birthmo_pop_lbl 11 `"November"', add
label define birthmo_pop_lbl 12 `"December"', add
label define birthmo_pop_lbl 98 `"Unknown"', add
label define birthmo_pop_lbl 99 `"NIU (not in universe)"', add
label values birthmo_pop birthmo_pop_lbl

label define birthmo_sp_lbl 01 `"January"'
label define birthmo_sp_lbl 02 `"February"', add
label define birthmo_sp_lbl 03 `"March"', add
label define birthmo_sp_lbl 04 `"April"', add
label define birthmo_sp_lbl 05 `"May"', add
label define birthmo_sp_lbl 06 `"June"', add
label define birthmo_sp_lbl 07 `"July"', add
label define birthmo_sp_lbl 08 `"August"', add
label define birthmo_sp_lbl 09 `"September"', add
label define birthmo_sp_lbl 10 `"October"', add
label define birthmo_sp_lbl 11 `"November"', add
label define birthmo_sp_lbl 12 `"December"', add
label define birthmo_sp_lbl 98 `"Unknown"', add
label define birthmo_sp_lbl 99 `"NIU (not in universe)"', add
label values birthmo_sp birthmo_sp_lbl

label define chbornf_head_lbl 00 `"No children"'
label define chbornf_head_lbl 01 `"1 child"', add
label define chbornf_head_lbl 02 `"2 children"', add
label define chbornf_head_lbl 03 `"3"', add
label define chbornf_head_lbl 04 `"4"', add
label define chbornf_head_lbl 05 `"5"', add
label define chbornf_head_lbl 06 `"6"', add
label define chbornf_head_lbl 07 `"7"', add
label define chbornf_head_lbl 08 `"8"', add
label define chbornf_head_lbl 09 `"9"', add
label define chbornf_head_lbl 10 `"10"', add
label define chbornf_head_lbl 11 `"11"', add
label define chbornf_head_lbl 12 `"12"', add
label define chbornf_head_lbl 13 `"13"', add
label define chbornf_head_lbl 14 `"14"', add
label define chbornf_head_lbl 15 `"15"', add
label define chbornf_head_lbl 16 `"16"', add
label define chbornf_head_lbl 17 `"17"', add
label define chbornf_head_lbl 18 `"18"', add
label define chbornf_head_lbl 19 `"19"', add
label define chbornf_head_lbl 20 `"20"', add
label define chbornf_head_lbl 21 `"21"', add
label define chbornf_head_lbl 22 `"22"', add
label define chbornf_head_lbl 23 `"23"', add
label define chbornf_head_lbl 24 `"24"', add
label define chbornf_head_lbl 25 `"25"', add
label define chbornf_head_lbl 26 `"26"', add
label define chbornf_head_lbl 27 `"27"', add
label define chbornf_head_lbl 28 `"28"', add
label define chbornf_head_lbl 29 `"29"', add
label define chbornf_head_lbl 30 `"30+"', add
label define chbornf_head_lbl 98 `"Unknown"', add
label define chbornf_head_lbl 99 `"NIU (not in universe)"', add
label values chbornf_head chbornf_head_lbl

label define chbornf_mom_lbl 00 `"No children"'
label define chbornf_mom_lbl 01 `"1 child"', add
label define chbornf_mom_lbl 02 `"2 children"', add
label define chbornf_mom_lbl 03 `"3"', add
label define chbornf_mom_lbl 04 `"4"', add
label define chbornf_mom_lbl 05 `"5"', add
label define chbornf_mom_lbl 06 `"6"', add
label define chbornf_mom_lbl 07 `"7"', add
label define chbornf_mom_lbl 08 `"8"', add
label define chbornf_mom_lbl 09 `"9"', add
label define chbornf_mom_lbl 10 `"10"', add
label define chbornf_mom_lbl 11 `"11"', add
label define chbornf_mom_lbl 12 `"12"', add
label define chbornf_mom_lbl 13 `"13"', add
label define chbornf_mom_lbl 14 `"14"', add
label define chbornf_mom_lbl 15 `"15"', add
label define chbornf_mom_lbl 16 `"16"', add
label define chbornf_mom_lbl 17 `"17"', add
label define chbornf_mom_lbl 18 `"18"', add
label define chbornf_mom_lbl 19 `"19"', add
label define chbornf_mom_lbl 20 `"20"', add
label define chbornf_mom_lbl 21 `"21"', add
label define chbornf_mom_lbl 22 `"22"', add
label define chbornf_mom_lbl 23 `"23"', add
label define chbornf_mom_lbl 24 `"24"', add
label define chbornf_mom_lbl 25 `"25"', add
label define chbornf_mom_lbl 26 `"26"', add
label define chbornf_mom_lbl 27 `"27"', add
label define chbornf_mom_lbl 28 `"28"', add
label define chbornf_mom_lbl 29 `"29"', add
label define chbornf_mom_lbl 30 `"30+"', add
label define chbornf_mom_lbl 98 `"Unknown"', add
label define chbornf_mom_lbl 99 `"NIU (not in universe)"', add
label values chbornf_mom chbornf_mom_lbl

label define chbornf_pop_lbl 00 `"No children"'
label define chbornf_pop_lbl 01 `"1 child"', add
label define chbornf_pop_lbl 02 `"2 children"', add
label define chbornf_pop_lbl 03 `"3"', add
label define chbornf_pop_lbl 04 `"4"', add
label define chbornf_pop_lbl 05 `"5"', add
label define chbornf_pop_lbl 06 `"6"', add
label define chbornf_pop_lbl 07 `"7"', add
label define chbornf_pop_lbl 08 `"8"', add
label define chbornf_pop_lbl 09 `"9"', add
label define chbornf_pop_lbl 10 `"10"', add
label define chbornf_pop_lbl 11 `"11"', add
label define chbornf_pop_lbl 12 `"12"', add
label define chbornf_pop_lbl 13 `"13"', add
label define chbornf_pop_lbl 14 `"14"', add
label define chbornf_pop_lbl 15 `"15"', add
label define chbornf_pop_lbl 16 `"16"', add
label define chbornf_pop_lbl 17 `"17"', add
label define chbornf_pop_lbl 18 `"18"', add
label define chbornf_pop_lbl 19 `"19"', add
label define chbornf_pop_lbl 20 `"20"', add
label define chbornf_pop_lbl 21 `"21"', add
label define chbornf_pop_lbl 22 `"22"', add
label define chbornf_pop_lbl 23 `"23"', add
label define chbornf_pop_lbl 24 `"24"', add
label define chbornf_pop_lbl 25 `"25"', add
label define chbornf_pop_lbl 26 `"26"', add
label define chbornf_pop_lbl 27 `"27"', add
label define chbornf_pop_lbl 28 `"28"', add
label define chbornf_pop_lbl 29 `"29"', add
label define chbornf_pop_lbl 30 `"30+"', add
label define chbornf_pop_lbl 98 `"Unknown"', add
label define chbornf_pop_lbl 99 `"NIU (not in universe)"', add
label values chbornf_pop chbornf_pop_lbl

label define chbornf_sp_lbl 00 `"No children"'
label define chbornf_sp_lbl 01 `"1 child"', add
label define chbornf_sp_lbl 02 `"2 children"', add
label define chbornf_sp_lbl 03 `"3"', add
label define chbornf_sp_lbl 04 `"4"', add
label define chbornf_sp_lbl 05 `"5"', add
label define chbornf_sp_lbl 06 `"6"', add
label define chbornf_sp_lbl 07 `"7"', add
label define chbornf_sp_lbl 08 `"8"', add
label define chbornf_sp_lbl 09 `"9"', add
label define chbornf_sp_lbl 10 `"10"', add
label define chbornf_sp_lbl 11 `"11"', add
label define chbornf_sp_lbl 12 `"12"', add
label define chbornf_sp_lbl 13 `"13"', add
label define chbornf_sp_lbl 14 `"14"', add
label define chbornf_sp_lbl 15 `"15"', add
label define chbornf_sp_lbl 16 `"16"', add
label define chbornf_sp_lbl 17 `"17"', add
label define chbornf_sp_lbl 18 `"18"', add
label define chbornf_sp_lbl 19 `"19"', add
label define chbornf_sp_lbl 20 `"20"', add
label define chbornf_sp_lbl 21 `"21"', add
label define chbornf_sp_lbl 22 `"22"', add
label define chbornf_sp_lbl 23 `"23"', add
label define chbornf_sp_lbl 24 `"24"', add
label define chbornf_sp_lbl 25 `"25"', add
label define chbornf_sp_lbl 26 `"26"', add
label define chbornf_sp_lbl 27 `"27"', add
label define chbornf_sp_lbl 28 `"28"', add
label define chbornf_sp_lbl 29 `"29"', add
label define chbornf_sp_lbl 30 `"30+"', add
label define chbornf_sp_lbl 98 `"Unknown"', add
label define chbornf_sp_lbl 99 `"NIU (not in universe)"', add
label values chbornf_sp chbornf_sp_lbl

label define chbornm_head_lbl 00 `"No children"'
label define chbornm_head_lbl 01 `"1 child"', add
label define chbornm_head_lbl 02 `"2 children"', add
label define chbornm_head_lbl 03 `"3"', add
label define chbornm_head_lbl 04 `"4"', add
label define chbornm_head_lbl 05 `"5"', add
label define chbornm_head_lbl 06 `"6"', add
label define chbornm_head_lbl 07 `"7"', add
label define chbornm_head_lbl 08 `"8"', add
label define chbornm_head_lbl 09 `"9"', add
label define chbornm_head_lbl 10 `"10"', add
label define chbornm_head_lbl 11 `"11"', add
label define chbornm_head_lbl 12 `"12"', add
label define chbornm_head_lbl 13 `"13"', add
label define chbornm_head_lbl 14 `"14"', add
label define chbornm_head_lbl 15 `"15"', add
label define chbornm_head_lbl 16 `"16"', add
label define chbornm_head_lbl 17 `"17"', add
label define chbornm_head_lbl 18 `"18"', add
label define chbornm_head_lbl 19 `"19"', add
label define chbornm_head_lbl 20 `"20"', add
label define chbornm_head_lbl 21 `"21"', add
label define chbornm_head_lbl 22 `"22"', add
label define chbornm_head_lbl 23 `"23"', add
label define chbornm_head_lbl 24 `"24"', add
label define chbornm_head_lbl 25 `"25"', add
label define chbornm_head_lbl 26 `"26"', add
label define chbornm_head_lbl 27 `"27"', add
label define chbornm_head_lbl 28 `"28"', add
label define chbornm_head_lbl 29 `"29"', add
label define chbornm_head_lbl 30 `"30+"', add
label define chbornm_head_lbl 98 `"Unknown"', add
label define chbornm_head_lbl 99 `"NIU (not in universe)"', add
label values chbornm_head chbornm_head_lbl

label define chbornm_mom_lbl 00 `"No children"'
label define chbornm_mom_lbl 01 `"1 child"', add
label define chbornm_mom_lbl 02 `"2 children"', add
label define chbornm_mom_lbl 03 `"3"', add
label define chbornm_mom_lbl 04 `"4"', add
label define chbornm_mom_lbl 05 `"5"', add
label define chbornm_mom_lbl 06 `"6"', add
label define chbornm_mom_lbl 07 `"7"', add
label define chbornm_mom_lbl 08 `"8"', add
label define chbornm_mom_lbl 09 `"9"', add
label define chbornm_mom_lbl 10 `"10"', add
label define chbornm_mom_lbl 11 `"11"', add
label define chbornm_mom_lbl 12 `"12"', add
label define chbornm_mom_lbl 13 `"13"', add
label define chbornm_mom_lbl 14 `"14"', add
label define chbornm_mom_lbl 15 `"15"', add
label define chbornm_mom_lbl 16 `"16"', add
label define chbornm_mom_lbl 17 `"17"', add
label define chbornm_mom_lbl 18 `"18"', add
label define chbornm_mom_lbl 19 `"19"', add
label define chbornm_mom_lbl 20 `"20"', add
label define chbornm_mom_lbl 21 `"21"', add
label define chbornm_mom_lbl 22 `"22"', add
label define chbornm_mom_lbl 23 `"23"', add
label define chbornm_mom_lbl 24 `"24"', add
label define chbornm_mom_lbl 25 `"25"', add
label define chbornm_mom_lbl 26 `"26"', add
label define chbornm_mom_lbl 27 `"27"', add
label define chbornm_mom_lbl 28 `"28"', add
label define chbornm_mom_lbl 29 `"29"', add
label define chbornm_mom_lbl 30 `"30+"', add
label define chbornm_mom_lbl 98 `"Unknown"', add
label define chbornm_mom_lbl 99 `"NIU (not in universe)"', add
label values chbornm_mom chbornm_mom_lbl

label define chbornm_pop_lbl 00 `"No children"'
label define chbornm_pop_lbl 01 `"1 child"', add
label define chbornm_pop_lbl 02 `"2 children"', add
label define chbornm_pop_lbl 03 `"3"', add
label define chbornm_pop_lbl 04 `"4"', add
label define chbornm_pop_lbl 05 `"5"', add
label define chbornm_pop_lbl 06 `"6"', add
label define chbornm_pop_lbl 07 `"7"', add
label define chbornm_pop_lbl 08 `"8"', add
label define chbornm_pop_lbl 09 `"9"', add
label define chbornm_pop_lbl 10 `"10"', add
label define chbornm_pop_lbl 11 `"11"', add
label define chbornm_pop_lbl 12 `"12"', add
label define chbornm_pop_lbl 13 `"13"', add
label define chbornm_pop_lbl 14 `"14"', add
label define chbornm_pop_lbl 15 `"15"', add
label define chbornm_pop_lbl 16 `"16"', add
label define chbornm_pop_lbl 17 `"17"', add
label define chbornm_pop_lbl 18 `"18"', add
label define chbornm_pop_lbl 19 `"19"', add
label define chbornm_pop_lbl 20 `"20"', add
label define chbornm_pop_lbl 21 `"21"', add
label define chbornm_pop_lbl 22 `"22"', add
label define chbornm_pop_lbl 23 `"23"', add
label define chbornm_pop_lbl 24 `"24"', add
label define chbornm_pop_lbl 25 `"25"', add
label define chbornm_pop_lbl 26 `"26"', add
label define chbornm_pop_lbl 27 `"27"', add
label define chbornm_pop_lbl 28 `"28"', add
label define chbornm_pop_lbl 29 `"29"', add
label define chbornm_pop_lbl 30 `"30+"', add
label define chbornm_pop_lbl 98 `"Unknown"', add
label define chbornm_pop_lbl 99 `"NIU (not in universe)"', add
label values chbornm_pop chbornm_pop_lbl

label define chbornm_sp_lbl 00 `"No children"'
label define chbornm_sp_lbl 01 `"1 child"', add
label define chbornm_sp_lbl 02 `"2 children"', add
label define chbornm_sp_lbl 03 `"3"', add
label define chbornm_sp_lbl 04 `"4"', add
label define chbornm_sp_lbl 05 `"5"', add
label define chbornm_sp_lbl 06 `"6"', add
label define chbornm_sp_lbl 07 `"7"', add
label define chbornm_sp_lbl 08 `"8"', add
label define chbornm_sp_lbl 09 `"9"', add
label define chbornm_sp_lbl 10 `"10"', add
label define chbornm_sp_lbl 11 `"11"', add
label define chbornm_sp_lbl 12 `"12"', add
label define chbornm_sp_lbl 13 `"13"', add
label define chbornm_sp_lbl 14 `"14"', add
label define chbornm_sp_lbl 15 `"15"', add
label define chbornm_sp_lbl 16 `"16"', add
label define chbornm_sp_lbl 17 `"17"', add
label define chbornm_sp_lbl 18 `"18"', add
label define chbornm_sp_lbl 19 `"19"', add
label define chbornm_sp_lbl 20 `"20"', add
label define chbornm_sp_lbl 21 `"21"', add
label define chbornm_sp_lbl 22 `"22"', add
label define chbornm_sp_lbl 23 `"23"', add
label define chbornm_sp_lbl 24 `"24"', add
label define chbornm_sp_lbl 25 `"25"', add
label define chbornm_sp_lbl 26 `"26"', add
label define chbornm_sp_lbl 27 `"27"', add
label define chbornm_sp_lbl 28 `"28"', add
label define chbornm_sp_lbl 29 `"29"', add
label define chbornm_sp_lbl 30 `"30+"', add
label define chbornm_sp_lbl 98 `"Unknown"', add
label define chbornm_sp_lbl 99 `"NIU (not in universe)"', add
label values chbornm_sp chbornm_sp_lbl

label define chsurvf_head_lbl 00 `"No children"'
label define chsurvf_head_lbl 01 `"1 child"', add
label define chsurvf_head_lbl 02 `"2 children"', add
label define chsurvf_head_lbl 03 `"3"', add
label define chsurvf_head_lbl 04 `"4"', add
label define chsurvf_head_lbl 05 `"5"', add
label define chsurvf_head_lbl 06 `"6"', add
label define chsurvf_head_lbl 07 `"7"', add
label define chsurvf_head_lbl 08 `"8"', add
label define chsurvf_head_lbl 09 `"9"', add
label define chsurvf_head_lbl 10 `"10"', add
label define chsurvf_head_lbl 11 `"11"', add
label define chsurvf_head_lbl 12 `"12"', add
label define chsurvf_head_lbl 13 `"13"', add
label define chsurvf_head_lbl 14 `"14"', add
label define chsurvf_head_lbl 15 `"15"', add
label define chsurvf_head_lbl 16 `"16"', add
label define chsurvf_head_lbl 17 `"17"', add
label define chsurvf_head_lbl 18 `"18"', add
label define chsurvf_head_lbl 19 `"19"', add
label define chsurvf_head_lbl 20 `"20+"', add
label define chsurvf_head_lbl 98 `"Unknown"', add
label define chsurvf_head_lbl 99 `"NIU (not in universe)"', add
label values chsurvf_head chsurvf_head_lbl

label define chsurvf_mom_lbl 00 `"No children"'
label define chsurvf_mom_lbl 01 `"1 child"', add
label define chsurvf_mom_lbl 02 `"2 children"', add
label define chsurvf_mom_lbl 03 `"3"', add
label define chsurvf_mom_lbl 04 `"4"', add
label define chsurvf_mom_lbl 05 `"5"', add
label define chsurvf_mom_lbl 06 `"6"', add
label define chsurvf_mom_lbl 07 `"7"', add
label define chsurvf_mom_lbl 08 `"8"', add
label define chsurvf_mom_lbl 09 `"9"', add
label define chsurvf_mom_lbl 10 `"10"', add
label define chsurvf_mom_lbl 11 `"11"', add
label define chsurvf_mom_lbl 12 `"12"', add
label define chsurvf_mom_lbl 13 `"13"', add
label define chsurvf_mom_lbl 14 `"14"', add
label define chsurvf_mom_lbl 15 `"15"', add
label define chsurvf_mom_lbl 16 `"16"', add
label define chsurvf_mom_lbl 17 `"17"', add
label define chsurvf_mom_lbl 18 `"18"', add
label define chsurvf_mom_lbl 19 `"19"', add
label define chsurvf_mom_lbl 20 `"20+"', add
label define chsurvf_mom_lbl 98 `"Unknown"', add
label define chsurvf_mom_lbl 99 `"NIU (not in universe)"', add
label values chsurvf_mom chsurvf_mom_lbl

label define chsurvf_pop_lbl 00 `"No children"'
label define chsurvf_pop_lbl 01 `"1 child"', add
label define chsurvf_pop_lbl 02 `"2 children"', add
label define chsurvf_pop_lbl 03 `"3"', add
label define chsurvf_pop_lbl 04 `"4"', add
label define chsurvf_pop_lbl 05 `"5"', add
label define chsurvf_pop_lbl 06 `"6"', add
label define chsurvf_pop_lbl 07 `"7"', add
label define chsurvf_pop_lbl 08 `"8"', add
label define chsurvf_pop_lbl 09 `"9"', add
label define chsurvf_pop_lbl 10 `"10"', add
label define chsurvf_pop_lbl 11 `"11"', add
label define chsurvf_pop_lbl 12 `"12"', add
label define chsurvf_pop_lbl 13 `"13"', add
label define chsurvf_pop_lbl 14 `"14"', add
label define chsurvf_pop_lbl 15 `"15"', add
label define chsurvf_pop_lbl 16 `"16"', add
label define chsurvf_pop_lbl 17 `"17"', add
label define chsurvf_pop_lbl 18 `"18"', add
label define chsurvf_pop_lbl 19 `"19"', add
label define chsurvf_pop_lbl 20 `"20+"', add
label define chsurvf_pop_lbl 98 `"Unknown"', add
label define chsurvf_pop_lbl 99 `"NIU (not in universe)"', add
label values chsurvf_pop chsurvf_pop_lbl

label define chsurvf_sp_lbl 00 `"No children"'
label define chsurvf_sp_lbl 01 `"1 child"', add
label define chsurvf_sp_lbl 02 `"2 children"', add
label define chsurvf_sp_lbl 03 `"3"', add
label define chsurvf_sp_lbl 04 `"4"', add
label define chsurvf_sp_lbl 05 `"5"', add
label define chsurvf_sp_lbl 06 `"6"', add
label define chsurvf_sp_lbl 07 `"7"', add
label define chsurvf_sp_lbl 08 `"8"', add
label define chsurvf_sp_lbl 09 `"9"', add
label define chsurvf_sp_lbl 10 `"10"', add
label define chsurvf_sp_lbl 11 `"11"', add
label define chsurvf_sp_lbl 12 `"12"', add
label define chsurvf_sp_lbl 13 `"13"', add
label define chsurvf_sp_lbl 14 `"14"', add
label define chsurvf_sp_lbl 15 `"15"', add
label define chsurvf_sp_lbl 16 `"16"', add
label define chsurvf_sp_lbl 17 `"17"', add
label define chsurvf_sp_lbl 18 `"18"', add
label define chsurvf_sp_lbl 19 `"19"', add
label define chsurvf_sp_lbl 20 `"20+"', add
label define chsurvf_sp_lbl 98 `"Unknown"', add
label define chsurvf_sp_lbl 99 `"NIU (not in universe)"', add
label values chsurvf_sp chsurvf_sp_lbl

label define chsurvm_head_lbl 00 `"No children"'
label define chsurvm_head_lbl 01 `"1 child"', add
label define chsurvm_head_lbl 02 `"2 children"', add
label define chsurvm_head_lbl 03 `"3"', add
label define chsurvm_head_lbl 04 `"4"', add
label define chsurvm_head_lbl 05 `"5"', add
label define chsurvm_head_lbl 06 `"6"', add
label define chsurvm_head_lbl 07 `"7"', add
label define chsurvm_head_lbl 08 `"8"', add
label define chsurvm_head_lbl 09 `"9"', add
label define chsurvm_head_lbl 10 `"10"', add
label define chsurvm_head_lbl 11 `"11"', add
label define chsurvm_head_lbl 12 `"12"', add
label define chsurvm_head_lbl 13 `"13"', add
label define chsurvm_head_lbl 14 `"14"', add
label define chsurvm_head_lbl 15 `"15"', add
label define chsurvm_head_lbl 16 `"16"', add
label define chsurvm_head_lbl 17 `"17"', add
label define chsurvm_head_lbl 18 `"18"', add
label define chsurvm_head_lbl 19 `"19"', add
label define chsurvm_head_lbl 20 `"20+"', add
label define chsurvm_head_lbl 98 `"Unknown"', add
label define chsurvm_head_lbl 99 `"NIU (not in universe)"', add
label values chsurvm_head chsurvm_head_lbl

label define chsurvm_mom_lbl 00 `"No children"'
label define chsurvm_mom_lbl 01 `"1 child"', add
label define chsurvm_mom_lbl 02 `"2 children"', add
label define chsurvm_mom_lbl 03 `"3"', add
label define chsurvm_mom_lbl 04 `"4"', add
label define chsurvm_mom_lbl 05 `"5"', add
label define chsurvm_mom_lbl 06 `"6"', add
label define chsurvm_mom_lbl 07 `"7"', add
label define chsurvm_mom_lbl 08 `"8"', add
label define chsurvm_mom_lbl 09 `"9"', add
label define chsurvm_mom_lbl 10 `"10"', add
label define chsurvm_mom_lbl 11 `"11"', add
label define chsurvm_mom_lbl 12 `"12"', add
label define chsurvm_mom_lbl 13 `"13"', add
label define chsurvm_mom_lbl 14 `"14"', add
label define chsurvm_mom_lbl 15 `"15"', add
label define chsurvm_mom_lbl 16 `"16"', add
label define chsurvm_mom_lbl 17 `"17"', add
label define chsurvm_mom_lbl 18 `"18"', add
label define chsurvm_mom_lbl 19 `"19"', add
label define chsurvm_mom_lbl 20 `"20+"', add
label define chsurvm_mom_lbl 98 `"Unknown"', add
label define chsurvm_mom_lbl 99 `"NIU (not in universe)"', add
label values chsurvm_mom chsurvm_mom_lbl

label define chsurvm_pop_lbl 00 `"No children"'
label define chsurvm_pop_lbl 01 `"1 child"', add
label define chsurvm_pop_lbl 02 `"2 children"', add
label define chsurvm_pop_lbl 03 `"3"', add
label define chsurvm_pop_lbl 04 `"4"', add
label define chsurvm_pop_lbl 05 `"5"', add
label define chsurvm_pop_lbl 06 `"6"', add
label define chsurvm_pop_lbl 07 `"7"', add
label define chsurvm_pop_lbl 08 `"8"', add
label define chsurvm_pop_lbl 09 `"9"', add
label define chsurvm_pop_lbl 10 `"10"', add
label define chsurvm_pop_lbl 11 `"11"', add
label define chsurvm_pop_lbl 12 `"12"', add
label define chsurvm_pop_lbl 13 `"13"', add
label define chsurvm_pop_lbl 14 `"14"', add
label define chsurvm_pop_lbl 15 `"15"', add
label define chsurvm_pop_lbl 16 `"16"', add
label define chsurvm_pop_lbl 17 `"17"', add
label define chsurvm_pop_lbl 18 `"18"', add
label define chsurvm_pop_lbl 19 `"19"', add
label define chsurvm_pop_lbl 20 `"20+"', add
label define chsurvm_pop_lbl 98 `"Unknown"', add
label define chsurvm_pop_lbl 99 `"NIU (not in universe)"', add
label values chsurvm_pop chsurvm_pop_lbl

label define chsurvm_sp_lbl 00 `"No children"'
label define chsurvm_sp_lbl 01 `"1 child"', add
label define chsurvm_sp_lbl 02 `"2 children"', add
label define chsurvm_sp_lbl 03 `"3"', add
label define chsurvm_sp_lbl 04 `"4"', add
label define chsurvm_sp_lbl 05 `"5"', add
label define chsurvm_sp_lbl 06 `"6"', add
label define chsurvm_sp_lbl 07 `"7"', add
label define chsurvm_sp_lbl 08 `"8"', add
label define chsurvm_sp_lbl 09 `"9"', add
label define chsurvm_sp_lbl 10 `"10"', add
label define chsurvm_sp_lbl 11 `"11"', add
label define chsurvm_sp_lbl 12 `"12"', add
label define chsurvm_sp_lbl 13 `"13"', add
label define chsurvm_sp_lbl 14 `"14"', add
label define chsurvm_sp_lbl 15 `"15"', add
label define chsurvm_sp_lbl 16 `"16"', add
label define chsurvm_sp_lbl 17 `"17"', add
label define chsurvm_sp_lbl 18 `"18"', add
label define chsurvm_sp_lbl 19 `"19"', add
label define chsurvm_sp_lbl 20 `"20+"', add
label define chsurvm_sp_lbl 98 `"Unknown"', add
label define chsurvm_sp_lbl 99 `"NIU (not in universe)"', add
label values chsurvm_sp chsurvm_sp_lbl

label define lastbmo_head_lbl 01 `"January"'
label define lastbmo_head_lbl 02 `"February"', add
label define lastbmo_head_lbl 03 `"March"', add
label define lastbmo_head_lbl 04 `"April"', add
label define lastbmo_head_lbl 05 `"May"', add
label define lastbmo_head_lbl 06 `"June"', add
label define lastbmo_head_lbl 07 `"July"', add
label define lastbmo_head_lbl 08 `"August"', add
label define lastbmo_head_lbl 09 `"September"', add
label define lastbmo_head_lbl 10 `"October"', add
label define lastbmo_head_lbl 11 `"November"', add
label define lastbmo_head_lbl 12 `"December"', add
label define lastbmo_head_lbl 98 `"Unknown"', add
label define lastbmo_head_lbl 99 `"NIU (not in universe)"', add
label values lastbmo_head lastbmo_head_lbl

label define lastbmo_mom_lbl 01 `"January"'
label define lastbmo_mom_lbl 02 `"February"', add
label define lastbmo_mom_lbl 03 `"March"', add
label define lastbmo_mom_lbl 04 `"April"', add
label define lastbmo_mom_lbl 05 `"May"', add
label define lastbmo_mom_lbl 06 `"June"', add
label define lastbmo_mom_lbl 07 `"July"', add
label define lastbmo_mom_lbl 08 `"August"', add
label define lastbmo_mom_lbl 09 `"September"', add
label define lastbmo_mom_lbl 10 `"October"', add
label define lastbmo_mom_lbl 11 `"November"', add
label define lastbmo_mom_lbl 12 `"December"', add
label define lastbmo_mom_lbl 98 `"Unknown"', add
label define lastbmo_mom_lbl 99 `"NIU (not in universe)"', add
label values lastbmo_mom lastbmo_mom_lbl

label define lastbmo_pop_lbl 01 `"January"'
label define lastbmo_pop_lbl 02 `"February"', add
label define lastbmo_pop_lbl 03 `"March"', add
label define lastbmo_pop_lbl 04 `"April"', add
label define lastbmo_pop_lbl 05 `"May"', add
label define lastbmo_pop_lbl 06 `"June"', add
label define lastbmo_pop_lbl 07 `"July"', add
label define lastbmo_pop_lbl 08 `"August"', add
label define lastbmo_pop_lbl 09 `"September"', add
label define lastbmo_pop_lbl 10 `"October"', add
label define lastbmo_pop_lbl 11 `"November"', add
label define lastbmo_pop_lbl 12 `"December"', add
label define lastbmo_pop_lbl 98 `"Unknown"', add
label define lastbmo_pop_lbl 99 `"NIU (not in universe)"', add
label values lastbmo_pop lastbmo_pop_lbl

label define lastbmo_sp_lbl 01 `"January"'
label define lastbmo_sp_lbl 02 `"February"', add
label define lastbmo_sp_lbl 03 `"March"', add
label define lastbmo_sp_lbl 04 `"April"', add
label define lastbmo_sp_lbl 05 `"May"', add
label define lastbmo_sp_lbl 06 `"June"', add
label define lastbmo_sp_lbl 07 `"July"', add
label define lastbmo_sp_lbl 08 `"August"', add
label define lastbmo_sp_lbl 09 `"September"', add
label define lastbmo_sp_lbl 10 `"October"', add
label define lastbmo_sp_lbl 11 `"November"', add
label define lastbmo_sp_lbl 12 `"December"', add
label define lastbmo_sp_lbl 98 `"Unknown"', add
label define lastbmo_sp_lbl 99 `"NIU (not in universe)"', add
label values lastbmo_sp lastbmo_sp_lbl

label define lastbyr_head_lbl 1900 `"1900"'
label define lastbyr_head_lbl 1901 `"1901"', add
label define lastbyr_head_lbl 1902 `"1902"', add
label define lastbyr_head_lbl 1903 `"1903"', add
label define lastbyr_head_lbl 1904 `"1904"', add
label define lastbyr_head_lbl 1905 `"1905"', add
label define lastbyr_head_lbl 1906 `"1906"', add
label define lastbyr_head_lbl 1907 `"1907"', add
label define lastbyr_head_lbl 1908 `"1908"', add
label define lastbyr_head_lbl 1909 `"1909"', add
label define lastbyr_head_lbl 1910 `"1910"', add
label define lastbyr_head_lbl 1911 `"1911"', add
label define lastbyr_head_lbl 1912 `"1912"', add
label define lastbyr_head_lbl 1913 `"1913"', add
label define lastbyr_head_lbl 1914 `"1914"', add
label define lastbyr_head_lbl 1915 `"1915"', add
label define lastbyr_head_lbl 1916 `"1916"', add
label define lastbyr_head_lbl 1917 `"1917"', add
label define lastbyr_head_lbl 1918 `"1918"', add
label define lastbyr_head_lbl 1919 `"1919"', add
label define lastbyr_head_lbl 1920 `"1920"', add
label define lastbyr_head_lbl 1921 `"1921"', add
label define lastbyr_head_lbl 1922 `"1922"', add
label define lastbyr_head_lbl 1923 `"1923"', add
label define lastbyr_head_lbl 1924 `"1924"', add
label define lastbyr_head_lbl 1925 `"1925"', add
label define lastbyr_head_lbl 1926 `"1926"', add
label define lastbyr_head_lbl 1927 `"1927"', add
label define lastbyr_head_lbl 1928 `"1928"', add
label define lastbyr_head_lbl 1929 `"1929"', add
label define lastbyr_head_lbl 1930 `"1930"', add
label define lastbyr_head_lbl 1931 `"1931"', add
label define lastbyr_head_lbl 1932 `"1932"', add
label define lastbyr_head_lbl 1933 `"1933"', add
label define lastbyr_head_lbl 1934 `"1934"', add
label define lastbyr_head_lbl 1935 `"1935"', add
label define lastbyr_head_lbl 1936 `"1936"', add
label define lastbyr_head_lbl 1937 `"1937"', add
label define lastbyr_head_lbl 1938 `"1938"', add
label define lastbyr_head_lbl 1939 `"1939"', add
label define lastbyr_head_lbl 1940 `"1940"', add
label define lastbyr_head_lbl 1941 `"1941"', add
label define lastbyr_head_lbl 1942 `"1942"', add
label define lastbyr_head_lbl 1943 `"1943"', add
label define lastbyr_head_lbl 1944 `"1944"', add
label define lastbyr_head_lbl 1945 `"1945"', add
label define lastbyr_head_lbl 1946 `"1946"', add
label define lastbyr_head_lbl 1947 `"1947"', add
label define lastbyr_head_lbl 1948 `"1948"', add
label define lastbyr_head_lbl 1949 `"1949"', add
label define lastbyr_head_lbl 1950 `"1950"', add
label define lastbyr_head_lbl 1951 `"1951"', add
label define lastbyr_head_lbl 1952 `"1952"', add
label define lastbyr_head_lbl 1953 `"1953"', add
label define lastbyr_head_lbl 1954 `"1954"', add
label define lastbyr_head_lbl 1955 `"1955"', add
label define lastbyr_head_lbl 1956 `"1956"', add
label define lastbyr_head_lbl 1957 `"1957"', add
label define lastbyr_head_lbl 1958 `"1958"', add
label define lastbyr_head_lbl 1959 `"1959"', add
label define lastbyr_head_lbl 1960 `"1960"', add
label define lastbyr_head_lbl 1961 `"1961"', add
label define lastbyr_head_lbl 1962 `"1962"', add
label define lastbyr_head_lbl 1963 `"1963"', add
label define lastbyr_head_lbl 1964 `"1964"', add
label define lastbyr_head_lbl 1965 `"1965"', add
label define lastbyr_head_lbl 1966 `"1966"', add
label define lastbyr_head_lbl 1967 `"1967"', add
label define lastbyr_head_lbl 1968 `"1968"', add
label define lastbyr_head_lbl 1969 `"1969"', add
label define lastbyr_head_lbl 1970 `"1970"', add
label define lastbyr_head_lbl 1971 `"1971"', add
label define lastbyr_head_lbl 1972 `"1972"', add
label define lastbyr_head_lbl 1973 `"1973"', add
label define lastbyr_head_lbl 1974 `"1974"', add
label define lastbyr_head_lbl 1975 `"1975"', add
label define lastbyr_head_lbl 1976 `"1976"', add
label define lastbyr_head_lbl 1977 `"1977"', add
label define lastbyr_head_lbl 1978 `"1978"', add
label define lastbyr_head_lbl 1979 `"1979"', add
label define lastbyr_head_lbl 1980 `"1980"', add
label define lastbyr_head_lbl 1981 `"1981"', add
label define lastbyr_head_lbl 1982 `"1982"', add
label define lastbyr_head_lbl 1983 `"1983"', add
label define lastbyr_head_lbl 1984 `"1984"', add
label define lastbyr_head_lbl 1985 `"1985"', add
label define lastbyr_head_lbl 1986 `"1986"', add
label define lastbyr_head_lbl 1987 `"1987"', add
label define lastbyr_head_lbl 1988 `"1988"', add
label define lastbyr_head_lbl 1989 `"1989"', add
label define lastbyr_head_lbl 1990 `"1990"', add
label define lastbyr_head_lbl 1991 `"1991"', add
label define lastbyr_head_lbl 1992 `"1992"', add
label define lastbyr_head_lbl 1993 `"1993"', add
label define lastbyr_head_lbl 1994 `"1994"', add
label define lastbyr_head_lbl 1995 `"1995"', add
label define lastbyr_head_lbl 1996 `"1996"', add
label define lastbyr_head_lbl 1997 `"1997"', add
label define lastbyr_head_lbl 1998 `"1998"', add
label define lastbyr_head_lbl 1999 `"1999"', add
label define lastbyr_head_lbl 2000 `"2000"', add
label define lastbyr_head_lbl 2001 `"2001"', add
label define lastbyr_head_lbl 2002 `"2002"', add
label define lastbyr_head_lbl 2003 `"2003"', add
label define lastbyr_head_lbl 2004 `"2004"', add
label define lastbyr_head_lbl 2005 `"2005"', add
label define lastbyr_head_lbl 2006 `"2006"', add
label define lastbyr_head_lbl 2007 `"2007"', add
label define lastbyr_head_lbl 2008 `"2008"', add
label define lastbyr_head_lbl 2009 `"2009"', add
label define lastbyr_head_lbl 2010 `"2010"', add
label define lastbyr_head_lbl 2011 `"2011"', add
label define lastbyr_head_lbl 2012 `"2012"', add
label define lastbyr_head_lbl 2013 `"2013"', add
label define lastbyr_head_lbl 2014 `"2014"', add
label define lastbyr_head_lbl 2015 `"2015"', add
label define lastbyr_head_lbl 2016 `"2016"', add
label define lastbyr_head_lbl 2017 `"2017"', add
label define lastbyr_head_lbl 2018 `"2018"', add
label define lastbyr_head_lbl 2019 `"2019"', add
label define lastbyr_head_lbl 2020 `"2020"', add
label define lastbyr_head_lbl 9998 `"Unknown"', add
label define lastbyr_head_lbl 9999 `"NIU (not in universe)"', add
label values lastbyr_head lastbyr_head_lbl

label define lastbyr_mom_lbl 1900 `"1900"'
label define lastbyr_mom_lbl 1901 `"1901"', add
label define lastbyr_mom_lbl 1902 `"1902"', add
label define lastbyr_mom_lbl 1903 `"1903"', add
label define lastbyr_mom_lbl 1904 `"1904"', add
label define lastbyr_mom_lbl 1905 `"1905"', add
label define lastbyr_mom_lbl 1906 `"1906"', add
label define lastbyr_mom_lbl 1907 `"1907"', add
label define lastbyr_mom_lbl 1908 `"1908"', add
label define lastbyr_mom_lbl 1909 `"1909"', add
label define lastbyr_mom_lbl 1910 `"1910"', add
label define lastbyr_mom_lbl 1911 `"1911"', add
label define lastbyr_mom_lbl 1912 `"1912"', add
label define lastbyr_mom_lbl 1913 `"1913"', add
label define lastbyr_mom_lbl 1914 `"1914"', add
label define lastbyr_mom_lbl 1915 `"1915"', add
label define lastbyr_mom_lbl 1916 `"1916"', add
label define lastbyr_mom_lbl 1917 `"1917"', add
label define lastbyr_mom_lbl 1918 `"1918"', add
label define lastbyr_mom_lbl 1919 `"1919"', add
label define lastbyr_mom_lbl 1920 `"1920"', add
label define lastbyr_mom_lbl 1921 `"1921"', add
label define lastbyr_mom_lbl 1922 `"1922"', add
label define lastbyr_mom_lbl 1923 `"1923"', add
label define lastbyr_mom_lbl 1924 `"1924"', add
label define lastbyr_mom_lbl 1925 `"1925"', add
label define lastbyr_mom_lbl 1926 `"1926"', add
label define lastbyr_mom_lbl 1927 `"1927"', add
label define lastbyr_mom_lbl 1928 `"1928"', add
label define lastbyr_mom_lbl 1929 `"1929"', add
label define lastbyr_mom_lbl 1930 `"1930"', add
label define lastbyr_mom_lbl 1931 `"1931"', add
label define lastbyr_mom_lbl 1932 `"1932"', add
label define lastbyr_mom_lbl 1933 `"1933"', add
label define lastbyr_mom_lbl 1934 `"1934"', add
label define lastbyr_mom_lbl 1935 `"1935"', add
label define lastbyr_mom_lbl 1936 `"1936"', add
label define lastbyr_mom_lbl 1937 `"1937"', add
label define lastbyr_mom_lbl 1938 `"1938"', add
label define lastbyr_mom_lbl 1939 `"1939"', add
label define lastbyr_mom_lbl 1940 `"1940"', add
label define lastbyr_mom_lbl 1941 `"1941"', add
label define lastbyr_mom_lbl 1942 `"1942"', add
label define lastbyr_mom_lbl 1943 `"1943"', add
label define lastbyr_mom_lbl 1944 `"1944"', add
label define lastbyr_mom_lbl 1945 `"1945"', add
label define lastbyr_mom_lbl 1946 `"1946"', add
label define lastbyr_mom_lbl 1947 `"1947"', add
label define lastbyr_mom_lbl 1948 `"1948"', add
label define lastbyr_mom_lbl 1949 `"1949"', add
label define lastbyr_mom_lbl 1950 `"1950"', add
label define lastbyr_mom_lbl 1951 `"1951"', add
label define lastbyr_mom_lbl 1952 `"1952"', add
label define lastbyr_mom_lbl 1953 `"1953"', add
label define lastbyr_mom_lbl 1954 `"1954"', add
label define lastbyr_mom_lbl 1955 `"1955"', add
label define lastbyr_mom_lbl 1956 `"1956"', add
label define lastbyr_mom_lbl 1957 `"1957"', add
label define lastbyr_mom_lbl 1958 `"1958"', add
label define lastbyr_mom_lbl 1959 `"1959"', add
label define lastbyr_mom_lbl 1960 `"1960"', add
label define lastbyr_mom_lbl 1961 `"1961"', add
label define lastbyr_mom_lbl 1962 `"1962"', add
label define lastbyr_mom_lbl 1963 `"1963"', add
label define lastbyr_mom_lbl 1964 `"1964"', add
label define lastbyr_mom_lbl 1965 `"1965"', add
label define lastbyr_mom_lbl 1966 `"1966"', add
label define lastbyr_mom_lbl 1967 `"1967"', add
label define lastbyr_mom_lbl 1968 `"1968"', add
label define lastbyr_mom_lbl 1969 `"1969"', add
label define lastbyr_mom_lbl 1970 `"1970"', add
label define lastbyr_mom_lbl 1971 `"1971"', add
label define lastbyr_mom_lbl 1972 `"1972"', add
label define lastbyr_mom_lbl 1973 `"1973"', add
label define lastbyr_mom_lbl 1974 `"1974"', add
label define lastbyr_mom_lbl 1975 `"1975"', add
label define lastbyr_mom_lbl 1976 `"1976"', add
label define lastbyr_mom_lbl 1977 `"1977"', add
label define lastbyr_mom_lbl 1978 `"1978"', add
label define lastbyr_mom_lbl 1979 `"1979"', add
label define lastbyr_mom_lbl 1980 `"1980"', add
label define lastbyr_mom_lbl 1981 `"1981"', add
label define lastbyr_mom_lbl 1982 `"1982"', add
label define lastbyr_mom_lbl 1983 `"1983"', add
label define lastbyr_mom_lbl 1984 `"1984"', add
label define lastbyr_mom_lbl 1985 `"1985"', add
label define lastbyr_mom_lbl 1986 `"1986"', add
label define lastbyr_mom_lbl 1987 `"1987"', add
label define lastbyr_mom_lbl 1988 `"1988"', add
label define lastbyr_mom_lbl 1989 `"1989"', add
label define lastbyr_mom_lbl 1990 `"1990"', add
label define lastbyr_mom_lbl 1991 `"1991"', add
label define lastbyr_mom_lbl 1992 `"1992"', add
label define lastbyr_mom_lbl 1993 `"1993"', add
label define lastbyr_mom_lbl 1994 `"1994"', add
label define lastbyr_mom_lbl 1995 `"1995"', add
label define lastbyr_mom_lbl 1996 `"1996"', add
label define lastbyr_mom_lbl 1997 `"1997"', add
label define lastbyr_mom_lbl 1998 `"1998"', add
label define lastbyr_mom_lbl 1999 `"1999"', add
label define lastbyr_mom_lbl 2000 `"2000"', add
label define lastbyr_mom_lbl 2001 `"2001"', add
label define lastbyr_mom_lbl 2002 `"2002"', add
label define lastbyr_mom_lbl 2003 `"2003"', add
label define lastbyr_mom_lbl 2004 `"2004"', add
label define lastbyr_mom_lbl 2005 `"2005"', add
label define lastbyr_mom_lbl 2006 `"2006"', add
label define lastbyr_mom_lbl 2007 `"2007"', add
label define lastbyr_mom_lbl 2008 `"2008"', add
label define lastbyr_mom_lbl 2009 `"2009"', add
label define lastbyr_mom_lbl 2010 `"2010"', add
label define lastbyr_mom_lbl 2011 `"2011"', add
label define lastbyr_mom_lbl 2012 `"2012"', add
label define lastbyr_mom_lbl 2013 `"2013"', add
label define lastbyr_mom_lbl 2014 `"2014"', add
label define lastbyr_mom_lbl 2015 `"2015"', add
label define lastbyr_mom_lbl 2016 `"2016"', add
label define lastbyr_mom_lbl 2017 `"2017"', add
label define lastbyr_mom_lbl 2018 `"2018"', add
label define lastbyr_mom_lbl 2019 `"2019"', add
label define lastbyr_mom_lbl 2020 `"2020"', add
label define lastbyr_mom_lbl 9998 `"Unknown"', add
label define lastbyr_mom_lbl 9999 `"NIU (not in universe)"', add
label values lastbyr_mom lastbyr_mom_lbl

label define lastbyr_pop_lbl 1900 `"1900"'
label define lastbyr_pop_lbl 1901 `"1901"', add
label define lastbyr_pop_lbl 1902 `"1902"', add
label define lastbyr_pop_lbl 1903 `"1903"', add
label define lastbyr_pop_lbl 1904 `"1904"', add
label define lastbyr_pop_lbl 1905 `"1905"', add
label define lastbyr_pop_lbl 1906 `"1906"', add
label define lastbyr_pop_lbl 1907 `"1907"', add
label define lastbyr_pop_lbl 1908 `"1908"', add
label define lastbyr_pop_lbl 1909 `"1909"', add
label define lastbyr_pop_lbl 1910 `"1910"', add
label define lastbyr_pop_lbl 1911 `"1911"', add
label define lastbyr_pop_lbl 1912 `"1912"', add
label define lastbyr_pop_lbl 1913 `"1913"', add
label define lastbyr_pop_lbl 1914 `"1914"', add
label define lastbyr_pop_lbl 1915 `"1915"', add
label define lastbyr_pop_lbl 1916 `"1916"', add
label define lastbyr_pop_lbl 1917 `"1917"', add
label define lastbyr_pop_lbl 1918 `"1918"', add
label define lastbyr_pop_lbl 1919 `"1919"', add
label define lastbyr_pop_lbl 1920 `"1920"', add
label define lastbyr_pop_lbl 1921 `"1921"', add
label define lastbyr_pop_lbl 1922 `"1922"', add
label define lastbyr_pop_lbl 1923 `"1923"', add
label define lastbyr_pop_lbl 1924 `"1924"', add
label define lastbyr_pop_lbl 1925 `"1925"', add
label define lastbyr_pop_lbl 1926 `"1926"', add
label define lastbyr_pop_lbl 1927 `"1927"', add
label define lastbyr_pop_lbl 1928 `"1928"', add
label define lastbyr_pop_lbl 1929 `"1929"', add
label define lastbyr_pop_lbl 1930 `"1930"', add
label define lastbyr_pop_lbl 1931 `"1931"', add
label define lastbyr_pop_lbl 1932 `"1932"', add
label define lastbyr_pop_lbl 1933 `"1933"', add
label define lastbyr_pop_lbl 1934 `"1934"', add
label define lastbyr_pop_lbl 1935 `"1935"', add
label define lastbyr_pop_lbl 1936 `"1936"', add
label define lastbyr_pop_lbl 1937 `"1937"', add
label define lastbyr_pop_lbl 1938 `"1938"', add
label define lastbyr_pop_lbl 1939 `"1939"', add
label define lastbyr_pop_lbl 1940 `"1940"', add
label define lastbyr_pop_lbl 1941 `"1941"', add
label define lastbyr_pop_lbl 1942 `"1942"', add
label define lastbyr_pop_lbl 1943 `"1943"', add
label define lastbyr_pop_lbl 1944 `"1944"', add
label define lastbyr_pop_lbl 1945 `"1945"', add
label define lastbyr_pop_lbl 1946 `"1946"', add
label define lastbyr_pop_lbl 1947 `"1947"', add
label define lastbyr_pop_lbl 1948 `"1948"', add
label define lastbyr_pop_lbl 1949 `"1949"', add
label define lastbyr_pop_lbl 1950 `"1950"', add
label define lastbyr_pop_lbl 1951 `"1951"', add
label define lastbyr_pop_lbl 1952 `"1952"', add
label define lastbyr_pop_lbl 1953 `"1953"', add
label define lastbyr_pop_lbl 1954 `"1954"', add
label define lastbyr_pop_lbl 1955 `"1955"', add
label define lastbyr_pop_lbl 1956 `"1956"', add
label define lastbyr_pop_lbl 1957 `"1957"', add
label define lastbyr_pop_lbl 1958 `"1958"', add
label define lastbyr_pop_lbl 1959 `"1959"', add
label define lastbyr_pop_lbl 1960 `"1960"', add
label define lastbyr_pop_lbl 1961 `"1961"', add
label define lastbyr_pop_lbl 1962 `"1962"', add
label define lastbyr_pop_lbl 1963 `"1963"', add
label define lastbyr_pop_lbl 1964 `"1964"', add
label define lastbyr_pop_lbl 1965 `"1965"', add
label define lastbyr_pop_lbl 1966 `"1966"', add
label define lastbyr_pop_lbl 1967 `"1967"', add
label define lastbyr_pop_lbl 1968 `"1968"', add
label define lastbyr_pop_lbl 1969 `"1969"', add
label define lastbyr_pop_lbl 1970 `"1970"', add
label define lastbyr_pop_lbl 1971 `"1971"', add
label define lastbyr_pop_lbl 1972 `"1972"', add
label define lastbyr_pop_lbl 1973 `"1973"', add
label define lastbyr_pop_lbl 1974 `"1974"', add
label define lastbyr_pop_lbl 1975 `"1975"', add
label define lastbyr_pop_lbl 1976 `"1976"', add
label define lastbyr_pop_lbl 1977 `"1977"', add
label define lastbyr_pop_lbl 1978 `"1978"', add
label define lastbyr_pop_lbl 1979 `"1979"', add
label define lastbyr_pop_lbl 1980 `"1980"', add
label define lastbyr_pop_lbl 1981 `"1981"', add
label define lastbyr_pop_lbl 1982 `"1982"', add
label define lastbyr_pop_lbl 1983 `"1983"', add
label define lastbyr_pop_lbl 1984 `"1984"', add
label define lastbyr_pop_lbl 1985 `"1985"', add
label define lastbyr_pop_lbl 1986 `"1986"', add
label define lastbyr_pop_lbl 1987 `"1987"', add
label define lastbyr_pop_lbl 1988 `"1988"', add
label define lastbyr_pop_lbl 1989 `"1989"', add
label define lastbyr_pop_lbl 1990 `"1990"', add
label define lastbyr_pop_lbl 1991 `"1991"', add
label define lastbyr_pop_lbl 1992 `"1992"', add
label define lastbyr_pop_lbl 1993 `"1993"', add
label define lastbyr_pop_lbl 1994 `"1994"', add
label define lastbyr_pop_lbl 1995 `"1995"', add
label define lastbyr_pop_lbl 1996 `"1996"', add
label define lastbyr_pop_lbl 1997 `"1997"', add
label define lastbyr_pop_lbl 1998 `"1998"', add
label define lastbyr_pop_lbl 1999 `"1999"', add
label define lastbyr_pop_lbl 2000 `"2000"', add
label define lastbyr_pop_lbl 2001 `"2001"', add
label define lastbyr_pop_lbl 2002 `"2002"', add
label define lastbyr_pop_lbl 2003 `"2003"', add
label define lastbyr_pop_lbl 2004 `"2004"', add
label define lastbyr_pop_lbl 2005 `"2005"', add
label define lastbyr_pop_lbl 2006 `"2006"', add
label define lastbyr_pop_lbl 2007 `"2007"', add
label define lastbyr_pop_lbl 2008 `"2008"', add
label define lastbyr_pop_lbl 2009 `"2009"', add
label define lastbyr_pop_lbl 2010 `"2010"', add
label define lastbyr_pop_lbl 2011 `"2011"', add
label define lastbyr_pop_lbl 2012 `"2012"', add
label define lastbyr_pop_lbl 2013 `"2013"', add
label define lastbyr_pop_lbl 2014 `"2014"', add
label define lastbyr_pop_lbl 2015 `"2015"', add
label define lastbyr_pop_lbl 2016 `"2016"', add
label define lastbyr_pop_lbl 2017 `"2017"', add
label define lastbyr_pop_lbl 2018 `"2018"', add
label define lastbyr_pop_lbl 2019 `"2019"', add
label define lastbyr_pop_lbl 2020 `"2020"', add
label define lastbyr_pop_lbl 9998 `"Unknown"', add
label define lastbyr_pop_lbl 9999 `"NIU (not in universe)"', add
label values lastbyr_pop lastbyr_pop_lbl

label define lastbyr_sp_lbl 1900 `"1900"'
label define lastbyr_sp_lbl 1901 `"1901"', add
label define lastbyr_sp_lbl 1902 `"1902"', add
label define lastbyr_sp_lbl 1903 `"1903"', add
label define lastbyr_sp_lbl 1904 `"1904"', add
label define lastbyr_sp_lbl 1905 `"1905"', add
label define lastbyr_sp_lbl 1906 `"1906"', add
label define lastbyr_sp_lbl 1907 `"1907"', add
label define lastbyr_sp_lbl 1908 `"1908"', add
label define lastbyr_sp_lbl 1909 `"1909"', add
label define lastbyr_sp_lbl 1910 `"1910"', add
label define lastbyr_sp_lbl 1911 `"1911"', add
label define lastbyr_sp_lbl 1912 `"1912"', add
label define lastbyr_sp_lbl 1913 `"1913"', add
label define lastbyr_sp_lbl 1914 `"1914"', add
label define lastbyr_sp_lbl 1915 `"1915"', add
label define lastbyr_sp_lbl 1916 `"1916"', add
label define lastbyr_sp_lbl 1917 `"1917"', add
label define lastbyr_sp_lbl 1918 `"1918"', add
label define lastbyr_sp_lbl 1919 `"1919"', add
label define lastbyr_sp_lbl 1920 `"1920"', add
label define lastbyr_sp_lbl 1921 `"1921"', add
label define lastbyr_sp_lbl 1922 `"1922"', add
label define lastbyr_sp_lbl 1923 `"1923"', add
label define lastbyr_sp_lbl 1924 `"1924"', add
label define lastbyr_sp_lbl 1925 `"1925"', add
label define lastbyr_sp_lbl 1926 `"1926"', add
label define lastbyr_sp_lbl 1927 `"1927"', add
label define lastbyr_sp_lbl 1928 `"1928"', add
label define lastbyr_sp_lbl 1929 `"1929"', add
label define lastbyr_sp_lbl 1930 `"1930"', add
label define lastbyr_sp_lbl 1931 `"1931"', add
label define lastbyr_sp_lbl 1932 `"1932"', add
label define lastbyr_sp_lbl 1933 `"1933"', add
label define lastbyr_sp_lbl 1934 `"1934"', add
label define lastbyr_sp_lbl 1935 `"1935"', add
label define lastbyr_sp_lbl 1936 `"1936"', add
label define lastbyr_sp_lbl 1937 `"1937"', add
label define lastbyr_sp_lbl 1938 `"1938"', add
label define lastbyr_sp_lbl 1939 `"1939"', add
label define lastbyr_sp_lbl 1940 `"1940"', add
label define lastbyr_sp_lbl 1941 `"1941"', add
label define lastbyr_sp_lbl 1942 `"1942"', add
label define lastbyr_sp_lbl 1943 `"1943"', add
label define lastbyr_sp_lbl 1944 `"1944"', add
label define lastbyr_sp_lbl 1945 `"1945"', add
label define lastbyr_sp_lbl 1946 `"1946"', add
label define lastbyr_sp_lbl 1947 `"1947"', add
label define lastbyr_sp_lbl 1948 `"1948"', add
label define lastbyr_sp_lbl 1949 `"1949"', add
label define lastbyr_sp_lbl 1950 `"1950"', add
label define lastbyr_sp_lbl 1951 `"1951"', add
label define lastbyr_sp_lbl 1952 `"1952"', add
label define lastbyr_sp_lbl 1953 `"1953"', add
label define lastbyr_sp_lbl 1954 `"1954"', add
label define lastbyr_sp_lbl 1955 `"1955"', add
label define lastbyr_sp_lbl 1956 `"1956"', add
label define lastbyr_sp_lbl 1957 `"1957"', add
label define lastbyr_sp_lbl 1958 `"1958"', add
label define lastbyr_sp_lbl 1959 `"1959"', add
label define lastbyr_sp_lbl 1960 `"1960"', add
label define lastbyr_sp_lbl 1961 `"1961"', add
label define lastbyr_sp_lbl 1962 `"1962"', add
label define lastbyr_sp_lbl 1963 `"1963"', add
label define lastbyr_sp_lbl 1964 `"1964"', add
label define lastbyr_sp_lbl 1965 `"1965"', add
label define lastbyr_sp_lbl 1966 `"1966"', add
label define lastbyr_sp_lbl 1967 `"1967"', add
label define lastbyr_sp_lbl 1968 `"1968"', add
label define lastbyr_sp_lbl 1969 `"1969"', add
label define lastbyr_sp_lbl 1970 `"1970"', add
label define lastbyr_sp_lbl 1971 `"1971"', add
label define lastbyr_sp_lbl 1972 `"1972"', add
label define lastbyr_sp_lbl 1973 `"1973"', add
label define lastbyr_sp_lbl 1974 `"1974"', add
label define lastbyr_sp_lbl 1975 `"1975"', add
label define lastbyr_sp_lbl 1976 `"1976"', add
label define lastbyr_sp_lbl 1977 `"1977"', add
label define lastbyr_sp_lbl 1978 `"1978"', add
label define lastbyr_sp_lbl 1979 `"1979"', add
label define lastbyr_sp_lbl 1980 `"1980"', add
label define lastbyr_sp_lbl 1981 `"1981"', add
label define lastbyr_sp_lbl 1982 `"1982"', add
label define lastbyr_sp_lbl 1983 `"1983"', add
label define lastbyr_sp_lbl 1984 `"1984"', add
label define lastbyr_sp_lbl 1985 `"1985"', add
label define lastbyr_sp_lbl 1986 `"1986"', add
label define lastbyr_sp_lbl 1987 `"1987"', add
label define lastbyr_sp_lbl 1988 `"1988"', add
label define lastbyr_sp_lbl 1989 `"1989"', add
label define lastbyr_sp_lbl 1990 `"1990"', add
label define lastbyr_sp_lbl 1991 `"1991"', add
label define lastbyr_sp_lbl 1992 `"1992"', add
label define lastbyr_sp_lbl 1993 `"1993"', add
label define lastbyr_sp_lbl 1994 `"1994"', add
label define lastbyr_sp_lbl 1995 `"1995"', add
label define lastbyr_sp_lbl 1996 `"1996"', add
label define lastbyr_sp_lbl 1997 `"1997"', add
label define lastbyr_sp_lbl 1998 `"1998"', add
label define lastbyr_sp_lbl 1999 `"1999"', add
label define lastbyr_sp_lbl 2000 `"2000"', add
label define lastbyr_sp_lbl 2001 `"2001"', add
label define lastbyr_sp_lbl 2002 `"2002"', add
label define lastbyr_sp_lbl 2003 `"2003"', add
label define lastbyr_sp_lbl 2004 `"2004"', add
label define lastbyr_sp_lbl 2005 `"2005"', add
label define lastbyr_sp_lbl 2006 `"2006"', add
label define lastbyr_sp_lbl 2007 `"2007"', add
label define lastbyr_sp_lbl 2008 `"2008"', add
label define lastbyr_sp_lbl 2009 `"2009"', add
label define lastbyr_sp_lbl 2010 `"2010"', add
label define lastbyr_sp_lbl 2011 `"2011"', add
label define lastbyr_sp_lbl 2012 `"2012"', add
label define lastbyr_sp_lbl 2013 `"2013"', add
label define lastbyr_sp_lbl 2014 `"2014"', add
label define lastbyr_sp_lbl 2015 `"2015"', add
label define lastbyr_sp_lbl 2016 `"2016"', add
label define lastbyr_sp_lbl 2017 `"2017"', add
label define lastbyr_sp_lbl 2018 `"2018"', add
label define lastbyr_sp_lbl 2019 `"2019"', add
label define lastbyr_sp_lbl 2020 `"2020"', add
label define lastbyr_sp_lbl 9998 `"Unknown"', add
label define lastbyr_sp_lbl 9999 `"NIU (not in universe)"', add
label values lastbyr_sp lastbyr_sp_lbl

label define lastbsex_head_lbl 0 `"NIU (not in universe)"'
label define lastbsex_head_lbl 1 `"Male"', add
label define lastbsex_head_lbl 2 `"Female"', add
label define lastbsex_head_lbl 3 `"Both sexes (multiple births)"', add
label define lastbsex_head_lbl 9 `"Unknown"', add
label values lastbsex_head lastbsex_head_lbl

label define lastbsex_mom_lbl 0 `"NIU (not in universe)"'
label define lastbsex_mom_lbl 1 `"Male"', add
label define lastbsex_mom_lbl 2 `"Female"', add
label define lastbsex_mom_lbl 3 `"Both sexes (multiple births)"', add
label define lastbsex_mom_lbl 9 `"Unknown"', add
label values lastbsex_mom lastbsex_mom_lbl

label define lastbsex_pop_lbl 0 `"NIU (not in universe)"'
label define lastbsex_pop_lbl 1 `"Male"', add
label define lastbsex_pop_lbl 2 `"Female"', add
label define lastbsex_pop_lbl 3 `"Both sexes (multiple births)"', add
label define lastbsex_pop_lbl 9 `"Unknown"', add
label values lastbsex_pop lastbsex_pop_lbl

label define lastbsex_sp_lbl 0 `"NIU (not in universe)"'
label define lastbsex_sp_lbl 1 `"Male"', add
label define lastbsex_sp_lbl 2 `"Female"', add
label define lastbsex_sp_lbl 3 `"Both sexes (multiple births)"', add
label define lastbsex_sp_lbl 9 `"Unknown"', add
label values lastbsex_sp lastbsex_sp_lbl

label define chdead_head_lbl 00 `"None"'
label define chdead_head_lbl 01 `"1"', add
label define chdead_head_lbl 02 `"2"', add
label define chdead_head_lbl 03 `"3"', add
label define chdead_head_lbl 04 `"4"', add
label define chdead_head_lbl 05 `"5"', add
label define chdead_head_lbl 06 `"6"', add
label define chdead_head_lbl 07 `"7"', add
label define chdead_head_lbl 08 `"8"', add
label define chdead_head_lbl 09 `"9"', add
label define chdead_head_lbl 10 `"10"', add
label define chdead_head_lbl 11 `"11"', add
label define chdead_head_lbl 12 `"12"', add
label define chdead_head_lbl 13 `"13"', add
label define chdead_head_lbl 14 `"14"', add
label define chdead_head_lbl 15 `"15"', add
label define chdead_head_lbl 16 `"16"', add
label define chdead_head_lbl 17 `"17"', add
label define chdead_head_lbl 18 `"18"', add
label define chdead_head_lbl 19 `"19"', add
label define chdead_head_lbl 20 `"20+"', add
label define chdead_head_lbl 98 `"Unknown/missing"', add
label define chdead_head_lbl 99 `"NIU (not in universe)"', add
label values chdead_head chdead_head_lbl

label define chdead_mom_lbl 00 `"None"'
label define chdead_mom_lbl 01 `"1"', add
label define chdead_mom_lbl 02 `"2"', add
label define chdead_mom_lbl 03 `"3"', add
label define chdead_mom_lbl 04 `"4"', add
label define chdead_mom_lbl 05 `"5"', add
label define chdead_mom_lbl 06 `"6"', add
label define chdead_mom_lbl 07 `"7"', add
label define chdead_mom_lbl 08 `"8"', add
label define chdead_mom_lbl 09 `"9"', add
label define chdead_mom_lbl 10 `"10"', add
label define chdead_mom_lbl 11 `"11"', add
label define chdead_mom_lbl 12 `"12"', add
label define chdead_mom_lbl 13 `"13"', add
label define chdead_mom_lbl 14 `"14"', add
label define chdead_mom_lbl 15 `"15"', add
label define chdead_mom_lbl 16 `"16"', add
label define chdead_mom_lbl 17 `"17"', add
label define chdead_mom_lbl 18 `"18"', add
label define chdead_mom_lbl 19 `"19"', add
label define chdead_mom_lbl 20 `"20+"', add
label define chdead_mom_lbl 98 `"Unknown/missing"', add
label define chdead_mom_lbl 99 `"NIU (not in universe)"', add
label values chdead_mom chdead_mom_lbl

label define chdead_pop_lbl 00 `"None"'
label define chdead_pop_lbl 01 `"1"', add
label define chdead_pop_lbl 02 `"2"', add
label define chdead_pop_lbl 03 `"3"', add
label define chdead_pop_lbl 04 `"4"', add
label define chdead_pop_lbl 05 `"5"', add
label define chdead_pop_lbl 06 `"6"', add
label define chdead_pop_lbl 07 `"7"', add
label define chdead_pop_lbl 08 `"8"', add
label define chdead_pop_lbl 09 `"9"', add
label define chdead_pop_lbl 10 `"10"', add
label define chdead_pop_lbl 11 `"11"', add
label define chdead_pop_lbl 12 `"12"', add
label define chdead_pop_lbl 13 `"13"', add
label define chdead_pop_lbl 14 `"14"', add
label define chdead_pop_lbl 15 `"15"', add
label define chdead_pop_lbl 16 `"16"', add
label define chdead_pop_lbl 17 `"17"', add
label define chdead_pop_lbl 18 `"18"', add
label define chdead_pop_lbl 19 `"19"', add
label define chdead_pop_lbl 20 `"20+"', add
label define chdead_pop_lbl 98 `"Unknown/missing"', add
label define chdead_pop_lbl 99 `"NIU (not in universe)"', add
label values chdead_pop chdead_pop_lbl

label define chdead_sp_lbl 00 `"None"'
label define chdead_sp_lbl 01 `"1"', add
label define chdead_sp_lbl 02 `"2"', add
label define chdead_sp_lbl 03 `"3"', add
label define chdead_sp_lbl 04 `"4"', add
label define chdead_sp_lbl 05 `"5"', add
label define chdead_sp_lbl 06 `"6"', add
label define chdead_sp_lbl 07 `"7"', add
label define chdead_sp_lbl 08 `"8"', add
label define chdead_sp_lbl 09 `"9"', add
label define chdead_sp_lbl 10 `"10"', add
label define chdead_sp_lbl 11 `"11"', add
label define chdead_sp_lbl 12 `"12"', add
label define chdead_sp_lbl 13 `"13"', add
label define chdead_sp_lbl 14 `"14"', add
label define chdead_sp_lbl 15 `"15"', add
label define chdead_sp_lbl 16 `"16"', add
label define chdead_sp_lbl 17 `"17"', add
label define chdead_sp_lbl 18 `"18"', add
label define chdead_sp_lbl 19 `"19"', add
label define chdead_sp_lbl 20 `"20+"', add
label define chdead_sp_lbl 98 `"Unknown/missing"', add
label define chdead_sp_lbl 99 `"NIU (not in universe)"', add
label values chdead_sp chdead_sp_lbl

label define chdeadfem_head_lbl 00 `"None"'
label define chdeadfem_head_lbl 01 `"1"', add
label define chdeadfem_head_lbl 02 `"2"', add
label define chdeadfem_head_lbl 03 `"3"', add
label define chdeadfem_head_lbl 04 `"4"', add
label define chdeadfem_head_lbl 05 `"5"', add
label define chdeadfem_head_lbl 06 `"6"', add
label define chdeadfem_head_lbl 07 `"7"', add
label define chdeadfem_head_lbl 08 `"8"', add
label define chdeadfem_head_lbl 09 `"9"', add
label define chdeadfem_head_lbl 10 `"10"', add
label define chdeadfem_head_lbl 11 `"11"', add
label define chdeadfem_head_lbl 12 `"12"', add
label define chdeadfem_head_lbl 13 `"13"', add
label define chdeadfem_head_lbl 14 `"14"', add
label define chdeadfem_head_lbl 15 `"15"', add
label define chdeadfem_head_lbl 16 `"16"', add
label define chdeadfem_head_lbl 17 `"17"', add
label define chdeadfem_head_lbl 18 `"18"', add
label define chdeadfem_head_lbl 19 `"19"', add
label define chdeadfem_head_lbl 20 `"20+"', add
label define chdeadfem_head_lbl 98 `"Unknown"', add
label define chdeadfem_head_lbl 99 `"NIU (not in universe)"', add
label values chdeadfem_head chdeadfem_head_lbl

label define chdeadfem_mom_lbl 00 `"None"'
label define chdeadfem_mom_lbl 01 `"1"', add
label define chdeadfem_mom_lbl 02 `"2"', add
label define chdeadfem_mom_lbl 03 `"3"', add
label define chdeadfem_mom_lbl 04 `"4"', add
label define chdeadfem_mom_lbl 05 `"5"', add
label define chdeadfem_mom_lbl 06 `"6"', add
label define chdeadfem_mom_lbl 07 `"7"', add
label define chdeadfem_mom_lbl 08 `"8"', add
label define chdeadfem_mom_lbl 09 `"9"', add
label define chdeadfem_mom_lbl 10 `"10"', add
label define chdeadfem_mom_lbl 11 `"11"', add
label define chdeadfem_mom_lbl 12 `"12"', add
label define chdeadfem_mom_lbl 13 `"13"', add
label define chdeadfem_mom_lbl 14 `"14"', add
label define chdeadfem_mom_lbl 15 `"15"', add
label define chdeadfem_mom_lbl 16 `"16"', add
label define chdeadfem_mom_lbl 17 `"17"', add
label define chdeadfem_mom_lbl 18 `"18"', add
label define chdeadfem_mom_lbl 19 `"19"', add
label define chdeadfem_mom_lbl 20 `"20+"', add
label define chdeadfem_mom_lbl 98 `"Unknown"', add
label define chdeadfem_mom_lbl 99 `"NIU (not in universe)"', add
label values chdeadfem_mom chdeadfem_mom_lbl

label define chdeadfem_pop_lbl 00 `"None"'
label define chdeadfem_pop_lbl 01 `"1"', add
label define chdeadfem_pop_lbl 02 `"2"', add
label define chdeadfem_pop_lbl 03 `"3"', add
label define chdeadfem_pop_lbl 04 `"4"', add
label define chdeadfem_pop_lbl 05 `"5"', add
label define chdeadfem_pop_lbl 06 `"6"', add
label define chdeadfem_pop_lbl 07 `"7"', add
label define chdeadfem_pop_lbl 08 `"8"', add
label define chdeadfem_pop_lbl 09 `"9"', add
label define chdeadfem_pop_lbl 10 `"10"', add
label define chdeadfem_pop_lbl 11 `"11"', add
label define chdeadfem_pop_lbl 12 `"12"', add
label define chdeadfem_pop_lbl 13 `"13"', add
label define chdeadfem_pop_lbl 14 `"14"', add
label define chdeadfem_pop_lbl 15 `"15"', add
label define chdeadfem_pop_lbl 16 `"16"', add
label define chdeadfem_pop_lbl 17 `"17"', add
label define chdeadfem_pop_lbl 18 `"18"', add
label define chdeadfem_pop_lbl 19 `"19"', add
label define chdeadfem_pop_lbl 20 `"20+"', add
label define chdeadfem_pop_lbl 98 `"Unknown"', add
label define chdeadfem_pop_lbl 99 `"NIU (not in universe)"', add
label values chdeadfem_pop chdeadfem_pop_lbl

label define chdeadfem_sp_lbl 00 `"None"'
label define chdeadfem_sp_lbl 01 `"1"', add
label define chdeadfem_sp_lbl 02 `"2"', add
label define chdeadfem_sp_lbl 03 `"3"', add
label define chdeadfem_sp_lbl 04 `"4"', add
label define chdeadfem_sp_lbl 05 `"5"', add
label define chdeadfem_sp_lbl 06 `"6"', add
label define chdeadfem_sp_lbl 07 `"7"', add
label define chdeadfem_sp_lbl 08 `"8"', add
label define chdeadfem_sp_lbl 09 `"9"', add
label define chdeadfem_sp_lbl 10 `"10"', add
label define chdeadfem_sp_lbl 11 `"11"', add
label define chdeadfem_sp_lbl 12 `"12"', add
label define chdeadfem_sp_lbl 13 `"13"', add
label define chdeadfem_sp_lbl 14 `"14"', add
label define chdeadfem_sp_lbl 15 `"15"', add
label define chdeadfem_sp_lbl 16 `"16"', add
label define chdeadfem_sp_lbl 17 `"17"', add
label define chdeadfem_sp_lbl 18 `"18"', add
label define chdeadfem_sp_lbl 19 `"19"', add
label define chdeadfem_sp_lbl 20 `"20+"', add
label define chdeadfem_sp_lbl 98 `"Unknown"', add
label define chdeadfem_sp_lbl 99 `"NIU (not in universe)"', add
label values chdeadfem_sp chdeadfem_sp_lbl

label define chdeadmale_head_lbl 00 `"None"'
label define chdeadmale_head_lbl 01 `"1"', add
label define chdeadmale_head_lbl 02 `"2"', add
label define chdeadmale_head_lbl 03 `"3"', add
label define chdeadmale_head_lbl 04 `"4"', add
label define chdeadmale_head_lbl 05 `"5"', add
label define chdeadmale_head_lbl 06 `"6"', add
label define chdeadmale_head_lbl 07 `"7"', add
label define chdeadmale_head_lbl 08 `"8"', add
label define chdeadmale_head_lbl 09 `"9"', add
label define chdeadmale_head_lbl 10 `"10"', add
label define chdeadmale_head_lbl 11 `"11"', add
label define chdeadmale_head_lbl 12 `"12"', add
label define chdeadmale_head_lbl 13 `"13"', add
label define chdeadmale_head_lbl 14 `"14"', add
label define chdeadmale_head_lbl 15 `"15"', add
label define chdeadmale_head_lbl 16 `"16"', add
label define chdeadmale_head_lbl 17 `"17"', add
label define chdeadmale_head_lbl 18 `"18"', add
label define chdeadmale_head_lbl 19 `"19"', add
label define chdeadmale_head_lbl 20 `"20+"', add
label define chdeadmale_head_lbl 98 `"Unknown"', add
label define chdeadmale_head_lbl 99 `"NIU (not in universe)"', add
label values chdeadmale_head chdeadmale_head_lbl

label define chdeadmale_mom_lbl 00 `"None"'
label define chdeadmale_mom_lbl 01 `"1"', add
label define chdeadmale_mom_lbl 02 `"2"', add
label define chdeadmale_mom_lbl 03 `"3"', add
label define chdeadmale_mom_lbl 04 `"4"', add
label define chdeadmale_mom_lbl 05 `"5"', add
label define chdeadmale_mom_lbl 06 `"6"', add
label define chdeadmale_mom_lbl 07 `"7"', add
label define chdeadmale_mom_lbl 08 `"8"', add
label define chdeadmale_mom_lbl 09 `"9"', add
label define chdeadmale_mom_lbl 10 `"10"', add
label define chdeadmale_mom_lbl 11 `"11"', add
label define chdeadmale_mom_lbl 12 `"12"', add
label define chdeadmale_mom_lbl 13 `"13"', add
label define chdeadmale_mom_lbl 14 `"14"', add
label define chdeadmale_mom_lbl 15 `"15"', add
label define chdeadmale_mom_lbl 16 `"16"', add
label define chdeadmale_mom_lbl 17 `"17"', add
label define chdeadmale_mom_lbl 18 `"18"', add
label define chdeadmale_mom_lbl 19 `"19"', add
label define chdeadmale_mom_lbl 20 `"20+"', add
label define chdeadmale_mom_lbl 98 `"Unknown"', add
label define chdeadmale_mom_lbl 99 `"NIU (not in universe)"', add
label values chdeadmale_mom chdeadmale_mom_lbl

label define chdeadmale_pop_lbl 00 `"None"'
label define chdeadmale_pop_lbl 01 `"1"', add
label define chdeadmale_pop_lbl 02 `"2"', add
label define chdeadmale_pop_lbl 03 `"3"', add
label define chdeadmale_pop_lbl 04 `"4"', add
label define chdeadmale_pop_lbl 05 `"5"', add
label define chdeadmale_pop_lbl 06 `"6"', add
label define chdeadmale_pop_lbl 07 `"7"', add
label define chdeadmale_pop_lbl 08 `"8"', add
label define chdeadmale_pop_lbl 09 `"9"', add
label define chdeadmale_pop_lbl 10 `"10"', add
label define chdeadmale_pop_lbl 11 `"11"', add
label define chdeadmale_pop_lbl 12 `"12"', add
label define chdeadmale_pop_lbl 13 `"13"', add
label define chdeadmale_pop_lbl 14 `"14"', add
label define chdeadmale_pop_lbl 15 `"15"', add
label define chdeadmale_pop_lbl 16 `"16"', add
label define chdeadmale_pop_lbl 17 `"17"', add
label define chdeadmale_pop_lbl 18 `"18"', add
label define chdeadmale_pop_lbl 19 `"19"', add
label define chdeadmale_pop_lbl 20 `"20+"', add
label define chdeadmale_pop_lbl 98 `"Unknown"', add
label define chdeadmale_pop_lbl 99 `"NIU (not in universe)"', add
label values chdeadmale_pop chdeadmale_pop_lbl

label define chdeadmale_sp_lbl 00 `"None"'
label define chdeadmale_sp_lbl 01 `"1"', add
label define chdeadmale_sp_lbl 02 `"2"', add
label define chdeadmale_sp_lbl 03 `"3"', add
label define chdeadmale_sp_lbl 04 `"4"', add
label define chdeadmale_sp_lbl 05 `"5"', add
label define chdeadmale_sp_lbl 06 `"6"', add
label define chdeadmale_sp_lbl 07 `"7"', add
label define chdeadmale_sp_lbl 08 `"8"', add
label define chdeadmale_sp_lbl 09 `"9"', add
label define chdeadmale_sp_lbl 10 `"10"', add
label define chdeadmale_sp_lbl 11 `"11"', add
label define chdeadmale_sp_lbl 12 `"12"', add
label define chdeadmale_sp_lbl 13 `"13"', add
label define chdeadmale_sp_lbl 14 `"14"', add
label define chdeadmale_sp_lbl 15 `"15"', add
label define chdeadmale_sp_lbl 16 `"16"', add
label define chdeadmale_sp_lbl 17 `"17"', add
label define chdeadmale_sp_lbl 18 `"18"', add
label define chdeadmale_sp_lbl 19 `"19"', add
label define chdeadmale_sp_lbl 20 `"20+"', add
label define chdeadmale_sp_lbl 98 `"Unknown"', add
label define chdeadmale_sp_lbl 99 `"NIU (not in universe)"', add
label values chdeadmale_sp chdeadmale_sp_lbl

label define lastbmort_head_lbl 0 `"NIU (not in universe)"'
label define lastbmort_head_lbl 1 `"Alive"', add
label define lastbmort_head_lbl 2 `"Dead"', add
label define lastbmort_head_lbl 9 `"Unknown"', add
label values lastbmort_head lastbmort_head_lbl

label define lastbmort_mom_lbl 0 `"NIU (not in universe)"'
label define lastbmort_mom_lbl 1 `"Alive"', add
label define lastbmort_mom_lbl 2 `"Dead"', add
label define lastbmort_mom_lbl 9 `"Unknown"', add
label values lastbmort_mom lastbmort_mom_lbl

label define lastbmort_pop_lbl 0 `"NIU (not in universe)"'
label define lastbmort_pop_lbl 1 `"Alive"', add
label define lastbmort_pop_lbl 2 `"Dead"', add
label define lastbmort_pop_lbl 9 `"Unknown"', add
label values lastbmort_pop lastbmort_pop_lbl

label define lastbmort_sp_lbl 0 `"NIU (not in universe)"'
label define lastbmort_sp_lbl 1 `"Alive"', add
label define lastbmort_sp_lbl 2 `"Dead"', add
label define lastbmort_sp_lbl 9 `"Unknown"', add
label values lastbmort_sp lastbmort_sp_lbl

label define mortmot_head_lbl 1 `"Alive"'
label define mortmot_head_lbl 2 `"Dead"', add
label define mortmot_head_lbl 7 `"Does not know"', add
label define mortmot_head_lbl 8 `"Missing"', add
label define mortmot_head_lbl 9 `"NIU (not in universe)"', add
label values mortmot_head mortmot_head_lbl

label define mortmot_mom_lbl 1 `"Alive"'
label define mortmot_mom_lbl 2 `"Dead"', add
label define mortmot_mom_lbl 7 `"Does not know"', add
label define mortmot_mom_lbl 8 `"Missing"', add
label define mortmot_mom_lbl 9 `"NIU (not in universe)"', add
label values mortmot_mom mortmot_mom_lbl

label define mortmot_pop_lbl 1 `"Alive"'
label define mortmot_pop_lbl 2 `"Dead"', add
label define mortmot_pop_lbl 7 `"Does not know"', add
label define mortmot_pop_lbl 8 `"Missing"', add
label define mortmot_pop_lbl 9 `"NIU (not in universe)"', add
label values mortmot_pop mortmot_pop_lbl

label define mortmot_sp_lbl 1 `"Alive"'
label define mortmot_sp_lbl 2 `"Dead"', add
label define mortmot_sp_lbl 7 `"Does not know"', add
label define mortmot_sp_lbl 8 `"Missing"', add
label define mortmot_sp_lbl 9 `"NIU (not in universe)"', add
label values mortmot_sp mortmot_sp_lbl

label define mortfat_head_lbl 1 `"Alive"'
label define mortfat_head_lbl 2 `"Dead"', add
label define mortfat_head_lbl 7 `"Does not know"', add
label define mortfat_head_lbl 8 `"Missing"', add
label define mortfat_head_lbl 9 `"NIU (not in universe)"', add
label values mortfat_head mortfat_head_lbl

label define mortfat_mom_lbl 1 `"Alive"'
label define mortfat_mom_lbl 2 `"Dead"', add
label define mortfat_mom_lbl 7 `"Does not know"', add
label define mortfat_mom_lbl 8 `"Missing"', add
label define mortfat_mom_lbl 9 `"NIU (not in universe)"', add
label values mortfat_mom mortfat_mom_lbl

label define mortfat_pop_lbl 1 `"Alive"'
label define mortfat_pop_lbl 2 `"Dead"', add
label define mortfat_pop_lbl 7 `"Does not know"', add
label define mortfat_pop_lbl 8 `"Missing"', add
label define mortfat_pop_lbl 9 `"NIU (not in universe)"', add
label values mortfat_pop mortfat_pop_lbl

label define mortfat_sp_lbl 1 `"Alive"'
label define mortfat_sp_lbl 2 `"Dead"', add
label define mortfat_sp_lbl 7 `"Does not know"', add
label define mortfat_sp_lbl 8 `"Missing"', add
label define mortfat_sp_lbl 9 `"NIU (not in universe)"', add
label values mortfat_sp mortfat_sp_lbl

label define homechild_head_lbl 00 `"0"'
label define homechild_head_lbl 01 `"1"', add
label define homechild_head_lbl 02 `"2"', add
label define homechild_head_lbl 03 `"3"', add
label define homechild_head_lbl 04 `"4"', add
label define homechild_head_lbl 05 `"5"', add
label define homechild_head_lbl 06 `"6"', add
label define homechild_head_lbl 07 `"7"', add
label define homechild_head_lbl 08 `"8"', add
label define homechild_head_lbl 09 `"9"', add
label define homechild_head_lbl 10 `"10"', add
label define homechild_head_lbl 11 `"11"', add
label define homechild_head_lbl 12 `"12"', add
label define homechild_head_lbl 13 `"13"', add
label define homechild_head_lbl 14 `"14"', add
label define homechild_head_lbl 15 `"15"', add
label define homechild_head_lbl 16 `"16"', add
label define homechild_head_lbl 17 `"17"', add
label define homechild_head_lbl 18 `"18"', add
label define homechild_head_lbl 19 `"19"', add
label define homechild_head_lbl 20 `"20+"', add
label define homechild_head_lbl 98 `"Unknown"', add
label define homechild_head_lbl 99 `"NIU (not in universe)"', add
label values homechild_head homechild_head_lbl

label define homechild_mom_lbl 00 `"0"'
label define homechild_mom_lbl 01 `"1"', add
label define homechild_mom_lbl 02 `"2"', add
label define homechild_mom_lbl 03 `"3"', add
label define homechild_mom_lbl 04 `"4"', add
label define homechild_mom_lbl 05 `"5"', add
label define homechild_mom_lbl 06 `"6"', add
label define homechild_mom_lbl 07 `"7"', add
label define homechild_mom_lbl 08 `"8"', add
label define homechild_mom_lbl 09 `"9"', add
label define homechild_mom_lbl 10 `"10"', add
label define homechild_mom_lbl 11 `"11"', add
label define homechild_mom_lbl 12 `"12"', add
label define homechild_mom_lbl 13 `"13"', add
label define homechild_mom_lbl 14 `"14"', add
label define homechild_mom_lbl 15 `"15"', add
label define homechild_mom_lbl 16 `"16"', add
label define homechild_mom_lbl 17 `"17"', add
label define homechild_mom_lbl 18 `"18"', add
label define homechild_mom_lbl 19 `"19"', add
label define homechild_mom_lbl 20 `"20+"', add
label define homechild_mom_lbl 98 `"Unknown"', add
label define homechild_mom_lbl 99 `"NIU (not in universe)"', add
label values homechild_mom homechild_mom_lbl

label define homechild_pop_lbl 00 `"0"'
label define homechild_pop_lbl 01 `"1"', add
label define homechild_pop_lbl 02 `"2"', add
label define homechild_pop_lbl 03 `"3"', add
label define homechild_pop_lbl 04 `"4"', add
label define homechild_pop_lbl 05 `"5"', add
label define homechild_pop_lbl 06 `"6"', add
label define homechild_pop_lbl 07 `"7"', add
label define homechild_pop_lbl 08 `"8"', add
label define homechild_pop_lbl 09 `"9"', add
label define homechild_pop_lbl 10 `"10"', add
label define homechild_pop_lbl 11 `"11"', add
label define homechild_pop_lbl 12 `"12"', add
label define homechild_pop_lbl 13 `"13"', add
label define homechild_pop_lbl 14 `"14"', add
label define homechild_pop_lbl 15 `"15"', add
label define homechild_pop_lbl 16 `"16"', add
label define homechild_pop_lbl 17 `"17"', add
label define homechild_pop_lbl 18 `"18"', add
label define homechild_pop_lbl 19 `"19"', add
label define homechild_pop_lbl 20 `"20+"', add
label define homechild_pop_lbl 98 `"Unknown"', add
label define homechild_pop_lbl 99 `"NIU (not in universe)"', add
label values homechild_pop homechild_pop_lbl

label define homechild_sp_lbl 00 `"0"'
label define homechild_sp_lbl 01 `"1"', add
label define homechild_sp_lbl 02 `"2"', add
label define homechild_sp_lbl 03 `"3"', add
label define homechild_sp_lbl 04 `"4"', add
label define homechild_sp_lbl 05 `"5"', add
label define homechild_sp_lbl 06 `"6"', add
label define homechild_sp_lbl 07 `"7"', add
label define homechild_sp_lbl 08 `"8"', add
label define homechild_sp_lbl 09 `"9"', add
label define homechild_sp_lbl 10 `"10"', add
label define homechild_sp_lbl 11 `"11"', add
label define homechild_sp_lbl 12 `"12"', add
label define homechild_sp_lbl 13 `"13"', add
label define homechild_sp_lbl 14 `"14"', add
label define homechild_sp_lbl 15 `"15"', add
label define homechild_sp_lbl 16 `"16"', add
label define homechild_sp_lbl 17 `"17"', add
label define homechild_sp_lbl 18 `"18"', add
label define homechild_sp_lbl 19 `"19"', add
label define homechild_sp_lbl 20 `"20+"', add
label define homechild_sp_lbl 98 `"Unknown"', add
label define homechild_sp_lbl 99 `"NIU (not in universe)"', add
label values homechild_sp homechild_sp_lbl

label define homefem_head_lbl 00 `"None"'
label define homefem_head_lbl 01 `"1"', add
label define homefem_head_lbl 02 `"2"', add
label define homefem_head_lbl 03 `"3"', add
label define homefem_head_lbl 04 `"4"', add
label define homefem_head_lbl 05 `"5"', add
label define homefem_head_lbl 06 `"6"', add
label define homefem_head_lbl 07 `"7"', add
label define homefem_head_lbl 08 `"8"', add
label define homefem_head_lbl 09 `"9"', add
label define homefem_head_lbl 10 `"10"', add
label define homefem_head_lbl 11 `"11"', add
label define homefem_head_lbl 12 `"12"', add
label define homefem_head_lbl 13 `"13"', add
label define homefem_head_lbl 14 `"14"', add
label define homefem_head_lbl 17 `"17"', add
label define homefem_head_lbl 20 `"20+"', add
label define homefem_head_lbl 98 `"Unknown"', add
label define homefem_head_lbl 99 `"NIU (not in universe)"', add
label values homefem_head homefem_head_lbl

label define homefem_mom_lbl 00 `"None"'
label define homefem_mom_lbl 01 `"1"', add
label define homefem_mom_lbl 02 `"2"', add
label define homefem_mom_lbl 03 `"3"', add
label define homefem_mom_lbl 04 `"4"', add
label define homefem_mom_lbl 05 `"5"', add
label define homefem_mom_lbl 06 `"6"', add
label define homefem_mom_lbl 07 `"7"', add
label define homefem_mom_lbl 08 `"8"', add
label define homefem_mom_lbl 09 `"9"', add
label define homefem_mom_lbl 10 `"10"', add
label define homefem_mom_lbl 11 `"11"', add
label define homefem_mom_lbl 12 `"12"', add
label define homefem_mom_lbl 13 `"13"', add
label define homefem_mom_lbl 14 `"14"', add
label define homefem_mom_lbl 17 `"17"', add
label define homefem_mom_lbl 20 `"20+"', add
label define homefem_mom_lbl 98 `"Unknown"', add
label define homefem_mom_lbl 99 `"NIU (not in universe)"', add
label values homefem_mom homefem_mom_lbl

label define homefem_pop_lbl 00 `"None"'
label define homefem_pop_lbl 01 `"1"', add
label define homefem_pop_lbl 02 `"2"', add
label define homefem_pop_lbl 03 `"3"', add
label define homefem_pop_lbl 04 `"4"', add
label define homefem_pop_lbl 05 `"5"', add
label define homefem_pop_lbl 06 `"6"', add
label define homefem_pop_lbl 07 `"7"', add
label define homefem_pop_lbl 08 `"8"', add
label define homefem_pop_lbl 09 `"9"', add
label define homefem_pop_lbl 10 `"10"', add
label define homefem_pop_lbl 11 `"11"', add
label define homefem_pop_lbl 12 `"12"', add
label define homefem_pop_lbl 13 `"13"', add
label define homefem_pop_lbl 14 `"14"', add
label define homefem_pop_lbl 17 `"17"', add
label define homefem_pop_lbl 20 `"20+"', add
label define homefem_pop_lbl 98 `"Unknown"', add
label define homefem_pop_lbl 99 `"NIU (not in universe)"', add
label values homefem_pop homefem_pop_lbl

label define homefem_sp_lbl 00 `"None"'
label define homefem_sp_lbl 01 `"1"', add
label define homefem_sp_lbl 02 `"2"', add
label define homefem_sp_lbl 03 `"3"', add
label define homefem_sp_lbl 04 `"4"', add
label define homefem_sp_lbl 05 `"5"', add
label define homefem_sp_lbl 06 `"6"', add
label define homefem_sp_lbl 07 `"7"', add
label define homefem_sp_lbl 08 `"8"', add
label define homefem_sp_lbl 09 `"9"', add
label define homefem_sp_lbl 10 `"10"', add
label define homefem_sp_lbl 11 `"11"', add
label define homefem_sp_lbl 12 `"12"', add
label define homefem_sp_lbl 13 `"13"', add
label define homefem_sp_lbl 14 `"14"', add
label define homefem_sp_lbl 17 `"17"', add
label define homefem_sp_lbl 20 `"20+"', add
label define homefem_sp_lbl 98 `"Unknown"', add
label define homefem_sp_lbl 99 `"NIU (not in universe)"', add
label values homefem_sp homefem_sp_lbl

label define homemale_head_lbl 00 `"None"'
label define homemale_head_lbl 01 `"1"', add
label define homemale_head_lbl 02 `"2"', add
label define homemale_head_lbl 03 `"3"', add
label define homemale_head_lbl 04 `"4"', add
label define homemale_head_lbl 05 `"5"', add
label define homemale_head_lbl 06 `"6"', add
label define homemale_head_lbl 07 `"7"', add
label define homemale_head_lbl 08 `"8"', add
label define homemale_head_lbl 09 `"9"', add
label define homemale_head_lbl 10 `"10"', add
label define homemale_head_lbl 11 `"11"', add
label define homemale_head_lbl 12 `"12"', add
label define homemale_head_lbl 13 `"13"', add
label define homemale_head_lbl 14 `"14"', add
label define homemale_head_lbl 15 `"15"', add
label define homemale_head_lbl 16 `"16"', add
label define homemale_head_lbl 17 `"17"', add
label define homemale_head_lbl 18 `"18"', add
label define homemale_head_lbl 19 `"19"', add
label define homemale_head_lbl 20 `"20+"', add
label define homemale_head_lbl 98 `"Unknown"', add
label define homemale_head_lbl 99 `"NIU (not in universe)"', add
label values homemale_head homemale_head_lbl

label define homemale_mom_lbl 00 `"None"'
label define homemale_mom_lbl 01 `"1"', add
label define homemale_mom_lbl 02 `"2"', add
label define homemale_mom_lbl 03 `"3"', add
label define homemale_mom_lbl 04 `"4"', add
label define homemale_mom_lbl 05 `"5"', add
label define homemale_mom_lbl 06 `"6"', add
label define homemale_mom_lbl 07 `"7"', add
label define homemale_mom_lbl 08 `"8"', add
label define homemale_mom_lbl 09 `"9"', add
label define homemale_mom_lbl 10 `"10"', add
label define homemale_mom_lbl 11 `"11"', add
label define homemale_mom_lbl 12 `"12"', add
label define homemale_mom_lbl 13 `"13"', add
label define homemale_mom_lbl 14 `"14"', add
label define homemale_mom_lbl 15 `"15"', add
label define homemale_mom_lbl 16 `"16"', add
label define homemale_mom_lbl 17 `"17"', add
label define homemale_mom_lbl 18 `"18"', add
label define homemale_mom_lbl 19 `"19"', add
label define homemale_mom_lbl 20 `"20+"', add
label define homemale_mom_lbl 98 `"Unknown"', add
label define homemale_mom_lbl 99 `"NIU (not in universe)"', add
label values homemale_mom homemale_mom_lbl

label define homemale_pop_lbl 00 `"None"'
label define homemale_pop_lbl 01 `"1"', add
label define homemale_pop_lbl 02 `"2"', add
label define homemale_pop_lbl 03 `"3"', add
label define homemale_pop_lbl 04 `"4"', add
label define homemale_pop_lbl 05 `"5"', add
label define homemale_pop_lbl 06 `"6"', add
label define homemale_pop_lbl 07 `"7"', add
label define homemale_pop_lbl 08 `"8"', add
label define homemale_pop_lbl 09 `"9"', add
label define homemale_pop_lbl 10 `"10"', add
label define homemale_pop_lbl 11 `"11"', add
label define homemale_pop_lbl 12 `"12"', add
label define homemale_pop_lbl 13 `"13"', add
label define homemale_pop_lbl 14 `"14"', add
label define homemale_pop_lbl 15 `"15"', add
label define homemale_pop_lbl 16 `"16"', add
label define homemale_pop_lbl 17 `"17"', add
label define homemale_pop_lbl 18 `"18"', add
label define homemale_pop_lbl 19 `"19"', add
label define homemale_pop_lbl 20 `"20+"', add
label define homemale_pop_lbl 98 `"Unknown"', add
label define homemale_pop_lbl 99 `"NIU (not in universe)"', add
label values homemale_pop homemale_pop_lbl

label define homemale_sp_lbl 00 `"None"'
label define homemale_sp_lbl 01 `"1"', add
label define homemale_sp_lbl 02 `"2"', add
label define homemale_sp_lbl 03 `"3"', add
label define homemale_sp_lbl 04 `"4"', add
label define homemale_sp_lbl 05 `"5"', add
label define homemale_sp_lbl 06 `"6"', add
label define homemale_sp_lbl 07 `"7"', add
label define homemale_sp_lbl 08 `"8"', add
label define homemale_sp_lbl 09 `"9"', add
label define homemale_sp_lbl 10 `"10"', add
label define homemale_sp_lbl 11 `"11"', add
label define homemale_sp_lbl 12 `"12"', add
label define homemale_sp_lbl 13 `"13"', add
label define homemale_sp_lbl 14 `"14"', add
label define homemale_sp_lbl 15 `"15"', add
label define homemale_sp_lbl 16 `"16"', add
label define homemale_sp_lbl 17 `"17"', add
label define homemale_sp_lbl 18 `"18"', add
label define homemale_sp_lbl 19 `"19"', add
label define homemale_sp_lbl 20 `"20+"', add
label define homemale_sp_lbl 98 `"Unknown"', add
label define homemale_sp_lbl 99 `"NIU (not in universe)"', add
label values homemale_sp homemale_sp_lbl

label define awaychild_head_lbl 00 `"0"'
label define awaychild_head_lbl 01 `"1"', add
label define awaychild_head_lbl 02 `"2"', add
label define awaychild_head_lbl 03 `"3"', add
label define awaychild_head_lbl 04 `"4"', add
label define awaychild_head_lbl 05 `"5"', add
label define awaychild_head_lbl 06 `"6"', add
label define awaychild_head_lbl 07 `"7"', add
label define awaychild_head_lbl 08 `"8"', add
label define awaychild_head_lbl 09 `"9"', add
label define awaychild_head_lbl 10 `"10"', add
label define awaychild_head_lbl 11 `"11"', add
label define awaychild_head_lbl 12 `"12"', add
label define awaychild_head_lbl 13 `"13"', add
label define awaychild_head_lbl 14 `"14"', add
label define awaychild_head_lbl 15 `"15"', add
label define awaychild_head_lbl 16 `"16"', add
label define awaychild_head_lbl 17 `"17"', add
label define awaychild_head_lbl 18 `"18"', add
label define awaychild_head_lbl 19 `"19"', add
label define awaychild_head_lbl 20 `"20"', add
label define awaychild_head_lbl 98 `"Unknown"', add
label define awaychild_head_lbl 99 `"NIU (not in universe)"', add
label values awaychild_head awaychild_head_lbl

label define awaychild_mom_lbl 00 `"0"'
label define awaychild_mom_lbl 01 `"1"', add
label define awaychild_mom_lbl 02 `"2"', add
label define awaychild_mom_lbl 03 `"3"', add
label define awaychild_mom_lbl 04 `"4"', add
label define awaychild_mom_lbl 05 `"5"', add
label define awaychild_mom_lbl 06 `"6"', add
label define awaychild_mom_lbl 07 `"7"', add
label define awaychild_mom_lbl 08 `"8"', add
label define awaychild_mom_lbl 09 `"9"', add
label define awaychild_mom_lbl 10 `"10"', add
label define awaychild_mom_lbl 11 `"11"', add
label define awaychild_mom_lbl 12 `"12"', add
label define awaychild_mom_lbl 13 `"13"', add
label define awaychild_mom_lbl 14 `"14"', add
label define awaychild_mom_lbl 15 `"15"', add
label define awaychild_mom_lbl 16 `"16"', add
label define awaychild_mom_lbl 17 `"17"', add
label define awaychild_mom_lbl 18 `"18"', add
label define awaychild_mom_lbl 19 `"19"', add
label define awaychild_mom_lbl 20 `"20"', add
label define awaychild_mom_lbl 98 `"Unknown"', add
label define awaychild_mom_lbl 99 `"NIU (not in universe)"', add
label values awaychild_mom awaychild_mom_lbl

label define awaychild_pop_lbl 00 `"0"'
label define awaychild_pop_lbl 01 `"1"', add
label define awaychild_pop_lbl 02 `"2"', add
label define awaychild_pop_lbl 03 `"3"', add
label define awaychild_pop_lbl 04 `"4"', add
label define awaychild_pop_lbl 05 `"5"', add
label define awaychild_pop_lbl 06 `"6"', add
label define awaychild_pop_lbl 07 `"7"', add
label define awaychild_pop_lbl 08 `"8"', add
label define awaychild_pop_lbl 09 `"9"', add
label define awaychild_pop_lbl 10 `"10"', add
label define awaychild_pop_lbl 11 `"11"', add
label define awaychild_pop_lbl 12 `"12"', add
label define awaychild_pop_lbl 13 `"13"', add
label define awaychild_pop_lbl 14 `"14"', add
label define awaychild_pop_lbl 15 `"15"', add
label define awaychild_pop_lbl 16 `"16"', add
label define awaychild_pop_lbl 17 `"17"', add
label define awaychild_pop_lbl 18 `"18"', add
label define awaychild_pop_lbl 19 `"19"', add
label define awaychild_pop_lbl 20 `"20"', add
label define awaychild_pop_lbl 98 `"Unknown"', add
label define awaychild_pop_lbl 99 `"NIU (not in universe)"', add
label values awaychild_pop awaychild_pop_lbl

label define awaychild_sp_lbl 00 `"0"'
label define awaychild_sp_lbl 01 `"1"', add
label define awaychild_sp_lbl 02 `"2"', add
label define awaychild_sp_lbl 03 `"3"', add
label define awaychild_sp_lbl 04 `"4"', add
label define awaychild_sp_lbl 05 `"5"', add
label define awaychild_sp_lbl 06 `"6"', add
label define awaychild_sp_lbl 07 `"7"', add
label define awaychild_sp_lbl 08 `"8"', add
label define awaychild_sp_lbl 09 `"9"', add
label define awaychild_sp_lbl 10 `"10"', add
label define awaychild_sp_lbl 11 `"11"', add
label define awaychild_sp_lbl 12 `"12"', add
label define awaychild_sp_lbl 13 `"13"', add
label define awaychild_sp_lbl 14 `"14"', add
label define awaychild_sp_lbl 15 `"15"', add
label define awaychild_sp_lbl 16 `"16"', add
label define awaychild_sp_lbl 17 `"17"', add
label define awaychild_sp_lbl 18 `"18"', add
label define awaychild_sp_lbl 19 `"19"', add
label define awaychild_sp_lbl 20 `"20"', add
label define awaychild_sp_lbl 98 `"Unknown"', add
label define awaychild_sp_lbl 99 `"NIU (not in universe)"', add
label values awaychild_sp awaychild_sp_lbl

label define awayfem_head_lbl 00 `"None"'
label define awayfem_head_lbl 01 `"1"', add
label define awayfem_head_lbl 02 `"2"', add
label define awayfem_head_lbl 03 `"3"', add
label define awayfem_head_lbl 04 `"4"', add
label define awayfem_head_lbl 05 `"5"', add
label define awayfem_head_lbl 06 `"6"', add
label define awayfem_head_lbl 07 `"7"', add
label define awayfem_head_lbl 08 `"8"', add
label define awayfem_head_lbl 09 `"9"', add
label define awayfem_head_lbl 10 `"10"', add
label define awayfem_head_lbl 11 `"11"', add
label define awayfem_head_lbl 12 `"12"', add
label define awayfem_head_lbl 13 `"13"', add
label define awayfem_head_lbl 14 `"14"', add
label define awayfem_head_lbl 15 `"15"', add
label define awayfem_head_lbl 16 `"16"', add
label define awayfem_head_lbl 17 `"17"', add
label define awayfem_head_lbl 18 `"18"', add
label define awayfem_head_lbl 19 `"19"', add
label define awayfem_head_lbl 20 `"20+"', add
label define awayfem_head_lbl 98 `"Unknown"', add
label define awayfem_head_lbl 99 `"NIU (not in universe)"', add
label values awayfem_head awayfem_head_lbl

label define awayfem_mom_lbl 00 `"None"'
label define awayfem_mom_lbl 01 `"1"', add
label define awayfem_mom_lbl 02 `"2"', add
label define awayfem_mom_lbl 03 `"3"', add
label define awayfem_mom_lbl 04 `"4"', add
label define awayfem_mom_lbl 05 `"5"', add
label define awayfem_mom_lbl 06 `"6"', add
label define awayfem_mom_lbl 07 `"7"', add
label define awayfem_mom_lbl 08 `"8"', add
label define awayfem_mom_lbl 09 `"9"', add
label define awayfem_mom_lbl 10 `"10"', add
label define awayfem_mom_lbl 11 `"11"', add
label define awayfem_mom_lbl 12 `"12"', add
label define awayfem_mom_lbl 13 `"13"', add
label define awayfem_mom_lbl 14 `"14"', add
label define awayfem_mom_lbl 15 `"15"', add
label define awayfem_mom_lbl 16 `"16"', add
label define awayfem_mom_lbl 17 `"17"', add
label define awayfem_mom_lbl 18 `"18"', add
label define awayfem_mom_lbl 19 `"19"', add
label define awayfem_mom_lbl 20 `"20+"', add
label define awayfem_mom_lbl 98 `"Unknown"', add
label define awayfem_mom_lbl 99 `"NIU (not in universe)"', add
label values awayfem_mom awayfem_mom_lbl

label define awayfem_pop_lbl 00 `"None"'
label define awayfem_pop_lbl 01 `"1"', add
label define awayfem_pop_lbl 02 `"2"', add
label define awayfem_pop_lbl 03 `"3"', add
label define awayfem_pop_lbl 04 `"4"', add
label define awayfem_pop_lbl 05 `"5"', add
label define awayfem_pop_lbl 06 `"6"', add
label define awayfem_pop_lbl 07 `"7"', add
label define awayfem_pop_lbl 08 `"8"', add
label define awayfem_pop_lbl 09 `"9"', add
label define awayfem_pop_lbl 10 `"10"', add
label define awayfem_pop_lbl 11 `"11"', add
label define awayfem_pop_lbl 12 `"12"', add
label define awayfem_pop_lbl 13 `"13"', add
label define awayfem_pop_lbl 14 `"14"', add
label define awayfem_pop_lbl 15 `"15"', add
label define awayfem_pop_lbl 16 `"16"', add
label define awayfem_pop_lbl 17 `"17"', add
label define awayfem_pop_lbl 18 `"18"', add
label define awayfem_pop_lbl 19 `"19"', add
label define awayfem_pop_lbl 20 `"20+"', add
label define awayfem_pop_lbl 98 `"Unknown"', add
label define awayfem_pop_lbl 99 `"NIU (not in universe)"', add
label values awayfem_pop awayfem_pop_lbl

label define awayfem_sp_lbl 00 `"None"'
label define awayfem_sp_lbl 01 `"1"', add
label define awayfem_sp_lbl 02 `"2"', add
label define awayfem_sp_lbl 03 `"3"', add
label define awayfem_sp_lbl 04 `"4"', add
label define awayfem_sp_lbl 05 `"5"', add
label define awayfem_sp_lbl 06 `"6"', add
label define awayfem_sp_lbl 07 `"7"', add
label define awayfem_sp_lbl 08 `"8"', add
label define awayfem_sp_lbl 09 `"9"', add
label define awayfem_sp_lbl 10 `"10"', add
label define awayfem_sp_lbl 11 `"11"', add
label define awayfem_sp_lbl 12 `"12"', add
label define awayfem_sp_lbl 13 `"13"', add
label define awayfem_sp_lbl 14 `"14"', add
label define awayfem_sp_lbl 15 `"15"', add
label define awayfem_sp_lbl 16 `"16"', add
label define awayfem_sp_lbl 17 `"17"', add
label define awayfem_sp_lbl 18 `"18"', add
label define awayfem_sp_lbl 19 `"19"', add
label define awayfem_sp_lbl 20 `"20+"', add
label define awayfem_sp_lbl 98 `"Unknown"', add
label define awayfem_sp_lbl 99 `"NIU (not in universe)"', add
label values awayfem_sp awayfem_sp_lbl

label define awaymale_head_lbl 00 `"None"'
label define awaymale_head_lbl 01 `"1"', add
label define awaymale_head_lbl 02 `"2"', add
label define awaymale_head_lbl 03 `"3"', add
label define awaymale_head_lbl 04 `"4"', add
label define awaymale_head_lbl 05 `"5"', add
label define awaymale_head_lbl 06 `"6"', add
label define awaymale_head_lbl 07 `"7"', add
label define awaymale_head_lbl 08 `"8"', add
label define awaymale_head_lbl 09 `"9"', add
label define awaymale_head_lbl 10 `"10"', add
label define awaymale_head_lbl 11 `"11"', add
label define awaymale_head_lbl 12 `"12"', add
label define awaymale_head_lbl 13 `"13"', add
label define awaymale_head_lbl 14 `"14"', add
label define awaymale_head_lbl 15 `"15"', add
label define awaymale_head_lbl 16 `"16"', add
label define awaymale_head_lbl 17 `"17"', add
label define awaymale_head_lbl 18 `"18"', add
label define awaymale_head_lbl 19 `"19"', add
label define awaymale_head_lbl 20 `"20"', add
label define awaymale_head_lbl 98 `"Unknown"', add
label define awaymale_head_lbl 99 `"NIU (not in universe)"', add
label values awaymale_head awaymale_head_lbl

label define awaymale_mom_lbl 00 `"None"'
label define awaymale_mom_lbl 01 `"1"', add
label define awaymale_mom_lbl 02 `"2"', add
label define awaymale_mom_lbl 03 `"3"', add
label define awaymale_mom_lbl 04 `"4"', add
label define awaymale_mom_lbl 05 `"5"', add
label define awaymale_mom_lbl 06 `"6"', add
label define awaymale_mom_lbl 07 `"7"', add
label define awaymale_mom_lbl 08 `"8"', add
label define awaymale_mom_lbl 09 `"9"', add
label define awaymale_mom_lbl 10 `"10"', add
label define awaymale_mom_lbl 11 `"11"', add
label define awaymale_mom_lbl 12 `"12"', add
label define awaymale_mom_lbl 13 `"13"', add
label define awaymale_mom_lbl 14 `"14"', add
label define awaymale_mom_lbl 15 `"15"', add
label define awaymale_mom_lbl 16 `"16"', add
label define awaymale_mom_lbl 17 `"17"', add
label define awaymale_mom_lbl 18 `"18"', add
label define awaymale_mom_lbl 19 `"19"', add
label define awaymale_mom_lbl 20 `"20"', add
label define awaymale_mom_lbl 98 `"Unknown"', add
label define awaymale_mom_lbl 99 `"NIU (not in universe)"', add
label values awaymale_mom awaymale_mom_lbl

label define awaymale_pop_lbl 00 `"None"'
label define awaymale_pop_lbl 01 `"1"', add
label define awaymale_pop_lbl 02 `"2"', add
label define awaymale_pop_lbl 03 `"3"', add
label define awaymale_pop_lbl 04 `"4"', add
label define awaymale_pop_lbl 05 `"5"', add
label define awaymale_pop_lbl 06 `"6"', add
label define awaymale_pop_lbl 07 `"7"', add
label define awaymale_pop_lbl 08 `"8"', add
label define awaymale_pop_lbl 09 `"9"', add
label define awaymale_pop_lbl 10 `"10"', add
label define awaymale_pop_lbl 11 `"11"', add
label define awaymale_pop_lbl 12 `"12"', add
label define awaymale_pop_lbl 13 `"13"', add
label define awaymale_pop_lbl 14 `"14"', add
label define awaymale_pop_lbl 15 `"15"', add
label define awaymale_pop_lbl 16 `"16"', add
label define awaymale_pop_lbl 17 `"17"', add
label define awaymale_pop_lbl 18 `"18"', add
label define awaymale_pop_lbl 19 `"19"', add
label define awaymale_pop_lbl 20 `"20"', add
label define awaymale_pop_lbl 98 `"Unknown"', add
label define awaymale_pop_lbl 99 `"NIU (not in universe)"', add
label values awaymale_pop awaymale_pop_lbl

label define awaymale_sp_lbl 00 `"None"'
label define awaymale_sp_lbl 01 `"1"', add
label define awaymale_sp_lbl 02 `"2"', add
label define awaymale_sp_lbl 03 `"3"', add
label define awaymale_sp_lbl 04 `"4"', add
label define awaymale_sp_lbl 05 `"5"', add
label define awaymale_sp_lbl 06 `"6"', add
label define awaymale_sp_lbl 07 `"7"', add
label define awaymale_sp_lbl 08 `"8"', add
label define awaymale_sp_lbl 09 `"9"', add
label define awaymale_sp_lbl 10 `"10"', add
label define awaymale_sp_lbl 11 `"11"', add
label define awaymale_sp_lbl 12 `"12"', add
label define awaymale_sp_lbl 13 `"13"', add
label define awaymale_sp_lbl 14 `"14"', add
label define awaymale_sp_lbl 15 `"15"', add
label define awaymale_sp_lbl 16 `"16"', add
label define awaymale_sp_lbl 17 `"17"', add
label define awaymale_sp_lbl 18 `"18"', add
label define awaymale_sp_lbl 19 `"19"', add
label define awaymale_sp_lbl 20 `"20"', add
label define awaymale_sp_lbl 98 `"Unknown"', add
label define awaymale_sp_lbl 99 `"NIU (not in universe)"', add
label values awaymale_sp awaymale_sp_lbl

label define nativity_head_lbl 0 `"NIU (not in universe)"'
label define nativity_head_lbl 1 `"Native-born"', add
label define nativity_head_lbl 2 `"Foreign-born"', add
label define nativity_head_lbl 9 `"Unknown/missing"', add
label values nativity_head nativity_head_lbl

label define nativity_mom_lbl 0 `"NIU (not in universe)"'
label define nativity_mom_lbl 1 `"Native-born"', add
label define nativity_mom_lbl 2 `"Foreign-born"', add
label define nativity_mom_lbl 9 `"Unknown/missing"', add
label values nativity_mom nativity_mom_lbl

label define nativity_pop_lbl 0 `"NIU (not in universe)"'
label define nativity_pop_lbl 1 `"Native-born"', add
label define nativity_pop_lbl 2 `"Foreign-born"', add
label define nativity_pop_lbl 9 `"Unknown/missing"', add
label values nativity_pop nativity_pop_lbl

label define nativity_sp_lbl 0 `"NIU (not in universe)"'
label define nativity_sp_lbl 1 `"Native-born"', add
label define nativity_sp_lbl 2 `"Foreign-born"', add
label define nativity_sp_lbl 9 `"Unknown/missing"', add
label values nativity_sp nativity_sp_lbl

label define bplcountry_head_lbl 00000 `"NIU (not in universe)"'
label define bplcountry_head_lbl 10000 `"Africa"', add
label define bplcountry_head_lbl 11000 `"Eastern Africa"', add
label define bplcountry_head_lbl 11005 `"British Indian Ocean Territory"', add
label define bplcountry_head_lbl 11010 `"Burundi"', add
label define bplcountry_head_lbl 11020 `"Comoros"', add
label define bplcountry_head_lbl 11030 `"Djibouti"', add
label define bplcountry_head_lbl 11040 `"Eritrea"', add
label define bplcountry_head_lbl 11050 `"Ethiopia"', add
label define bplcountry_head_lbl 11051 `"Ethiopia (including Eritrea)"', add
label define bplcountry_head_lbl 11060 `"Kenya"', add
label define bplcountry_head_lbl 11070 `"Madagascar"', add
label define bplcountry_head_lbl 11080 `"Malawi"', add
label define bplcountry_head_lbl 11090 `"Mauritius"', add
label define bplcountry_head_lbl 11100 `"Mozambique"', add
label define bplcountry_head_lbl 11110 `"Reunion"', add
label define bplcountry_head_lbl 11120 `"Rwanda"', add
label define bplcountry_head_lbl 11130 `"Seychelles"', add
label define bplcountry_head_lbl 11140 `"Somalia"', add
label define bplcountry_head_lbl 11150 `"South Sudan"', add
label define bplcountry_head_lbl 11160 `"Uganda"', add
label define bplcountry_head_lbl 11170 `"Tanzania"', add
label define bplcountry_head_lbl 11180 `"Zambia"', add
label define bplcountry_head_lbl 11190 `"Zimbabwe"', add
label define bplcountry_head_lbl 11999 `"Eastern Africa, other or n.s."', add
label define bplcountry_head_lbl 12000 `"Middle Africa"', add
label define bplcountry_head_lbl 12010 `"Angola"', add
label define bplcountry_head_lbl 12020 `"Cameroon"', add
label define bplcountry_head_lbl 12030 `"Central African Republic"', add
label define bplcountry_head_lbl 12040 `"Chad"', add
label define bplcountry_head_lbl 12050 `"Congo (Republic of)"', add
label define bplcountry_head_lbl 12060 `"Democratic Republic of Congo"', add
label define bplcountry_head_lbl 12070 `"Equatorial Guinea"', add
label define bplcountry_head_lbl 12080 `"Gabon"', add
label define bplcountry_head_lbl 12090 `"Sao Tome and Principe"', add
label define bplcountry_head_lbl 12999 `"Middle Africa, other or n.s."', add
label define bplcountry_head_lbl 13000 `"Northern Africa"', add
label define bplcountry_head_lbl 13010 `"Algeria"', add
label define bplcountry_head_lbl 13011 `"Algeria/Tunisia"', add
label define bplcountry_head_lbl 13020 `"Egypt"', add
label define bplcountry_head_lbl 13021 `"Egypt/Sudan"', add
label define bplcountry_head_lbl 13030 `"Libya"', add
label define bplcountry_head_lbl 13040 `"Morocco"', add
label define bplcountry_head_lbl 13050 `"Sudan"', add
label define bplcountry_head_lbl 13060 `"Tunisia"', add
label define bplcountry_head_lbl 13070 `"Western Sahara"', add
label define bplcountry_head_lbl 13999 `"Northern Africa, other or n.s."', add
label define bplcountry_head_lbl 14000 `"Southern Africa"', add
label define bplcountry_head_lbl 14010 `"Botswana"', add
label define bplcountry_head_lbl 14020 `"Lesotho"', add
label define bplcountry_head_lbl 14030 `"Namibia"', add
label define bplcountry_head_lbl 14040 `"South Africa"', add
label define bplcountry_head_lbl 14050 `"Swaziland"', add
label define bplcountry_head_lbl 14999 `"Southern Africa, other or n.s."', add
label define bplcountry_head_lbl 15000 `"Western Africa"', add
label define bplcountry_head_lbl 15010 `"Benin"', add
label define bplcountry_head_lbl 15020 `"Burkina Faso"', add
label define bplcountry_head_lbl 15021 `"Upper Volta"', add
label define bplcountry_head_lbl 15030 `"Cape Verde"', add
label define bplcountry_head_lbl 15040 `"Ivory Coast"', add
label define bplcountry_head_lbl 15050 `"Gambia"', add
label define bplcountry_head_lbl 15060 `"Ghana"', add
label define bplcountry_head_lbl 15070 `"Guinea"', add
label define bplcountry_head_lbl 15080 `"Guinea-Bissau"', add
label define bplcountry_head_lbl 15081 `"Guinea-Bissau and Cape Verde"', add
label define bplcountry_head_lbl 15090 `"Liberia"', add
label define bplcountry_head_lbl 15100 `"Mali"', add
label define bplcountry_head_lbl 15110 `"Mauritania"', add
label define bplcountry_head_lbl 15120 `"Niger"', add
label define bplcountry_head_lbl 15130 `"Nigeria"', add
label define bplcountry_head_lbl 15140 `"St. Helena and Ascension"', add
label define bplcountry_head_lbl 15150 `"Senegal"', add
label define bplcountry_head_lbl 15160 `"Sierra Leone"', add
label define bplcountry_head_lbl 15170 `"Togo"', add
label define bplcountry_head_lbl 15180 `"Canary Islands"', add
label define bplcountry_head_lbl 15999 `"West Africa, other or n.s."', add
label define bplcountry_head_lbl 19999 `"Africa, other or n.s."', add
label define bplcountry_head_lbl 20000 `"Americas"', add
label define bplcountry_head_lbl 21000 `"Caribbean"', add
label define bplcountry_head_lbl 21010 `"Anguilla"', add
label define bplcountry_head_lbl 21020 `"Antigua-Barbuda"', add
label define bplcountry_head_lbl 21030 `"Aruba"', add
label define bplcountry_head_lbl 21040 `"Bahamas"', add
label define bplcountry_head_lbl 21050 `"Barbados"', add
label define bplcountry_head_lbl 21060 `"British Virgin Islands"', add
label define bplcountry_head_lbl 21070 `"Cayman Isles"', add
label define bplcountry_head_lbl 21080 `"Cuba"', add
label define bplcountry_head_lbl 21090 `"Dominica"', add
label define bplcountry_head_lbl 21100 `"Dominican Republic"', add
label define bplcountry_head_lbl 21110 `"Grenada"', add
label define bplcountry_head_lbl 21120 `"Guadeloupe"', add
label define bplcountry_head_lbl 21130 `"Haiti"', add
label define bplcountry_head_lbl 21140 `"Jamaica"', add
label define bplcountry_head_lbl 21150 `"Martinique"', add
label define bplcountry_head_lbl 21160 `"Montserrat"', add
label define bplcountry_head_lbl 21170 `"Netherlands Antilles"', add
label define bplcountry_head_lbl 21180 `"Puerto Rico"', add
label define bplcountry_head_lbl 21190 `"St. Kitts-Nevis"', add
label define bplcountry_head_lbl 21200 `"St. Croix"', add
label define bplcountry_head_lbl 21210 `"St. John"', add
label define bplcountry_head_lbl 21220 `"St. Lucia"', add
label define bplcountry_head_lbl 21230 `"St Thomas"', add
label define bplcountry_head_lbl 21240 `"St. Vincent"', add
label define bplcountry_head_lbl 21250 `"Trinidad and Tobago"', add
label define bplcountry_head_lbl 21260 `"Turks and Caicos"', add
label define bplcountry_head_lbl 21270 `"U.S. Virgin Islands"', add
label define bplcountry_head_lbl 21991 `"Caribbean commonwealth, n.s."', add
label define bplcountry_head_lbl 21999 `"Caribbean, other or n.s."', add
label define bplcountry_head_lbl 22000 `"Central America"', add
label define bplcountry_head_lbl 22010 `"Belize/British Honduras"', add
label define bplcountry_head_lbl 22020 `"Costa Rica"', add
label define bplcountry_head_lbl 22030 `"El Salvador"', add
label define bplcountry_head_lbl 22040 `"Guatemala"', add
label define bplcountry_head_lbl 22050 `"Honduras"', add
label define bplcountry_head_lbl 22060 `"Mexico"', add
label define bplcountry_head_lbl 22070 `"Nicaragua"', add
label define bplcountry_head_lbl 22080 `"Panama"', add
label define bplcountry_head_lbl 22081 `"Panama Canal Zone"', add
label define bplcountry_head_lbl 22999 `"Central America, other or n.s."', add
label define bplcountry_head_lbl 23000 `"South America"', add
label define bplcountry_head_lbl 23010 `"Argentina"', add
label define bplcountry_head_lbl 23020 `"Bolivia"', add
label define bplcountry_head_lbl 23030 `"Brazil"', add
label define bplcountry_head_lbl 23040 `"Chile"', add
label define bplcountry_head_lbl 23050 `"Colombia"', add
label define bplcountry_head_lbl 23060 `"Ecuador"', add
label define bplcountry_head_lbl 23070 `"Falkland Islands"', add
label define bplcountry_head_lbl 23080 `"French Guiana"', add
label define bplcountry_head_lbl 23090 `"Guyana/British Guiana"', add
label define bplcountry_head_lbl 23100 `"Paraguay"', add
label define bplcountry_head_lbl 23110 `"Peru"', add
label define bplcountry_head_lbl 23120 `"Suriname"', add
label define bplcountry_head_lbl 23130 `"Uruguay"', add
label define bplcountry_head_lbl 23140 `"Venezuela"', add
label define bplcountry_head_lbl 23999 `"South America, other or n.s."', add
label define bplcountry_head_lbl 24000 `"North America"', add
label define bplcountry_head_lbl 24010 `"Bermuda"', add
label define bplcountry_head_lbl 24020 `"Canada"', add
label define bplcountry_head_lbl 24030 `"Greenland"', add
label define bplcountry_head_lbl 24040 `"United States"', add
label define bplcountry_head_lbl 24999 `"North America, other or n.s."', add
label define bplcountry_head_lbl 29999 `"Americas, other or n.s."', add
label define bplcountry_head_lbl 30000 `"Asia"', add
label define bplcountry_head_lbl 31000 `"Eastern Asia"', add
label define bplcountry_head_lbl 31010 `"China"', add
label define bplcountry_head_lbl 31011 `"Hong Kong"', add
label define bplcountry_head_lbl 31012 `"Macau"', add
label define bplcountry_head_lbl 31013 `"Taiwan"', add
label define bplcountry_head_lbl 31020 `"Japan"', add
label define bplcountry_head_lbl 31030 `"Korea"', add
label define bplcountry_head_lbl 31031 `"Korea, DPR (North)"', add
label define bplcountry_head_lbl 31032 `"Korea, RO (South)"', add
label define bplcountry_head_lbl 31040 `"Mongolia"', add
label define bplcountry_head_lbl 31999 `"Eastern Asia, other or n.s."', add
label define bplcountry_head_lbl 32000 `"South-Central Asia"', add
label define bplcountry_head_lbl 32010 `"Afghanistan"', add
label define bplcountry_head_lbl 32020 `"Bangladesh"', add
label define bplcountry_head_lbl 32030 `"Bhutan"', add
label define bplcountry_head_lbl 32040 `"India"', add
label define bplcountry_head_lbl 32041 `"India/Pakistan"', add
label define bplcountry_head_lbl 32042 `"India/Pakistan/Bangladesh/Sri Lanka"', add
label define bplcountry_head_lbl 32050 `"Iran"', add
label define bplcountry_head_lbl 32060 `"Kazakhstan"', add
label define bplcountry_head_lbl 32070 `"Kyrgyzstan"', add
label define bplcountry_head_lbl 32080 `"Maldives"', add
label define bplcountry_head_lbl 32090 `"Nepal"', add
label define bplcountry_head_lbl 32100 `"Pakistan"', add
label define bplcountry_head_lbl 32101 `"Pakistan/Bangladesh"', add
label define bplcountry_head_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define bplcountry_head_lbl 32120 `"Tajikistan"', add
label define bplcountry_head_lbl 32130 `"Turkmenistan"', add
label define bplcountry_head_lbl 32140 `"Uzbekistan"', add
label define bplcountry_head_lbl 32999 `"South-Central Asia, other or n.s."', add
label define bplcountry_head_lbl 33000 `"South-Eastern Asia"', add
label define bplcountry_head_lbl 33010 `"Brunei"', add
label define bplcountry_head_lbl 33020 `"Cambodia (Kampuchea)"', add
label define bplcountry_head_lbl 33030 `"East Timor"', add
label define bplcountry_head_lbl 33040 `"Indonesia"', add
label define bplcountry_head_lbl 33050 `"Laos"', add
label define bplcountry_head_lbl 33060 `"Malaysia"', add
label define bplcountry_head_lbl 33070 `"Myanmar (Burma)"', add
label define bplcountry_head_lbl 33080 `"Philippines"', add
label define bplcountry_head_lbl 33090 `"Singapore"', add
label define bplcountry_head_lbl 33100 `"Thailand"', add
label define bplcountry_head_lbl 33110 `"Vietnam"', add
label define bplcountry_head_lbl 33999 `"South-Eastern Asia, other or n.s."', add
label define bplcountry_head_lbl 34000 `"Western Asia"', add
label define bplcountry_head_lbl 34010 `"Armenia"', add
label define bplcountry_head_lbl 34020 `"Azerbaijan"', add
label define bplcountry_head_lbl 34030 `"Bahrain"', add
label define bplcountry_head_lbl 34040 `"Cyprus"', add
label define bplcountry_head_lbl 34050 `"Georgia"', add
label define bplcountry_head_lbl 34051 `"Abkhazia"', add
label define bplcountry_head_lbl 34052 `"South Ossetia"', add
label define bplcountry_head_lbl 34060 `"Iraq"', add
label define bplcountry_head_lbl 34070 `"Israel"', add
label define bplcountry_head_lbl 34071 `"Israel/Palestine"', add
label define bplcountry_head_lbl 34080 `"Jordan"', add
label define bplcountry_head_lbl 34090 `"Kuwait"', add
label define bplcountry_head_lbl 34100 `"Lebanon"', add
label define bplcountry_head_lbl 34110 `"Palestine"', add
label define bplcountry_head_lbl 34111 `"West Bank"', add
label define bplcountry_head_lbl 34112 `"Gaza Strip"', add
label define bplcountry_head_lbl 34120 `"Oman"', add
label define bplcountry_head_lbl 34130 `"Qatar"', add
label define bplcountry_head_lbl 34140 `"Saudi Arabia"', add
label define bplcountry_head_lbl 34150 `"Syria"', add
label define bplcountry_head_lbl 34151 `"Syria/Lebanon"', add
label define bplcountry_head_lbl 34160 `"Turkey"', add
label define bplcountry_head_lbl 34170 `"United Arab Emirates"', add
label define bplcountry_head_lbl 34180 `"Yemen"', add
label define bplcountry_head_lbl 34991 `"Middle East"', add
label define bplcountry_head_lbl 34999 `"Western Asia, other or n.s."', add
label define bplcountry_head_lbl 39999 `"Asia, other or n.s."', add
label define bplcountry_head_lbl 40000 `"Europe"', add
label define bplcountry_head_lbl 41000 `"Eastern Europe"', add
label define bplcountry_head_lbl 41010 `"Belarus"', add
label define bplcountry_head_lbl 41020 `"Bulgaria"', add
label define bplcountry_head_lbl 41021 `"Bulgaria/Greece"', add
label define bplcountry_head_lbl 41030 `"Czech Republic/Czechoslovakia"', add
label define bplcountry_head_lbl 41040 `"Hungary"', add
label define bplcountry_head_lbl 41050 `"Poland"', add
label define bplcountry_head_lbl 41060 `"Moldova"', add
label define bplcountry_head_lbl 41070 `"Romania"', add
label define bplcountry_head_lbl 41080 `"Russia/USSR"', add
label define bplcountry_head_lbl 41090 `"Slovakia"', add
label define bplcountry_head_lbl 41100 `"Ukraine"', add
label define bplcountry_head_lbl 41991 `"Albania, Bulgaria, Czech, Hungary, Romania, Yugoslavia"', add
label define bplcountry_head_lbl 41992 `"Central-Eastern Europe"', add
label define bplcountry_head_lbl 41999 `"Eastern Europe, other or n.s."', add
label define bplcountry_head_lbl 42000 `"Northern Europe"', add
label define bplcountry_head_lbl 42010 `"Denmark"', add
label define bplcountry_head_lbl 42020 `"Estonia"', add
label define bplcountry_head_lbl 42030 `"Faroe Islands"', add
label define bplcountry_head_lbl 42040 `"Finland"', add
label define bplcountry_head_lbl 42050 `"Iceland"', add
label define bplcountry_head_lbl 42060 `"Ireland"', add
label define bplcountry_head_lbl 42070 `"Latvia"', add
label define bplcountry_head_lbl 42080 `"Lithuania"', add
label define bplcountry_head_lbl 42090 `"Norway"', add
label define bplcountry_head_lbl 42100 `"Svalbard and Jan Mayen Islands"', add
label define bplcountry_head_lbl 42110 `"Sweden"', add
label define bplcountry_head_lbl 42120 `"United Kingdom"', add
label define bplcountry_head_lbl 42999 `"Northern Europe, other or n.s."', add
label define bplcountry_head_lbl 43000 `"Southern Europe"', add
label define bplcountry_head_lbl 43010 `"Albania"', add
label define bplcountry_head_lbl 43020 `"Andorra"', add
label define bplcountry_head_lbl 43030 `"Bosnia and Herzegovina"', add
label define bplcountry_head_lbl 43040 `"Croatia"', add
label define bplcountry_head_lbl 43050 `"Gibraltar"', add
label define bplcountry_head_lbl 43060 `"Greece"', add
label define bplcountry_head_lbl 43070 `"Italy"', add
label define bplcountry_head_lbl 43071 `"Vatican City"', add
label define bplcountry_head_lbl 43080 `"Malta"', add
label define bplcountry_head_lbl 43090 `"Portugal"', add
label define bplcountry_head_lbl 43100 `"San Marino"', add
label define bplcountry_head_lbl 43110 `"Slovenia"', add
label define bplcountry_head_lbl 43120 `"Spain"', add
label define bplcountry_head_lbl 43121 `"Spain/Portugal"', add
label define bplcountry_head_lbl 43130 `"Macedonia"', add
label define bplcountry_head_lbl 43140 `"Yugoslavia"', add
label define bplcountry_head_lbl 43141 `"Montenegro"', add
label define bplcountry_head_lbl 43142 `"Serbia"', add
label define bplcountry_head_lbl 43143 `"Kosovo"', add
label define bplcountry_head_lbl 43144 `"Serbia and Montenegro"', add
label define bplcountry_head_lbl 43991 `"Gibraltar/Malta"', add
label define bplcountry_head_lbl 43992 `"Portugal/Greece"', add
label define bplcountry_head_lbl 43993 `"Italy, Holy See, San Marino"', add
label define bplcountry_head_lbl 43999 `"Southern Europe, other or n.s."', add
label define bplcountry_head_lbl 44000 `"Western Europe"', add
label define bplcountry_head_lbl 44010 `"Austria"', add
label define bplcountry_head_lbl 44020 `"Belgium"', add
label define bplcountry_head_lbl 44021 `"Belgium/Luxemburg"', add
label define bplcountry_head_lbl 44022 `"Belgium/Netherlands/Luxemburg"', add
label define bplcountry_head_lbl 44030 `"France"', add
label define bplcountry_head_lbl 44040 `"Germany"', add
label define bplcountry_head_lbl 44042 `"West Germany"', add
label define bplcountry_head_lbl 44043 `"Germany/Austria"', add
label define bplcountry_head_lbl 44044 `"Mecklenburg-Schwerin"', add
label define bplcountry_head_lbl 44050 `"Liechtenstein"', add
label define bplcountry_head_lbl 44060 `"Luxembourg"', add
label define bplcountry_head_lbl 44070 `"Monaco"', add
label define bplcountry_head_lbl 44080 `"Netherlands"', add
label define bplcountry_head_lbl 44090 `"Switzerland"', add
label define bplcountry_head_lbl 44991 `"Belgium, Denmark, Luxembourg, Netherlands"', add
label define bplcountry_head_lbl 44999 `"Western Europe, other or n.s."', add
label define bplcountry_head_lbl 49992 `"European Union"', add
label define bplcountry_head_lbl 49993 `"European Union (original 15)"', add
label define bplcountry_head_lbl 49994 `"Other European Union (not original 15)"', add
label define bplcountry_head_lbl 49999 `"Europe, other or n.s."', add
label define bplcountry_head_lbl 50000 `"Oceania"', add
label define bplcountry_head_lbl 51000 `"Australia and New Zealand"', add
label define bplcountry_head_lbl 51010 `"Australia"', add
label define bplcountry_head_lbl 51020 `"New Zealand"', add
label define bplcountry_head_lbl 51030 `"Norfolk Islands"', add
label define bplcountry_head_lbl 51999 `"Australia and New Zealand, n.s."', add
label define bplcountry_head_lbl 52000 `"Melanesia"', add
label define bplcountry_head_lbl 52010 `"Fiji"', add
label define bplcountry_head_lbl 52020 `"New Caledonia"', add
label define bplcountry_head_lbl 52030 `"Papua New Guinea"', add
label define bplcountry_head_lbl 52040 `"Solomon Islands"', add
label define bplcountry_head_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define bplcountry_head_lbl 52999 `"Melanesia, n.s."', add
label define bplcountry_head_lbl 53000 `"Micronesia"', add
label define bplcountry_head_lbl 53010 `"Kiribati"', add
label define bplcountry_head_lbl 53020 `"Marshall Islands"', add
label define bplcountry_head_lbl 53030 `"Nauru"', add
label define bplcountry_head_lbl 53040 `"Northern Mariana Isls."', add
label define bplcountry_head_lbl 53050 `"Palau"', add
label define bplcountry_head_lbl 53060 `"Federated States of Micronesia"', add
label define bplcountry_head_lbl 53999 `"Micronesia, other or n.s."', add
label define bplcountry_head_lbl 54000 `"Polynesia"', add
label define bplcountry_head_lbl 54010 `"Cook Islands"', add
label define bplcountry_head_lbl 54020 `"French Polynesia"', add
label define bplcountry_head_lbl 54030 `"Niue"', add
label define bplcountry_head_lbl 54040 `"Pitcairn Island"', add
label define bplcountry_head_lbl 54050 `"Western Samoa"', add
label define bplcountry_head_lbl 54060 `"Eastern Samoa"', add
label define bplcountry_head_lbl 54070 `"Tokelau"', add
label define bplcountry_head_lbl 54080 `"Tonga"', add
label define bplcountry_head_lbl 54090 `"Tuvalu"', add
label define bplcountry_head_lbl 54100 `"Wallis and Futuna Isls."', add
label define bplcountry_head_lbl 54999 `"Polynesia, other or n.s."', add
label define bplcountry_head_lbl 55000 `"U.S. Pacific Possessions"', add
label define bplcountry_head_lbl 55010 `"American Samoa"', add
label define bplcountry_head_lbl 55020 `"Baker Island"', add
label define bplcountry_head_lbl 55030 `"Guam"', add
label define bplcountry_head_lbl 55040 `"Howland Island"', add
label define bplcountry_head_lbl 55050 `"Johnston Atoll"', add
label define bplcountry_head_lbl 55060 `"Kingman Reef"', add
label define bplcountry_head_lbl 55070 `"Midway Islands"', add
label define bplcountry_head_lbl 55080 `"Wake Island"', add
label define bplcountry_head_lbl 55999 `"US Pacific, other or n.s."', add
label define bplcountry_head_lbl 59999 `"Oceania, other or n.s."', add
label define bplcountry_head_lbl 80000 `"AT SEA"', add
label define bplcountry_head_lbl 90000 `"Other countries n.s."', add
label define bplcountry_head_lbl 99999 `"Unknown"', add
label values bplcountry_head bplcountry_head_lbl

label define bplcountry_mom_lbl 00000 `"NIU (not in universe)"'
label define bplcountry_mom_lbl 10000 `"Africa"', add
label define bplcountry_mom_lbl 11000 `"Eastern Africa"', add
label define bplcountry_mom_lbl 11005 `"British Indian Ocean Territory"', add
label define bplcountry_mom_lbl 11010 `"Burundi"', add
label define bplcountry_mom_lbl 11020 `"Comoros"', add
label define bplcountry_mom_lbl 11030 `"Djibouti"', add
label define bplcountry_mom_lbl 11040 `"Eritrea"', add
label define bplcountry_mom_lbl 11050 `"Ethiopia"', add
label define bplcountry_mom_lbl 11051 `"Ethiopia (including Eritrea)"', add
label define bplcountry_mom_lbl 11060 `"Kenya"', add
label define bplcountry_mom_lbl 11070 `"Madagascar"', add
label define bplcountry_mom_lbl 11080 `"Malawi"', add
label define bplcountry_mom_lbl 11090 `"Mauritius"', add
label define bplcountry_mom_lbl 11100 `"Mozambique"', add
label define bplcountry_mom_lbl 11110 `"Reunion"', add
label define bplcountry_mom_lbl 11120 `"Rwanda"', add
label define bplcountry_mom_lbl 11130 `"Seychelles"', add
label define bplcountry_mom_lbl 11140 `"Somalia"', add
label define bplcountry_mom_lbl 11150 `"South Sudan"', add
label define bplcountry_mom_lbl 11160 `"Uganda"', add
label define bplcountry_mom_lbl 11170 `"Tanzania"', add
label define bplcountry_mom_lbl 11180 `"Zambia"', add
label define bplcountry_mom_lbl 11190 `"Zimbabwe"', add
label define bplcountry_mom_lbl 11999 `"Eastern Africa, other or n.s."', add
label define bplcountry_mom_lbl 12000 `"Middle Africa"', add
label define bplcountry_mom_lbl 12010 `"Angola"', add
label define bplcountry_mom_lbl 12020 `"Cameroon"', add
label define bplcountry_mom_lbl 12030 `"Central African Republic"', add
label define bplcountry_mom_lbl 12040 `"Chad"', add
label define bplcountry_mom_lbl 12050 `"Congo (Republic of)"', add
label define bplcountry_mom_lbl 12060 `"Democratic Republic of Congo"', add
label define bplcountry_mom_lbl 12070 `"Equatorial Guinea"', add
label define bplcountry_mom_lbl 12080 `"Gabon"', add
label define bplcountry_mom_lbl 12090 `"Sao Tome and Principe"', add
label define bplcountry_mom_lbl 12999 `"Middle Africa, other or n.s."', add
label define bplcountry_mom_lbl 13000 `"Northern Africa"', add
label define bplcountry_mom_lbl 13010 `"Algeria"', add
label define bplcountry_mom_lbl 13011 `"Algeria/Tunisia"', add
label define bplcountry_mom_lbl 13020 `"Egypt"', add
label define bplcountry_mom_lbl 13021 `"Egypt/Sudan"', add
label define bplcountry_mom_lbl 13030 `"Libya"', add
label define bplcountry_mom_lbl 13040 `"Morocco"', add
label define bplcountry_mom_lbl 13050 `"Sudan"', add
label define bplcountry_mom_lbl 13060 `"Tunisia"', add
label define bplcountry_mom_lbl 13070 `"Western Sahara"', add
label define bplcountry_mom_lbl 13999 `"Northern Africa, other or n.s."', add
label define bplcountry_mom_lbl 14000 `"Southern Africa"', add
label define bplcountry_mom_lbl 14010 `"Botswana"', add
label define bplcountry_mom_lbl 14020 `"Lesotho"', add
label define bplcountry_mom_lbl 14030 `"Namibia"', add
label define bplcountry_mom_lbl 14040 `"South Africa"', add
label define bplcountry_mom_lbl 14050 `"Swaziland"', add
label define bplcountry_mom_lbl 14999 `"Southern Africa, other or n.s."', add
label define bplcountry_mom_lbl 15000 `"Western Africa"', add
label define bplcountry_mom_lbl 15010 `"Benin"', add
label define bplcountry_mom_lbl 15020 `"Burkina Faso"', add
label define bplcountry_mom_lbl 15021 `"Upper Volta"', add
label define bplcountry_mom_lbl 15030 `"Cape Verde"', add
label define bplcountry_mom_lbl 15040 `"Ivory Coast"', add
label define bplcountry_mom_lbl 15050 `"Gambia"', add
label define bplcountry_mom_lbl 15060 `"Ghana"', add
label define bplcountry_mom_lbl 15070 `"Guinea"', add
label define bplcountry_mom_lbl 15080 `"Guinea-Bissau"', add
label define bplcountry_mom_lbl 15081 `"Guinea-Bissau and Cape Verde"', add
label define bplcountry_mom_lbl 15090 `"Liberia"', add
label define bplcountry_mom_lbl 15100 `"Mali"', add
label define bplcountry_mom_lbl 15110 `"Mauritania"', add
label define bplcountry_mom_lbl 15120 `"Niger"', add
label define bplcountry_mom_lbl 15130 `"Nigeria"', add
label define bplcountry_mom_lbl 15140 `"St. Helena and Ascension"', add
label define bplcountry_mom_lbl 15150 `"Senegal"', add
label define bplcountry_mom_lbl 15160 `"Sierra Leone"', add
label define bplcountry_mom_lbl 15170 `"Togo"', add
label define bplcountry_mom_lbl 15180 `"Canary Islands"', add
label define bplcountry_mom_lbl 15999 `"West Africa, other or n.s."', add
label define bplcountry_mom_lbl 19999 `"Africa, other or n.s."', add
label define bplcountry_mom_lbl 20000 `"Americas"', add
label define bplcountry_mom_lbl 21000 `"Caribbean"', add
label define bplcountry_mom_lbl 21010 `"Anguilla"', add
label define bplcountry_mom_lbl 21020 `"Antigua-Barbuda"', add
label define bplcountry_mom_lbl 21030 `"Aruba"', add
label define bplcountry_mom_lbl 21040 `"Bahamas"', add
label define bplcountry_mom_lbl 21050 `"Barbados"', add
label define bplcountry_mom_lbl 21060 `"British Virgin Islands"', add
label define bplcountry_mom_lbl 21070 `"Cayman Isles"', add
label define bplcountry_mom_lbl 21080 `"Cuba"', add
label define bplcountry_mom_lbl 21090 `"Dominica"', add
label define bplcountry_mom_lbl 21100 `"Dominican Republic"', add
label define bplcountry_mom_lbl 21110 `"Grenada"', add
label define bplcountry_mom_lbl 21120 `"Guadeloupe"', add
label define bplcountry_mom_lbl 21130 `"Haiti"', add
label define bplcountry_mom_lbl 21140 `"Jamaica"', add
label define bplcountry_mom_lbl 21150 `"Martinique"', add
label define bplcountry_mom_lbl 21160 `"Montserrat"', add
label define bplcountry_mom_lbl 21170 `"Netherlands Antilles"', add
label define bplcountry_mom_lbl 21180 `"Puerto Rico"', add
label define bplcountry_mom_lbl 21190 `"St. Kitts-Nevis"', add
label define bplcountry_mom_lbl 21200 `"St. Croix"', add
label define bplcountry_mom_lbl 21210 `"St. John"', add
label define bplcountry_mom_lbl 21220 `"St. Lucia"', add
label define bplcountry_mom_lbl 21230 `"St Thomas"', add
label define bplcountry_mom_lbl 21240 `"St. Vincent"', add
label define bplcountry_mom_lbl 21250 `"Trinidad and Tobago"', add
label define bplcountry_mom_lbl 21260 `"Turks and Caicos"', add
label define bplcountry_mom_lbl 21270 `"U.S. Virgin Islands"', add
label define bplcountry_mom_lbl 21991 `"Caribbean commonwealth, n.s."', add
label define bplcountry_mom_lbl 21999 `"Caribbean, other or n.s."', add
label define bplcountry_mom_lbl 22000 `"Central America"', add
label define bplcountry_mom_lbl 22010 `"Belize/British Honduras"', add
label define bplcountry_mom_lbl 22020 `"Costa Rica"', add
label define bplcountry_mom_lbl 22030 `"El Salvador"', add
label define bplcountry_mom_lbl 22040 `"Guatemala"', add
label define bplcountry_mom_lbl 22050 `"Honduras"', add
label define bplcountry_mom_lbl 22060 `"Mexico"', add
label define bplcountry_mom_lbl 22070 `"Nicaragua"', add
label define bplcountry_mom_lbl 22080 `"Panama"', add
label define bplcountry_mom_lbl 22081 `"Panama Canal Zone"', add
label define bplcountry_mom_lbl 22999 `"Central America, other or n.s."', add
label define bplcountry_mom_lbl 23000 `"South America"', add
label define bplcountry_mom_lbl 23010 `"Argentina"', add
label define bplcountry_mom_lbl 23020 `"Bolivia"', add
label define bplcountry_mom_lbl 23030 `"Brazil"', add
label define bplcountry_mom_lbl 23040 `"Chile"', add
label define bplcountry_mom_lbl 23050 `"Colombia"', add
label define bplcountry_mom_lbl 23060 `"Ecuador"', add
label define bplcountry_mom_lbl 23070 `"Falkland Islands"', add
label define bplcountry_mom_lbl 23080 `"French Guiana"', add
label define bplcountry_mom_lbl 23090 `"Guyana/British Guiana"', add
label define bplcountry_mom_lbl 23100 `"Paraguay"', add
label define bplcountry_mom_lbl 23110 `"Peru"', add
label define bplcountry_mom_lbl 23120 `"Suriname"', add
label define bplcountry_mom_lbl 23130 `"Uruguay"', add
label define bplcountry_mom_lbl 23140 `"Venezuela"', add
label define bplcountry_mom_lbl 23999 `"South America, other or n.s."', add
label define bplcountry_mom_lbl 24000 `"North America"', add
label define bplcountry_mom_lbl 24010 `"Bermuda"', add
label define bplcountry_mom_lbl 24020 `"Canada"', add
label define bplcountry_mom_lbl 24030 `"Greenland"', add
label define bplcountry_mom_lbl 24040 `"United States"', add
label define bplcountry_mom_lbl 24999 `"North America, other or n.s."', add
label define bplcountry_mom_lbl 29999 `"Americas, other or n.s."', add
label define bplcountry_mom_lbl 30000 `"Asia"', add
label define bplcountry_mom_lbl 31000 `"Eastern Asia"', add
label define bplcountry_mom_lbl 31010 `"China"', add
label define bplcountry_mom_lbl 31011 `"Hong Kong"', add
label define bplcountry_mom_lbl 31012 `"Macau"', add
label define bplcountry_mom_lbl 31013 `"Taiwan"', add
label define bplcountry_mom_lbl 31020 `"Japan"', add
label define bplcountry_mom_lbl 31030 `"Korea"', add
label define bplcountry_mom_lbl 31031 `"Korea, DPR (North)"', add
label define bplcountry_mom_lbl 31032 `"Korea, RO (South)"', add
label define bplcountry_mom_lbl 31040 `"Mongolia"', add
label define bplcountry_mom_lbl 31999 `"Eastern Asia, other or n.s."', add
label define bplcountry_mom_lbl 32000 `"South-Central Asia"', add
label define bplcountry_mom_lbl 32010 `"Afghanistan"', add
label define bplcountry_mom_lbl 32020 `"Bangladesh"', add
label define bplcountry_mom_lbl 32030 `"Bhutan"', add
label define bplcountry_mom_lbl 32040 `"India"', add
label define bplcountry_mom_lbl 32041 `"India/Pakistan"', add
label define bplcountry_mom_lbl 32042 `"India/Pakistan/Bangladesh/Sri Lanka"', add
label define bplcountry_mom_lbl 32050 `"Iran"', add
label define bplcountry_mom_lbl 32060 `"Kazakhstan"', add
label define bplcountry_mom_lbl 32070 `"Kyrgyzstan"', add
label define bplcountry_mom_lbl 32080 `"Maldives"', add
label define bplcountry_mom_lbl 32090 `"Nepal"', add
label define bplcountry_mom_lbl 32100 `"Pakistan"', add
label define bplcountry_mom_lbl 32101 `"Pakistan/Bangladesh"', add
label define bplcountry_mom_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define bplcountry_mom_lbl 32120 `"Tajikistan"', add
label define bplcountry_mom_lbl 32130 `"Turkmenistan"', add
label define bplcountry_mom_lbl 32140 `"Uzbekistan"', add
label define bplcountry_mom_lbl 32999 `"South-Central Asia, other or n.s."', add
label define bplcountry_mom_lbl 33000 `"South-Eastern Asia"', add
label define bplcountry_mom_lbl 33010 `"Brunei"', add
label define bplcountry_mom_lbl 33020 `"Cambodia (Kampuchea)"', add
label define bplcountry_mom_lbl 33030 `"East Timor"', add
label define bplcountry_mom_lbl 33040 `"Indonesia"', add
label define bplcountry_mom_lbl 33050 `"Laos"', add
label define bplcountry_mom_lbl 33060 `"Malaysia"', add
label define bplcountry_mom_lbl 33070 `"Myanmar (Burma)"', add
label define bplcountry_mom_lbl 33080 `"Philippines"', add
label define bplcountry_mom_lbl 33090 `"Singapore"', add
label define bplcountry_mom_lbl 33100 `"Thailand"', add
label define bplcountry_mom_lbl 33110 `"Vietnam"', add
label define bplcountry_mom_lbl 33999 `"South-Eastern Asia, other or n.s."', add
label define bplcountry_mom_lbl 34000 `"Western Asia"', add
label define bplcountry_mom_lbl 34010 `"Armenia"', add
label define bplcountry_mom_lbl 34020 `"Azerbaijan"', add
label define bplcountry_mom_lbl 34030 `"Bahrain"', add
label define bplcountry_mom_lbl 34040 `"Cyprus"', add
label define bplcountry_mom_lbl 34050 `"Georgia"', add
label define bplcountry_mom_lbl 34051 `"Abkhazia"', add
label define bplcountry_mom_lbl 34052 `"South Ossetia"', add
label define bplcountry_mom_lbl 34060 `"Iraq"', add
label define bplcountry_mom_lbl 34070 `"Israel"', add
label define bplcountry_mom_lbl 34071 `"Israel/Palestine"', add
label define bplcountry_mom_lbl 34080 `"Jordan"', add
label define bplcountry_mom_lbl 34090 `"Kuwait"', add
label define bplcountry_mom_lbl 34100 `"Lebanon"', add
label define bplcountry_mom_lbl 34110 `"Palestine"', add
label define bplcountry_mom_lbl 34111 `"West Bank"', add
label define bplcountry_mom_lbl 34112 `"Gaza Strip"', add
label define bplcountry_mom_lbl 34120 `"Oman"', add
label define bplcountry_mom_lbl 34130 `"Qatar"', add
label define bplcountry_mom_lbl 34140 `"Saudi Arabia"', add
label define bplcountry_mom_lbl 34150 `"Syria"', add
label define bplcountry_mom_lbl 34151 `"Syria/Lebanon"', add
label define bplcountry_mom_lbl 34160 `"Turkey"', add
label define bplcountry_mom_lbl 34170 `"United Arab Emirates"', add
label define bplcountry_mom_lbl 34180 `"Yemen"', add
label define bplcountry_mom_lbl 34991 `"Middle East"', add
label define bplcountry_mom_lbl 34999 `"Western Asia, other or n.s."', add
label define bplcountry_mom_lbl 39999 `"Asia, other or n.s."', add
label define bplcountry_mom_lbl 40000 `"Europe"', add
label define bplcountry_mom_lbl 41000 `"Eastern Europe"', add
label define bplcountry_mom_lbl 41010 `"Belarus"', add
label define bplcountry_mom_lbl 41020 `"Bulgaria"', add
label define bplcountry_mom_lbl 41021 `"Bulgaria/Greece"', add
label define bplcountry_mom_lbl 41030 `"Czech Republic/Czechoslovakia"', add
label define bplcountry_mom_lbl 41040 `"Hungary"', add
label define bplcountry_mom_lbl 41050 `"Poland"', add
label define bplcountry_mom_lbl 41060 `"Moldova"', add
label define bplcountry_mom_lbl 41070 `"Romania"', add
label define bplcountry_mom_lbl 41080 `"Russia/USSR"', add
label define bplcountry_mom_lbl 41090 `"Slovakia"', add
label define bplcountry_mom_lbl 41100 `"Ukraine"', add
label define bplcountry_mom_lbl 41991 `"Albania, Bulgaria, Czech, Hungary, Romania, Yugoslavia"', add
label define bplcountry_mom_lbl 41992 `"Central-Eastern Europe"', add
label define bplcountry_mom_lbl 41999 `"Eastern Europe, other or n.s."', add
label define bplcountry_mom_lbl 42000 `"Northern Europe"', add
label define bplcountry_mom_lbl 42010 `"Denmark"', add
label define bplcountry_mom_lbl 42020 `"Estonia"', add
label define bplcountry_mom_lbl 42030 `"Faroe Islands"', add
label define bplcountry_mom_lbl 42040 `"Finland"', add
label define bplcountry_mom_lbl 42050 `"Iceland"', add
label define bplcountry_mom_lbl 42060 `"Ireland"', add
label define bplcountry_mom_lbl 42070 `"Latvia"', add
label define bplcountry_mom_lbl 42080 `"Lithuania"', add
label define bplcountry_mom_lbl 42090 `"Norway"', add
label define bplcountry_mom_lbl 42100 `"Svalbard and Jan Mayen Islands"', add
label define bplcountry_mom_lbl 42110 `"Sweden"', add
label define bplcountry_mom_lbl 42120 `"United Kingdom"', add
label define bplcountry_mom_lbl 42999 `"Northern Europe, other or n.s."', add
label define bplcountry_mom_lbl 43000 `"Southern Europe"', add
label define bplcountry_mom_lbl 43010 `"Albania"', add
label define bplcountry_mom_lbl 43020 `"Andorra"', add
label define bplcountry_mom_lbl 43030 `"Bosnia and Herzegovina"', add
label define bplcountry_mom_lbl 43040 `"Croatia"', add
label define bplcountry_mom_lbl 43050 `"Gibraltar"', add
label define bplcountry_mom_lbl 43060 `"Greece"', add
label define bplcountry_mom_lbl 43070 `"Italy"', add
label define bplcountry_mom_lbl 43071 `"Vatican City"', add
label define bplcountry_mom_lbl 43080 `"Malta"', add
label define bplcountry_mom_lbl 43090 `"Portugal"', add
label define bplcountry_mom_lbl 43100 `"San Marino"', add
label define bplcountry_mom_lbl 43110 `"Slovenia"', add
label define bplcountry_mom_lbl 43120 `"Spain"', add
label define bplcountry_mom_lbl 43121 `"Spain/Portugal"', add
label define bplcountry_mom_lbl 43130 `"Macedonia"', add
label define bplcountry_mom_lbl 43140 `"Yugoslavia"', add
label define bplcountry_mom_lbl 43141 `"Montenegro"', add
label define bplcountry_mom_lbl 43142 `"Serbia"', add
label define bplcountry_mom_lbl 43143 `"Kosovo"', add
label define bplcountry_mom_lbl 43144 `"Serbia and Montenegro"', add
label define bplcountry_mom_lbl 43991 `"Gibraltar/Malta"', add
label define bplcountry_mom_lbl 43992 `"Portugal/Greece"', add
label define bplcountry_mom_lbl 43993 `"Italy, Holy See, San Marino"', add
label define bplcountry_mom_lbl 43999 `"Southern Europe, other or n.s."', add
label define bplcountry_mom_lbl 44000 `"Western Europe"', add
label define bplcountry_mom_lbl 44010 `"Austria"', add
label define bplcountry_mom_lbl 44020 `"Belgium"', add
label define bplcountry_mom_lbl 44021 `"Belgium/Luxemburg"', add
label define bplcountry_mom_lbl 44022 `"Belgium/Netherlands/Luxemburg"', add
label define bplcountry_mom_lbl 44030 `"France"', add
label define bplcountry_mom_lbl 44040 `"Germany"', add
label define bplcountry_mom_lbl 44042 `"West Germany"', add
label define bplcountry_mom_lbl 44043 `"Germany/Austria"', add
label define bplcountry_mom_lbl 44044 `"Mecklenburg-Schwerin"', add
label define bplcountry_mom_lbl 44050 `"Liechtenstein"', add
label define bplcountry_mom_lbl 44060 `"Luxembourg"', add
label define bplcountry_mom_lbl 44070 `"Monaco"', add
label define bplcountry_mom_lbl 44080 `"Netherlands"', add
label define bplcountry_mom_lbl 44090 `"Switzerland"', add
label define bplcountry_mom_lbl 44991 `"Belgium, Denmark, Luxembourg, Netherlands"', add
label define bplcountry_mom_lbl 44999 `"Western Europe, other or n.s."', add
label define bplcountry_mom_lbl 49992 `"European Union"', add
label define bplcountry_mom_lbl 49993 `"European Union (original 15)"', add
label define bplcountry_mom_lbl 49994 `"Other European Union (not original 15)"', add
label define bplcountry_mom_lbl 49999 `"Europe, other or n.s."', add
label define bplcountry_mom_lbl 50000 `"Oceania"', add
label define bplcountry_mom_lbl 51000 `"Australia and New Zealand"', add
label define bplcountry_mom_lbl 51010 `"Australia"', add
label define bplcountry_mom_lbl 51020 `"New Zealand"', add
label define bplcountry_mom_lbl 51030 `"Norfolk Islands"', add
label define bplcountry_mom_lbl 51999 `"Australia and New Zealand, n.s."', add
label define bplcountry_mom_lbl 52000 `"Melanesia"', add
label define bplcountry_mom_lbl 52010 `"Fiji"', add
label define bplcountry_mom_lbl 52020 `"New Caledonia"', add
label define bplcountry_mom_lbl 52030 `"Papua New Guinea"', add
label define bplcountry_mom_lbl 52040 `"Solomon Islands"', add
label define bplcountry_mom_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define bplcountry_mom_lbl 52999 `"Melanesia, n.s."', add
label define bplcountry_mom_lbl 53000 `"Micronesia"', add
label define bplcountry_mom_lbl 53010 `"Kiribati"', add
label define bplcountry_mom_lbl 53020 `"Marshall Islands"', add
label define bplcountry_mom_lbl 53030 `"Nauru"', add
label define bplcountry_mom_lbl 53040 `"Northern Mariana Isls."', add
label define bplcountry_mom_lbl 53050 `"Palau"', add
label define bplcountry_mom_lbl 53060 `"Federated States of Micronesia"', add
label define bplcountry_mom_lbl 53999 `"Micronesia, other or n.s."', add
label define bplcountry_mom_lbl 54000 `"Polynesia"', add
label define bplcountry_mom_lbl 54010 `"Cook Islands"', add
label define bplcountry_mom_lbl 54020 `"French Polynesia"', add
label define bplcountry_mom_lbl 54030 `"Niue"', add
label define bplcountry_mom_lbl 54040 `"Pitcairn Island"', add
label define bplcountry_mom_lbl 54050 `"Western Samoa"', add
label define bplcountry_mom_lbl 54060 `"Eastern Samoa"', add
label define bplcountry_mom_lbl 54070 `"Tokelau"', add
label define bplcountry_mom_lbl 54080 `"Tonga"', add
label define bplcountry_mom_lbl 54090 `"Tuvalu"', add
label define bplcountry_mom_lbl 54100 `"Wallis and Futuna Isls."', add
label define bplcountry_mom_lbl 54999 `"Polynesia, other or n.s."', add
label define bplcountry_mom_lbl 55000 `"U.S. Pacific Possessions"', add
label define bplcountry_mom_lbl 55010 `"American Samoa"', add
label define bplcountry_mom_lbl 55020 `"Baker Island"', add
label define bplcountry_mom_lbl 55030 `"Guam"', add
label define bplcountry_mom_lbl 55040 `"Howland Island"', add
label define bplcountry_mom_lbl 55050 `"Johnston Atoll"', add
label define bplcountry_mom_lbl 55060 `"Kingman Reef"', add
label define bplcountry_mom_lbl 55070 `"Midway Islands"', add
label define bplcountry_mom_lbl 55080 `"Wake Island"', add
label define bplcountry_mom_lbl 55999 `"US Pacific, other or n.s."', add
label define bplcountry_mom_lbl 59999 `"Oceania, other or n.s."', add
label define bplcountry_mom_lbl 80000 `"AT SEA"', add
label define bplcountry_mom_lbl 90000 `"Other countries n.s."', add
label define bplcountry_mom_lbl 99999 `"Unknown"', add
label values bplcountry_mom bplcountry_mom_lbl

label define bplcountry_pop_lbl 00000 `"NIU (not in universe)"'
label define bplcountry_pop_lbl 10000 `"Africa"', add
label define bplcountry_pop_lbl 11000 `"Eastern Africa"', add
label define bplcountry_pop_lbl 11005 `"British Indian Ocean Territory"', add
label define bplcountry_pop_lbl 11010 `"Burundi"', add
label define bplcountry_pop_lbl 11020 `"Comoros"', add
label define bplcountry_pop_lbl 11030 `"Djibouti"', add
label define bplcountry_pop_lbl 11040 `"Eritrea"', add
label define bplcountry_pop_lbl 11050 `"Ethiopia"', add
label define bplcountry_pop_lbl 11051 `"Ethiopia (including Eritrea)"', add
label define bplcountry_pop_lbl 11060 `"Kenya"', add
label define bplcountry_pop_lbl 11070 `"Madagascar"', add
label define bplcountry_pop_lbl 11080 `"Malawi"', add
label define bplcountry_pop_lbl 11090 `"Mauritius"', add
label define bplcountry_pop_lbl 11100 `"Mozambique"', add
label define bplcountry_pop_lbl 11110 `"Reunion"', add
label define bplcountry_pop_lbl 11120 `"Rwanda"', add
label define bplcountry_pop_lbl 11130 `"Seychelles"', add
label define bplcountry_pop_lbl 11140 `"Somalia"', add
label define bplcountry_pop_lbl 11150 `"South Sudan"', add
label define bplcountry_pop_lbl 11160 `"Uganda"', add
label define bplcountry_pop_lbl 11170 `"Tanzania"', add
label define bplcountry_pop_lbl 11180 `"Zambia"', add
label define bplcountry_pop_lbl 11190 `"Zimbabwe"', add
label define bplcountry_pop_lbl 11999 `"Eastern Africa, other or n.s."', add
label define bplcountry_pop_lbl 12000 `"Middle Africa"', add
label define bplcountry_pop_lbl 12010 `"Angola"', add
label define bplcountry_pop_lbl 12020 `"Cameroon"', add
label define bplcountry_pop_lbl 12030 `"Central African Republic"', add
label define bplcountry_pop_lbl 12040 `"Chad"', add
label define bplcountry_pop_lbl 12050 `"Congo (Republic of)"', add
label define bplcountry_pop_lbl 12060 `"Democratic Republic of Congo"', add
label define bplcountry_pop_lbl 12070 `"Equatorial Guinea"', add
label define bplcountry_pop_lbl 12080 `"Gabon"', add
label define bplcountry_pop_lbl 12090 `"Sao Tome and Principe"', add
label define bplcountry_pop_lbl 12999 `"Middle Africa, other or n.s."', add
label define bplcountry_pop_lbl 13000 `"Northern Africa"', add
label define bplcountry_pop_lbl 13010 `"Algeria"', add
label define bplcountry_pop_lbl 13011 `"Algeria/Tunisia"', add
label define bplcountry_pop_lbl 13020 `"Egypt"', add
label define bplcountry_pop_lbl 13021 `"Egypt/Sudan"', add
label define bplcountry_pop_lbl 13030 `"Libya"', add
label define bplcountry_pop_lbl 13040 `"Morocco"', add
label define bplcountry_pop_lbl 13050 `"Sudan"', add
label define bplcountry_pop_lbl 13060 `"Tunisia"', add
label define bplcountry_pop_lbl 13070 `"Western Sahara"', add
label define bplcountry_pop_lbl 13999 `"Northern Africa, other or n.s."', add
label define bplcountry_pop_lbl 14000 `"Southern Africa"', add
label define bplcountry_pop_lbl 14010 `"Botswana"', add
label define bplcountry_pop_lbl 14020 `"Lesotho"', add
label define bplcountry_pop_lbl 14030 `"Namibia"', add
label define bplcountry_pop_lbl 14040 `"South Africa"', add
label define bplcountry_pop_lbl 14050 `"Swaziland"', add
label define bplcountry_pop_lbl 14999 `"Southern Africa, other or n.s."', add
label define bplcountry_pop_lbl 15000 `"Western Africa"', add
label define bplcountry_pop_lbl 15010 `"Benin"', add
label define bplcountry_pop_lbl 15020 `"Burkina Faso"', add
label define bplcountry_pop_lbl 15021 `"Upper Volta"', add
label define bplcountry_pop_lbl 15030 `"Cape Verde"', add
label define bplcountry_pop_lbl 15040 `"Ivory Coast"', add
label define bplcountry_pop_lbl 15050 `"Gambia"', add
label define bplcountry_pop_lbl 15060 `"Ghana"', add
label define bplcountry_pop_lbl 15070 `"Guinea"', add
label define bplcountry_pop_lbl 15080 `"Guinea-Bissau"', add
label define bplcountry_pop_lbl 15081 `"Guinea-Bissau and Cape Verde"', add
label define bplcountry_pop_lbl 15090 `"Liberia"', add
label define bplcountry_pop_lbl 15100 `"Mali"', add
label define bplcountry_pop_lbl 15110 `"Mauritania"', add
label define bplcountry_pop_lbl 15120 `"Niger"', add
label define bplcountry_pop_lbl 15130 `"Nigeria"', add
label define bplcountry_pop_lbl 15140 `"St. Helena and Ascension"', add
label define bplcountry_pop_lbl 15150 `"Senegal"', add
label define bplcountry_pop_lbl 15160 `"Sierra Leone"', add
label define bplcountry_pop_lbl 15170 `"Togo"', add
label define bplcountry_pop_lbl 15180 `"Canary Islands"', add
label define bplcountry_pop_lbl 15999 `"West Africa, other or n.s."', add
label define bplcountry_pop_lbl 19999 `"Africa, other or n.s."', add
label define bplcountry_pop_lbl 20000 `"Americas"', add
label define bplcountry_pop_lbl 21000 `"Caribbean"', add
label define bplcountry_pop_lbl 21010 `"Anguilla"', add
label define bplcountry_pop_lbl 21020 `"Antigua-Barbuda"', add
label define bplcountry_pop_lbl 21030 `"Aruba"', add
label define bplcountry_pop_lbl 21040 `"Bahamas"', add
label define bplcountry_pop_lbl 21050 `"Barbados"', add
label define bplcountry_pop_lbl 21060 `"British Virgin Islands"', add
label define bplcountry_pop_lbl 21070 `"Cayman Isles"', add
label define bplcountry_pop_lbl 21080 `"Cuba"', add
label define bplcountry_pop_lbl 21090 `"Dominica"', add
label define bplcountry_pop_lbl 21100 `"Dominican Republic"', add
label define bplcountry_pop_lbl 21110 `"Grenada"', add
label define bplcountry_pop_lbl 21120 `"Guadeloupe"', add
label define bplcountry_pop_lbl 21130 `"Haiti"', add
label define bplcountry_pop_lbl 21140 `"Jamaica"', add
label define bplcountry_pop_lbl 21150 `"Martinique"', add
label define bplcountry_pop_lbl 21160 `"Montserrat"', add
label define bplcountry_pop_lbl 21170 `"Netherlands Antilles"', add
label define bplcountry_pop_lbl 21180 `"Puerto Rico"', add
label define bplcountry_pop_lbl 21190 `"St. Kitts-Nevis"', add
label define bplcountry_pop_lbl 21200 `"St. Croix"', add
label define bplcountry_pop_lbl 21210 `"St. John"', add
label define bplcountry_pop_lbl 21220 `"St. Lucia"', add
label define bplcountry_pop_lbl 21230 `"St Thomas"', add
label define bplcountry_pop_lbl 21240 `"St. Vincent"', add
label define bplcountry_pop_lbl 21250 `"Trinidad and Tobago"', add
label define bplcountry_pop_lbl 21260 `"Turks and Caicos"', add
label define bplcountry_pop_lbl 21270 `"U.S. Virgin Islands"', add
label define bplcountry_pop_lbl 21991 `"Caribbean commonwealth, n.s."', add
label define bplcountry_pop_lbl 21999 `"Caribbean, other or n.s."', add
label define bplcountry_pop_lbl 22000 `"Central America"', add
label define bplcountry_pop_lbl 22010 `"Belize/British Honduras"', add
label define bplcountry_pop_lbl 22020 `"Costa Rica"', add
label define bplcountry_pop_lbl 22030 `"El Salvador"', add
label define bplcountry_pop_lbl 22040 `"Guatemala"', add
label define bplcountry_pop_lbl 22050 `"Honduras"', add
label define bplcountry_pop_lbl 22060 `"Mexico"', add
label define bplcountry_pop_lbl 22070 `"Nicaragua"', add
label define bplcountry_pop_lbl 22080 `"Panama"', add
label define bplcountry_pop_lbl 22081 `"Panama Canal Zone"', add
label define bplcountry_pop_lbl 22999 `"Central America, other or n.s."', add
label define bplcountry_pop_lbl 23000 `"South America"', add
label define bplcountry_pop_lbl 23010 `"Argentina"', add
label define bplcountry_pop_lbl 23020 `"Bolivia"', add
label define bplcountry_pop_lbl 23030 `"Brazil"', add
label define bplcountry_pop_lbl 23040 `"Chile"', add
label define bplcountry_pop_lbl 23050 `"Colombia"', add
label define bplcountry_pop_lbl 23060 `"Ecuador"', add
label define bplcountry_pop_lbl 23070 `"Falkland Islands"', add
label define bplcountry_pop_lbl 23080 `"French Guiana"', add
label define bplcountry_pop_lbl 23090 `"Guyana/British Guiana"', add
label define bplcountry_pop_lbl 23100 `"Paraguay"', add
label define bplcountry_pop_lbl 23110 `"Peru"', add
label define bplcountry_pop_lbl 23120 `"Suriname"', add
label define bplcountry_pop_lbl 23130 `"Uruguay"', add
label define bplcountry_pop_lbl 23140 `"Venezuela"', add
label define bplcountry_pop_lbl 23999 `"South America, other or n.s."', add
label define bplcountry_pop_lbl 24000 `"North America"', add
label define bplcountry_pop_lbl 24010 `"Bermuda"', add
label define bplcountry_pop_lbl 24020 `"Canada"', add
label define bplcountry_pop_lbl 24030 `"Greenland"', add
label define bplcountry_pop_lbl 24040 `"United States"', add
label define bplcountry_pop_lbl 24999 `"North America, other or n.s."', add
label define bplcountry_pop_lbl 29999 `"Americas, other or n.s."', add
label define bplcountry_pop_lbl 30000 `"Asia"', add
label define bplcountry_pop_lbl 31000 `"Eastern Asia"', add
label define bplcountry_pop_lbl 31010 `"China"', add
label define bplcountry_pop_lbl 31011 `"Hong Kong"', add
label define bplcountry_pop_lbl 31012 `"Macau"', add
label define bplcountry_pop_lbl 31013 `"Taiwan"', add
label define bplcountry_pop_lbl 31020 `"Japan"', add
label define bplcountry_pop_lbl 31030 `"Korea"', add
label define bplcountry_pop_lbl 31031 `"Korea, DPR (North)"', add
label define bplcountry_pop_lbl 31032 `"Korea, RO (South)"', add
label define bplcountry_pop_lbl 31040 `"Mongolia"', add
label define bplcountry_pop_lbl 31999 `"Eastern Asia, other or n.s."', add
label define bplcountry_pop_lbl 32000 `"South-Central Asia"', add
label define bplcountry_pop_lbl 32010 `"Afghanistan"', add
label define bplcountry_pop_lbl 32020 `"Bangladesh"', add
label define bplcountry_pop_lbl 32030 `"Bhutan"', add
label define bplcountry_pop_lbl 32040 `"India"', add
label define bplcountry_pop_lbl 32041 `"India/Pakistan"', add
label define bplcountry_pop_lbl 32042 `"India/Pakistan/Bangladesh/Sri Lanka"', add
label define bplcountry_pop_lbl 32050 `"Iran"', add
label define bplcountry_pop_lbl 32060 `"Kazakhstan"', add
label define bplcountry_pop_lbl 32070 `"Kyrgyzstan"', add
label define bplcountry_pop_lbl 32080 `"Maldives"', add
label define bplcountry_pop_lbl 32090 `"Nepal"', add
label define bplcountry_pop_lbl 32100 `"Pakistan"', add
label define bplcountry_pop_lbl 32101 `"Pakistan/Bangladesh"', add
label define bplcountry_pop_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define bplcountry_pop_lbl 32120 `"Tajikistan"', add
label define bplcountry_pop_lbl 32130 `"Turkmenistan"', add
label define bplcountry_pop_lbl 32140 `"Uzbekistan"', add
label define bplcountry_pop_lbl 32999 `"South-Central Asia, other or n.s."', add
label define bplcountry_pop_lbl 33000 `"South-Eastern Asia"', add
label define bplcountry_pop_lbl 33010 `"Brunei"', add
label define bplcountry_pop_lbl 33020 `"Cambodia (Kampuchea)"', add
label define bplcountry_pop_lbl 33030 `"East Timor"', add
label define bplcountry_pop_lbl 33040 `"Indonesia"', add
label define bplcountry_pop_lbl 33050 `"Laos"', add
label define bplcountry_pop_lbl 33060 `"Malaysia"', add
label define bplcountry_pop_lbl 33070 `"Myanmar (Burma)"', add
label define bplcountry_pop_lbl 33080 `"Philippines"', add
label define bplcountry_pop_lbl 33090 `"Singapore"', add
label define bplcountry_pop_lbl 33100 `"Thailand"', add
label define bplcountry_pop_lbl 33110 `"Vietnam"', add
label define bplcountry_pop_lbl 33999 `"South-Eastern Asia, other or n.s."', add
label define bplcountry_pop_lbl 34000 `"Western Asia"', add
label define bplcountry_pop_lbl 34010 `"Armenia"', add
label define bplcountry_pop_lbl 34020 `"Azerbaijan"', add
label define bplcountry_pop_lbl 34030 `"Bahrain"', add
label define bplcountry_pop_lbl 34040 `"Cyprus"', add
label define bplcountry_pop_lbl 34050 `"Georgia"', add
label define bplcountry_pop_lbl 34051 `"Abkhazia"', add
label define bplcountry_pop_lbl 34052 `"South Ossetia"', add
label define bplcountry_pop_lbl 34060 `"Iraq"', add
label define bplcountry_pop_lbl 34070 `"Israel"', add
label define bplcountry_pop_lbl 34071 `"Israel/Palestine"', add
label define bplcountry_pop_lbl 34080 `"Jordan"', add
label define bplcountry_pop_lbl 34090 `"Kuwait"', add
label define bplcountry_pop_lbl 34100 `"Lebanon"', add
label define bplcountry_pop_lbl 34110 `"Palestine"', add
label define bplcountry_pop_lbl 34111 `"West Bank"', add
label define bplcountry_pop_lbl 34112 `"Gaza Strip"', add
label define bplcountry_pop_lbl 34120 `"Oman"', add
label define bplcountry_pop_lbl 34130 `"Qatar"', add
label define bplcountry_pop_lbl 34140 `"Saudi Arabia"', add
label define bplcountry_pop_lbl 34150 `"Syria"', add
label define bplcountry_pop_lbl 34151 `"Syria/Lebanon"', add
label define bplcountry_pop_lbl 34160 `"Turkey"', add
label define bplcountry_pop_lbl 34170 `"United Arab Emirates"', add
label define bplcountry_pop_lbl 34180 `"Yemen"', add
label define bplcountry_pop_lbl 34991 `"Middle East"', add
label define bplcountry_pop_lbl 34999 `"Western Asia, other or n.s."', add
label define bplcountry_pop_lbl 39999 `"Asia, other or n.s."', add
label define bplcountry_pop_lbl 40000 `"Europe"', add
label define bplcountry_pop_lbl 41000 `"Eastern Europe"', add
label define bplcountry_pop_lbl 41010 `"Belarus"', add
label define bplcountry_pop_lbl 41020 `"Bulgaria"', add
label define bplcountry_pop_lbl 41021 `"Bulgaria/Greece"', add
label define bplcountry_pop_lbl 41030 `"Czech Republic/Czechoslovakia"', add
label define bplcountry_pop_lbl 41040 `"Hungary"', add
label define bplcountry_pop_lbl 41050 `"Poland"', add
label define bplcountry_pop_lbl 41060 `"Moldova"', add
label define bplcountry_pop_lbl 41070 `"Romania"', add
label define bplcountry_pop_lbl 41080 `"Russia/USSR"', add
label define bplcountry_pop_lbl 41090 `"Slovakia"', add
label define bplcountry_pop_lbl 41100 `"Ukraine"', add
label define bplcountry_pop_lbl 41991 `"Albania, Bulgaria, Czech, Hungary, Romania, Yugoslavia"', add
label define bplcountry_pop_lbl 41992 `"Central-Eastern Europe"', add
label define bplcountry_pop_lbl 41999 `"Eastern Europe, other or n.s."', add
label define bplcountry_pop_lbl 42000 `"Northern Europe"', add
label define bplcountry_pop_lbl 42010 `"Denmark"', add
label define bplcountry_pop_lbl 42020 `"Estonia"', add
label define bplcountry_pop_lbl 42030 `"Faroe Islands"', add
label define bplcountry_pop_lbl 42040 `"Finland"', add
label define bplcountry_pop_lbl 42050 `"Iceland"', add
label define bplcountry_pop_lbl 42060 `"Ireland"', add
label define bplcountry_pop_lbl 42070 `"Latvia"', add
label define bplcountry_pop_lbl 42080 `"Lithuania"', add
label define bplcountry_pop_lbl 42090 `"Norway"', add
label define bplcountry_pop_lbl 42100 `"Svalbard and Jan Mayen Islands"', add
label define bplcountry_pop_lbl 42110 `"Sweden"', add
label define bplcountry_pop_lbl 42120 `"United Kingdom"', add
label define bplcountry_pop_lbl 42999 `"Northern Europe, other or n.s."', add
label define bplcountry_pop_lbl 43000 `"Southern Europe"', add
label define bplcountry_pop_lbl 43010 `"Albania"', add
label define bplcountry_pop_lbl 43020 `"Andorra"', add
label define bplcountry_pop_lbl 43030 `"Bosnia and Herzegovina"', add
label define bplcountry_pop_lbl 43040 `"Croatia"', add
label define bplcountry_pop_lbl 43050 `"Gibraltar"', add
label define bplcountry_pop_lbl 43060 `"Greece"', add
label define bplcountry_pop_lbl 43070 `"Italy"', add
label define bplcountry_pop_lbl 43071 `"Vatican City"', add
label define bplcountry_pop_lbl 43080 `"Malta"', add
label define bplcountry_pop_lbl 43090 `"Portugal"', add
label define bplcountry_pop_lbl 43100 `"San Marino"', add
label define bplcountry_pop_lbl 43110 `"Slovenia"', add
label define bplcountry_pop_lbl 43120 `"Spain"', add
label define bplcountry_pop_lbl 43121 `"Spain/Portugal"', add
label define bplcountry_pop_lbl 43130 `"Macedonia"', add
label define bplcountry_pop_lbl 43140 `"Yugoslavia"', add
label define bplcountry_pop_lbl 43141 `"Montenegro"', add
label define bplcountry_pop_lbl 43142 `"Serbia"', add
label define bplcountry_pop_lbl 43143 `"Kosovo"', add
label define bplcountry_pop_lbl 43144 `"Serbia and Montenegro"', add
label define bplcountry_pop_lbl 43991 `"Gibraltar/Malta"', add
label define bplcountry_pop_lbl 43992 `"Portugal/Greece"', add
label define bplcountry_pop_lbl 43993 `"Italy, Holy See, San Marino"', add
label define bplcountry_pop_lbl 43999 `"Southern Europe, other or n.s."', add
label define bplcountry_pop_lbl 44000 `"Western Europe"', add
label define bplcountry_pop_lbl 44010 `"Austria"', add
label define bplcountry_pop_lbl 44020 `"Belgium"', add
label define bplcountry_pop_lbl 44021 `"Belgium/Luxemburg"', add
label define bplcountry_pop_lbl 44022 `"Belgium/Netherlands/Luxemburg"', add
label define bplcountry_pop_lbl 44030 `"France"', add
label define bplcountry_pop_lbl 44040 `"Germany"', add
label define bplcountry_pop_lbl 44042 `"West Germany"', add
label define bplcountry_pop_lbl 44043 `"Germany/Austria"', add
label define bplcountry_pop_lbl 44044 `"Mecklenburg-Schwerin"', add
label define bplcountry_pop_lbl 44050 `"Liechtenstein"', add
label define bplcountry_pop_lbl 44060 `"Luxembourg"', add
label define bplcountry_pop_lbl 44070 `"Monaco"', add
label define bplcountry_pop_lbl 44080 `"Netherlands"', add
label define bplcountry_pop_lbl 44090 `"Switzerland"', add
label define bplcountry_pop_lbl 44991 `"Belgium, Denmark, Luxembourg, Netherlands"', add
label define bplcountry_pop_lbl 44999 `"Western Europe, other or n.s."', add
label define bplcountry_pop_lbl 49992 `"European Union"', add
label define bplcountry_pop_lbl 49993 `"European Union (original 15)"', add
label define bplcountry_pop_lbl 49994 `"Other European Union (not original 15)"', add
label define bplcountry_pop_lbl 49999 `"Europe, other or n.s."', add
label define bplcountry_pop_lbl 50000 `"Oceania"', add
label define bplcountry_pop_lbl 51000 `"Australia and New Zealand"', add
label define bplcountry_pop_lbl 51010 `"Australia"', add
label define bplcountry_pop_lbl 51020 `"New Zealand"', add
label define bplcountry_pop_lbl 51030 `"Norfolk Islands"', add
label define bplcountry_pop_lbl 51999 `"Australia and New Zealand, n.s."', add
label define bplcountry_pop_lbl 52000 `"Melanesia"', add
label define bplcountry_pop_lbl 52010 `"Fiji"', add
label define bplcountry_pop_lbl 52020 `"New Caledonia"', add
label define bplcountry_pop_lbl 52030 `"Papua New Guinea"', add
label define bplcountry_pop_lbl 52040 `"Solomon Islands"', add
label define bplcountry_pop_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define bplcountry_pop_lbl 52999 `"Melanesia, n.s."', add
label define bplcountry_pop_lbl 53000 `"Micronesia"', add
label define bplcountry_pop_lbl 53010 `"Kiribati"', add
label define bplcountry_pop_lbl 53020 `"Marshall Islands"', add
label define bplcountry_pop_lbl 53030 `"Nauru"', add
label define bplcountry_pop_lbl 53040 `"Northern Mariana Isls."', add
label define bplcountry_pop_lbl 53050 `"Palau"', add
label define bplcountry_pop_lbl 53060 `"Federated States of Micronesia"', add
label define bplcountry_pop_lbl 53999 `"Micronesia, other or n.s."', add
label define bplcountry_pop_lbl 54000 `"Polynesia"', add
label define bplcountry_pop_lbl 54010 `"Cook Islands"', add
label define bplcountry_pop_lbl 54020 `"French Polynesia"', add
label define bplcountry_pop_lbl 54030 `"Niue"', add
label define bplcountry_pop_lbl 54040 `"Pitcairn Island"', add
label define bplcountry_pop_lbl 54050 `"Western Samoa"', add
label define bplcountry_pop_lbl 54060 `"Eastern Samoa"', add
label define bplcountry_pop_lbl 54070 `"Tokelau"', add
label define bplcountry_pop_lbl 54080 `"Tonga"', add
label define bplcountry_pop_lbl 54090 `"Tuvalu"', add
label define bplcountry_pop_lbl 54100 `"Wallis and Futuna Isls."', add
label define bplcountry_pop_lbl 54999 `"Polynesia, other or n.s."', add
label define bplcountry_pop_lbl 55000 `"U.S. Pacific Possessions"', add
label define bplcountry_pop_lbl 55010 `"American Samoa"', add
label define bplcountry_pop_lbl 55020 `"Baker Island"', add
label define bplcountry_pop_lbl 55030 `"Guam"', add
label define bplcountry_pop_lbl 55040 `"Howland Island"', add
label define bplcountry_pop_lbl 55050 `"Johnston Atoll"', add
label define bplcountry_pop_lbl 55060 `"Kingman Reef"', add
label define bplcountry_pop_lbl 55070 `"Midway Islands"', add
label define bplcountry_pop_lbl 55080 `"Wake Island"', add
label define bplcountry_pop_lbl 55999 `"US Pacific, other or n.s."', add
label define bplcountry_pop_lbl 59999 `"Oceania, other or n.s."', add
label define bplcountry_pop_lbl 80000 `"AT SEA"', add
label define bplcountry_pop_lbl 90000 `"Other countries n.s."', add
label define bplcountry_pop_lbl 99999 `"Unknown"', add
label values bplcountry_pop bplcountry_pop_lbl

label define bplcountry_sp_lbl 00000 `"NIU (not in universe)"'
label define bplcountry_sp_lbl 10000 `"Africa"', add
label define bplcountry_sp_lbl 11000 `"Eastern Africa"', add
label define bplcountry_sp_lbl 11005 `"British Indian Ocean Territory"', add
label define bplcountry_sp_lbl 11010 `"Burundi"', add
label define bplcountry_sp_lbl 11020 `"Comoros"', add
label define bplcountry_sp_lbl 11030 `"Djibouti"', add
label define bplcountry_sp_lbl 11040 `"Eritrea"', add
label define bplcountry_sp_lbl 11050 `"Ethiopia"', add
label define bplcountry_sp_lbl 11051 `"Ethiopia (including Eritrea)"', add
label define bplcountry_sp_lbl 11060 `"Kenya"', add
label define bplcountry_sp_lbl 11070 `"Madagascar"', add
label define bplcountry_sp_lbl 11080 `"Malawi"', add
label define bplcountry_sp_lbl 11090 `"Mauritius"', add
label define bplcountry_sp_lbl 11100 `"Mozambique"', add
label define bplcountry_sp_lbl 11110 `"Reunion"', add
label define bplcountry_sp_lbl 11120 `"Rwanda"', add
label define bplcountry_sp_lbl 11130 `"Seychelles"', add
label define bplcountry_sp_lbl 11140 `"Somalia"', add
label define bplcountry_sp_lbl 11150 `"South Sudan"', add
label define bplcountry_sp_lbl 11160 `"Uganda"', add
label define bplcountry_sp_lbl 11170 `"Tanzania"', add
label define bplcountry_sp_lbl 11180 `"Zambia"', add
label define bplcountry_sp_lbl 11190 `"Zimbabwe"', add
label define bplcountry_sp_lbl 11999 `"Eastern Africa, other or n.s."', add
label define bplcountry_sp_lbl 12000 `"Middle Africa"', add
label define bplcountry_sp_lbl 12010 `"Angola"', add
label define bplcountry_sp_lbl 12020 `"Cameroon"', add
label define bplcountry_sp_lbl 12030 `"Central African Republic"', add
label define bplcountry_sp_lbl 12040 `"Chad"', add
label define bplcountry_sp_lbl 12050 `"Congo (Republic of)"', add
label define bplcountry_sp_lbl 12060 `"Democratic Republic of Congo"', add
label define bplcountry_sp_lbl 12070 `"Equatorial Guinea"', add
label define bplcountry_sp_lbl 12080 `"Gabon"', add
label define bplcountry_sp_lbl 12090 `"Sao Tome and Principe"', add
label define bplcountry_sp_lbl 12999 `"Middle Africa, other or n.s."', add
label define bplcountry_sp_lbl 13000 `"Northern Africa"', add
label define bplcountry_sp_lbl 13010 `"Algeria"', add
label define bplcountry_sp_lbl 13011 `"Algeria/Tunisia"', add
label define bplcountry_sp_lbl 13020 `"Egypt"', add
label define bplcountry_sp_lbl 13021 `"Egypt/Sudan"', add
label define bplcountry_sp_lbl 13030 `"Libya"', add
label define bplcountry_sp_lbl 13040 `"Morocco"', add
label define bplcountry_sp_lbl 13050 `"Sudan"', add
label define bplcountry_sp_lbl 13060 `"Tunisia"', add
label define bplcountry_sp_lbl 13070 `"Western Sahara"', add
label define bplcountry_sp_lbl 13999 `"Northern Africa, other or n.s."', add
label define bplcountry_sp_lbl 14000 `"Southern Africa"', add
label define bplcountry_sp_lbl 14010 `"Botswana"', add
label define bplcountry_sp_lbl 14020 `"Lesotho"', add
label define bplcountry_sp_lbl 14030 `"Namibia"', add
label define bplcountry_sp_lbl 14040 `"South Africa"', add
label define bplcountry_sp_lbl 14050 `"Swaziland"', add
label define bplcountry_sp_lbl 14999 `"Southern Africa, other or n.s."', add
label define bplcountry_sp_lbl 15000 `"Western Africa"', add
label define bplcountry_sp_lbl 15010 `"Benin"', add
label define bplcountry_sp_lbl 15020 `"Burkina Faso"', add
label define bplcountry_sp_lbl 15021 `"Upper Volta"', add
label define bplcountry_sp_lbl 15030 `"Cape Verde"', add
label define bplcountry_sp_lbl 15040 `"Ivory Coast"', add
label define bplcountry_sp_lbl 15050 `"Gambia"', add
label define bplcountry_sp_lbl 15060 `"Ghana"', add
label define bplcountry_sp_lbl 15070 `"Guinea"', add
label define bplcountry_sp_lbl 15080 `"Guinea-Bissau"', add
label define bplcountry_sp_lbl 15081 `"Guinea-Bissau and Cape Verde"', add
label define bplcountry_sp_lbl 15090 `"Liberia"', add
label define bplcountry_sp_lbl 15100 `"Mali"', add
label define bplcountry_sp_lbl 15110 `"Mauritania"', add
label define bplcountry_sp_lbl 15120 `"Niger"', add
label define bplcountry_sp_lbl 15130 `"Nigeria"', add
label define bplcountry_sp_lbl 15140 `"St. Helena and Ascension"', add
label define bplcountry_sp_lbl 15150 `"Senegal"', add
label define bplcountry_sp_lbl 15160 `"Sierra Leone"', add
label define bplcountry_sp_lbl 15170 `"Togo"', add
label define bplcountry_sp_lbl 15180 `"Canary Islands"', add
label define bplcountry_sp_lbl 15999 `"West Africa, other or n.s."', add
label define bplcountry_sp_lbl 19999 `"Africa, other or n.s."', add
label define bplcountry_sp_lbl 20000 `"Americas"', add
label define bplcountry_sp_lbl 21000 `"Caribbean"', add
label define bplcountry_sp_lbl 21010 `"Anguilla"', add
label define bplcountry_sp_lbl 21020 `"Antigua-Barbuda"', add
label define bplcountry_sp_lbl 21030 `"Aruba"', add
label define bplcountry_sp_lbl 21040 `"Bahamas"', add
label define bplcountry_sp_lbl 21050 `"Barbados"', add
label define bplcountry_sp_lbl 21060 `"British Virgin Islands"', add
label define bplcountry_sp_lbl 21070 `"Cayman Isles"', add
label define bplcountry_sp_lbl 21080 `"Cuba"', add
label define bplcountry_sp_lbl 21090 `"Dominica"', add
label define bplcountry_sp_lbl 21100 `"Dominican Republic"', add
label define bplcountry_sp_lbl 21110 `"Grenada"', add
label define bplcountry_sp_lbl 21120 `"Guadeloupe"', add
label define bplcountry_sp_lbl 21130 `"Haiti"', add
label define bplcountry_sp_lbl 21140 `"Jamaica"', add
label define bplcountry_sp_lbl 21150 `"Martinique"', add
label define bplcountry_sp_lbl 21160 `"Montserrat"', add
label define bplcountry_sp_lbl 21170 `"Netherlands Antilles"', add
label define bplcountry_sp_lbl 21180 `"Puerto Rico"', add
label define bplcountry_sp_lbl 21190 `"St. Kitts-Nevis"', add
label define bplcountry_sp_lbl 21200 `"St. Croix"', add
label define bplcountry_sp_lbl 21210 `"St. John"', add
label define bplcountry_sp_lbl 21220 `"St. Lucia"', add
label define bplcountry_sp_lbl 21230 `"St Thomas"', add
label define bplcountry_sp_lbl 21240 `"St. Vincent"', add
label define bplcountry_sp_lbl 21250 `"Trinidad and Tobago"', add
label define bplcountry_sp_lbl 21260 `"Turks and Caicos"', add
label define bplcountry_sp_lbl 21270 `"U.S. Virgin Islands"', add
label define bplcountry_sp_lbl 21991 `"Caribbean commonwealth, n.s."', add
label define bplcountry_sp_lbl 21999 `"Caribbean, other or n.s."', add
label define bplcountry_sp_lbl 22000 `"Central America"', add
label define bplcountry_sp_lbl 22010 `"Belize/British Honduras"', add
label define bplcountry_sp_lbl 22020 `"Costa Rica"', add
label define bplcountry_sp_lbl 22030 `"El Salvador"', add
label define bplcountry_sp_lbl 22040 `"Guatemala"', add
label define bplcountry_sp_lbl 22050 `"Honduras"', add
label define bplcountry_sp_lbl 22060 `"Mexico"', add
label define bplcountry_sp_lbl 22070 `"Nicaragua"', add
label define bplcountry_sp_lbl 22080 `"Panama"', add
label define bplcountry_sp_lbl 22081 `"Panama Canal Zone"', add
label define bplcountry_sp_lbl 22999 `"Central America, other or n.s."', add
label define bplcountry_sp_lbl 23000 `"South America"', add
label define bplcountry_sp_lbl 23010 `"Argentina"', add
label define bplcountry_sp_lbl 23020 `"Bolivia"', add
label define bplcountry_sp_lbl 23030 `"Brazil"', add
label define bplcountry_sp_lbl 23040 `"Chile"', add
label define bplcountry_sp_lbl 23050 `"Colombia"', add
label define bplcountry_sp_lbl 23060 `"Ecuador"', add
label define bplcountry_sp_lbl 23070 `"Falkland Islands"', add
label define bplcountry_sp_lbl 23080 `"French Guiana"', add
label define bplcountry_sp_lbl 23090 `"Guyana/British Guiana"', add
label define bplcountry_sp_lbl 23100 `"Paraguay"', add
label define bplcountry_sp_lbl 23110 `"Peru"', add
label define bplcountry_sp_lbl 23120 `"Suriname"', add
label define bplcountry_sp_lbl 23130 `"Uruguay"', add
label define bplcountry_sp_lbl 23140 `"Venezuela"', add
label define bplcountry_sp_lbl 23999 `"South America, other or n.s."', add
label define bplcountry_sp_lbl 24000 `"North America"', add
label define bplcountry_sp_lbl 24010 `"Bermuda"', add
label define bplcountry_sp_lbl 24020 `"Canada"', add
label define bplcountry_sp_lbl 24030 `"Greenland"', add
label define bplcountry_sp_lbl 24040 `"United States"', add
label define bplcountry_sp_lbl 24999 `"North America, other or n.s."', add
label define bplcountry_sp_lbl 29999 `"Americas, other or n.s."', add
label define bplcountry_sp_lbl 30000 `"Asia"', add
label define bplcountry_sp_lbl 31000 `"Eastern Asia"', add
label define bplcountry_sp_lbl 31010 `"China"', add
label define bplcountry_sp_lbl 31011 `"Hong Kong"', add
label define bplcountry_sp_lbl 31012 `"Macau"', add
label define bplcountry_sp_lbl 31013 `"Taiwan"', add
label define bplcountry_sp_lbl 31020 `"Japan"', add
label define bplcountry_sp_lbl 31030 `"Korea"', add
label define bplcountry_sp_lbl 31031 `"Korea, DPR (North)"', add
label define bplcountry_sp_lbl 31032 `"Korea, RO (South)"', add
label define bplcountry_sp_lbl 31040 `"Mongolia"', add
label define bplcountry_sp_lbl 31999 `"Eastern Asia, other or n.s."', add
label define bplcountry_sp_lbl 32000 `"South-Central Asia"', add
label define bplcountry_sp_lbl 32010 `"Afghanistan"', add
label define bplcountry_sp_lbl 32020 `"Bangladesh"', add
label define bplcountry_sp_lbl 32030 `"Bhutan"', add
label define bplcountry_sp_lbl 32040 `"India"', add
label define bplcountry_sp_lbl 32041 `"India/Pakistan"', add
label define bplcountry_sp_lbl 32042 `"India/Pakistan/Bangladesh/Sri Lanka"', add
label define bplcountry_sp_lbl 32050 `"Iran"', add
label define bplcountry_sp_lbl 32060 `"Kazakhstan"', add
label define bplcountry_sp_lbl 32070 `"Kyrgyzstan"', add
label define bplcountry_sp_lbl 32080 `"Maldives"', add
label define bplcountry_sp_lbl 32090 `"Nepal"', add
label define bplcountry_sp_lbl 32100 `"Pakistan"', add
label define bplcountry_sp_lbl 32101 `"Pakistan/Bangladesh"', add
label define bplcountry_sp_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define bplcountry_sp_lbl 32120 `"Tajikistan"', add
label define bplcountry_sp_lbl 32130 `"Turkmenistan"', add
label define bplcountry_sp_lbl 32140 `"Uzbekistan"', add
label define bplcountry_sp_lbl 32999 `"South-Central Asia, other or n.s."', add
label define bplcountry_sp_lbl 33000 `"South-Eastern Asia"', add
label define bplcountry_sp_lbl 33010 `"Brunei"', add
label define bplcountry_sp_lbl 33020 `"Cambodia (Kampuchea)"', add
label define bplcountry_sp_lbl 33030 `"East Timor"', add
label define bplcountry_sp_lbl 33040 `"Indonesia"', add
label define bplcountry_sp_lbl 33050 `"Laos"', add
label define bplcountry_sp_lbl 33060 `"Malaysia"', add
label define bplcountry_sp_lbl 33070 `"Myanmar (Burma)"', add
label define bplcountry_sp_lbl 33080 `"Philippines"', add
label define bplcountry_sp_lbl 33090 `"Singapore"', add
label define bplcountry_sp_lbl 33100 `"Thailand"', add
label define bplcountry_sp_lbl 33110 `"Vietnam"', add
label define bplcountry_sp_lbl 33999 `"South-Eastern Asia, other or n.s."', add
label define bplcountry_sp_lbl 34000 `"Western Asia"', add
label define bplcountry_sp_lbl 34010 `"Armenia"', add
label define bplcountry_sp_lbl 34020 `"Azerbaijan"', add
label define bplcountry_sp_lbl 34030 `"Bahrain"', add
label define bplcountry_sp_lbl 34040 `"Cyprus"', add
label define bplcountry_sp_lbl 34050 `"Georgia"', add
label define bplcountry_sp_lbl 34051 `"Abkhazia"', add
label define bplcountry_sp_lbl 34052 `"South Ossetia"', add
label define bplcountry_sp_lbl 34060 `"Iraq"', add
label define bplcountry_sp_lbl 34070 `"Israel"', add
label define bplcountry_sp_lbl 34071 `"Israel/Palestine"', add
label define bplcountry_sp_lbl 34080 `"Jordan"', add
label define bplcountry_sp_lbl 34090 `"Kuwait"', add
label define bplcountry_sp_lbl 34100 `"Lebanon"', add
label define bplcountry_sp_lbl 34110 `"Palestine"', add
label define bplcountry_sp_lbl 34111 `"West Bank"', add
label define bplcountry_sp_lbl 34112 `"Gaza Strip"', add
label define bplcountry_sp_lbl 34120 `"Oman"', add
label define bplcountry_sp_lbl 34130 `"Qatar"', add
label define bplcountry_sp_lbl 34140 `"Saudi Arabia"', add
label define bplcountry_sp_lbl 34150 `"Syria"', add
label define bplcountry_sp_lbl 34151 `"Syria/Lebanon"', add
label define bplcountry_sp_lbl 34160 `"Turkey"', add
label define bplcountry_sp_lbl 34170 `"United Arab Emirates"', add
label define bplcountry_sp_lbl 34180 `"Yemen"', add
label define bplcountry_sp_lbl 34991 `"Middle East"', add
label define bplcountry_sp_lbl 34999 `"Western Asia, other or n.s."', add
label define bplcountry_sp_lbl 39999 `"Asia, other or n.s."', add
label define bplcountry_sp_lbl 40000 `"Europe"', add
label define bplcountry_sp_lbl 41000 `"Eastern Europe"', add
label define bplcountry_sp_lbl 41010 `"Belarus"', add
label define bplcountry_sp_lbl 41020 `"Bulgaria"', add
label define bplcountry_sp_lbl 41021 `"Bulgaria/Greece"', add
label define bplcountry_sp_lbl 41030 `"Czech Republic/Czechoslovakia"', add
label define bplcountry_sp_lbl 41040 `"Hungary"', add
label define bplcountry_sp_lbl 41050 `"Poland"', add
label define bplcountry_sp_lbl 41060 `"Moldova"', add
label define bplcountry_sp_lbl 41070 `"Romania"', add
label define bplcountry_sp_lbl 41080 `"Russia/USSR"', add
label define bplcountry_sp_lbl 41090 `"Slovakia"', add
label define bplcountry_sp_lbl 41100 `"Ukraine"', add
label define bplcountry_sp_lbl 41991 `"Albania, Bulgaria, Czech, Hungary, Romania, Yugoslavia"', add
label define bplcountry_sp_lbl 41992 `"Central-Eastern Europe"', add
label define bplcountry_sp_lbl 41999 `"Eastern Europe, other or n.s."', add
label define bplcountry_sp_lbl 42000 `"Northern Europe"', add
label define bplcountry_sp_lbl 42010 `"Denmark"', add
label define bplcountry_sp_lbl 42020 `"Estonia"', add
label define bplcountry_sp_lbl 42030 `"Faroe Islands"', add
label define bplcountry_sp_lbl 42040 `"Finland"', add
label define bplcountry_sp_lbl 42050 `"Iceland"', add
label define bplcountry_sp_lbl 42060 `"Ireland"', add
label define bplcountry_sp_lbl 42070 `"Latvia"', add
label define bplcountry_sp_lbl 42080 `"Lithuania"', add
label define bplcountry_sp_lbl 42090 `"Norway"', add
label define bplcountry_sp_lbl 42100 `"Svalbard and Jan Mayen Islands"', add
label define bplcountry_sp_lbl 42110 `"Sweden"', add
label define bplcountry_sp_lbl 42120 `"United Kingdom"', add
label define bplcountry_sp_lbl 42999 `"Northern Europe, other or n.s."', add
label define bplcountry_sp_lbl 43000 `"Southern Europe"', add
label define bplcountry_sp_lbl 43010 `"Albania"', add
label define bplcountry_sp_lbl 43020 `"Andorra"', add
label define bplcountry_sp_lbl 43030 `"Bosnia and Herzegovina"', add
label define bplcountry_sp_lbl 43040 `"Croatia"', add
label define bplcountry_sp_lbl 43050 `"Gibraltar"', add
label define bplcountry_sp_lbl 43060 `"Greece"', add
label define bplcountry_sp_lbl 43070 `"Italy"', add
label define bplcountry_sp_lbl 43071 `"Vatican City"', add
label define bplcountry_sp_lbl 43080 `"Malta"', add
label define bplcountry_sp_lbl 43090 `"Portugal"', add
label define bplcountry_sp_lbl 43100 `"San Marino"', add
label define bplcountry_sp_lbl 43110 `"Slovenia"', add
label define bplcountry_sp_lbl 43120 `"Spain"', add
label define bplcountry_sp_lbl 43121 `"Spain/Portugal"', add
label define bplcountry_sp_lbl 43130 `"Macedonia"', add
label define bplcountry_sp_lbl 43140 `"Yugoslavia"', add
label define bplcountry_sp_lbl 43141 `"Montenegro"', add
label define bplcountry_sp_lbl 43142 `"Serbia"', add
label define bplcountry_sp_lbl 43143 `"Kosovo"', add
label define bplcountry_sp_lbl 43144 `"Serbia and Montenegro"', add
label define bplcountry_sp_lbl 43991 `"Gibraltar/Malta"', add
label define bplcountry_sp_lbl 43992 `"Portugal/Greece"', add
label define bplcountry_sp_lbl 43993 `"Italy, Holy See, San Marino"', add
label define bplcountry_sp_lbl 43999 `"Southern Europe, other or n.s."', add
label define bplcountry_sp_lbl 44000 `"Western Europe"', add
label define bplcountry_sp_lbl 44010 `"Austria"', add
label define bplcountry_sp_lbl 44020 `"Belgium"', add
label define bplcountry_sp_lbl 44021 `"Belgium/Luxemburg"', add
label define bplcountry_sp_lbl 44022 `"Belgium/Netherlands/Luxemburg"', add
label define bplcountry_sp_lbl 44030 `"France"', add
label define bplcountry_sp_lbl 44040 `"Germany"', add
label define bplcountry_sp_lbl 44042 `"West Germany"', add
label define bplcountry_sp_lbl 44043 `"Germany/Austria"', add
label define bplcountry_sp_lbl 44044 `"Mecklenburg-Schwerin"', add
label define bplcountry_sp_lbl 44050 `"Liechtenstein"', add
label define bplcountry_sp_lbl 44060 `"Luxembourg"', add
label define bplcountry_sp_lbl 44070 `"Monaco"', add
label define bplcountry_sp_lbl 44080 `"Netherlands"', add
label define bplcountry_sp_lbl 44090 `"Switzerland"', add
label define bplcountry_sp_lbl 44991 `"Belgium, Denmark, Luxembourg, Netherlands"', add
label define bplcountry_sp_lbl 44999 `"Western Europe, other or n.s."', add
label define bplcountry_sp_lbl 49992 `"European Union"', add
label define bplcountry_sp_lbl 49993 `"European Union (original 15)"', add
label define bplcountry_sp_lbl 49994 `"Other European Union (not original 15)"', add
label define bplcountry_sp_lbl 49999 `"Europe, other or n.s."', add
label define bplcountry_sp_lbl 50000 `"Oceania"', add
label define bplcountry_sp_lbl 51000 `"Australia and New Zealand"', add
label define bplcountry_sp_lbl 51010 `"Australia"', add
label define bplcountry_sp_lbl 51020 `"New Zealand"', add
label define bplcountry_sp_lbl 51030 `"Norfolk Islands"', add
label define bplcountry_sp_lbl 51999 `"Australia and New Zealand, n.s."', add
label define bplcountry_sp_lbl 52000 `"Melanesia"', add
label define bplcountry_sp_lbl 52010 `"Fiji"', add
label define bplcountry_sp_lbl 52020 `"New Caledonia"', add
label define bplcountry_sp_lbl 52030 `"Papua New Guinea"', add
label define bplcountry_sp_lbl 52040 `"Solomon Islands"', add
label define bplcountry_sp_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define bplcountry_sp_lbl 52999 `"Melanesia, n.s."', add
label define bplcountry_sp_lbl 53000 `"Micronesia"', add
label define bplcountry_sp_lbl 53010 `"Kiribati"', add
label define bplcountry_sp_lbl 53020 `"Marshall Islands"', add
label define bplcountry_sp_lbl 53030 `"Nauru"', add
label define bplcountry_sp_lbl 53040 `"Northern Mariana Isls."', add
label define bplcountry_sp_lbl 53050 `"Palau"', add
label define bplcountry_sp_lbl 53060 `"Federated States of Micronesia"', add
label define bplcountry_sp_lbl 53999 `"Micronesia, other or n.s."', add
label define bplcountry_sp_lbl 54000 `"Polynesia"', add
label define bplcountry_sp_lbl 54010 `"Cook Islands"', add
label define bplcountry_sp_lbl 54020 `"French Polynesia"', add
label define bplcountry_sp_lbl 54030 `"Niue"', add
label define bplcountry_sp_lbl 54040 `"Pitcairn Island"', add
label define bplcountry_sp_lbl 54050 `"Western Samoa"', add
label define bplcountry_sp_lbl 54060 `"Eastern Samoa"', add
label define bplcountry_sp_lbl 54070 `"Tokelau"', add
label define bplcountry_sp_lbl 54080 `"Tonga"', add
label define bplcountry_sp_lbl 54090 `"Tuvalu"', add
label define bplcountry_sp_lbl 54100 `"Wallis and Futuna Isls."', add
label define bplcountry_sp_lbl 54999 `"Polynesia, other or n.s."', add
label define bplcountry_sp_lbl 55000 `"U.S. Pacific Possessions"', add
label define bplcountry_sp_lbl 55010 `"American Samoa"', add
label define bplcountry_sp_lbl 55020 `"Baker Island"', add
label define bplcountry_sp_lbl 55030 `"Guam"', add
label define bplcountry_sp_lbl 55040 `"Howland Island"', add
label define bplcountry_sp_lbl 55050 `"Johnston Atoll"', add
label define bplcountry_sp_lbl 55060 `"Kingman Reef"', add
label define bplcountry_sp_lbl 55070 `"Midway Islands"', add
label define bplcountry_sp_lbl 55080 `"Wake Island"', add
label define bplcountry_sp_lbl 55999 `"US Pacific, other or n.s."', add
label define bplcountry_sp_lbl 59999 `"Oceania, other or n.s."', add
label define bplcountry_sp_lbl 80000 `"AT SEA"', add
label define bplcountry_sp_lbl 90000 `"Other countries n.s."', add
label define bplcountry_sp_lbl 99999 `"Unknown"', add
label values bplcountry_sp bplcountry_sp_lbl

label define citizen_head_lbl 1 `"Citizen, not specified"'
label define citizen_head_lbl 2 `"Citizen by birth"', add
label define citizen_head_lbl 3 `"Naturalized citizen"', add
label define citizen_head_lbl 4 `"Not a citizen"', add
label define citizen_head_lbl 5 `"Without citizenship, stateless"', add
label define citizen_head_lbl 8 `"Unknown"', add
label define citizen_head_lbl 9 `"NIU (not in universe)"', add
label values citizen_head citizen_head_lbl

label define citizen_mom_lbl 1 `"Citizen, not specified"'
label define citizen_mom_lbl 2 `"Citizen by birth"', add
label define citizen_mom_lbl 3 `"Naturalized citizen"', add
label define citizen_mom_lbl 4 `"Not a citizen"', add
label define citizen_mom_lbl 5 `"Without citizenship, stateless"', add
label define citizen_mom_lbl 8 `"Unknown"', add
label define citizen_mom_lbl 9 `"NIU (not in universe)"', add
label values citizen_mom citizen_mom_lbl

label define citizen_pop_lbl 1 `"Citizen, not specified"'
label define citizen_pop_lbl 2 `"Citizen by birth"', add
label define citizen_pop_lbl 3 `"Naturalized citizen"', add
label define citizen_pop_lbl 4 `"Not a citizen"', add
label define citizen_pop_lbl 5 `"Without citizenship, stateless"', add
label define citizen_pop_lbl 8 `"Unknown"', add
label define citizen_pop_lbl 9 `"NIU (not in universe)"', add
label values citizen_pop citizen_pop_lbl

label define citizen_sp_lbl 1 `"Citizen, not specified"'
label define citizen_sp_lbl 2 `"Citizen by birth"', add
label define citizen_sp_lbl 3 `"Naturalized citizen"', add
label define citizen_sp_lbl 4 `"Not a citizen"', add
label define citizen_sp_lbl 5 `"Without citizenship, stateless"', add
label define citizen_sp_lbl 8 `"Unknown"', add
label define citizen_sp_lbl 9 `"NIU (not in universe)"', add
label values citizen_sp citizen_sp_lbl

label define school_head_lbl 0 `"NIU (not in universe)"'
label define school_head_lbl 1 `"Yes"', add
label define school_head_lbl 2 `"No, not specified"', add
label define school_head_lbl 3 `"No, attended in the past"', add
label define school_head_lbl 4 `"No, never attended"', add
label define school_head_lbl 9 `"Unknown/missing"', add
label values school_head school_head_lbl

label define school_mom_lbl 0 `"NIU (not in universe)"'
label define school_mom_lbl 1 `"Yes"', add
label define school_mom_lbl 2 `"No, not specified"', add
label define school_mom_lbl 3 `"No, attended in the past"', add
label define school_mom_lbl 4 `"No, never attended"', add
label define school_mom_lbl 9 `"Unknown/missing"', add
label values school_mom school_mom_lbl

label define school_pop_lbl 0 `"NIU (not in universe)"'
label define school_pop_lbl 1 `"Yes"', add
label define school_pop_lbl 2 `"No, not specified"', add
label define school_pop_lbl 3 `"No, attended in the past"', add
label define school_pop_lbl 4 `"No, never attended"', add
label define school_pop_lbl 9 `"Unknown/missing"', add
label values school_pop school_pop_lbl

label define school_sp_lbl 0 `"NIU (not in universe)"'
label define school_sp_lbl 1 `"Yes"', add
label define school_sp_lbl 2 `"No, not specified"', add
label define school_sp_lbl 3 `"No, attended in the past"', add
label define school_sp_lbl 4 `"No, never attended"', add
label define school_sp_lbl 9 `"Unknown/missing"', add
label values school_sp school_sp_lbl

label define lit_head_lbl 0 `"NIU (not in universe)"'
label define lit_head_lbl 1 `"No, illiterate"', add
label define lit_head_lbl 2 `"Yes, literate"', add
label define lit_head_lbl 9 `"Unknown/missing"', add
label values lit_head lit_head_lbl

label define lit_mom_lbl 0 `"NIU (not in universe)"'
label define lit_mom_lbl 1 `"No, illiterate"', add
label define lit_mom_lbl 2 `"Yes, literate"', add
label define lit_mom_lbl 9 `"Unknown/missing"', add
label values lit_mom lit_mom_lbl

label define lit_pop_lbl 0 `"NIU (not in universe)"'
label define lit_pop_lbl 1 `"No, illiterate"', add
label define lit_pop_lbl 2 `"Yes, literate"', add
label define lit_pop_lbl 9 `"Unknown/missing"', add
label values lit_pop lit_pop_lbl

label define lit_sp_lbl 0 `"NIU (not in universe)"'
label define lit_sp_lbl 1 `"No, illiterate"', add
label define lit_sp_lbl 2 `"Yes, literate"', add
label define lit_sp_lbl 9 `"Unknown/missing"', add
label values lit_sp lit_sp_lbl

label define edattain_head_lbl 0 `"NIU (not in universe)"'
label define edattain_head_lbl 1 `"Less than primary completed"', add
label define edattain_head_lbl 2 `"Primary completed"', add
label define edattain_head_lbl 3 `"Secondary completed"', add
label define edattain_head_lbl 4 `"University completed"', add
label define edattain_head_lbl 9 `"Unknown"', add
label values edattain_head edattain_head_lbl

label define edattain_mom_lbl 0 `"NIU (not in universe)"'
label define edattain_mom_lbl 1 `"Less than primary completed"', add
label define edattain_mom_lbl 2 `"Primary completed"', add
label define edattain_mom_lbl 3 `"Secondary completed"', add
label define edattain_mom_lbl 4 `"University completed"', add
label define edattain_mom_lbl 9 `"Unknown"', add
label values edattain_mom edattain_mom_lbl

label define edattain_pop_lbl 0 `"NIU (not in universe)"'
label define edattain_pop_lbl 1 `"Less than primary completed"', add
label define edattain_pop_lbl 2 `"Primary completed"', add
label define edattain_pop_lbl 3 `"Secondary completed"', add
label define edattain_pop_lbl 4 `"University completed"', add
label define edattain_pop_lbl 9 `"Unknown"', add
label values edattain_pop edattain_pop_lbl

label define edattain_sp_lbl 0 `"NIU (not in universe)"'
label define edattain_sp_lbl 1 `"Less than primary completed"', add
label define edattain_sp_lbl 2 `"Primary completed"', add
label define edattain_sp_lbl 3 `"Secondary completed"', add
label define edattain_sp_lbl 4 `"University completed"', add
label define edattain_sp_lbl 9 `"Unknown"', add
label values edattain_sp edattain_sp_lbl

label define edattaind_head_lbl 000 `"NIU (not in universe)"'
label define edattaind_head_lbl 100 `"Less than primary completed (n.s.)"', add
label define edattaind_head_lbl 110 `"No schooling"', add
label define edattaind_head_lbl 120 `"Some primary completed"', add
label define edattaind_head_lbl 130 `"Primary (4 yrs) completed"', add
label define edattaind_head_lbl 211 `"Primary (5 yrs) completed"', add
label define edattaind_head_lbl 212 `"Primary (6 yrs) completed"', add
label define edattaind_head_lbl 221 `"Lower secondary general completed"', add
label define edattaind_head_lbl 222 `"Lower secondary technical completed"', add
label define edattaind_head_lbl 311 `"Secondary, general track completed"', add
label define edattaind_head_lbl 312 `"Some college completed"', add
label define edattaind_head_lbl 320 `"Secondary or post-secondary technical completed"', add
label define edattaind_head_lbl 321 `"Secondary, technical track completed"', add
label define edattaind_head_lbl 322 `"Post-secondary technical education"', add
label define edattaind_head_lbl 400 `"University completed"', add
label define edattaind_head_lbl 999 `"Unknown/missing"', add
label values edattaind_head edattaind_head_lbl

label define edattaind_mom_lbl 000 `"NIU (not in universe)"'
label define edattaind_mom_lbl 100 `"Less than primary completed (n.s.)"', add
label define edattaind_mom_lbl 110 `"No schooling"', add
label define edattaind_mom_lbl 120 `"Some primary completed"', add
label define edattaind_mom_lbl 130 `"Primary (4 yrs) completed"', add
label define edattaind_mom_lbl 211 `"Primary (5 yrs) completed"', add
label define edattaind_mom_lbl 212 `"Primary (6 yrs) completed"', add
label define edattaind_mom_lbl 221 `"Lower secondary general completed"', add
label define edattaind_mom_lbl 222 `"Lower secondary technical completed"', add
label define edattaind_mom_lbl 311 `"Secondary, general track completed"', add
label define edattaind_mom_lbl 312 `"Some college completed"', add
label define edattaind_mom_lbl 320 `"Secondary or post-secondary technical completed"', add
label define edattaind_mom_lbl 321 `"Secondary, technical track completed"', add
label define edattaind_mom_lbl 322 `"Post-secondary technical education"', add
label define edattaind_mom_lbl 400 `"University completed"', add
label define edattaind_mom_lbl 999 `"Unknown/missing"', add
label values edattaind_mom edattaind_mom_lbl

label define edattaind_pop_lbl 000 `"NIU (not in universe)"'
label define edattaind_pop_lbl 100 `"Less than primary completed (n.s.)"', add
label define edattaind_pop_lbl 110 `"No schooling"', add
label define edattaind_pop_lbl 120 `"Some primary completed"', add
label define edattaind_pop_lbl 130 `"Primary (4 yrs) completed"', add
label define edattaind_pop_lbl 211 `"Primary (5 yrs) completed"', add
label define edattaind_pop_lbl 212 `"Primary (6 yrs) completed"', add
label define edattaind_pop_lbl 221 `"Lower secondary general completed"', add
label define edattaind_pop_lbl 222 `"Lower secondary technical completed"', add
label define edattaind_pop_lbl 311 `"Secondary, general track completed"', add
label define edattaind_pop_lbl 312 `"Some college completed"', add
label define edattaind_pop_lbl 320 `"Secondary or post-secondary technical completed"', add
label define edattaind_pop_lbl 321 `"Secondary, technical track completed"', add
label define edattaind_pop_lbl 322 `"Post-secondary technical education"', add
label define edattaind_pop_lbl 400 `"University completed"', add
label define edattaind_pop_lbl 999 `"Unknown/missing"', add
label values edattaind_pop edattaind_pop_lbl

label define edattaind_sp_lbl 000 `"NIU (not in universe)"'
label define edattaind_sp_lbl 100 `"Less than primary completed (n.s.)"', add
label define edattaind_sp_lbl 110 `"No schooling"', add
label define edattaind_sp_lbl 120 `"Some primary completed"', add
label define edattaind_sp_lbl 130 `"Primary (4 yrs) completed"', add
label define edattaind_sp_lbl 211 `"Primary (5 yrs) completed"', add
label define edattaind_sp_lbl 212 `"Primary (6 yrs) completed"', add
label define edattaind_sp_lbl 221 `"Lower secondary general completed"', add
label define edattaind_sp_lbl 222 `"Lower secondary technical completed"', add
label define edattaind_sp_lbl 311 `"Secondary, general track completed"', add
label define edattaind_sp_lbl 312 `"Some college completed"', add
label define edattaind_sp_lbl 320 `"Secondary or post-secondary technical completed"', add
label define edattaind_sp_lbl 321 `"Secondary, technical track completed"', add
label define edattaind_sp_lbl 322 `"Post-secondary technical education"', add
label define edattaind_sp_lbl 400 `"University completed"', add
label define edattaind_sp_lbl 999 `"Unknown/missing"', add
label values edattaind_sp edattaind_sp_lbl

label define yrschool_head_lbl 00 `"None or pre-school"'
label define yrschool_head_lbl 01 `"1 year"', add
label define yrschool_head_lbl 02 `"2 years"', add
label define yrschool_head_lbl 03 `"3 years"', add
label define yrschool_head_lbl 04 `"4 years"', add
label define yrschool_head_lbl 05 `"5 years"', add
label define yrschool_head_lbl 06 `"6 years"', add
label define yrschool_head_lbl 07 `"7 years"', add
label define yrschool_head_lbl 08 `"8 years"', add
label define yrschool_head_lbl 09 `"9 years"', add
label define yrschool_head_lbl 10 `"10 years"', add
label define yrschool_head_lbl 11 `"11 years"', add
label define yrschool_head_lbl 12 `"12 years"', add
label define yrschool_head_lbl 13 `"13 years"', add
label define yrschool_head_lbl 14 `"14 years"', add
label define yrschool_head_lbl 15 `"15 years"', add
label define yrschool_head_lbl 16 `"16 years"', add
label define yrschool_head_lbl 17 `"17 years"', add
label define yrschool_head_lbl 18 `"18 years or more"', add
label define yrschool_head_lbl 90 `"Not specified"', add
label define yrschool_head_lbl 91 `"Some primary"', add
label define yrschool_head_lbl 92 `"Some technical after primary"', add
label define yrschool_head_lbl 93 `"Some secondary"', add
label define yrschool_head_lbl 94 `"Some tertiary"', add
label define yrschool_head_lbl 95 `"Adult literacy"', add
label define yrschool_head_lbl 96 `"Special education"', add
label define yrschool_head_lbl 98 `"Unknown/missing"', add
label define yrschool_head_lbl 99 `"NIU (not in universe)"', add
label values yrschool_head yrschool_head_lbl

label define yrschool_mom_lbl 00 `"None or pre-school"'
label define yrschool_mom_lbl 01 `"1 year"', add
label define yrschool_mom_lbl 02 `"2 years"', add
label define yrschool_mom_lbl 03 `"3 years"', add
label define yrschool_mom_lbl 04 `"4 years"', add
label define yrschool_mom_lbl 05 `"5 years"', add
label define yrschool_mom_lbl 06 `"6 years"', add
label define yrschool_mom_lbl 07 `"7 years"', add
label define yrschool_mom_lbl 08 `"8 years"', add
label define yrschool_mom_lbl 09 `"9 years"', add
label define yrschool_mom_lbl 10 `"10 years"', add
label define yrschool_mom_lbl 11 `"11 years"', add
label define yrschool_mom_lbl 12 `"12 years"', add
label define yrschool_mom_lbl 13 `"13 years"', add
label define yrschool_mom_lbl 14 `"14 years"', add
label define yrschool_mom_lbl 15 `"15 years"', add
label define yrschool_mom_lbl 16 `"16 years"', add
label define yrschool_mom_lbl 17 `"17 years"', add
label define yrschool_mom_lbl 18 `"18 years or more"', add
label define yrschool_mom_lbl 90 `"Not specified"', add
label define yrschool_mom_lbl 91 `"Some primary"', add
label define yrschool_mom_lbl 92 `"Some technical after primary"', add
label define yrschool_mom_lbl 93 `"Some secondary"', add
label define yrschool_mom_lbl 94 `"Some tertiary"', add
label define yrschool_mom_lbl 95 `"Adult literacy"', add
label define yrschool_mom_lbl 96 `"Special education"', add
label define yrschool_mom_lbl 98 `"Unknown/missing"', add
label define yrschool_mom_lbl 99 `"NIU (not in universe)"', add
label values yrschool_mom yrschool_mom_lbl

label define yrschool_pop_lbl 00 `"None or pre-school"'
label define yrschool_pop_lbl 01 `"1 year"', add
label define yrschool_pop_lbl 02 `"2 years"', add
label define yrschool_pop_lbl 03 `"3 years"', add
label define yrschool_pop_lbl 04 `"4 years"', add
label define yrschool_pop_lbl 05 `"5 years"', add
label define yrschool_pop_lbl 06 `"6 years"', add
label define yrschool_pop_lbl 07 `"7 years"', add
label define yrschool_pop_lbl 08 `"8 years"', add
label define yrschool_pop_lbl 09 `"9 years"', add
label define yrschool_pop_lbl 10 `"10 years"', add
label define yrschool_pop_lbl 11 `"11 years"', add
label define yrschool_pop_lbl 12 `"12 years"', add
label define yrschool_pop_lbl 13 `"13 years"', add
label define yrschool_pop_lbl 14 `"14 years"', add
label define yrschool_pop_lbl 15 `"15 years"', add
label define yrschool_pop_lbl 16 `"16 years"', add
label define yrschool_pop_lbl 17 `"17 years"', add
label define yrschool_pop_lbl 18 `"18 years or more"', add
label define yrschool_pop_lbl 90 `"Not specified"', add
label define yrschool_pop_lbl 91 `"Some primary"', add
label define yrschool_pop_lbl 92 `"Some technical after primary"', add
label define yrschool_pop_lbl 93 `"Some secondary"', add
label define yrschool_pop_lbl 94 `"Some tertiary"', add
label define yrschool_pop_lbl 95 `"Adult literacy"', add
label define yrschool_pop_lbl 96 `"Special education"', add
label define yrschool_pop_lbl 98 `"Unknown/missing"', add
label define yrschool_pop_lbl 99 `"NIU (not in universe)"', add
label values yrschool_pop yrschool_pop_lbl

label define yrschool_sp_lbl 00 `"None or pre-school"'
label define yrschool_sp_lbl 01 `"1 year"', add
label define yrschool_sp_lbl 02 `"2 years"', add
label define yrschool_sp_lbl 03 `"3 years"', add
label define yrschool_sp_lbl 04 `"4 years"', add
label define yrschool_sp_lbl 05 `"5 years"', add
label define yrschool_sp_lbl 06 `"6 years"', add
label define yrschool_sp_lbl 07 `"7 years"', add
label define yrschool_sp_lbl 08 `"8 years"', add
label define yrschool_sp_lbl 09 `"9 years"', add
label define yrschool_sp_lbl 10 `"10 years"', add
label define yrschool_sp_lbl 11 `"11 years"', add
label define yrschool_sp_lbl 12 `"12 years"', add
label define yrschool_sp_lbl 13 `"13 years"', add
label define yrschool_sp_lbl 14 `"14 years"', add
label define yrschool_sp_lbl 15 `"15 years"', add
label define yrschool_sp_lbl 16 `"16 years"', add
label define yrschool_sp_lbl 17 `"17 years"', add
label define yrschool_sp_lbl 18 `"18 years or more"', add
label define yrschool_sp_lbl 90 `"Not specified"', add
label define yrschool_sp_lbl 91 `"Some primary"', add
label define yrschool_sp_lbl 92 `"Some technical after primary"', add
label define yrschool_sp_lbl 93 `"Some secondary"', add
label define yrschool_sp_lbl 94 `"Some tertiary"', add
label define yrschool_sp_lbl 95 `"Adult literacy"', add
label define yrschool_sp_lbl 96 `"Special education"', add
label define yrschool_sp_lbl 98 `"Unknown/missing"', add
label define yrschool_sp_lbl 99 `"NIU (not in universe)"', add
label values yrschool_sp yrschool_sp_lbl

label define educls_head_lbl 00 `"NIU (not in universe)"'
label define educls_head_lbl 10 `"None, preschool, or non-formal education"', add
label define educls_head_lbl 11 `"None"', add
label define educls_head_lbl 12 `"Preschool"', add
label define educls_head_lbl 13 `"Non-formal education"', add
label define educls_head_lbl 21 `"Standard 1"', add
label define educls_head_lbl 22 `"Standard 2"', add
label define educls_head_lbl 23 `"Standard 3"', add
label define educls_head_lbl 24 `"Standard 4"', add
label define educls_head_lbl 25 `"Standard 5"', add
label define educls_head_lbl 26 `"Standard 6"', add
label define educls_head_lbl 27 `"Standard 7"', add
label define educls_head_lbl 31 `"Diploma or certificate after primary"', add
label define educls_head_lbl 32 `"Vocational training after primary"', add
label define educls_head_lbl 41 `"Form 1 (form A)"', add
label define educls_head_lbl 42 `"Form 2 (form B)"', add
label define educls_head_lbl 43 `"Form 3 (form C)"', add
label define educls_head_lbl 44 `"Diploma or certificate after lower secondary"', add
label define educls_head_lbl 45 `"Vocational training after lower secondary"', add
label define educls_head_lbl 51 `"Form 4 (form D)"', add
label define educls_head_lbl 52 `"Form 5 (form E)"', add
label define educls_head_lbl 60 `"Post-secondary, non-university"', add
label define educls_head_lbl 61 `"Undergraduate or graduate studies"', add
label define educls_head_lbl 62 `"Undergraduate studies"', add
label define educls_head_lbl 63 `"Graduate studies"', add
label define educls_head_lbl 90 `"Other"', add
label values educls_head educls_head_lbl

label define educls_mom_lbl 00 `"NIU (not in universe)"'
label define educls_mom_lbl 10 `"None, preschool, or non-formal education"', add
label define educls_mom_lbl 11 `"None"', add
label define educls_mom_lbl 12 `"Preschool"', add
label define educls_mom_lbl 13 `"Non-formal education"', add
label define educls_mom_lbl 21 `"Standard 1"', add
label define educls_mom_lbl 22 `"Standard 2"', add
label define educls_mom_lbl 23 `"Standard 3"', add
label define educls_mom_lbl 24 `"Standard 4"', add
label define educls_mom_lbl 25 `"Standard 5"', add
label define educls_mom_lbl 26 `"Standard 6"', add
label define educls_mom_lbl 27 `"Standard 7"', add
label define educls_mom_lbl 31 `"Diploma or certificate after primary"', add
label define educls_mom_lbl 32 `"Vocational training after primary"', add
label define educls_mom_lbl 41 `"Form 1 (form A)"', add
label define educls_mom_lbl 42 `"Form 2 (form B)"', add
label define educls_mom_lbl 43 `"Form 3 (form C)"', add
label define educls_mom_lbl 44 `"Diploma or certificate after lower secondary"', add
label define educls_mom_lbl 45 `"Vocational training after lower secondary"', add
label define educls_mom_lbl 51 `"Form 4 (form D)"', add
label define educls_mom_lbl 52 `"Form 5 (form E)"', add
label define educls_mom_lbl 60 `"Post-secondary, non-university"', add
label define educls_mom_lbl 61 `"Undergraduate or graduate studies"', add
label define educls_mom_lbl 62 `"Undergraduate studies"', add
label define educls_mom_lbl 63 `"Graduate studies"', add
label define educls_mom_lbl 90 `"Other"', add
label values educls_mom educls_mom_lbl

label define educls_pop_lbl 00 `"NIU (not in universe)"'
label define educls_pop_lbl 10 `"None, preschool, or non-formal education"', add
label define educls_pop_lbl 11 `"None"', add
label define educls_pop_lbl 12 `"Preschool"', add
label define educls_pop_lbl 13 `"Non-formal education"', add
label define educls_pop_lbl 21 `"Standard 1"', add
label define educls_pop_lbl 22 `"Standard 2"', add
label define educls_pop_lbl 23 `"Standard 3"', add
label define educls_pop_lbl 24 `"Standard 4"', add
label define educls_pop_lbl 25 `"Standard 5"', add
label define educls_pop_lbl 26 `"Standard 6"', add
label define educls_pop_lbl 27 `"Standard 7"', add
label define educls_pop_lbl 31 `"Diploma or certificate after primary"', add
label define educls_pop_lbl 32 `"Vocational training after primary"', add
label define educls_pop_lbl 41 `"Form 1 (form A)"', add
label define educls_pop_lbl 42 `"Form 2 (form B)"', add
label define educls_pop_lbl 43 `"Form 3 (form C)"', add
label define educls_pop_lbl 44 `"Diploma or certificate after lower secondary"', add
label define educls_pop_lbl 45 `"Vocational training after lower secondary"', add
label define educls_pop_lbl 51 `"Form 4 (form D)"', add
label define educls_pop_lbl 52 `"Form 5 (form E)"', add
label define educls_pop_lbl 60 `"Post-secondary, non-university"', add
label define educls_pop_lbl 61 `"Undergraduate or graduate studies"', add
label define educls_pop_lbl 62 `"Undergraduate studies"', add
label define educls_pop_lbl 63 `"Graduate studies"', add
label define educls_pop_lbl 90 `"Other"', add
label values educls_pop educls_pop_lbl

label define educls_sp_lbl 00 `"NIU (not in universe)"'
label define educls_sp_lbl 10 `"None, preschool, or non-formal education"', add
label define educls_sp_lbl 11 `"None"', add
label define educls_sp_lbl 12 `"Preschool"', add
label define educls_sp_lbl 13 `"Non-formal education"', add
label define educls_sp_lbl 21 `"Standard 1"', add
label define educls_sp_lbl 22 `"Standard 2"', add
label define educls_sp_lbl 23 `"Standard 3"', add
label define educls_sp_lbl 24 `"Standard 4"', add
label define educls_sp_lbl 25 `"Standard 5"', add
label define educls_sp_lbl 26 `"Standard 6"', add
label define educls_sp_lbl 27 `"Standard 7"', add
label define educls_sp_lbl 31 `"Diploma or certificate after primary"', add
label define educls_sp_lbl 32 `"Vocational training after primary"', add
label define educls_sp_lbl 41 `"Form 1 (form A)"', add
label define educls_sp_lbl 42 `"Form 2 (form B)"', add
label define educls_sp_lbl 43 `"Form 3 (form C)"', add
label define educls_sp_lbl 44 `"Diploma or certificate after lower secondary"', add
label define educls_sp_lbl 45 `"Vocational training after lower secondary"', add
label define educls_sp_lbl 51 `"Form 4 (form D)"', add
label define educls_sp_lbl 52 `"Form 5 (form E)"', add
label define educls_sp_lbl 60 `"Post-secondary, non-university"', add
label define educls_sp_lbl 61 `"Undergraduate or graduate studies"', add
label define educls_sp_lbl 62 `"Undergraduate studies"', add
label define educls_sp_lbl 63 `"Graduate studies"', add
label define educls_sp_lbl 90 `"Other"', add
label values educls_sp educls_sp_lbl

label define empstat_head_lbl 0 `"NIU (not in universe)"'
label define empstat_head_lbl 1 `"Employed"', add
label define empstat_head_lbl 2 `"Unemployed"', add
label define empstat_head_lbl 3 `"Inactive"', add
label define empstat_head_lbl 9 `"Unknown/missing"', add
label values empstat_head empstat_head_lbl

label define empstat_mom_lbl 0 `"NIU (not in universe)"'
label define empstat_mom_lbl 1 `"Employed"', add
label define empstat_mom_lbl 2 `"Unemployed"', add
label define empstat_mom_lbl 3 `"Inactive"', add
label define empstat_mom_lbl 9 `"Unknown/missing"', add
label values empstat_mom empstat_mom_lbl

label define empstat_pop_lbl 0 `"NIU (not in universe)"'
label define empstat_pop_lbl 1 `"Employed"', add
label define empstat_pop_lbl 2 `"Unemployed"', add
label define empstat_pop_lbl 3 `"Inactive"', add
label define empstat_pop_lbl 9 `"Unknown/missing"', add
label values empstat_pop empstat_pop_lbl

label define empstat_sp_lbl 0 `"NIU (not in universe)"'
label define empstat_sp_lbl 1 `"Employed"', add
label define empstat_sp_lbl 2 `"Unemployed"', add
label define empstat_sp_lbl 3 `"Inactive"', add
label define empstat_sp_lbl 9 `"Unknown/missing"', add
label values empstat_sp empstat_sp_lbl

label define empstatd_head_lbl 000 `"NIU (not in universe)"'
label define empstatd_head_lbl 100 `"Employed, not specified"', add
label define empstatd_head_lbl 110 `"At work"', add
label define empstatd_head_lbl 111 `"At work, and 'student'"', add
label define empstatd_head_lbl 112 `"At work, and 'housework'"', add
label define empstatd_head_lbl 113 `"At work, and 'seeking work'"', add
label define empstatd_head_lbl 114 `"At work, and 'retired'"', add
label define empstatd_head_lbl 115 `"At work, and 'no work'"', add
label define empstatd_head_lbl 116 `"At work, and other situation"', add
label define empstatd_head_lbl 117 `"At work, family holding, not specified"', add
label define empstatd_head_lbl 118 `"At work, family holding, not agricultural"', add
label define empstatd_head_lbl 119 `"At work, family holding, agricultural"', add
label define empstatd_head_lbl 120 `"Have job, not at work in reference period"', add
label define empstatd_head_lbl 130 `"Armed forces"', add
label define empstatd_head_lbl 131 `"Armed forces, at work"', add
label define empstatd_head_lbl 132 `"Armed forces, not at work in reference period"', add
label define empstatd_head_lbl 133 `"Military trainee"', add
label define empstatd_head_lbl 140 `"Marginally employed"', add
label define empstatd_head_lbl 200 `"Unemployed, not specified"', add
label define empstatd_head_lbl 201 `"Unemployed 6 or more months"', add
label define empstatd_head_lbl 202 `"Worked fewer than 6 months, permanent job"', add
label define empstatd_head_lbl 203 `"Worked fewer than 6 months, temporary job"', add
label define empstatd_head_lbl 210 `"Unemployed, experienced worker"', add
label define empstatd_head_lbl 220 `"Unemployed, new worker"', add
label define empstatd_head_lbl 230 `"No work available"', add
label define empstatd_head_lbl 240 `"Inactive unemployed"', add
label define empstatd_head_lbl 300 `"Inactive (not in labor force)"', add
label define empstatd_head_lbl 301 `"Unavailable jobseekers"', add
label define empstatd_head_lbl 302 `"Available potential jobseekers"', add
label define empstatd_head_lbl 310 `"Housework"', add
label define empstatd_head_lbl 320 `"Health reasons, unable to work, or disabled"', add
label define empstatd_head_lbl 321 `"Permanent disability"', add
label define empstatd_head_lbl 322 `"Temporary illness"', add
label define empstatd_head_lbl 323 `"Disabled or imprisoned"', add
label define empstatd_head_lbl 330 `"In school"', add
label define empstatd_head_lbl 340 `"Retirees and living on rent"', add
label define empstatd_head_lbl 341 `"Living on rents"', add
label define empstatd_head_lbl 342 `"Living on rents or pension"', add
label define empstatd_head_lbl 343 `"Retirees/pensioners"', add
label define empstatd_head_lbl 344 `"Retired"', add
label define empstatd_head_lbl 345 `"Pensioner"', add
label define empstatd_head_lbl 346 `"Non-retirement pension"', add
label define empstatd_head_lbl 347 `"Disability pension"', add
label define empstatd_head_lbl 348 `"Retired without benefits"', add
label define empstatd_head_lbl 350 `"Elderly"', add
label define empstatd_head_lbl 351 `"Elderly or disabled"', add
label define empstatd_head_lbl 360 `"Institutionalized"', add
label define empstatd_head_lbl 361 `"Prisoner"', add
label define empstatd_head_lbl 370 `"Intermittent worker"', add
label define empstatd_head_lbl 371 `"Not working, seasonal worker"', add
label define empstatd_head_lbl 372 `"Not working, occasional worker"', add
label define empstatd_head_lbl 380 `"Other income recipient"', add
label define empstatd_head_lbl 390 `"Inactive, other reasons"', add
label define empstatd_head_lbl 391 `"Too young to work"', add
label define empstatd_head_lbl 392 `"Dependent"', add
label define empstatd_head_lbl 999 `"Unknown/missing"', add
label values empstatd_head empstatd_head_lbl

label define empstatd_mom_lbl 000 `"NIU (not in universe)"'
label define empstatd_mom_lbl 100 `"Employed, not specified"', add
label define empstatd_mom_lbl 110 `"At work"', add
label define empstatd_mom_lbl 111 `"At work, and 'student'"', add
label define empstatd_mom_lbl 112 `"At work, and 'housework'"', add
label define empstatd_mom_lbl 113 `"At work, and 'seeking work'"', add
label define empstatd_mom_lbl 114 `"At work, and 'retired'"', add
label define empstatd_mom_lbl 115 `"At work, and 'no work'"', add
label define empstatd_mom_lbl 116 `"At work, and other situation"', add
label define empstatd_mom_lbl 117 `"At work, family holding, not specified"', add
label define empstatd_mom_lbl 118 `"At work, family holding, not agricultural"', add
label define empstatd_mom_lbl 119 `"At work, family holding, agricultural"', add
label define empstatd_mom_lbl 120 `"Have job, not at work in reference period"', add
label define empstatd_mom_lbl 130 `"Armed forces"', add
label define empstatd_mom_lbl 131 `"Armed forces, at work"', add
label define empstatd_mom_lbl 132 `"Armed forces, not at work in reference period"', add
label define empstatd_mom_lbl 133 `"Military trainee"', add
label define empstatd_mom_lbl 140 `"Marginally employed"', add
label define empstatd_mom_lbl 200 `"Unemployed, not specified"', add
label define empstatd_mom_lbl 201 `"Unemployed 6 or more months"', add
label define empstatd_mom_lbl 202 `"Worked fewer than 6 months, permanent job"', add
label define empstatd_mom_lbl 203 `"Worked fewer than 6 months, temporary job"', add
label define empstatd_mom_lbl 210 `"Unemployed, experienced worker"', add
label define empstatd_mom_lbl 220 `"Unemployed, new worker"', add
label define empstatd_mom_lbl 230 `"No work available"', add
label define empstatd_mom_lbl 240 `"Inactive unemployed"', add
label define empstatd_mom_lbl 300 `"Inactive (not in labor force)"', add
label define empstatd_mom_lbl 301 `"Unavailable jobseekers"', add
label define empstatd_mom_lbl 302 `"Available potential jobseekers"', add
label define empstatd_mom_lbl 310 `"Housework"', add
label define empstatd_mom_lbl 320 `"Health reasons, unable to work, or disabled"', add
label define empstatd_mom_lbl 321 `"Permanent disability"', add
label define empstatd_mom_lbl 322 `"Temporary illness"', add
label define empstatd_mom_lbl 323 `"Disabled or imprisoned"', add
label define empstatd_mom_lbl 330 `"In school"', add
label define empstatd_mom_lbl 340 `"Retirees and living on rent"', add
label define empstatd_mom_lbl 341 `"Living on rents"', add
label define empstatd_mom_lbl 342 `"Living on rents or pension"', add
label define empstatd_mom_lbl 343 `"Retirees/pensioners"', add
label define empstatd_mom_lbl 344 `"Retired"', add
label define empstatd_mom_lbl 345 `"Pensioner"', add
label define empstatd_mom_lbl 346 `"Non-retirement pension"', add
label define empstatd_mom_lbl 347 `"Disability pension"', add
label define empstatd_mom_lbl 348 `"Retired without benefits"', add
label define empstatd_mom_lbl 350 `"Elderly"', add
label define empstatd_mom_lbl 351 `"Elderly or disabled"', add
label define empstatd_mom_lbl 360 `"Institutionalized"', add
label define empstatd_mom_lbl 361 `"Prisoner"', add
label define empstatd_mom_lbl 370 `"Intermittent worker"', add
label define empstatd_mom_lbl 371 `"Not working, seasonal worker"', add
label define empstatd_mom_lbl 372 `"Not working, occasional worker"', add
label define empstatd_mom_lbl 380 `"Other income recipient"', add
label define empstatd_mom_lbl 390 `"Inactive, other reasons"', add
label define empstatd_mom_lbl 391 `"Too young to work"', add
label define empstatd_mom_lbl 392 `"Dependent"', add
label define empstatd_mom_lbl 999 `"Unknown/missing"', add
label values empstatd_mom empstatd_mom_lbl

label define empstatd_pop_lbl 000 `"NIU (not in universe)"'
label define empstatd_pop_lbl 100 `"Employed, not specified"', add
label define empstatd_pop_lbl 110 `"At work"', add
label define empstatd_pop_lbl 111 `"At work, and 'student'"', add
label define empstatd_pop_lbl 112 `"At work, and 'housework'"', add
label define empstatd_pop_lbl 113 `"At work, and 'seeking work'"', add
label define empstatd_pop_lbl 114 `"At work, and 'retired'"', add
label define empstatd_pop_lbl 115 `"At work, and 'no work'"', add
label define empstatd_pop_lbl 116 `"At work, and other situation"', add
label define empstatd_pop_lbl 117 `"At work, family holding, not specified"', add
label define empstatd_pop_lbl 118 `"At work, family holding, not agricultural"', add
label define empstatd_pop_lbl 119 `"At work, family holding, agricultural"', add
label define empstatd_pop_lbl 120 `"Have job, not at work in reference period"', add
label define empstatd_pop_lbl 130 `"Armed forces"', add
label define empstatd_pop_lbl 131 `"Armed forces, at work"', add
label define empstatd_pop_lbl 132 `"Armed forces, not at work in reference period"', add
label define empstatd_pop_lbl 133 `"Military trainee"', add
label define empstatd_pop_lbl 140 `"Marginally employed"', add
label define empstatd_pop_lbl 200 `"Unemployed, not specified"', add
label define empstatd_pop_lbl 201 `"Unemployed 6 or more months"', add
label define empstatd_pop_lbl 202 `"Worked fewer than 6 months, permanent job"', add
label define empstatd_pop_lbl 203 `"Worked fewer than 6 months, temporary job"', add
label define empstatd_pop_lbl 210 `"Unemployed, experienced worker"', add
label define empstatd_pop_lbl 220 `"Unemployed, new worker"', add
label define empstatd_pop_lbl 230 `"No work available"', add
label define empstatd_pop_lbl 240 `"Inactive unemployed"', add
label define empstatd_pop_lbl 300 `"Inactive (not in labor force)"', add
label define empstatd_pop_lbl 301 `"Unavailable jobseekers"', add
label define empstatd_pop_lbl 302 `"Available potential jobseekers"', add
label define empstatd_pop_lbl 310 `"Housework"', add
label define empstatd_pop_lbl 320 `"Health reasons, unable to work, or disabled"', add
label define empstatd_pop_lbl 321 `"Permanent disability"', add
label define empstatd_pop_lbl 322 `"Temporary illness"', add
label define empstatd_pop_lbl 323 `"Disabled or imprisoned"', add
label define empstatd_pop_lbl 330 `"In school"', add
label define empstatd_pop_lbl 340 `"Retirees and living on rent"', add
label define empstatd_pop_lbl 341 `"Living on rents"', add
label define empstatd_pop_lbl 342 `"Living on rents or pension"', add
label define empstatd_pop_lbl 343 `"Retirees/pensioners"', add
label define empstatd_pop_lbl 344 `"Retired"', add
label define empstatd_pop_lbl 345 `"Pensioner"', add
label define empstatd_pop_lbl 346 `"Non-retirement pension"', add
label define empstatd_pop_lbl 347 `"Disability pension"', add
label define empstatd_pop_lbl 348 `"Retired without benefits"', add
label define empstatd_pop_lbl 350 `"Elderly"', add
label define empstatd_pop_lbl 351 `"Elderly or disabled"', add
label define empstatd_pop_lbl 360 `"Institutionalized"', add
label define empstatd_pop_lbl 361 `"Prisoner"', add
label define empstatd_pop_lbl 370 `"Intermittent worker"', add
label define empstatd_pop_lbl 371 `"Not working, seasonal worker"', add
label define empstatd_pop_lbl 372 `"Not working, occasional worker"', add
label define empstatd_pop_lbl 380 `"Other income recipient"', add
label define empstatd_pop_lbl 390 `"Inactive, other reasons"', add
label define empstatd_pop_lbl 391 `"Too young to work"', add
label define empstatd_pop_lbl 392 `"Dependent"', add
label define empstatd_pop_lbl 999 `"Unknown/missing"', add
label values empstatd_pop empstatd_pop_lbl

label define empstatd_sp_lbl 000 `"NIU (not in universe)"'
label define empstatd_sp_lbl 100 `"Employed, not specified"', add
label define empstatd_sp_lbl 110 `"At work"', add
label define empstatd_sp_lbl 111 `"At work, and 'student'"', add
label define empstatd_sp_lbl 112 `"At work, and 'housework'"', add
label define empstatd_sp_lbl 113 `"At work, and 'seeking work'"', add
label define empstatd_sp_lbl 114 `"At work, and 'retired'"', add
label define empstatd_sp_lbl 115 `"At work, and 'no work'"', add
label define empstatd_sp_lbl 116 `"At work, and other situation"', add
label define empstatd_sp_lbl 117 `"At work, family holding, not specified"', add
label define empstatd_sp_lbl 118 `"At work, family holding, not agricultural"', add
label define empstatd_sp_lbl 119 `"At work, family holding, agricultural"', add
label define empstatd_sp_lbl 120 `"Have job, not at work in reference period"', add
label define empstatd_sp_lbl 130 `"Armed forces"', add
label define empstatd_sp_lbl 131 `"Armed forces, at work"', add
label define empstatd_sp_lbl 132 `"Armed forces, not at work in reference period"', add
label define empstatd_sp_lbl 133 `"Military trainee"', add
label define empstatd_sp_lbl 140 `"Marginally employed"', add
label define empstatd_sp_lbl 200 `"Unemployed, not specified"', add
label define empstatd_sp_lbl 201 `"Unemployed 6 or more months"', add
label define empstatd_sp_lbl 202 `"Worked fewer than 6 months, permanent job"', add
label define empstatd_sp_lbl 203 `"Worked fewer than 6 months, temporary job"', add
label define empstatd_sp_lbl 210 `"Unemployed, experienced worker"', add
label define empstatd_sp_lbl 220 `"Unemployed, new worker"', add
label define empstatd_sp_lbl 230 `"No work available"', add
label define empstatd_sp_lbl 240 `"Inactive unemployed"', add
label define empstatd_sp_lbl 300 `"Inactive (not in labor force)"', add
label define empstatd_sp_lbl 301 `"Unavailable jobseekers"', add
label define empstatd_sp_lbl 302 `"Available potential jobseekers"', add
label define empstatd_sp_lbl 310 `"Housework"', add
label define empstatd_sp_lbl 320 `"Health reasons, unable to work, or disabled"', add
label define empstatd_sp_lbl 321 `"Permanent disability"', add
label define empstatd_sp_lbl 322 `"Temporary illness"', add
label define empstatd_sp_lbl 323 `"Disabled or imprisoned"', add
label define empstatd_sp_lbl 330 `"In school"', add
label define empstatd_sp_lbl 340 `"Retirees and living on rent"', add
label define empstatd_sp_lbl 341 `"Living on rents"', add
label define empstatd_sp_lbl 342 `"Living on rents or pension"', add
label define empstatd_sp_lbl 343 `"Retirees/pensioners"', add
label define empstatd_sp_lbl 344 `"Retired"', add
label define empstatd_sp_lbl 345 `"Pensioner"', add
label define empstatd_sp_lbl 346 `"Non-retirement pension"', add
label define empstatd_sp_lbl 347 `"Disability pension"', add
label define empstatd_sp_lbl 348 `"Retired without benefits"', add
label define empstatd_sp_lbl 350 `"Elderly"', add
label define empstatd_sp_lbl 351 `"Elderly or disabled"', add
label define empstatd_sp_lbl 360 `"Institutionalized"', add
label define empstatd_sp_lbl 361 `"Prisoner"', add
label define empstatd_sp_lbl 370 `"Intermittent worker"', add
label define empstatd_sp_lbl 371 `"Not working, seasonal worker"', add
label define empstatd_sp_lbl 372 `"Not working, occasional worker"', add
label define empstatd_sp_lbl 380 `"Other income recipient"', add
label define empstatd_sp_lbl 390 `"Inactive, other reasons"', add
label define empstatd_sp_lbl 391 `"Too young to work"', add
label define empstatd_sp_lbl 392 `"Dependent"', add
label define empstatd_sp_lbl 999 `"Unknown/missing"', add
label values empstatd_sp empstatd_sp_lbl

label define labforce_head_lbl 1 `"No, not in the labor force"'
label define labforce_head_lbl 2 `"Yes, in the labor force"', add
label define labforce_head_lbl 8 `"Unknown"', add
label define labforce_head_lbl 9 `"NIU (not in universe)"', add
label values labforce_head labforce_head_lbl

label define labforce_mom_lbl 1 `"No, not in the labor force"'
label define labforce_mom_lbl 2 `"Yes, in the labor force"', add
label define labforce_mom_lbl 8 `"Unknown"', add
label define labforce_mom_lbl 9 `"NIU (not in universe)"', add
label values labforce_mom labforce_mom_lbl

label define labforce_pop_lbl 1 `"No, not in the labor force"'
label define labforce_pop_lbl 2 `"Yes, in the labor force"', add
label define labforce_pop_lbl 8 `"Unknown"', add
label define labforce_pop_lbl 9 `"NIU (not in universe)"', add
label values labforce_pop labforce_pop_lbl

label define labforce_sp_lbl 1 `"No, not in the labor force"'
label define labforce_sp_lbl 2 `"Yes, in the labor force"', add
label define labforce_sp_lbl 8 `"Unknown"', add
label define labforce_sp_lbl 9 `"NIU (not in universe)"', add
label values labforce_sp labforce_sp_lbl

label define occisco_head_lbl 01 `"Legislators, senior officials and managers"'
label define occisco_head_lbl 02 `"Professionals"', add
label define occisco_head_lbl 03 `"Technicians and associate professionals"', add
label define occisco_head_lbl 04 `"Clerks"', add
label define occisco_head_lbl 05 `"Service workers and shop and market sales"', add
label define occisco_head_lbl 06 `"Skilled agricultural and fishery workers"', add
label define occisco_head_lbl 07 `"Crafts and related trades workers"', add
label define occisco_head_lbl 08 `"Plant and machine operators and assemblers"', add
label define occisco_head_lbl 09 `"Elementary occupations"', add
label define occisco_head_lbl 10 `"Armed forces"', add
label define occisco_head_lbl 11 `"Other occupations, unspecified or n.e.c."', add
label define occisco_head_lbl 97 `"Response suppressed"', add
label define occisco_head_lbl 98 `"Unknown"', add
label define occisco_head_lbl 99 `"NIU (not in universe)"', add
label values occisco_head occisco_head_lbl

label define occisco_mom_lbl 01 `"Legislators, senior officials and managers"'
label define occisco_mom_lbl 02 `"Professionals"', add
label define occisco_mom_lbl 03 `"Technicians and associate professionals"', add
label define occisco_mom_lbl 04 `"Clerks"', add
label define occisco_mom_lbl 05 `"Service workers and shop and market sales"', add
label define occisco_mom_lbl 06 `"Skilled agricultural and fishery workers"', add
label define occisco_mom_lbl 07 `"Crafts and related trades workers"', add
label define occisco_mom_lbl 08 `"Plant and machine operators and assemblers"', add
label define occisco_mom_lbl 09 `"Elementary occupations"', add
label define occisco_mom_lbl 10 `"Armed forces"', add
label define occisco_mom_lbl 11 `"Other occupations, unspecified or n.e.c."', add
label define occisco_mom_lbl 97 `"Response suppressed"', add
label define occisco_mom_lbl 98 `"Unknown"', add
label define occisco_mom_lbl 99 `"NIU (not in universe)"', add
label values occisco_mom occisco_mom_lbl

label define occisco_pop_lbl 01 `"Legislators, senior officials and managers"'
label define occisco_pop_lbl 02 `"Professionals"', add
label define occisco_pop_lbl 03 `"Technicians and associate professionals"', add
label define occisco_pop_lbl 04 `"Clerks"', add
label define occisco_pop_lbl 05 `"Service workers and shop and market sales"', add
label define occisco_pop_lbl 06 `"Skilled agricultural and fishery workers"', add
label define occisco_pop_lbl 07 `"Crafts and related trades workers"', add
label define occisco_pop_lbl 08 `"Plant and machine operators and assemblers"', add
label define occisco_pop_lbl 09 `"Elementary occupations"', add
label define occisco_pop_lbl 10 `"Armed forces"', add
label define occisco_pop_lbl 11 `"Other occupations, unspecified or n.e.c."', add
label define occisco_pop_lbl 97 `"Response suppressed"', add
label define occisco_pop_lbl 98 `"Unknown"', add
label define occisco_pop_lbl 99 `"NIU (not in universe)"', add
label values occisco_pop occisco_pop_lbl

label define occisco_sp_lbl 01 `"Legislators, senior officials and managers"'
label define occisco_sp_lbl 02 `"Professionals"', add
label define occisco_sp_lbl 03 `"Technicians and associate professionals"', add
label define occisco_sp_lbl 04 `"Clerks"', add
label define occisco_sp_lbl 05 `"Service workers and shop and market sales"', add
label define occisco_sp_lbl 06 `"Skilled agricultural and fishery workers"', add
label define occisco_sp_lbl 07 `"Crafts and related trades workers"', add
label define occisco_sp_lbl 08 `"Plant and machine operators and assemblers"', add
label define occisco_sp_lbl 09 `"Elementary occupations"', add
label define occisco_sp_lbl 10 `"Armed forces"', add
label define occisco_sp_lbl 11 `"Other occupations, unspecified or n.e.c."', add
label define occisco_sp_lbl 97 `"Response suppressed"', add
label define occisco_sp_lbl 98 `"Unknown"', add
label define occisco_sp_lbl 99 `"NIU (not in universe)"', add
label values occisco_sp occisco_sp_lbl

label define indgen_head_lbl 000 `"NIU (not in universe)"'
label define indgen_head_lbl 010 `"Agriculture, fishing, and forestry"', add
label define indgen_head_lbl 020 `"Mining and extraction"', add
label define indgen_head_lbl 030 `"Manufacturing"', add
label define indgen_head_lbl 040 `"Electricity, gas, water and waste management"', add
label define indgen_head_lbl 050 `"Construction"', add
label define indgen_head_lbl 060 `"Wholesale and retail trade"', add
label define indgen_head_lbl 070 `"Hotels and restaurants"', add
label define indgen_head_lbl 080 `"Transportation, storage, and communications"', add
label define indgen_head_lbl 090 `"Financial services and insurance"', add
label define indgen_head_lbl 100 `"Public administration and defense"', add
label define indgen_head_lbl 110 `"Services, not specified"', add
label define indgen_head_lbl 111 `"Business services and real estate"', add
label define indgen_head_lbl 112 `"Education"', add
label define indgen_head_lbl 113 `"Health and social work"', add
label define indgen_head_lbl 114 `"Other services"', add
label define indgen_head_lbl 120 `"Private household services"', add
label define indgen_head_lbl 130 `"Other industry, n.e.c."', add
label define indgen_head_lbl 998 `"Response suppressed"', add
label define indgen_head_lbl 999 `"Unknown"', add
label values indgen_head indgen_head_lbl

label define indgen_mom_lbl 000 `"NIU (not in universe)"'
label define indgen_mom_lbl 010 `"Agriculture, fishing, and forestry"', add
label define indgen_mom_lbl 020 `"Mining and extraction"', add
label define indgen_mom_lbl 030 `"Manufacturing"', add
label define indgen_mom_lbl 040 `"Electricity, gas, water and waste management"', add
label define indgen_mom_lbl 050 `"Construction"', add
label define indgen_mom_lbl 060 `"Wholesale and retail trade"', add
label define indgen_mom_lbl 070 `"Hotels and restaurants"', add
label define indgen_mom_lbl 080 `"Transportation, storage, and communications"', add
label define indgen_mom_lbl 090 `"Financial services and insurance"', add
label define indgen_mom_lbl 100 `"Public administration and defense"', add
label define indgen_mom_lbl 110 `"Services, not specified"', add
label define indgen_mom_lbl 111 `"Business services and real estate"', add
label define indgen_mom_lbl 112 `"Education"', add
label define indgen_mom_lbl 113 `"Health and social work"', add
label define indgen_mom_lbl 114 `"Other services"', add
label define indgen_mom_lbl 120 `"Private household services"', add
label define indgen_mom_lbl 130 `"Other industry, n.e.c."', add
label define indgen_mom_lbl 998 `"Response suppressed"', add
label define indgen_mom_lbl 999 `"Unknown"', add
label values indgen_mom indgen_mom_lbl

label define indgen_pop_lbl 000 `"NIU (not in universe)"'
label define indgen_pop_lbl 010 `"Agriculture, fishing, and forestry"', add
label define indgen_pop_lbl 020 `"Mining and extraction"', add
label define indgen_pop_lbl 030 `"Manufacturing"', add
label define indgen_pop_lbl 040 `"Electricity, gas, water and waste management"', add
label define indgen_pop_lbl 050 `"Construction"', add
label define indgen_pop_lbl 060 `"Wholesale and retail trade"', add
label define indgen_pop_lbl 070 `"Hotels and restaurants"', add
label define indgen_pop_lbl 080 `"Transportation, storage, and communications"', add
label define indgen_pop_lbl 090 `"Financial services and insurance"', add
label define indgen_pop_lbl 100 `"Public administration and defense"', add
label define indgen_pop_lbl 110 `"Services, not specified"', add
label define indgen_pop_lbl 111 `"Business services and real estate"', add
label define indgen_pop_lbl 112 `"Education"', add
label define indgen_pop_lbl 113 `"Health and social work"', add
label define indgen_pop_lbl 114 `"Other services"', add
label define indgen_pop_lbl 120 `"Private household services"', add
label define indgen_pop_lbl 130 `"Other industry, n.e.c."', add
label define indgen_pop_lbl 998 `"Response suppressed"', add
label define indgen_pop_lbl 999 `"Unknown"', add
label values indgen_pop indgen_pop_lbl

label define indgen_sp_lbl 000 `"NIU (not in universe)"'
label define indgen_sp_lbl 010 `"Agriculture, fishing, and forestry"', add
label define indgen_sp_lbl 020 `"Mining and extraction"', add
label define indgen_sp_lbl 030 `"Manufacturing"', add
label define indgen_sp_lbl 040 `"Electricity, gas, water and waste management"', add
label define indgen_sp_lbl 050 `"Construction"', add
label define indgen_sp_lbl 060 `"Wholesale and retail trade"', add
label define indgen_sp_lbl 070 `"Hotels and restaurants"', add
label define indgen_sp_lbl 080 `"Transportation, storage, and communications"', add
label define indgen_sp_lbl 090 `"Financial services and insurance"', add
label define indgen_sp_lbl 100 `"Public administration and defense"', add
label define indgen_sp_lbl 110 `"Services, not specified"', add
label define indgen_sp_lbl 111 `"Business services and real estate"', add
label define indgen_sp_lbl 112 `"Education"', add
label define indgen_sp_lbl 113 `"Health and social work"', add
label define indgen_sp_lbl 114 `"Other services"', add
label define indgen_sp_lbl 120 `"Private household services"', add
label define indgen_sp_lbl 130 `"Other industry, n.e.c."', add
label define indgen_sp_lbl 998 `"Response suppressed"', add
label define indgen_sp_lbl 999 `"Unknown"', add
label values indgen_sp indgen_sp_lbl

label define classwk_head_lbl 0 `"NIU (not in universe)"'
label define classwk_head_lbl 1 `"Self-employed"', add
label define classwk_head_lbl 2 `"Wage/salary worker"', add
label define classwk_head_lbl 3 `"Unpaid worker"', add
label define classwk_head_lbl 4 `"Other"', add
label define classwk_head_lbl 9 `"Unknown/missing"', add
label values classwk_head classwk_head_lbl

label define classwk_mom_lbl 0 `"NIU (not in universe)"'
label define classwk_mom_lbl 1 `"Self-employed"', add
label define classwk_mom_lbl 2 `"Wage/salary worker"', add
label define classwk_mom_lbl 3 `"Unpaid worker"', add
label define classwk_mom_lbl 4 `"Other"', add
label define classwk_mom_lbl 9 `"Unknown/missing"', add
label values classwk_mom classwk_mom_lbl

label define classwk_pop_lbl 0 `"NIU (not in universe)"'
label define classwk_pop_lbl 1 `"Self-employed"', add
label define classwk_pop_lbl 2 `"Wage/salary worker"', add
label define classwk_pop_lbl 3 `"Unpaid worker"', add
label define classwk_pop_lbl 4 `"Other"', add
label define classwk_pop_lbl 9 `"Unknown/missing"', add
label values classwk_pop classwk_pop_lbl

label define classwk_sp_lbl 0 `"NIU (not in universe)"'
label define classwk_sp_lbl 1 `"Self-employed"', add
label define classwk_sp_lbl 2 `"Wage/salary worker"', add
label define classwk_sp_lbl 3 `"Unpaid worker"', add
label define classwk_sp_lbl 4 `"Other"', add
label define classwk_sp_lbl 9 `"Unknown/missing"', add
label values classwk_sp classwk_sp_lbl

label define classwkd_head_lbl 000 `"NIU (not in universe)"'
label define classwkd_head_lbl 100 `"Self-employed"', add
label define classwkd_head_lbl 101 `"Self-employed, unincorporated"', add
label define classwkd_head_lbl 102 `"Self-employed, incorporated"', add
label define classwkd_head_lbl 110 `"Employer"', add
label define classwkd_head_lbl 111 `"Sharecropper, employer"', add
label define classwkd_head_lbl 120 `"Working on own account"', add
label define classwkd_head_lbl 121 `"Own account, agriculture"', add
label define classwkd_head_lbl 122 `"Domestic worker, self-employed"', add
label define classwkd_head_lbl 123 `"Subsistence worker, own consumption"', add
label define classwkd_head_lbl 124 `"Own account, other"', add
label define classwkd_head_lbl 125 `"Own account, without temporary/unpaid help"', add
label define classwkd_head_lbl 126 `"Own account, with temporary/unpaid help"', add
label define classwkd_head_lbl 130 `"Member of cooperative"', add
label define classwkd_head_lbl 140 `"Sharecropper"', add
label define classwkd_head_lbl 141 `"Sharecropper, self-employed"', add
label define classwkd_head_lbl 142 `"Sharecropper, employee"', add
label define classwkd_head_lbl 150 `"Kibbutz member"', add
label define classwkd_head_lbl 199 `"Self-employed, not specified"', add
label define classwkd_head_lbl 200 `"Wage/salary worker"', add
label define classwkd_head_lbl 201 `"Management"', add
label define classwkd_head_lbl 202 `"Non-management"', add
label define classwkd_head_lbl 203 `"White collar (non-manual)"', add
label define classwkd_head_lbl 204 `"Blue collar (manual)"', add
label define classwkd_head_lbl 205 `"White or blue collar"', add
label define classwkd_head_lbl 206 `"Day laborer"', add
label define classwkd_head_lbl 207 `"Employee, with a permanent job"', add
label define classwkd_head_lbl 208 `"Employee, occasional, temporary, contract"', add
label define classwkd_head_lbl 209 `"Employee without legal contract"', add
label define classwkd_head_lbl 210 `"Wage/salary worker, private employer"', add
label define classwkd_head_lbl 211 `"Apprentice"', add
label define classwkd_head_lbl 212 `"Religious worker"', add
label define classwkd_head_lbl 213 `"Wage/salary worker, non-profit, NGO"', add
label define classwkd_head_lbl 214 `"White collar, private"', add
label define classwkd_head_lbl 215 `"Blue collar, private"', add
label define classwkd_head_lbl 216 `"Paid family worker"', add
label define classwkd_head_lbl 217 `"Cooperative employee"', add
label define classwkd_head_lbl 220 `"Wage/salary worker, government or public sector"', add
label define classwkd_head_lbl 221 `"Federal, government employee"', add
label define classwkd_head_lbl 222 `"State government employee"', add
label define classwkd_head_lbl 223 `"Local government employee"', add
label define classwkd_head_lbl 224 `"White collar, public"', add
label define classwkd_head_lbl 225 `"Blue collar, public"', add
label define classwkd_head_lbl 226 `"Public companies"', add
label define classwkd_head_lbl 227 `"Civil servants, local collectives"', add
label define classwkd_head_lbl 230 `"Domestic worker (work for private household)"', add
label define classwkd_head_lbl 240 `"Seasonal migrant"', add
label define classwkd_head_lbl 241 `"Seasonal migrant, no broker"', add
label define classwkd_head_lbl 242 `"Seasonal migrant, uses broker"', add
label define classwkd_head_lbl 250 `"Other wage and salary"', add
label define classwkd_head_lbl 251 `"Canal zone/commission employee"', add
label define classwkd_head_lbl 252 `"Government employment/training program"', add
label define classwkd_head_lbl 253 `"Mixed state/private enterprise/parastatal"', add
label define classwkd_head_lbl 254 `"Government public work program"', add
label define classwkd_head_lbl 255 `"State enterprise employee"', add
label define classwkd_head_lbl 256 `"Coordinated and continuous collaboration job"', add
label define classwkd_head_lbl 300 `"Unpaid worker"', add
label define classwkd_head_lbl 310 `"Unpaid family worker"', add
label define classwkd_head_lbl 320 `"Apprentice, unpaid or unspecified"', add
label define classwkd_head_lbl 330 `"Trainee"', add
label define classwkd_head_lbl 340 `"Apprentice or trainee"', add
label define classwkd_head_lbl 350 `"Works for others without wage"', add
label define classwkd_head_lbl 400 `"Other"', add
label define classwkd_head_lbl 999 `"Unknown/missing"', add
label values classwkd_head classwkd_head_lbl

label define classwkd_mom_lbl 000 `"NIU (not in universe)"'
label define classwkd_mom_lbl 100 `"Self-employed"', add
label define classwkd_mom_lbl 101 `"Self-employed, unincorporated"', add
label define classwkd_mom_lbl 102 `"Self-employed, incorporated"', add
label define classwkd_mom_lbl 110 `"Employer"', add
label define classwkd_mom_lbl 111 `"Sharecropper, employer"', add
label define classwkd_mom_lbl 120 `"Working on own account"', add
label define classwkd_mom_lbl 121 `"Own account, agriculture"', add
label define classwkd_mom_lbl 122 `"Domestic worker, self-employed"', add
label define classwkd_mom_lbl 123 `"Subsistence worker, own consumption"', add
label define classwkd_mom_lbl 124 `"Own account, other"', add
label define classwkd_mom_lbl 125 `"Own account, without temporary/unpaid help"', add
label define classwkd_mom_lbl 126 `"Own account, with temporary/unpaid help"', add
label define classwkd_mom_lbl 130 `"Member of cooperative"', add
label define classwkd_mom_lbl 140 `"Sharecropper"', add
label define classwkd_mom_lbl 141 `"Sharecropper, self-employed"', add
label define classwkd_mom_lbl 142 `"Sharecropper, employee"', add
label define classwkd_mom_lbl 150 `"Kibbutz member"', add
label define classwkd_mom_lbl 199 `"Self-employed, not specified"', add
label define classwkd_mom_lbl 200 `"Wage/salary worker"', add
label define classwkd_mom_lbl 201 `"Management"', add
label define classwkd_mom_lbl 202 `"Non-management"', add
label define classwkd_mom_lbl 203 `"White collar (non-manual)"', add
label define classwkd_mom_lbl 204 `"Blue collar (manual)"', add
label define classwkd_mom_lbl 205 `"White or blue collar"', add
label define classwkd_mom_lbl 206 `"Day laborer"', add
label define classwkd_mom_lbl 207 `"Employee, with a permanent job"', add
label define classwkd_mom_lbl 208 `"Employee, occasional, temporary, contract"', add
label define classwkd_mom_lbl 209 `"Employee without legal contract"', add
label define classwkd_mom_lbl 210 `"Wage/salary worker, private employer"', add
label define classwkd_mom_lbl 211 `"Apprentice"', add
label define classwkd_mom_lbl 212 `"Religious worker"', add
label define classwkd_mom_lbl 213 `"Wage/salary worker, non-profit, NGO"', add
label define classwkd_mom_lbl 214 `"White collar, private"', add
label define classwkd_mom_lbl 215 `"Blue collar, private"', add
label define classwkd_mom_lbl 216 `"Paid family worker"', add
label define classwkd_mom_lbl 217 `"Cooperative employee"', add
label define classwkd_mom_lbl 220 `"Wage/salary worker, government or public sector"', add
label define classwkd_mom_lbl 221 `"Federal, government employee"', add
label define classwkd_mom_lbl 222 `"State government employee"', add
label define classwkd_mom_lbl 223 `"Local government employee"', add
label define classwkd_mom_lbl 224 `"White collar, public"', add
label define classwkd_mom_lbl 225 `"Blue collar, public"', add
label define classwkd_mom_lbl 226 `"Public companies"', add
label define classwkd_mom_lbl 227 `"Civil servants, local collectives"', add
label define classwkd_mom_lbl 230 `"Domestic worker (work for private household)"', add
label define classwkd_mom_lbl 240 `"Seasonal migrant"', add
label define classwkd_mom_lbl 241 `"Seasonal migrant, no broker"', add
label define classwkd_mom_lbl 242 `"Seasonal migrant, uses broker"', add
label define classwkd_mom_lbl 250 `"Other wage and salary"', add
label define classwkd_mom_lbl 251 `"Canal zone/commission employee"', add
label define classwkd_mom_lbl 252 `"Government employment/training program"', add
label define classwkd_mom_lbl 253 `"Mixed state/private enterprise/parastatal"', add
label define classwkd_mom_lbl 254 `"Government public work program"', add
label define classwkd_mom_lbl 255 `"State enterprise employee"', add
label define classwkd_mom_lbl 256 `"Coordinated and continuous collaboration job"', add
label define classwkd_mom_lbl 300 `"Unpaid worker"', add
label define classwkd_mom_lbl 310 `"Unpaid family worker"', add
label define classwkd_mom_lbl 320 `"Apprentice, unpaid or unspecified"', add
label define classwkd_mom_lbl 330 `"Trainee"', add
label define classwkd_mom_lbl 340 `"Apprentice or trainee"', add
label define classwkd_mom_lbl 350 `"Works for others without wage"', add
label define classwkd_mom_lbl 400 `"Other"', add
label define classwkd_mom_lbl 999 `"Unknown/missing"', add
label values classwkd_mom classwkd_mom_lbl

label define classwkd_pop_lbl 000 `"NIU (not in universe)"'
label define classwkd_pop_lbl 100 `"Self-employed"', add
label define classwkd_pop_lbl 101 `"Self-employed, unincorporated"', add
label define classwkd_pop_lbl 102 `"Self-employed, incorporated"', add
label define classwkd_pop_lbl 110 `"Employer"', add
label define classwkd_pop_lbl 111 `"Sharecropper, employer"', add
label define classwkd_pop_lbl 120 `"Working on own account"', add
label define classwkd_pop_lbl 121 `"Own account, agriculture"', add
label define classwkd_pop_lbl 122 `"Domestic worker, self-employed"', add
label define classwkd_pop_lbl 123 `"Subsistence worker, own consumption"', add
label define classwkd_pop_lbl 124 `"Own account, other"', add
label define classwkd_pop_lbl 125 `"Own account, without temporary/unpaid help"', add
label define classwkd_pop_lbl 126 `"Own account, with temporary/unpaid help"', add
label define classwkd_pop_lbl 130 `"Member of cooperative"', add
label define classwkd_pop_lbl 140 `"Sharecropper"', add
label define classwkd_pop_lbl 141 `"Sharecropper, self-employed"', add
label define classwkd_pop_lbl 142 `"Sharecropper, employee"', add
label define classwkd_pop_lbl 150 `"Kibbutz member"', add
label define classwkd_pop_lbl 199 `"Self-employed, not specified"', add
label define classwkd_pop_lbl 200 `"Wage/salary worker"', add
label define classwkd_pop_lbl 201 `"Management"', add
label define classwkd_pop_lbl 202 `"Non-management"', add
label define classwkd_pop_lbl 203 `"White collar (non-manual)"', add
label define classwkd_pop_lbl 204 `"Blue collar (manual)"', add
label define classwkd_pop_lbl 205 `"White or blue collar"', add
label define classwkd_pop_lbl 206 `"Day laborer"', add
label define classwkd_pop_lbl 207 `"Employee, with a permanent job"', add
label define classwkd_pop_lbl 208 `"Employee, occasional, temporary, contract"', add
label define classwkd_pop_lbl 209 `"Employee without legal contract"', add
label define classwkd_pop_lbl 210 `"Wage/salary worker, private employer"', add
label define classwkd_pop_lbl 211 `"Apprentice"', add
label define classwkd_pop_lbl 212 `"Religious worker"', add
label define classwkd_pop_lbl 213 `"Wage/salary worker, non-profit, NGO"', add
label define classwkd_pop_lbl 214 `"White collar, private"', add
label define classwkd_pop_lbl 215 `"Blue collar, private"', add
label define classwkd_pop_lbl 216 `"Paid family worker"', add
label define classwkd_pop_lbl 217 `"Cooperative employee"', add
label define classwkd_pop_lbl 220 `"Wage/salary worker, government or public sector"', add
label define classwkd_pop_lbl 221 `"Federal, government employee"', add
label define classwkd_pop_lbl 222 `"State government employee"', add
label define classwkd_pop_lbl 223 `"Local government employee"', add
label define classwkd_pop_lbl 224 `"White collar, public"', add
label define classwkd_pop_lbl 225 `"Blue collar, public"', add
label define classwkd_pop_lbl 226 `"Public companies"', add
label define classwkd_pop_lbl 227 `"Civil servants, local collectives"', add
label define classwkd_pop_lbl 230 `"Domestic worker (work for private household)"', add
label define classwkd_pop_lbl 240 `"Seasonal migrant"', add
label define classwkd_pop_lbl 241 `"Seasonal migrant, no broker"', add
label define classwkd_pop_lbl 242 `"Seasonal migrant, uses broker"', add
label define classwkd_pop_lbl 250 `"Other wage and salary"', add
label define classwkd_pop_lbl 251 `"Canal zone/commission employee"', add
label define classwkd_pop_lbl 252 `"Government employment/training program"', add
label define classwkd_pop_lbl 253 `"Mixed state/private enterprise/parastatal"', add
label define classwkd_pop_lbl 254 `"Government public work program"', add
label define classwkd_pop_lbl 255 `"State enterprise employee"', add
label define classwkd_pop_lbl 256 `"Coordinated and continuous collaboration job"', add
label define classwkd_pop_lbl 300 `"Unpaid worker"', add
label define classwkd_pop_lbl 310 `"Unpaid family worker"', add
label define classwkd_pop_lbl 320 `"Apprentice, unpaid or unspecified"', add
label define classwkd_pop_lbl 330 `"Trainee"', add
label define classwkd_pop_lbl 340 `"Apprentice or trainee"', add
label define classwkd_pop_lbl 350 `"Works for others without wage"', add
label define classwkd_pop_lbl 400 `"Other"', add
label define classwkd_pop_lbl 999 `"Unknown/missing"', add
label values classwkd_pop classwkd_pop_lbl

label define classwkd_sp_lbl 000 `"NIU (not in universe)"'
label define classwkd_sp_lbl 100 `"Self-employed"', add
label define classwkd_sp_lbl 101 `"Self-employed, unincorporated"', add
label define classwkd_sp_lbl 102 `"Self-employed, incorporated"', add
label define classwkd_sp_lbl 110 `"Employer"', add
label define classwkd_sp_lbl 111 `"Sharecropper, employer"', add
label define classwkd_sp_lbl 120 `"Working on own account"', add
label define classwkd_sp_lbl 121 `"Own account, agriculture"', add
label define classwkd_sp_lbl 122 `"Domestic worker, self-employed"', add
label define classwkd_sp_lbl 123 `"Subsistence worker, own consumption"', add
label define classwkd_sp_lbl 124 `"Own account, other"', add
label define classwkd_sp_lbl 125 `"Own account, without temporary/unpaid help"', add
label define classwkd_sp_lbl 126 `"Own account, with temporary/unpaid help"', add
label define classwkd_sp_lbl 130 `"Member of cooperative"', add
label define classwkd_sp_lbl 140 `"Sharecropper"', add
label define classwkd_sp_lbl 141 `"Sharecropper, self-employed"', add
label define classwkd_sp_lbl 142 `"Sharecropper, employee"', add
label define classwkd_sp_lbl 150 `"Kibbutz member"', add
label define classwkd_sp_lbl 199 `"Self-employed, not specified"', add
label define classwkd_sp_lbl 200 `"Wage/salary worker"', add
label define classwkd_sp_lbl 201 `"Management"', add
label define classwkd_sp_lbl 202 `"Non-management"', add
label define classwkd_sp_lbl 203 `"White collar (non-manual)"', add
label define classwkd_sp_lbl 204 `"Blue collar (manual)"', add
label define classwkd_sp_lbl 205 `"White or blue collar"', add
label define classwkd_sp_lbl 206 `"Day laborer"', add
label define classwkd_sp_lbl 207 `"Employee, with a permanent job"', add
label define classwkd_sp_lbl 208 `"Employee, occasional, temporary, contract"', add
label define classwkd_sp_lbl 209 `"Employee without legal contract"', add
label define classwkd_sp_lbl 210 `"Wage/salary worker, private employer"', add
label define classwkd_sp_lbl 211 `"Apprentice"', add
label define classwkd_sp_lbl 212 `"Religious worker"', add
label define classwkd_sp_lbl 213 `"Wage/salary worker, non-profit, NGO"', add
label define classwkd_sp_lbl 214 `"White collar, private"', add
label define classwkd_sp_lbl 215 `"Blue collar, private"', add
label define classwkd_sp_lbl 216 `"Paid family worker"', add
label define classwkd_sp_lbl 217 `"Cooperative employee"', add
label define classwkd_sp_lbl 220 `"Wage/salary worker, government or public sector"', add
label define classwkd_sp_lbl 221 `"Federal, government employee"', add
label define classwkd_sp_lbl 222 `"State government employee"', add
label define classwkd_sp_lbl 223 `"Local government employee"', add
label define classwkd_sp_lbl 224 `"White collar, public"', add
label define classwkd_sp_lbl 225 `"Blue collar, public"', add
label define classwkd_sp_lbl 226 `"Public companies"', add
label define classwkd_sp_lbl 227 `"Civil servants, local collectives"', add
label define classwkd_sp_lbl 230 `"Domestic worker (work for private household)"', add
label define classwkd_sp_lbl 240 `"Seasonal migrant"', add
label define classwkd_sp_lbl 241 `"Seasonal migrant, no broker"', add
label define classwkd_sp_lbl 242 `"Seasonal migrant, uses broker"', add
label define classwkd_sp_lbl 250 `"Other wage and salary"', add
label define classwkd_sp_lbl 251 `"Canal zone/commission employee"', add
label define classwkd_sp_lbl 252 `"Government employment/training program"', add
label define classwkd_sp_lbl 253 `"Mixed state/private enterprise/parastatal"', add
label define classwkd_sp_lbl 254 `"Government public work program"', add
label define classwkd_sp_lbl 255 `"State enterprise employee"', add
label define classwkd_sp_lbl 256 `"Coordinated and continuous collaboration job"', add
label define classwkd_sp_lbl 300 `"Unpaid worker"', add
label define classwkd_sp_lbl 310 `"Unpaid family worker"', add
label define classwkd_sp_lbl 320 `"Apprentice, unpaid or unspecified"', add
label define classwkd_sp_lbl 330 `"Trainee"', add
label define classwkd_sp_lbl 340 `"Apprentice or trainee"', add
label define classwkd_sp_lbl 350 `"Works for others without wage"', add
label define classwkd_sp_lbl 400 `"Other"', add
label define classwkd_sp_lbl 999 `"Unknown/missing"', add
label values classwkd_sp classwkd_sp_lbl

label define empsect_sp_lbl 00 `"NIU (not in universe)"'
label define empsect_sp_lbl 10 `"Public"', add
label define empsect_sp_lbl 20 `"Private"', add
label define empsect_sp_lbl 21 `"Private, not elsewhere classified"', add
label define empsect_sp_lbl 22 `"Individual/family enterprise, and self-employed"', add
label define empsect_sp_lbl 23 `"Foreign"', add
label define empsect_sp_lbl 30 `"Mixed: public-private or parastatal"', add
label define empsect_sp_lbl 40 `"Collective or cooperative"', add
label define empsect_sp_lbl 50 `"Foreign government or non-governmental organization"', add
label define empsect_sp_lbl 60 `"Other, unspecified"', add
label define empsect_sp_lbl 61 `"Canal zone"', add
label define empsect_sp_lbl 62 `"Faith-based organization"', add
label define empsect_sp_lbl 63 `"Informal sector"', add
label define empsect_sp_lbl 99 `"Unknown"', add
label values empsect_sp empsect_sp_lbl

label define migrate0_sp_lbl 00 `"NIU (not in universe)"'
label define migrate0_sp_lbl 10 `"Same major administrative unit"', add
label define migrate0_sp_lbl 11 `"Same major, same minor administrative unit"', add
label define migrate0_sp_lbl 12 `"Same minor administrative unit, same house"', add
label define migrate0_sp_lbl 13 `"Same minor administrative unit, different house"', add
label define migrate0_sp_lbl 14 `"Same major, different minor administrative unit"', add
label define migrate0_sp_lbl 20 `"Different major administrative unit"', add
label define migrate0_sp_lbl 30 `"Abroad"', add
label define migrate0_sp_lbl 99 `"Unknown/missing"', add
label values migrate0_sp migrate0_sp_lbl

label define migctry0_sp_lbl 00000 `"NIU (not in universe)"'
label define migctry0_sp_lbl 10000 `"AFRICA"', add
label define migctry0_sp_lbl 11000 `"Eastern Africa"', add
label define migctry0_sp_lbl 11010 `"Burundi"', add
label define migctry0_sp_lbl 11020 `"Comoros"', add
label define migctry0_sp_lbl 11030 `"Djibouti"', add
label define migctry0_sp_lbl 11040 `"Eritrea"', add
label define migctry0_sp_lbl 11050 `"Ethiopia"', add
label define migctry0_sp_lbl 11060 `"Kenya"', add
label define migctry0_sp_lbl 11070 `"Madagascar"', add
label define migctry0_sp_lbl 11080 `"Malawi"', add
label define migctry0_sp_lbl 11090 `"Mauritius"', add
label define migctry0_sp_lbl 11100 `"Mozambique"', add
label define migctry0_sp_lbl 11110 `"Reunion"', add
label define migctry0_sp_lbl 11120 `"Rwanda"', add
label define migctry0_sp_lbl 11130 `"Seychelles"', add
label define migctry0_sp_lbl 11140 `"Somalia"', add
label define migctry0_sp_lbl 11150 `"South Sudan"', add
label define migctry0_sp_lbl 11160 `"Uganda"', add
label define migctry0_sp_lbl 11170 `"Tanzania"', add
label define migctry0_sp_lbl 11180 `"Zambia"', add
label define migctry0_sp_lbl 11190 `"Zimbabwe"', add
label define migctry0_sp_lbl 11999 `"Eastern Africa, n.s."', add
label define migctry0_sp_lbl 12000 `"Middle Africa"', add
label define migctry0_sp_lbl 12010 `"Angola"', add
label define migctry0_sp_lbl 12020 `"Cameroon"', add
label define migctry0_sp_lbl 12030 `"Central African Republic"', add
label define migctry0_sp_lbl 12040 `"Chad"', add
label define migctry0_sp_lbl 12050 `"Congo"', add
label define migctry0_sp_lbl 12060 `"Democratic Republic of Congo"', add
label define migctry0_sp_lbl 12070 `"Equatorial Guinea"', add
label define migctry0_sp_lbl 12080 `"Gabon"', add
label define migctry0_sp_lbl 12100 `"Sao Tome and Principe"', add
label define migctry0_sp_lbl 12999 `"Middle Africa, n.s."', add
label define migctry0_sp_lbl 13000 `"Northern Africa"', add
label define migctry0_sp_lbl 13010 `"Algeria"', add
label define migctry0_sp_lbl 13020 `"Egypt/United Arab Rep."', add
label define migctry0_sp_lbl 13030 `"Libya"', add
label define migctry0_sp_lbl 13040 `"Morocco"', add
label define migctry0_sp_lbl 13050 `"Sudan"', add
label define migctry0_sp_lbl 13060 `"Tunisia"', add
label define migctry0_sp_lbl 13070 `"Western Sahara"', add
label define migctry0_sp_lbl 13990 `"Northern Africa, n.s."', add
label define migctry0_sp_lbl 14000 `"Southern Africa"', add
label define migctry0_sp_lbl 14010 `"Botswana"', add
label define migctry0_sp_lbl 14020 `"Lesotho"', add
label define migctry0_sp_lbl 14030 `"Namibia"', add
label define migctry0_sp_lbl 14040 `"South Africa"', add
label define migctry0_sp_lbl 14050 `"Swaziland"', add
label define migctry0_sp_lbl 14999 `"Southern Africa, n.s."', add
label define migctry0_sp_lbl 15000 `"Western Africa"', add
label define migctry0_sp_lbl 15010 `"Benin"', add
label define migctry0_sp_lbl 15020 `"Burkina Faso"', add
label define migctry0_sp_lbl 15150 `"Cape Verde"', add
label define migctry0_sp_lbl 15040 `"Ivory Coast"', add
label define migctry0_sp_lbl 15050 `"Gambia"', add
label define migctry0_sp_lbl 15060 `"Ghana"', add
label define migctry0_sp_lbl 15070 `"Guinea"', add
label define migctry0_sp_lbl 15080 `"Guinea-Bissau"', add
label define migctry0_sp_lbl 15090 `"Liberia"', add
label define migctry0_sp_lbl 15100 `"Mali"', add
label define migctry0_sp_lbl 15110 `"Mauritania"', add
label define migctry0_sp_lbl 15120 `"Niger"', add
label define migctry0_sp_lbl 15130 `"Nigeria"', add
label define migctry0_sp_lbl 15140 `"St. Helena and Ascension"', add
label define migctry0_sp_lbl 15160 `"Sierra Leone"', add
label define migctry0_sp_lbl 15170 `"Togo"', add
label define migctry0_sp_lbl 19999 `"Africa, n.s."', add
label define migctry0_sp_lbl 20000 `"AMERICAS"', add
label define migctry0_sp_lbl 21000 `"Caribbean"', add
label define migctry0_sp_lbl 21010 `"Anguilla"', add
label define migctry0_sp_lbl 21020 `"Antigua-Barbuda"', add
label define migctry0_sp_lbl 21030 `"Aruba"', add
label define migctry0_sp_lbl 21040 `"Bahamas"', add
label define migctry0_sp_lbl 21050 `"Barbados"', add
label define migctry0_sp_lbl 21060 `"British Virgin Islands"', add
label define migctry0_sp_lbl 21070 `"Cayman Isles"', add
label define migctry0_sp_lbl 21080 `"Cuba"', add
label define migctry0_sp_lbl 21090 `"Dominica"', add
label define migctry0_sp_lbl 21100 `"Dominican Republic"', add
label define migctry0_sp_lbl 21110 `"Grenada"', add
label define migctry0_sp_lbl 21120 `"Guadeloupe"', add
label define migctry0_sp_lbl 21130 `"Haiti"', add
label define migctry0_sp_lbl 21140 `"Jamaica"', add
label define migctry0_sp_lbl 21150 `"Martinique"', add
label define migctry0_sp_lbl 21160 `"Montserrat"', add
label define migctry0_sp_lbl 21170 `"Netherlands Antilles"', add
label define migctry0_sp_lbl 21180 `"Puerto Rico"', add
label define migctry0_sp_lbl 21190 `"St. Kitts-Nevis"', add
label define migctry0_sp_lbl 21200 `"St. Croix"', add
label define migctry0_sp_lbl 21210 `"St. John"', add
label define migctry0_sp_lbl 21220 `"St. Lucia"', add
label define migctry0_sp_lbl 21230 `"St. Thomas"', add
label define migctry0_sp_lbl 21240 `"St. Vincent and the Grenadines"', add
label define migctry0_sp_lbl 21250 `"Trinidad and Tobago"', add
label define migctry0_sp_lbl 21260 `"Turks and Caicos"', add
label define migctry0_sp_lbl 21270 `"U.S. Virgin Islands"', add
label define migctry0_sp_lbl 21999 `"Caribbean, n.s."', add
label define migctry0_sp_lbl 22000 `"Central America"', add
label define migctry0_sp_lbl 22010 `"Belize/British Honduras"', add
label define migctry0_sp_lbl 22020 `"Costa Rica"', add
label define migctry0_sp_lbl 22030 `"El Salvador"', add
label define migctry0_sp_lbl 22040 `"Guatemala"', add
label define migctry0_sp_lbl 22050 `"Honduras"', add
label define migctry0_sp_lbl 22060 `"Mexico"', add
label define migctry0_sp_lbl 22070 `"Nicaragua"', add
label define migctry0_sp_lbl 22080 `"Panama"', add
label define migctry0_sp_lbl 22081 `"Panama Canal Zone"', add
label define migctry0_sp_lbl 22999 `"Central America, n.s."', add
label define migctry0_sp_lbl 23000 `"South America"', add
label define migctry0_sp_lbl 23010 `"Argentina"', add
label define migctry0_sp_lbl 23020 `"Bolivia"', add
label define migctry0_sp_lbl 23030 `"Brazil"', add
label define migctry0_sp_lbl 23040 `"Chile"', add
label define migctry0_sp_lbl 23050 `"Colombia"', add
label define migctry0_sp_lbl 23060 `"Ecuador"', add
label define migctry0_sp_lbl 23070 `"Falkland Islands"', add
label define migctry0_sp_lbl 23080 `"French Guiana"', add
label define migctry0_sp_lbl 23090 `"Guyana/British Guiana"', add
label define migctry0_sp_lbl 23100 `"Paraguay"', add
label define migctry0_sp_lbl 23110 `"Peru"', add
label define migctry0_sp_lbl 23120 `"Suriname"', add
label define migctry0_sp_lbl 23130 `"Uruguay"', add
label define migctry0_sp_lbl 23140 `"Venezuela"', add
label define migctry0_sp_lbl 23990 `"South America, n.s."', add
label define migctry0_sp_lbl 23991 `"Central and Latin America"', add
label define migctry0_sp_lbl 24000 `"North America"', add
label define migctry0_sp_lbl 24010 `"Bermuda"', add
label define migctry0_sp_lbl 24020 `"Canada"', add
label define migctry0_sp_lbl 24030 `"Greenland"', add
label define migctry0_sp_lbl 24040 `"Saint Pierre and Miquelon"', add
label define migctry0_sp_lbl 24050 `"United States"', add
label define migctry0_sp_lbl 24051 `"U.S. Outlying Areas and Territories"', add
label define migctry0_sp_lbl 24999 `"U.S.A, Canada, Mexico"', add
label define migctry0_sp_lbl 29999 `"Americas, n.s."', add
label define migctry0_sp_lbl 30000 `"ASIA"', add
label define migctry0_sp_lbl 31000 `"Eastern Asia"', add
label define migctry0_sp_lbl 31010 `"China"', add
label define migctry0_sp_lbl 31011 `"Hong Kong"', add
label define migctry0_sp_lbl 31012 `"Macau"', add
label define migctry0_sp_lbl 31013 `"Taiwan"', add
label define migctry0_sp_lbl 31020 `"Japan"', add
label define migctry0_sp_lbl 31030 `"Korea"', add
label define migctry0_sp_lbl 31031 `"Korea, DPR (North)"', add
label define migctry0_sp_lbl 31032 `"Korea, RO (South)"', add
label define migctry0_sp_lbl 31040 `"Mongolia"', add
label define migctry0_sp_lbl 32000 `"South-Central Asia"', add
label define migctry0_sp_lbl 32010 `"Afghanistan"', add
label define migctry0_sp_lbl 32020 `"Bangladesh"', add
label define migctry0_sp_lbl 32030 `"Bhutan"', add
label define migctry0_sp_lbl 32040 `"India"', add
label define migctry0_sp_lbl 32041 `"India, Pakistan, Bangladesh, Sri Lanka"', add
label define migctry0_sp_lbl 32050 `"Iran"', add
label define migctry0_sp_lbl 32060 `"Kazakhstan"', add
label define migctry0_sp_lbl 32070 `"Kyrgyzstan"', add
label define migctry0_sp_lbl 32080 `"Maldives"', add
label define migctry0_sp_lbl 32090 `"Nepal"', add
label define migctry0_sp_lbl 32100 `"Pakistan"', add
label define migctry0_sp_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define migctry0_sp_lbl 32120 `"Tajikistan"', add
label define migctry0_sp_lbl 32130 `"Turkmenistan"', add
label define migctry0_sp_lbl 32140 `"Uzbekistan"', add
label define migctry0_sp_lbl 33000 `"South-Eastern Asia"', add
label define migctry0_sp_lbl 33010 `"Brunei"', add
label define migctry0_sp_lbl 33020 `"Cambodia (Kampuchea)"', add
label define migctry0_sp_lbl 33040 `"Indonesia"', add
label define migctry0_sp_lbl 33050 `"Laos"', add
label define migctry0_sp_lbl 33060 `"Malaysia"', add
label define migctry0_sp_lbl 33061 `"Malaysia and Singapore"', add
label define migctry0_sp_lbl 33070 `"Myanmar (Burma)"', add
label define migctry0_sp_lbl 33080 `"Philippines"', add
label define migctry0_sp_lbl 33090 `"Singapore"', add
label define migctry0_sp_lbl 33100 `"Thailand"', add
label define migctry0_sp_lbl 33110 `"Vietnam"', add
label define migctry0_sp_lbl 34000 `"Western Asia"', add
label define migctry0_sp_lbl 34010 `"Armenia"', add
label define migctry0_sp_lbl 34020 `"Azerbaijan"', add
label define migctry0_sp_lbl 34030 `"Bahrain"', add
label define migctry0_sp_lbl 34040 `"Cyprus"', add
label define migctry0_sp_lbl 34050 `"Georgia"', add
label define migctry0_sp_lbl 34060 `"Iraq"', add
label define migctry0_sp_lbl 34070 `"Israel"', add
label define migctry0_sp_lbl 34080 `"Jordan"', add
label define migctry0_sp_lbl 34090 `"Kuwait"', add
label define migctry0_sp_lbl 34100 `"Lebanon"', add
label define migctry0_sp_lbl 34110 `"Palestine"', add
label define migctry0_sp_lbl 34120 `"Oman"', add
label define migctry0_sp_lbl 34130 `"Qatar"', add
label define migctry0_sp_lbl 34140 `"Saudi Arabia"', add
label define migctry0_sp_lbl 34150 `"Syria"', add
label define migctry0_sp_lbl 34160 `"Turkey"', add
label define migctry0_sp_lbl 34170 `"United Arab Emirates"', add
label define migctry0_sp_lbl 34180 `"Yemen"', add
label define migctry0_sp_lbl 34190 `"Middle East, not specified"', add
label define migctry0_sp_lbl 34191 `"Arabia"', add
label define migctry0_sp_lbl 34192 `"Other Arab countries"', add
label define migctry0_sp_lbl 34199 `"Gulf countries"', add
label define migctry0_sp_lbl 39999 `"Asia, n.s."', add
label define migctry0_sp_lbl 40000 `"EUROPE"', add
label define migctry0_sp_lbl 41000 `"Eastern Europe"', add
label define migctry0_sp_lbl 41010 `"Belarus"', add
label define migctry0_sp_lbl 41020 `"Bulgaria"', add
label define migctry0_sp_lbl 41021 `"Albania/Bulgaria/Romania"', add
label define migctry0_sp_lbl 41030 `"Czech Republic"', add
label define migctry0_sp_lbl 41031 `"Czechoslovakia/Yugoslavia"', add
label define migctry0_sp_lbl 41040 `"Hungary"', add
label define migctry0_sp_lbl 41050 `"Poland"', add
label define migctry0_sp_lbl 41060 `"Moldova"', add
label define migctry0_sp_lbl 41070 `"Romania"', add
label define migctry0_sp_lbl 41080 `"Russia/USSR"', add
label define migctry0_sp_lbl 41090 `"Slovakia"', add
label define migctry0_sp_lbl 41100 `"Ukraine"', add
label define migctry0_sp_lbl 41999 `"Eastern Europe, n.s."', add
label define migctry0_sp_lbl 42000 `"Northern Europe"', add
label define migctry0_sp_lbl 42010 `"Denmark"', add
label define migctry0_sp_lbl 42020 `"Estonia"', add
label define migctry0_sp_lbl 42030 `"Faroe Islands"', add
label define migctry0_sp_lbl 42040 `"Finland"', add
label define migctry0_sp_lbl 42050 `"Iceland"', add
label define migctry0_sp_lbl 42060 `"Ireland"', add
label define migctry0_sp_lbl 42070 `"Latvia"', add
label define migctry0_sp_lbl 42080 `"Lithuania"', add
label define migctry0_sp_lbl 42090 `"Norway"', add
label define migctry0_sp_lbl 42110 `"Sweden"', add
label define migctry0_sp_lbl 42120 `"United Kingdom"', add
label define migctry0_sp_lbl 42199 `"Scandinavia"', add
label define migctry0_sp_lbl 43000 `"Southern Europe"', add
label define migctry0_sp_lbl 43010 `"Albania"', add
label define migctry0_sp_lbl 43020 `"Andorra"', add
label define migctry0_sp_lbl 43030 `"Bosnia"', add
label define migctry0_sp_lbl 43040 `"Croatia"', add
label define migctry0_sp_lbl 43050 `"Gibraltar"', add
label define migctry0_sp_lbl 43060 `"Greece"', add
label define migctry0_sp_lbl 43070 `"Italy"', add
label define migctry0_sp_lbl 43080 `"Malta"', add
label define migctry0_sp_lbl 43090 `"Portugal"', add
label define migctry0_sp_lbl 43100 `"San Marino"', add
label define migctry0_sp_lbl 43110 `"Slovenia"', add
label define migctry0_sp_lbl 43120 `"Spain"', add
label define migctry0_sp_lbl 43130 `"Macedonia"', add
label define migctry0_sp_lbl 43140 `"Yugoslavia"', add
label define migctry0_sp_lbl 43141 `"Montenegro"', add
label define migctry0_sp_lbl 43142 `"Serbia"', add
label define migctry0_sp_lbl 43143 `"Serbia and Montenegro"', add
label define migctry0_sp_lbl 43999 `"Southern Europe, n.s."', add
label define migctry0_sp_lbl 44000 `"Western Europe"', add
label define migctry0_sp_lbl 44010 `"Austria"', add
label define migctry0_sp_lbl 44020 `"Belgium"', add
label define migctry0_sp_lbl 44021 `"Belgium/Luxemburg"', add
label define migctry0_sp_lbl 44022 `"Benelux (Belgium/Netherlands/Luxemburg)"', add
label define migctry0_sp_lbl 44030 `"France"', add
label define migctry0_sp_lbl 44040 `"Germany"', add
label define migctry0_sp_lbl 44050 `"Liechtenstein"', add
label define migctry0_sp_lbl 44060 `"Luxembourg"', add
label define migctry0_sp_lbl 44070 `"Monaco"', add
label define migctry0_sp_lbl 44080 `"Netherlands"', add
label define migctry0_sp_lbl 44090 `"Switzerland"', add
label define migctry0_sp_lbl 49999 `"Europe, n.s."', add
label define migctry0_sp_lbl 50000 `"OCEANIA"', add
label define migctry0_sp_lbl 51000 `"Australia and New Zealand"', add
label define migctry0_sp_lbl 51010 `"Australia"', add
label define migctry0_sp_lbl 51020 `"New Zealand"', add
label define migctry0_sp_lbl 51021 `"New Zealand/New Guinea"', add
label define migctry0_sp_lbl 51030 `"Norfolk Islands"', add
label define migctry0_sp_lbl 51999 `"Australia and New Zealand, n.s."', add
label define migctry0_sp_lbl 52000 `"Melanesia"', add
label define migctry0_sp_lbl 52010 `"Fiji"', add
label define migctry0_sp_lbl 52020 `"New Caledonia"', add
label define migctry0_sp_lbl 52030 `"Papua New Guinea"', add
label define migctry0_sp_lbl 52040 `"Solomon Islands"', add
label define migctry0_sp_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define migctry0_sp_lbl 53000 `"Micronesia"', add
label define migctry0_sp_lbl 53010 `"Kiribati"', add
label define migctry0_sp_lbl 53020 `"Marshall Islands"', add
label define migctry0_sp_lbl 53030 `"Nauru"', add
label define migctry0_sp_lbl 53040 `"Northern Mariana Isls."', add
label define migctry0_sp_lbl 53050 `"Palau"', add
label define migctry0_sp_lbl 53999 `"Micronesia, n.e.c."', add
label define migctry0_sp_lbl 54000 `"Polynesia"', add
label define migctry0_sp_lbl 54010 `"Cook Islands"', add
label define migctry0_sp_lbl 54020 `"French Polynesia"', add
label define migctry0_sp_lbl 54030 `"Niue"', add
label define migctry0_sp_lbl 54040 `"Pitcairn Island"', add
label define migctry0_sp_lbl 54050 `"Samoa"', add
label define migctry0_sp_lbl 54060 `"Tokelau"', add
label define migctry0_sp_lbl 54070 `"Tonga"', add
label define migctry0_sp_lbl 54080 `"Tuvalu"', add
label define migctry0_sp_lbl 54090 `"Wallis and Futuna Isls."', add
label define migctry0_sp_lbl 59999 `"Oceania, n.s."', add
label define migctry0_sp_lbl 60000 `"OTHER, unspecified or unclassifiable"', add
label define migctry0_sp_lbl 90000 `"Non-migrants (International)"', add
label define migctry0_sp_lbl 99998 `"Response suppressed"', add
label define migctry0_sp_lbl 99999 `"UNKNOWN"', add
label values migctry0_sp migctry0_sp_lbl

label define migyrs1_sp_lbl 00 `"Less than 1 year"'
label define migyrs1_sp_lbl 01 `"1 year (or 1 year or less)"', add
label define migyrs1_sp_lbl 02 `"2 years"', add
label define migyrs1_sp_lbl 03 `"3"', add
label define migyrs1_sp_lbl 04 `"4"', add
label define migyrs1_sp_lbl 05 `"5"', add
label define migyrs1_sp_lbl 06 `"6"', add
label define migyrs1_sp_lbl 07 `"7"', add
label define migyrs1_sp_lbl 08 `"8"', add
label define migyrs1_sp_lbl 09 `"9"', add
label define migyrs1_sp_lbl 10 `"10"', add
label define migyrs1_sp_lbl 11 `"11"', add
label define migyrs1_sp_lbl 12 `"12"', add
label define migyrs1_sp_lbl 13 `"13"', add
label define migyrs1_sp_lbl 14 `"14"', add
label define migyrs1_sp_lbl 15 `"15"', add
label define migyrs1_sp_lbl 16 `"16"', add
label define migyrs1_sp_lbl 17 `"17"', add
label define migyrs1_sp_lbl 18 `"18"', add
label define migyrs1_sp_lbl 19 `"19"', add
label define migyrs1_sp_lbl 20 `"20"', add
label define migyrs1_sp_lbl 21 `"21"', add
label define migyrs1_sp_lbl 22 `"22"', add
label define migyrs1_sp_lbl 23 `"23"', add
label define migyrs1_sp_lbl 24 `"24"', add
label define migyrs1_sp_lbl 25 `"25"', add
label define migyrs1_sp_lbl 26 `"26"', add
label define migyrs1_sp_lbl 27 `"27"', add
label define migyrs1_sp_lbl 28 `"28"', add
label define migyrs1_sp_lbl 29 `"29"', add
label define migyrs1_sp_lbl 30 `"30"', add
label define migyrs1_sp_lbl 31 `"31"', add
label define migyrs1_sp_lbl 32 `"32"', add
label define migyrs1_sp_lbl 33 `"33"', add
label define migyrs1_sp_lbl 34 `"34"', add
label define migyrs1_sp_lbl 35 `"35"', add
label define migyrs1_sp_lbl 36 `"36"', add
label define migyrs1_sp_lbl 37 `"37"', add
label define migyrs1_sp_lbl 38 `"38"', add
label define migyrs1_sp_lbl 39 `"39"', add
label define migyrs1_sp_lbl 40 `"40"', add
label define migyrs1_sp_lbl 41 `"41"', add
label define migyrs1_sp_lbl 42 `"42"', add
label define migyrs1_sp_lbl 43 `"43"', add
label define migyrs1_sp_lbl 44 `"44"', add
label define migyrs1_sp_lbl 45 `"45"', add
label define migyrs1_sp_lbl 46 `"46"', add
label define migyrs1_sp_lbl 47 `"47"', add
label define migyrs1_sp_lbl 48 `"48"', add
label define migyrs1_sp_lbl 49 `"49"', add
label define migyrs1_sp_lbl 50 `"50"', add
label define migyrs1_sp_lbl 51 `"51"', add
label define migyrs1_sp_lbl 52 `"52"', add
label define migyrs1_sp_lbl 53 `"53"', add
label define migyrs1_sp_lbl 54 `"54"', add
label define migyrs1_sp_lbl 55 `"55"', add
label define migyrs1_sp_lbl 56 `"56"', add
label define migyrs1_sp_lbl 57 `"57"', add
label define migyrs1_sp_lbl 58 `"58"', add
label define migyrs1_sp_lbl 59 `"59"', add
label define migyrs1_sp_lbl 60 `"60"', add
label define migyrs1_sp_lbl 61 `"61"', add
label define migyrs1_sp_lbl 62 `"62"', add
label define migyrs1_sp_lbl 63 `"63"', add
label define migyrs1_sp_lbl 64 `"64"', add
label define migyrs1_sp_lbl 65 `"65"', add
label define migyrs1_sp_lbl 66 `"66"', add
label define migyrs1_sp_lbl 67 `"67"', add
label define migyrs1_sp_lbl 68 `"68"', add
label define migyrs1_sp_lbl 69 `"69"', add
label define migyrs1_sp_lbl 70 `"70"', add
label define migyrs1_sp_lbl 71 `"71"', add
label define migyrs1_sp_lbl 72 `"72"', add
label define migyrs1_sp_lbl 73 `"73"', add
label define migyrs1_sp_lbl 74 `"74"', add
label define migyrs1_sp_lbl 75 `"75"', add
label define migyrs1_sp_lbl 76 `"76"', add
label define migyrs1_sp_lbl 77 `"77"', add
label define migyrs1_sp_lbl 78 `"78"', add
label define migyrs1_sp_lbl 79 `"79"', add
label define migyrs1_sp_lbl 80 `"80"', add
label define migyrs1_sp_lbl 81 `"81"', add
label define migyrs1_sp_lbl 82 `"82"', add
label define migyrs1_sp_lbl 83 `"83"', add
label define migyrs1_sp_lbl 84 `"84"', add
label define migyrs1_sp_lbl 85 `"85"', add
label define migyrs1_sp_lbl 86 `"86"', add
label define migyrs1_sp_lbl 87 `"87"', add
label define migyrs1_sp_lbl 88 `"88"', add
label define migyrs1_sp_lbl 89 `"89"', add
label define migyrs1_sp_lbl 90 `"90"', add
label define migyrs1_sp_lbl 91 `"91"', add
label define migyrs1_sp_lbl 92 `"92"', add
label define migyrs1_sp_lbl 93 `"93"', add
label define migyrs1_sp_lbl 94 `"94"', add
label define migyrs1_sp_lbl 95 `"95+ years"', add
label define migyrs1_sp_lbl 96 `"Less than 5 years"', add
label define migyrs1_sp_lbl 97 `"More than 5 years"', add
label define migyrs1_sp_lbl 98 `"Unknown"', add
label define migyrs1_sp_lbl 99 `"NIU (not in universe)"', add
label values migyrs1_sp migyrs1_sp_lbl

label define disabled_sp_lbl 0 `"NIU (not in universe)"'
label define disabled_sp_lbl 1 `"Yes, disabled"', add
label define disabled_sp_lbl 2 `"No, not disabled"', add
label define disabled_sp_lbl 9 `"Unknown"', add
label values disabled_sp disabled_sp_lbl

label define disemp_sp_lbl 1 `"Disabled"'
label define disemp_sp_lbl 2 `"Not disabled"', add
label define disemp_sp_lbl 8 `"Unknown"', add
label define disemp_sp_lbl 9 `"NIU (not in universe)"', add
label values disemp_sp disemp_sp_lbl

label define disblnd_sp_lbl 0 `"NIU (not in universe)"'
label define disblnd_sp_lbl 1 `"Yes"', add
label define disblnd_sp_lbl 2 `"No"', add
label define disblnd_sp_lbl 9 `"Unknown"', add
label values disblnd_sp disblnd_sp_lbl

label define disdeaf_sp_lbl 0 `"NIU (not in universe)"'
label define disdeaf_sp_lbl 1 `"Yes"', add
label define disdeaf_sp_lbl 2 `"No"', add
label define disdeaf_sp_lbl 9 `"Unknown"', add
label values disdeaf_sp disdeaf_sp_lbl

label define dismute_sp_lbl 0 `"NIU (not in universe)"'
label define dismute_sp_lbl 1 `"Yes"', add
label define dismute_sp_lbl 2 `"No"', add
label define dismute_sp_lbl 9 `"Unknown"', add
label values dismute_sp dismute_sp_lbl

label define dislowr_sp_lbl 0 `"NIU (not in universe)"'
label define dislowr_sp_lbl 1 `"Yes"', add
label define dislowr_sp_lbl 2 `"No"', add
label define dislowr_sp_lbl 9 `"Unknown"', add
label values dislowr_sp dislowr_sp_lbl

label define dismntl_sp_lbl 0 `"NIU (not in universe)"'
label define dismntl_sp_lbl 1 `"Yes"', add
label define dismntl_sp_lbl 2 `"No"', add
label define dismntl_sp_lbl 9 `"Unknown"', add
label values dismntl_sp dismntl_sp_lbl

label define dispsyc_sp_lbl 0 `"NIU (not in universe)"'
label define dispsyc_sp_lbl 1 `"Yes"', add
label define dispsyc_sp_lbl 2 `"No"', add
label define dispsyc_sp_lbl 9 `"Unknown"', add
label values dispsyc_sp dispsyc_sp_lbl

label define disorig_sp_lbl 00 `"NIU (not in universe)"'
label define disorig_sp_lbl 10 `"Congenital, since birth"', add
label define disorig_sp_lbl 20 `"Disease"', add
label define disorig_sp_lbl 21 `"Polio, infant paralysis"', add
label define disorig_sp_lbl 22 `"Parkinsons"', add
label define disorig_sp_lbl 23 `"Sclerosis"', add
label define disorig_sp_lbl 24 `"Stroke"', add
label define disorig_sp_lbl 25 `"Epilepsy"', add
label define disorig_sp_lbl 26 `"Hanson disease"', add
label define disorig_sp_lbl 29 `"Other disease"', add
label define disorig_sp_lbl 30 `"Accident"', add
label define disorig_sp_lbl 31 `"Work accident"', add
label define disorig_sp_lbl 32 `"Transport accident"', add
label define disorig_sp_lbl 33 `"Animal accident"', add
label define disorig_sp_lbl 34 `"Sports, athletic, or playing accident"', add
label define disorig_sp_lbl 39 `"Other accident"', add
label define disorig_sp_lbl 40 `"Other"', add
label define disorig_sp_lbl 41 `"Aging"', add
label define disorig_sp_lbl 42 `"Mental infirmity"', add
label define disorig_sp_lbl 43 `"War injury"', add
label define disorig_sp_lbl 44 `"Genocide"', add
label define disorig_sp_lbl 45 `"Anti-personnel mine or unexploded ordnance (UXO)"', add
label define disorig_sp_lbl 46 `"Domestic violence"', add
label define disorig_sp_lbl 47 `"Violence of delinquency"', add
label define disorig_sp_lbl 48 `"Other form of violence"', add
label define disorig_sp_lbl 49 `"Witchcraft"', add
label define disorig_sp_lbl 50 `"Other cause, n.e.c."', add
label define disorig_sp_lbl 70 `"Multiple causes"', add
label define disorig_sp_lbl 90 `"No disability"', add
label define disorig_sp_lbl 99 `"Unknown"', add
label values disorig_sp disorig_sp_lbl

label define ls1996a_splive_sp_lbl 1 `"Alive"'
label define ls1996a_splive_sp_lbl 2 `"Not alive"', add
label define ls1996a_splive_sp_lbl 8 `"Unknown"', add
label define ls1996a_splive_sp_lbl 9 `"NIU (not in universe)"', add
label values ls1996a_splive_sp ls1996a_splive_sp_lbl

