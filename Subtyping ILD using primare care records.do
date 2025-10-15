* STEP 3a: pull in the observation files one by one and merge with revised ild  code list (n=21: see import do file) 

forvalues i=1/48{
use ${obs_dta}Observation_`i', clear

*merge with our final cohort of patients and keep rows for those patients only 
merge m:1 patid using "aurum_min_eligible_patids_89955.dta" 
keep if _m==3
drop _m
* and then flag the ild rows; using the subtypes version;; 
*** **CHK that any specific codes are also in the combined ctd codelist 
merge m:1 medcodeid using "X:\Ann\BI_ILD_projects\non_IPF_ILDs_epi\codelists\data_files\new_all_ILD\ILD codelist final.dta"
keep if _m==3
drop _m
** just keep the ild rows
*keep if ild==1 
save "${path_intermediate_data}ild_cohort_aurum_`i'.dta", replace
}


use "${path_intermediate_data}ild_cohort_aurum_1.dta", clear
forvalues i=2/48{
append using "${path_intermediate_data}ild_cohort_aurum_`i'.dta"
}

*drop unwanted vars
drop consid obsid staffid parentobsid value numunitid numrangelow numrangehigh probobs
save "DA2_aurum_study_cohort_allild_obs_rev1.dta", replace
** same as DA1
codebook patid // now 85701//  now 86,094  // before 86,276  

* add the two obs searches ttogether ; 
use "DA2_aurum_study_cohort_allild_obs_rev1.dta", clear
append using "DA2_aurum_study_cohort_ctdobs.dta"
sort patid obsdate
save "DA2_aurum_study_cohort_allobs_rev1.dta", replace
codebook patid //89497// 89,796 //b89,955  

* tackle subtyping first -  then order rows to find first ? 

* rules:
* 	*1 ipf/iip ; ipf plus generic ild/pul fib in absence of evidecne of anyhting else  codes but no 2s, 3s or 4s (erap HP ctdild other) or no CTD code 
*	at least one HP/exposure code (erap==2) but no ctd or ctd-ild codes oe erap==3 (to exclude people with )
* 	at least one ctd-ild code (erap==3) or erap==1 plus ctd code but not any erap==2 or 4 codes 
* 	at least one other code (erap==4)


use "DA2_aurum_study_cohort_allobs_rev1.dta", clear
codebook patid // 89497// 89,795

** first a bit of cleaning to get rid of missing and unlikely obs dates
count //718508
/// 721451 obs - so more obs but not many new patids 9well couldnt have more than 89955 anyway as we are starting with those we deem eligibel forstudy
sort patid obsdate 
** there are some obs/enter rows dated 31dec1899 and others 31dec9999 both unlikely; remove 

count if enterdate==.  // none
count if obsdate==.  // 1,069
count if obsdate <=td(01,01,1900)  // 20
** explore missing obs date; ok to replace with enterdate?
replace obsdate=enterdate if obsdate==.  // 1,069
replace obsdate=enterdate if obsdate <=td(01,01,1900) //  4

* 1. get rid of any obsdates that are still this date (implies date unknown?)
drop if obsdate<=td(01,01,1900) // 130 gone  but two are dated 9999

gen obs_year = year(obsdate) 
tab obs_year,m  // earliest is 1901 and we have a 9999
drop if obs_year==9999  // 2

* 2. ditch obs before dob (another basic cleaning rule)
count if obsdate < dob 
drop if obsdate < dob  // 12 earliest is now 1930, 

** 3. ditch any obs after study end (31 /12 / 2022)
* although inc/prev sums exclude obs/earliest mention after people exit/study end (2022) anyway
count if obsdate>exit  //  54,655
count if obsdate>td(31,12,2022)

codebook patid if obsdate>exit 

drop if obsdate>exit  
codebook patid  
*** assign patients to a specifc subtype and then find their date of diagnosis = earliest record
sort patid obsdate
save "DA2_aurum_study_cohort_allobs_cleaned_rev1.dta", replace
  

*try the subtyping
use "DA2_aurum_study_cohort_allobs_cleaned_rev1.dta", clear
codebook patid // 81240 /// 81670  

****           PROCESSING seven cohorts  ************************************


tab VNILDsubtype,m
*//*
     VN ILD |
   subtype  |      Freq.     Percent        Cum.
