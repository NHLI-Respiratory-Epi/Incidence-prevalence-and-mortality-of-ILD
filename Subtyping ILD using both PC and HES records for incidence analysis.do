
 use "${path_deriv_dta}ILD_cohort_flagged_76772.dta" , clear
 
 preserve 
 use "DA3_ILD_cohort_flagged_173428_NEW.dta", clear
 keep if hes_ild_cat==2
 keep patid hes_earliest_mention regstartdate entry dob gender region hes_ild_cat e2019_imd_5 ethnicity_3 incident exit 
 tempfile hp_hes
 save `hp_hes'
 codebook patid  //27,138
 restore 
 
 keep if ild_subtype==2 
 codebook patid //11,729 
 *vars sholud be the same but streamline for simplicity; keep sta vars and imd and eth but drop all the deth stuff
 keep patid earliest_mention regstartdate enterdate dob gender region ild_subtype e2019_imd_5 ethnicity_3 incident exit 
 merge 1:1 patid using `hp_hes'
 codebook patid  // 32,768
 /* Result                      Number of obs
    -----------------------------------------
    Not matched                        26,669
        from master                     5,630  (_merge==1)
        from using                     21,039  (_merge==2)

    Matched                             6,099  (_merge==3)
    -----------------------------------------
*/
 gen subtype=2
 tab subtype,m
 drop _m
 save DA4_hp_cohort_32768_NEW.dta, replace
 
 ******************************************************************************
** processing the ipf cohort; use the flgged up DA2 ild cocort created in 02/04 do files for DA2
*******************************************************************************
*
 use "${path_deriv_dta}ILD_cohort_flagged_76772.dta" , clear
 
 preserve 
 use "DA3_ILD_cohort_flagged_173428_NEW.dta", clear
 keep if hes_ild_cat==1
 keep patid hes_earliest_mention regstartdate entry dob gender region hes_ild_cat e2019_imd_5 ethnicity_3 incident exit 
 tempfile ipf_hes
 save `ipf_hes'
 codebook patid  // 104,050 
 restore 
 
 keep if ild_subtype==1 
 codebook patid // 47,122 
 *vars sholud be the same but streamline for simplicity; keep sta vars and imd and eth but drop all the deth stuff
 keep patid earliest_mention regstartdate enterdate dob gender region ild_subtype e2019_imd_5 ethnicity_3 incident exit 
 merge 1:1 patid using `ipf_hes'
 codebook patid  // 120,823 
 /* 
*/
 gen subtype=1
 tab subtype,m
 drop _m
 save DA4_ipf_cohort_120823_NEW.dta, replace
 
  ******************************************************************************