------------+-----------------------------------
            |    274,775       41.39       41.39
          1 |    215,579       32.47       73.87
          2 |     50,336        7.58       81.45
          3 |      4,038        0.61       82.06
          4 |      1,956        0.29       82.35
          5 |     28,523        4.30       86.65
          6 |      8,482        1.28       87.93
          7 |     80,151       12.07      100.00
------------+-----------------------------------
      Total |    663,840      100.00
*//


tab VNILDsubtype,m

* so do what i did before but with full cohort	  
	  
sort patid obsdate 
tab VNILDsubtype
gen flag_rev_erap1 = 0 //ipf
gen flag_rev_erap2 = 0 //hp exposure
gen flag_rev_erap3 = 0  //ctdild
gen flag_rev_erap4 = 0 // drug radiation
gen flag_rev_erap5 = 0 // pulmonary sarcoid
gen flag_rev_erap6 = 0  // other
gen flag_rev_erap7 = 0 // verybroad
*gen flag_rev_erap9 = 0   // gen ric ild
gen flag_rev_ctd = 0   // ctd

recode flag_rev_erap1 (0=1) if VNILDsubtype=="1"
recode flag_rev_erap2 (0=5) if VNILDsubtype=="2"
recode flag_rev_erap3 (0=10) if VNILDsubtype=="3"
recode flag_rev_erap4 (0=25) if VNILDsubtype=="4"
recode flag_rev_erap5 (0=50) if VNILDsubtype=="5"
recode flag_rev_erap6 (0=100) if VNILDsubtype=="6"
recode flag_rev_erap7 (0=180) if VNILDsubtype=="7"
*recode flag_rev_erap9 (0=125) if rev_erap==9
recode flag_rev_ctd   (0=200) if VNILDsubtype==""

by patid: egen erap1 = max(flag_rev_erap1)  //so = 1 if has a ipf code 
by patid: egen erap2 = max(flag_rev_erap2)  //so = 5 if has a hp code
by patid: egen erap3 = max(flag_rev_erap3) 
by patid: egen erap4 = max(flag_rev_erap4)  //so = 10 if has a ctdild code 
by patid: egen erap5 = max(flag_rev_erap5)  //so = 25 if has a  other code 
by patid: egen erap6 = max(flag_rev_erap6)  //so = 50 if has a pul src code 
by patid: egen erap7 = max(flag_rev_erap7)  //so = 50 if has a pul src code 
by patid: egen ectd =  max(flag_rev_ctd)    //so = 200 if has a ctd 

** sum of these 5 rows will vary deoping on the combos
** 1+ 2 only will be 6; 5 means only hp codes
gen sum=(erap1+erap2+erap3+erap4+erap5+erap6+erap7+ectd) 

tab sum, m	  