** processing the ctdild cohort; use the flgged up DA2 ild cocort created in 02/04 do files for DA2
*******************************************************************************
*
 use "${path_deriv_dta}ILD_cohort_flagged_76772.dta" , clear
 
 preserve 
 use "DA3_ILD_cohort_flagged_173428_NEW.dta", clear
 keep if hes_ild_cat==3
 keep patid hes_earliest_mention regstartdate entry dob gender region hes_ild_cat e2019_imd_5 ethnicity_3 incident exit 
 tempfile ctdild_hes
 save `ctdild_hes'
 codebook patid  // 
 restore 
 
 keep if ild_subtype==3
 codebook patid //  
 *vars sholud be the same but streamline for simplicity; keep sta vars and imd and eth but drop all the deth stuff
 keep patid earliest_mention regstartdate enterdate dob gender region ild_subtype e2019_imd_5 ethnicity_3 incident exit 
 merge 1:1 patid using `ctdild_hes'
 codebook patid  //  27,740 
 /* 
*/
 gen subtype=3
 tab subtype,m
 drop _m
 save "DA4_ctdild_cohort_27740.dta", replace
 
 
 
 
  use "${path_deriv_dta}ILD_cohort_flagged_76772.dta" , clear
 
 preserve 
 use "DA3_ILD_cohort_flagged_173428_NEW.dta", clear
 keep if hes_ild_cat==5
 keep patid hes_earliest_mention regstartdate entry dob gender region hes_ild_cat e2019_imd_5 ethnicity_3 incident exit 
 tempfile drugrad_hes
 save `drugrad_hes'
 codebook patid  // 
 restore 
 
 keep if ild_subtype==4
 codebook patid //  
 *vars sholud be the same but streamline for simplicity; keep sta vars and imd and eth but drop all the deth stuff
 keep patid earliest_mention regstartdate enterdate dob gender region ild_subtype e2019_imd_5 ethnicity_3 incident exit 
 merge 1:1 patid using `drugrad_hes'
 codebook patid  //  27,740 
 /* 
*/
 gen subtype=4
 tab subtype,m
 drop _m
 save "DA4_drugrad_cohort_27740.dta", replace
 
 
 
   use "${path_deriv_dta}ILD_cohort_flagged_76772.dta" , clear
 
 preserve 
 use "DA3_ILD_cohort_flagged_173428_NEW.dta", clear
 keep if hes_ild_cat==4
 keep patid hes_earliest_mention regstartdate entry dob gender region hes_ild_cat e2019_imd_5 ethnicity_3 incident exit 
 tempfile psarc_hes
 save `psarc_hes'
 codebook patid  // 
 restore 
 
 keep if ild_subtype==5
 codebook patid //  
 *vars sholud be the same but streamline for simplicity; keep sta vars and imd and eth but drop all the deth stuff
 keep patid earliest_mention regstartdate enterdate dob gender region ild_subtype e2019_imd_5 ethnicity_3 incident exit 
 merge 1:1 patid using `psarc_hes'
 codebook patid  //  27,740 
 /* 
*/
 gen subtype=5
 tab subtype,m
 drop _m
 save "DA4_psarc_cohort_27740.dta", replace
 
  ***********************************************************
   use "${path_deriv_dta}ILD_cohort_flagged_76772.dta" , clear
 keep if ild_subtype==6
 codebook patid //  
 *vars sholud be the same but streamline for simplicity; keep sta vars and imd and eth but drop all the deth stuff
 keep patid earliest_mention regstartdate enterdate dob gender region ild_subtype e2019_imd_5 ethnicity_3 incident exit 
 codebook patid  //  27,740 
 /* 
*/
 gen subtype=6
 tab subtype,m
 save "DA4_otherild_cohort_27740.dta", replace
 *************************************************************
 
   use "${path_deriv_dta}ILD_cohort_flagged_76772.dta" , clear
 
 preserve 
 use "DA3_ILD_cohort_flagged_173428_NEW.dta", clear
 keep if hes_ild_cat==10
 keep patid hes_earliest_mention regstartdate entry dob gender region hes_ild_cat e2019_imd_5 ethnicity_3 incident exit 
 tempfile broad_hes
 save `broad_hes'
 codebook patid  // 
 restore 
 
 keep if ild_subtype==7
 codebook patid //  
 *vars sholud be the same but streamline for simplicity; keep sta vars and imd and eth but drop all the deth stuff
 keep patid earliest_mention regstartdate enterdate dob gender region ild_subtype e2019_imd_5 ethnicity_3 incident exit 
 merge 1:1 patid using `broad_hes'
 codebook patid  //  27,740 
 /* 
*/
 gen subtype=7
 tab subtype,m
 drop _m
 save "DA4_broad_cohort_27740.dta", replace
 ************************************************************************ 
   use "${path_deriv_dta}ILD_cohort_flagged_76772.dta" , clear
 
 preserve 
 use "DA3_ILD_cohort_flagged_173428_NEW.dta", clear
 keep if hes_ild_cat==8
 keep patid hes_earliest_mention regstartdate entry dob gender region hes_ild_cat e2019_imd_5 ethnicity_3 incident exit 
 tempfile contradictory_hes
 save `contradictory_hes'
 codebook patid  // 
 restore 
 
 keep if ild_subtype==8
 codebook patid //  
 *vars sholud be the same but streamline for simplicity; keep sta vars and imd and eth but drop all the deth stuff
 keep patid earliest_mention regstartdate enterdate dob gender region ild_subtype e2019_imd_5 ethnicity_3 incident exit 
 merge 1:1 patid using `contradictory_hes'
 codebook patid  //  27,740 
 /* 
*/
 gen subtype=8
 tab subtype,m
 drop _m
 save "DA4_contradictory_cohort_27740.dta", replace
  
 