preserve
keep if 
	  
  /*      sum |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |    148,673       22.30       22.30  ipf 
          5 |     34,848        5.23       27.53
          6 |     17,181        2.58       30.11
         10 |        410        0.06       30.17
         11 |        832        0.12       30.29
         15 |         31        0.00       30.30
         16 |          7        0.00       30.30
         25 |      4,797        0.72       31.02
         26 |      1,940        0.29       31.31
         30 |        157        0.02       31.33
         31 |        366        0.05       31.39
         35 |         36        0.01       31.39
         36 |          9        0.00       31.39
         41 |         14        0.00       31.40
         50 |     23,723        3.56       34.95
         51 |      2,956        0.44       35.40
         55 |        256        0.04       35.44
         56 |        132        0.02       35.46
         60 |         17        0.00       35.46
         75 |        140        0.02       35.48
         76 |          7        0.00       35.48
         80 |          6        0.00       35.48
        100 |     34,739        5.21       40.69
        101 |     50,567        7.59       48.28
        105 |      7,988        1.20       49.48
        106 |      7,049        1.06       50.53
        110 |        277        0.04       50.57
        111 |        144        0.02       50.60
        115 |         12        0.00       50.60
        116 |         37        0.01       50.60
        125 |        415        0.06       50.67
        126 |        527        0.08       50.75
        130 |         87        0.01       50.76
        131 |         43        0.01       50.76
        135 |          4        0.00       50.77
        150 |      1,261        0.19       50.95
        151 |        679        0.10       51.06
        155 |         55        0.01       51.06
        156 |         79        0.01       51.08
        175 |          7        0.00       51.08
        176 |         22        0.00       51.08
        200 |     64,769        9.72       60.80
        201 |    102,044       15.31       76.10
        205 |     10,035        1.51       77.61
        206 |      3,946        0.59       78.20
        210 |     11,834        1.78       79.98
        211 |      7,243        1.09       81.06
        215 |        350        0.05       81.11
        216 |        111        0.02       81.13
        225 |      6,778        1.02       82.15
        226 |      1,393        0.21       82.36
        230 |         93        0.01       82.37
        231 |         91        0.01       82.38
        235 |      1,236        0.19       82.57
        236 |        220        0.03       82.60
        250 |      3,938        0.59       83.19
        251 |        314        0.05       83.24
        255 |         74        0.01       83.25
        256 |         42        0.01       83.26
        260 |         17        0.00       83.26
        266 |         14        0.00       83.26
        275 |          5        0.00       83.26
        291 |         86        0.01       83.28
        300 |     59,502        8.93       92.20
        301 |     38,067        5.71       97.91
        305 |      3,137        0.47       98.38
        306 |      1,975        0.30       98.68
        310 |      2,346        0.35       99.03
        311 |      3,075        0.46       99.49
        315 |         37        0.01       99.50
        316 |         62        0.01       99.51
        325 |      1,525        0.23       99.74
        326 |        811        0.12       99.86
        330 |         75        0.01       99.87
        331 |         27        0.00       99.87
        335 |        223        0.03       99.91
        336 |         15        0.00       99.91
        340 |         28        0.00       99.91
        350 |        359        0.05       99.97
        351 |        208        0.03      100.00
        356 |         17        0.00      100.00
------------+-----------------------------------
      Total |    666,652      100.00

furst try
 sum |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |    234,266       38.86       38.86
          5 |     34,870        5.78       44.64
          6 |     32,300        5.36       50.00
         10 |        410        0.07       50.07
         11 |      1,256        0.21       50.28
         15 |         31        0.01       50.28
         16 |         56        0.01       50.29
         25 |     28,766        4.77       55.07
         26 |      7,816        1.30       56.36
         30 |        419        0.07       56.43
         31 |        762        0.13       56.56
         35 |         53        0.01       56.57
         36 |         13        0.00       56.57
         41 |         14        0.00       56.57
         51 |    199,940       33.17       89.74
         55 |     10,037        1.66       91.40
         56 |      9,058        1.50       92.91
         60 |     11,934        1.98       94.89
         61 |     12,664        2.10       96.99
         65 |        350        0.06       97.04
         66 |        210        0.03       97.08
         75 |     10,743        1.78       98.86
         76 |      4,610        0.76       99.63
         80 |        167        0.03       99.65
         81 |        252        0.04       99.69
         85 |      1,253        0.21       99.90
         86 |        458        0.08       99.98
         91 |        128        0.02      100.00
------------+-----------------------------------
      Total |    602,836      100.00
*/

  gen ild_subtype=0
recode ild_subtype (0=1) if sum==1  //  ipf codes only
recode ild_subtype (0=2) if sum==5   // hp only
recode ild_subtype (0=2) if sum==6  //  ipf and hp so hp

recode ild_subtype (0=3) if sum==10  // ctd ild only
recode ild_subtype (0=3) if sum==11   //  ipf plus ctdlid
recode ild_subtype (0=8) if sum==15   // hp &ctdild
recode ild_subtype (0=8) if sum==16  // ipf plus hp + ctdild

recode ild_subtype (0=4) if sum==25   // specifc other only
recode ild_subtype (0=4) if sum==26  // specific other plus ipf
  // 
recode ild_subtype (0=8) if sum==30   // sp-other + hp
recode ild_subtype (0=8) if sum==31  //  sp-other + hp +i[f]
recode ild_subtype (0=8) if sum==35  // sp-other +ctdild 
recode ild_subtype (0=8) if sum==36  // sp-other + ctdild + ipf
recode ild_subtype (0=8) if sum==41  // // sp-other + ctdild + ipf =+ hp

recode ild_subtype (0=5) if sum==50  // sar only
recode ild_subtype (0=5) if sum==51  // sar + ipf 
recode ild_subtype (0=8) if sum==55  // sar + hp
recode ild_subtype (0=8) if sum==56 // sar +ipf+ hp
  // 
recode ild_subtype (0=8) if sum==60  // sar + ctdild   ???/or 5??
recode ild_subtype (0=8) if sum==75  // sar + sp-other
recode ild_subtype (0=8) if sum==76 // sar + sp-other +ipf

recode ild_subtype (0=8) if sum==80  // sar + sp-other + hp

recode ild_subtype (0=6) if sum==100  // generic ild only   
recode ild_subtype (0=1) if sum==101 // generic ild plus ipf
recode ild_subtype (0=2) if sum==105 // generic ild + hp
recode ild_subtype (0=8) if sum==106 // generic ild + hp ipf
recode ild_subtype (0=3) if sum==110  // generic ild +ctdild
recode ild_subtype (0=8) if sum==111  // generic ild ctdild ipf 
recode ild_subtype (0=8) if sum==115 // generic ild ctdild hp
recode ild_subtype (0=8) if sum==116 // generic ild ctdild hp upf
recode ild_subtype (0=8) if sum==125  // generic ild sp other 
recode ild_subtype (0=8) if sum==126  // generic ild sp other ipf
recode ild_subtype (0=8) if sum==130 // generic ild sp other hp 
recode ild_subtype (0=8) if sum==131 // generic ild sp other hp ipf
recode ild_subtype (0=8) if sum==135  // generic ild sp other ctdild


recode ild_subtype (0=8) if sum==150 // generic ild sar
recode ild_subtype (0=8) if sum==151  // generic ild sar ipf
recode ild_subtype (0=8) if sum==155  // generic ild sar hp
recode ild_subtype (0=8) if sum==156 // generic ild sar  hp ipf
recode ild_subtype (0=8) if sum==175 // generic ild sar sp other 
recode ild_subtype (0=8) if sum==176  // generic ild sar sp other ipf
recode ild_subtype (0=7) if sum==180  // broad ILD code
recode ild_subtype (0=1) if sum==181  //
recode ild_subtype (0=2) if sum==185  //
recode ild_subtype (0=2) if sum==186  //
recode ild_subtype (0=3) if sum==190  //
recode ild_subtype (0=3) if sum==191  //
recode ild_subtype (0=8) if sum==195  //
recode ild_subtype (0=8) if sum==196  //

recode ild_subtype (0=0) if sum==200 // ctd only so not ild 
recode ild_subtype (0=3) if sum==201  // ctd + ipf 
recode ild_subtype (0=8) if sum==205  // ctd hp
recode ild_subtype (0=8) if sum==206 // ctd hp ipf
recode ild_subtype (0=3) if sum==210 // ctd +ctdild  
recode ild_subtype (0=3) if sum==211 // ctd +ctdild + ipf
recode ild_subtype (0=8) if sum==215 // ctd + ctdild +hp
recode ild_subtype (0=8) if sum==216 // ctd  ctdild hp ipf
recode ild_subtype (0=4) if sum==225  //  ctd + sp other 
recode ild_subtype (0=8) if sum==226  // ctd + sp other  ipf
recode ild_subtype (0=8) if sum==230 // ctd  sp other hp 
recode ild_subtype (0=8) if sum==231 // ctd  sp other hp ipf
recode ild_subtype (0=8) if sum==235  // ctd   sp other ctdild
recode ild_subtype (0=8) if sum==236  // ctd   sp other ctdild ipf
recode ild_subtype (0=5) if sum==250 // ctd + sar ?? 
recode ild_subtype (0=5) if sum==251  // ctd + sar ipf ?? 
recode ild_subtype (0=8) if sum==255  // ctd  sar hp
recode ild_subtype (0=8) if sum==256 // ctd sar  hp ipf
recode ild_subtype (0=8) if sum==260 // ctd sar ctdild 
recode ild_subtype (0=8) if sum==266 // ctd sar ctfild hp ipf  
recode ild_subtype (0=8) if sum==275 // ctd sar sp other 
recode ild_subtype (0=8) if sum==280  //
recode ild_subtype (0=8) if sum==281  //
recode ild_subtype (0=8) if sum==285  //
recode ild_subtype (0=8) if sum==286  //
recode ild_subtype (0=8) if sum==290  //
recode ild_subtype (0=8) if sum==291  // ctd  ild sar sp other ipf
recode ild_subtype (0=8) if sum==295 //