clear
use "DA4_contradictory_cohort_27740.dta"
 ** append
 append using "DA4_hp_cohort_32768_NEW"
 append using "DA4_ipf_cohort_120823_NEW"
 append using "DA4_ctdild_cohort_27740.dta"
 append using "DA4_drugrad_cohort_27740.dta"
 append using "DA4_psarc_cohort_27740.dta"
 append using "DA4_otherild_cohort_27740.dta"
 append using "DA4_broad_cohort_27740.dta"
 
 codebook patid // 171106 
 
 ** ***************************
 ** some duplicates; conflicts which need resolving; use same rules
 ** 
 save "DA4_allILD_cohort_new.dta", replace
  
  use "DA4_allILD_cohort_new.dta", clear
 codebook patid
 
 tab subtype,m
 /* subtype |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     67,760       37.27       37.27  ipf
          2 |     18,444       10.14       47.41   hp
          3 |     29,689       16.33       63.74  ctdild
          4 |      2,521        1.39       65.13  drug/rad induced
          5 |     13,444        7.39       72.52   pul sarcoid
          6 |      1,902        1.05       73.57    other ilds (arurm only)
          7 |     45,979       25.29       98.85   generic ild
          8 |      2,086        1.15      100.00   conflicted
------------+-----------------------------------
      Total |    181,825      100.00
*/
 
 *&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

  sort patid 
 by patid: gen counter=_n
 by patid: gen total=_N
 tab total,m // only 12% in both
  gen flag = 0
  recode flag (0=1) if total==2
  by patid: egen conflict=max(flag)
   drop flag
  order patid conflict ild_subtype hes_ild_cat subtype earliest_mention hes_earliest_mention
 ** rules; but only need to do for the duplicated patids; if single rows will just have 15 10 etc  
** work off var subtype (we have 8)
gen flag_erap1 = 0 
gen flag_erap2 = 0 
gen flag_erap3 = 0
gen flag_erap4 = 0  
gen flag_erap5 = 0
gen flag_erap6 = 0
gen flag_erap7 = 0
gen flag_erap8 = 0
recode flag_erap1 (0=1) if  subtype==1 
recode flag_erap2 (0=5) if  subtype==2 
recode flag_erap3 (0=10) if subtype==3 
recode flag_erap4 (0=25) if subtype==4 
recode flag_erap5 (0=50) if  subtype==5  
recode flag_erap6 (0=100) if subtype==6 
recode flag_erap7 (0=200) if subtype==7
recode flag_erap8 (0=400) if subtype==8 

by patid: egen erap1 = max(flag_erap1)  //so = 1 of has a 1 code 
by patid: egen erap2 = max(flag_erap2)  //so =5 if has a 2 code
by patid: egen erap3 = max(flag_erap3)  //so =10 of has a 3 code 
by patid: egen erap4 = max(flag_erap4)  //so =25 of has a 4 code drui
by patid: egen erap5 = max(flag_erap5)  //so =50 if has pul sarc 
by patid: egen erap6 = max(flag_erap6)  //so = 100 if spec other ild
by patid: egen erap7 = max(flag_erap7)  //so = 200 if gen ild code so NOS
by patid: egen erap8 = max(flag_erap8)  //so = 400 if conflicted 