recode ild_subtype (0=6) if sum==300 // ctd and gen ild 
recode ild_subtype (0=6) if sum==301  // ctd + gen ild ipf 
recode ild_subtype (0=8) if sum==305  // ctd + gen ild hp
recode ild_subtype (0=8) if sum==306 // ctd+ gen ild hp ipf
recode ild_subtype (0=3) if sum==310 // ctd + gen ild + ctdild  
recode ild_subtype (0=3) if sum==311 // ctd + gen ild ctdild + ipf
recode ild_subtype (0=8) if sum==315 // ctd + gen ild ctdild +hp
recode ild_subtype (0=8) if sum==316 // ctd  gen ildctdild hp ipf
recode ild_subtype (0=8) if sum==325  //  ctd + gen ild + sp other 
recode ild_subtype (0=8) if sum==326  // ctd + gen ild sp other  ipf
recode ild_subtype (0=8) if sum==330 // ctd  gen ild sp other hp 
recode ild_subtype (0=8) if sum==331 // ctd  gen ild sp other hp ipf
recode ild_subtype (0=8) if sum==335  // ctd  gen ild sp other ctdild
recode ild_subtype (0=8) if sum==336  // ctd  gen ild sp other ctdild ipf

recode ild_subtype (0=8) if sum==340 // ctd + gen ild  +  sp other hp ctdild  
recode ild_subtype (0=8) if sum==350 // ctd + gen ild  + sar ?? or5 ??
recode ild_subtype (0=8) if sum==351  // ctd + gen ild sar ipf ?? 
recode ild_subtype (0=8) if sum==356 // ctd gen ild sar  hp ipf
recode ild_subtype (0=3) if sum==380  //
recode ild_subtype (0=3) if sum==381
recode ild_subtype (0=2) if sum==385  //
recode ild_subtype (0=8) if sum==386  //
recode ild_subtype (0=3) if sum==390  //
recode ild_subtype (0=3) if sum==391  //
recode ild_subtype (0=8) if sum==395  //
recode ild_subtype (0=8) if sum==396  //
recode ild_subtype (0=8) if sum==405  //
recode ild_subtype (0=8) if sum==406  //
recode ild_subtype (0=8) if sum==416  //
recode ild_subtype (0=5) if sum==430  //
recode ild_subtype (0=5) if sum==431  //
recode ild_subtype (0=8) if sum==436  //
recode ild_subtype (0=6) if sum==480  //
recode ild_subtype (0=8) if sum==481  //
recode ild_subtype (0=8) if sum==485  //
recode ild_subtype (0=8) if sum==486  //
recode ild_subtype (0=3) if sum==490  //
recode ild_subtype (0=3) if sum==491  //
recode ild_subtype (0=8) if sum==495  //
recode ild_subtype (0=8) if sum==510  //



preserve
keep if ild_subtype==0
tab sum, m
restore

tab ild_subtype,m


* drop reduntant vars in prep forredcingto one line per pat
drop flag_rev_erap1 flag_rev_erap2 flag_rev_erap3 flag_rev_erap4 flag_rev_erap5 flag_rev_erap6 flag_rev_erap7 flag_rev_ctd erap1 erap2 erap3 erap4 erap5 erap6 erap7 ectd sum jkq
drop if ild_subtype==0  // drop patids with  ctd rows only
  * put obs in order
  sort patid VNILDsubtype obsdate // puts  last
  ** can delete the ctd rows in the people with ctdild as the date of diagnsosi relies on the ild coding not the CTD  
  drop if VNILDsubtype=="" & ild_subtype==3


  ** noe do the date od diis based on the ild codes only
  sort patid obsdate
  by patid: gen counter =_n
  by patid: gen total_obs=_N
  * chk each patd has same ildsubtype allrows
  order patid VNILDsubtype ild_subtype counter total_obs
  order patid  obsdate counter total_obs VNILDsubtype term obs_year
     * keep the first/earliest 
  keep if counter==1
  *one row per patid
  codebook patid  // 77,205
  rename obsdate earliest_mention
  tab obs_year, m 

    drop  counter total_obs exit entry medcodeid obstypeid

  save DA2_ILD_cohort_77205_rev1.dta, replace
  keep patid earliest_mention enterdate regstartdate ild_subtype
  save DA2_ILD_cohort_77205_patids.dta, replace
  ** also saved in comobidity folder
  *****
  tab ild_subtype,m
 
  
  
  
  
  