gen sum=(erap1+erap2+erap3+erap4+erap5+erap6+erap7+erap8) if conflict==1
* eg  a four only will be a 25; only 5s sum=50 is sarcoid in both aurum and hes
tab sum if conflict==1, m 
 
 
  /*  
      sum |      Freq.     Percent        Cum.
------------+-----------------------------------
          6 |      3,764       17.56       17.56
         11 |      2,786       13.00       30.55
         15 |        162        0.76       31.31
         26 |        436        2.03       33.34
         30 |         40        0.19       33.53
         35 |         98        0.46       33.99
         51 |        838        3.91       37.90
         55 |         80        0.37       38.27
         60 |         82        0.38       38.65
        101 |        802        3.74       42.39
        105 |         28        0.13       42.52
        110 |        280        1.31       43.83
        125 |          2        0.01       43.84
        150 |         14        0.07       43.90
        201 |      7,834       36.54       80.45
        205 |        674        3.14       83.59
        210 |        526        2.45       86.04
        225 |        132        0.62       86.66
        250 |        452        2.11       88.77
        300 |        158        0.74       89.50
        401 |        790        3.69       93.19
        405 |        448        2.09       95.28
        410 |        534        2.49       97.77
        425 |         92        0.43       98.20
        450 |        308        1.44       99.64
        500 |          8        0.04       99.67
        600 |         70        0.33      100.00
------------+-----------------------------------
      Total |     21,438      100.00

*/
 recode subtype (1=2) if sum == 6 & conflict ==1  // so if a 1 and 2 subtype becomes 2
 recode subtype (1=3) if sum == 11 & conflict ==1 // so 1 and 3 becomnes 3 ctdild
 recode subtype (2=8) if sum == 15 & conflict ==1 // 2 2 nad 3 becomes conflict 8y 
 recode subtype (3=8) if sum == 15 & conflict ==1 
 
 recode subtype (1=4) if sum == 26 & conflict ==1 // drug and ipf == drug so 4 
 
 recode subtype (2=8) if sum == 30 & conflict ==1 //drug and hp becomes 8
  recode subtype (4=8) if sum == 30 & conflict ==1 // 2 nd 4 both need to swtic to 8
 
  recode subtype (3=8) if sum == 35 & conflict ==1 //drug and ctdild  becomes 8
  recode subtype (4=8) if sum == 35 & conflict ==1  // 3 and 4 both switch
 
 recode subtype (1=5) if sum == 51 & conflict ==1 // pul sarc and ipf 
 recode subtype (2=8) if sum == 55 & conflict ==1 //pul src and hp 
  recode subtype (5=8) if sum == 55 & conflict ==1 //both swtch

  recode subtype (3=8) if sum == 60 & conflict ==1 // ctd ild  plus sac
 recode subtype (5=8) if sum == 60 & conflict ==1 
 
 recode subtype (1=6) if sum == 101 & conflict ==1 // aurum olther plus ipf 
 recode subtype (2=8) if sum == 105 & conflict ==1 //spcif other plus hp 
 recode subtype (6=8) if sum == 105 & conflict ==1 // both switch
 
  recode subtype (6=8) if sum == 110 & conflict ==1 // Aother plus ctlid 
 recode subtype (3=8) if sum == 110 & conflict ==1 // both switch
 
 recode subtype (6=8) if sum == 125 & conflict ==1 //A other plus drug i
  recode subtype (4=8) if sum == 125 & conflict ==1 //both switch
 recode subtype (6=8) if sum == 150 & conflict ==1 // aother plus pul sarc
 recode subtype (5=8) if sum == 150 & conflict ==1 //
 
  recode subtype (7=1) if sum == 201 & conflict ==1 // gen ild plus ipf 
 recode subtype (7=2) if sum == 205 & conflict ==1 //  gen ild plud hp
 recode subtype (7=3) if sum == 210 & conflict ==1 //  gen ild plud ctdild
 recode subtype (7=4) if sum == 225 & conflict ==1 //  gen ild plud drug rad
  recode subtype (7=5) if sum == 250 & conflict ==1 //  gen ild plus sarc
  recode subtype (7=6) if sum == 300 & conflict ==1 //  gen ild plus au other 
	
recode subtype (1=8) if sum == 401 & conflict ==1 //  ipf and conflict
 recode subtype (2=8) if sum == 405 & conflict ==1 //  hp and conflict
  recode subtype (3=8) if sum == 410 & conflict ==1 //  ctdild and conflict
  recode subtype (4=8) if sum == 425 & conflict ==1 //  drug and conflict
  recode subtype (5=8) if sum == 450 & conflict ==1 // pul sarc and conflict
  recode subtype (6=8) if sum == 500 & conflict ==1 // a-other and conflict
  recode subtype (7=8) if sum == 600 & conflict ==1 //gen ild and conflict

  
  
 ** reduce to one line patid by combing subtype info and earliest date
 drop flag_erap? erap? sum counter total

 tab subtype,m
 /*tab subtype,m

    subtype |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     66,969       36.83       36.83
          2 |     20,284       11.16       47.99
          3 |     30,767       16.92       64.91
          4 |      2,689        1.48       66.39
          5 |     13,847        7.62       74.00
          6 |      2,216        1.22       75.22
          7 |     41,056       22.58       97.80
          8 |      3,997        2.20      100.00
------------+-----------------------------------
      Total |    181,825      100.00

*/

 *copy ealiest date to all rows for aptid
 sort patid 
 by patid : egen aurum_temp_date = max(earliest_mention)
 by patid : egen hes_temp_date = max(hes_earliest_mention)
 format aurum_temp_date hes_temp_date %td
 
 ** 
 save "${path_intermediate_dta}DA4_ILD_cohort_allobs_NEW.dta", replace
 
 
 use "${path_intermediate_dta}DA4_ILD_cohort_allobs_NEW.dta", clear
 drop ild_subtype hes_ild_cat earliest_mention hes_earliest_mention conflict incident
 replace entry=enterdate if entry==.
 drop enterdate  
 duplicates drop
 codebook patid // 171,106 b196,906 
 tab subtype, m
 /*ubtype |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     63,052       36.85       36.85
          2 |     18,065       10.56       47.41
          3 |     29,111       17.01       64.42
          4 |      2,405        1.41       65.83
          5 |     13,202        7.72       73.54
          6 |      1,736        1.01       74.56
          7 |     41,056       23.99       98.55
          8 |      2,479        1.45      100.00
------------+-----------------------------------
      Total |    171,106      100.00

*/

egen earliest_mention = rowmin(aurum_temp_date hes_temp_date)
format earliest_mention %td
drop if earliest_mention==.  // justt one
  save "DA4_ILD_cohort_171106_NEW", replace
 

 
** remake incident flag and then ready to go??
 ** 
 *** create various flags
  ****************************************************************************
  *1.  if earliest earliest mention predates cr reg; then prior_diag = 1
  ****************************************************************************
  
  
use "DA4_ILD_cohort_171106_NEW", clear  
  count if earliest_mention< regstartdate  // -30,682  samaller % more like 12%?(in aurum its 17%) applies to hes as well 
  gen prior_diag=1 if earliest_mention< regstartdate
  recode prior_diag (.=0)
 
****************************************************************************
  *2.  if earliest mention falls within first 12 months of registration   ****************************************************************************
     ** not so much of a thing in hes data ??? not comparable so wouldn't do anythway
	 ** how many have earliest mention that comes in first 12 months of their current registration
	 	count if earliest_mention>=regstartdate & earliest_mention<regstartdate+365.25  //  7,600
		** only 3-4% overall 
		** if em falls into the 12 month period with no eviecne of prior records then risk is they are not incident (but "prevalent") and would need to come out of the numerator or incident for that year
		*  while the others (the ones with a prior record) can stay in the numberator 
	 gen diag_first12months = 0
		 recode diag_first12months (0=1) if earliest_mention>=regstartdate & earliest_mention<regstartdate+365.25
		 



****************************************************************************
  *4.  flag patients who should be counted as incident cases ie in the numerator 

	gen incident=1  // 179563
	gen startstudy = td(01,01,2005)
	recode incident (1=0) if earliest_mention<startstudy
	tab incident,m  // 162758 (max) 
	gen year_diag = year(earliest_mention)
	
	tab year_diag if incident == 1

** chk date 18 applided ; or go back and keep this in as well 
gen yob =year(dob)
gen date18=	date("01/07/"+string(yob+18), "DMY") 
format date18 %td

**
count if earliest_mention < date18 //0

** recode the sybtypes to make the pre file working

save "DA4_ILD_cohort_flagged_196905_NEW.dta", replace

codebook patid

 use "X:\Ann\BI_ILD_projects\non_IPF_ILDs_epi\analysis\cohort_prep\deriv_dta/DA4_ILD_cohort_flagged_196905_NEW.dta", clear
 codebook patid // 
 
 tab subtype, m
gen ild_broad=0
replace ild_broad=1 if subtype==1
replace ild_broad=2 if subtype==2 | subtype==3 | subtype==4 | subtype==5 | subtype==6 

tab ild_broad subtype
sort patid ild_broad
by patid: gen litn=_n
by patid: gen bign=_N
keep if litn==1
drop litn bign
save "X:\Ann\BI_ILD_projects\non_IPF_ILDs_epi\analysis\cohort_prep\deriv_dta/DA4_ILD_cohort_flagged_196905_NEW.dta", replace
 ***************  END *************************