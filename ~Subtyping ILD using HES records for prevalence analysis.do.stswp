
** start with the spelled file; so we have admidate as well as epistart (see import hes_diagnosis episodes) at bottom of  file
use hes_apc_episodes_wide.dta, clear
codebook patid // 428,285 (note: not everyone will have a hosp)  

* extract episodes with a ild code 
* so our ICD-10 codes were: but need to look in each of the 20 columns now;; 
/*keep if strmatch(icd, "J84.*") | strmatch(icd, "J60") | strmatch(icd, "J61") | strmatch(icd, "J62.*") | strmatch(icd, "J63.*") | strmatch(icd, "J64")   | strmatch(icd, "J67.*") | strmatch(icd, "J68.4") | strmatch(icd, "J70.*") | strmatch(icd, "J98.4") | strmatch(icd, "Q33.0") | strmatch(icd, "J99.*") | strmatch(icd, "D86.0") | strmatch(icd, "D86.1") | strmatch(icd, "D86.2") | strmatch(icd, "D86.8") | strmatch(icd, "D86.9") | strmatch(icd, "M05.1") | strmatch(icd, "M05.3") | strmatch(icd, "M30.1") | strmatch(icd, "M31.3") | strmatch(icd, "M31.7") | strmatch(icd, "M32.1") | strmatch(icd, "M33.1") | strmatch(icd, "M33.2") | strmatch(icd, "M33.9") | strmatch(icd, "M34.8") | strmatch(icd, "M35.0") | strmatch(icd, "M35.1") | strmatch(icd, "M35.8") | strmatch(icd, "M35.9") | strmatch(icd, "M31.0") | strmatch(icd, "M33.0") 
*/

***** note 15/09 for this strategy then we need to:
* 1. change 1/20 to 1/2 for the ild codes, and 
* 2. add codes for RA, SSc and lupus but allow the search to run to 1/20; also allow search for the other CTD codes we already have (eg PM/DM) to run to 1/20 (any position) 

** RA codes M05 and M06; M06.9 is the most general and I suspect the most commonly used code 
** lupus is M32.*; but we dont want all of them
** see my icd 10 spreadsheet for more detials

*drop unwated vars
drop epidur epitype admimeth admisorc disdest dismeth mainspef tretspef pconsult intmanig classpat firstreg ethnos
gen ild =0

forvalues x = 1/20  {
	recode ild(0=1) if strmatch(icd0`x', "J84.1*") 
}

forvalues x = 1/20  {
	recode ild(0=1) if strmatch(icd0`x', "J84.8*") 
}

forvalues x = 1/20  {
	recode ild(0=1) if strmatch(icd0`x', "J84.9*") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J60") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J61") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J62.*") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J63.*") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J64") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J67.*") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J68.4") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J70.*") 
}





forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J98.4") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J99.0*") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J99.1*") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "J99.8*") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "D86.0*") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "D86.2*") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "D86.8*") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M05.1") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M05.3") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M30.1") 
}





forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M31.0") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M31.3") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M31.7") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M32.1") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M33.*") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M34.8") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M35.0") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M35.1") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M35.8") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M35.9") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M06.9") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M05.9") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M06.8") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M05.8") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M06.0") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M32.8") 
}
forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M32.9") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M34.9") 
}

forvalues x = 1/20  {
	recode ild (0=1) if strmatch(icd0`x', "M34.0") 
}

tab ild, m 
/* ild |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |  8,354,200       82.65       82.65
          1 |  1,754,204       17.35      100.00
------------+-----------------------------------
      Total | 10,108,404      100.00
*/

** so if a *.0 code found in any one of the 20 columns and ild flipped to a 1, then if there is a *.2 code in a another column then it won't flip as already a 1 etc ...
* but we stll have the same number of patids 

codebook patid if ild ==1  // 400,559  have a hes ild code (rest are people hosp'd but not with ild in their record)

* just keep the ild rows
  keep if ild==1
  
** would be useful to keep the icd code at this point for subtyping 
//so keeps all rows which have an ild code (flagged with a 1 in ild var) and then we have columns with a 1 for the each individual icd 10 codes; this will have to be each one ...cant use * here

* Group A: only look in 1st and 2nd position
local icd10_list_2 "J84.1 J84.8 J84.9 J60 J61 J62.0 J62.8 J63.0 J63.1 J63.2 J63.3 J63.4 J63.5 J63.8 J64 J67.0 J67.1 J67.2 J67.3 J67.4 J67.5 J67.6 J67.7 J67.8 J67.9 J68.4 J70.0 J70.1 J70.2 J70.3 J70.4 J70.8 J70.9 J98.4 J99.0 J99.1 J99.8 D86.0 D86.2 D86.8 M05.1 M30.1"

foreach code of local icd10_list_2 {
    local varname = subinstr("`code'", ".", "_", .)   // replace dot with underscore
    gen byte `varname' = 0                            // create indicator variable
    forvalues x = 1/2 {
        replace `varname' = 1 if strmatch(icd0`x', "`code'")
    }
}

* Group B: look across all 20 diagnosis positions
local icd10_list_20 "M05.3 M31.0 M31.3 M31.7 M32.1 M33.0 M33.1 M33.2 M33.9 M34.8 M35.0 M35.1 M35.8 M35.9 M06.9 M05.9 M06.8 M05.8 M06.0 M32.8 M32.9 M34.9 M34.0"

foreach code of local icd10_list_20 {
    local varname = subinstr("`code'", ".", "_", .)   // replace dot with underscore
    gen byte `varname' = 0                            // create indicator variable
    forvalues x = 1/20 {
        replace `varname' = 1 if strmatch(icd0`x', "`code'")
    }
}


* people have been coded using different sub type codes esp across episodes/spells

keep if ild==1  
codebook patid // 225,586

save "hes_apc_ild_episodes_NEW_prev.dta", replace 

use "hes_apc_ild_episodes_NEW_prev.dta", replace 
 
* Step 2::
  ** next rationalise episodes to individual spells: pats can still have multipl spells wit a ild code and keep only those spells within follow up periods/ or rather admidate falls within ...

  ** modified on 10 aug to exclude spells which oly have the non specifc sarcoid code too
  
  use "hes_apc_ild_episodes_NEW_prev.dta", clear // spelled version

  gen apc_erapsubtype=0  // try to assign each spell to one unqiue erap equivalent code; 
  
  ** note if one row contians multiple ILD flags ththen it what happens -  hek using row total ..might this affect if there ild plus the M* for the codes?? 
	 egen codecounter = rowtotal(J84_1 J84_8 J84_9 J60 J61 J62_0 J62_8 J63_0 J63_1 J63_2 J63_3 J63_4 J63_5 J63_8 J64 J67_0 J67_1 J67_2 J67_3 J67_4 J67_5 J67_6 J67_7 J67_8 J67_9 J68_4 J70_0 J70_1 J70_2 J70_3 J70_4 J70_8 J70_9 J98_4 J99_0 J99_1 J99_8 D86_0 D86_2 D86_8 M05_1 M30_1 M05_3 M31_0 M31_3 M31_7 M32_1 M33_0 M33_1 M33_2 M33_9 M34_8 M35_0 M35_1 M35_8 M35_9 M06_9 M05_9 M06_8 M05_8 M06_0 M32_8 M32_9 M34_9 M34_0)
	
	tab codecounter,m
/*
codecounter |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |  1,186,238       89.31       89.31
          2 |    132,428        9.97       99.28
          3 |      8,934        0.67       99.95
          4 |        635        0.05      100.00
          5 |         23        0.00      100.00
------------+-----------------------------------
      Total |  1,328,258      100.00



about 10% have multiple ild-related codes in an episode, most of whih have 2 codes in out list
	 
*/	
   
   ** asugn each icd-10 code to one of our erapsubtypes; we have ipf, hp,ctd-ild,pul sarc,specificother (drug induced), a ctd code and vague ild codes (J99.8 and J98.4)
  
  ** so do the non ipf ones first and the ipf ones last otherwsie the ones with ipf and something esle get coded as ipf; largely at expense of group 2 and 3 (hp and ctlild)

** all the HP one J60s 
recode apc_erapsubtype (0=2) if J60==1 | J61==1 | J62_0==1 | J62_8==1 | J63_0==1 | J63_1==1 | J63_2==1 | J63_3==1 | J63_4==1 | J63_5==1 | J63_8==1 | J64==1 | J67_0==1 | J67_1==1 | J67_2==1 | J67_3==1 | J67_4==1 | J67_5==1 | J67_6==1 | J67_7==1 | J67_8==1 | J67_9==1 | J68_4==1 

** the ctd-ilds; nb inc codes which imply lung involvement specific code with or without J99*
recode apc_erapsubtype (0=3) if M05_1==1 | M05_3==1 | J99_0==1 | J99_1==1 | M30_1==1 | M32_1==1 | M34_8==1 | M35_8==1 | M35_9==1    

* pul sarcoid  
recode apc_erapsubtype (0=4) if D86_0==1 | D86_2==1 | D86_8==1 

** drug radiation (specifc other) 
recode apc_erapsubtype (0=5) if J70_0==1 | J70_1==1 | J70_2==1 | J70_3==1 | J70_4==1 | J70_8==1 | J70_9==1 

** for the CTD codes that don't necessarily imply lung involvement
recode apc_erapsubtype (0=9) if M05_3==1 | M31_0==1 | M31_3==1 | M31_7==1 | M32_1==1 | M33_0==1 | M33_1==1 | M33_2==1 | M33_9==1 | M34_8==1 | M35_0==1 | M35_1==1 | M35_8==1 | M35_9==1 | M06_9==1 | M05_9==1 | M06_8==1 | M05_8==1 | M06_0==1 | M32_8==1 | M32_9==1 | M34_9==1 | M34_0==1

** very non-specific lung diseases NOS
recode apc_erapsubtype (0=10) if J98_4==1 | J99_8==1

** IPF / as per RS study
recode apc_erapsubtype (0=1) if J84_1==1 | J84_8==1 | J84_9==1 

* recodes episode with an ra code to ctdild if accompanied by either ipf or a vague ild code 
recode apc_erapsubtype (9=3) if codecounter==2 & (J84_1==1 | J84_8==1 | J84_9==1 | J98_4==1 | J99_8==1)


  tab apc_erapsubtype,m
/*
**/ 

* drop 	if apc_erapsubtype==0 	 

    
 ** 2A;; each row =-= an episode now has a erapsubtype-code - unique code as best we can - now condense to one row per spell and assign a suttype to that spell 
  keep patid spell apc_erapsubtype admidate discharged ild
  sort patid spell apc_erapsubtype
  * add counters within a spell order the codes
by patid spell: gen obs=_n
by patid spell: gen num_obs=_N

** so flag any duplicated coded rows within a spell so we have uniques ones only; most  they are unique in a spell; this codes subsequent rows as zero if subtype is the same; so by dropping if ild ==0 we shed the duplicated episode rows
by patid spell: replace ild=0 if apc_erapsubtype==apc_erapsubtype[_n-1]
drop if ild ==0

* do we have unique spells
codebook spell  // not quite 
*redo counters now that we have lost rows witht he same subtyped
drop obs num_obs
by patid spell: gen obs=_n
by patid spell: gen num_obs=_N

codebook patid if num_obs>1  // 
tab ild,m
recode ild (1=0) if num_obs>1
browse if ild==0
* this is people with diff codes in a spell
** sen analysis 4521 have mixed codes
*  create bunch of flags that will distinguish the combinations- use again for multiple spells 
** bit different now sarc is in sep
gen flag_erap1 = 0 // ipf
gen flag_erap2 = 0 // hp
gen flag_erap3 = 0 // ctd-ild
gen flag_erap4 = 0 // pul sarc
gen flag_erap5 = 0 // specific other/drug induced
gen flag_erap9 = 0 // ctd code/RA
gen flag_erap10 = 0 //  the very generic code J98.4 J99.8
*gen flag_ctd = 0  // ctds and vague sarcoid
recode flag_erap1 (0=1) if apc_erapsubtype==1
recode flag_erap2 (0=5) if apc_erapsubtype==2
recode flag_erap3 (0=10) if apc_erapsubtype==3
recode flag_erap4 (0=25) if apc_erapsubtype==4
recode flag_erap5 (0=50) if apc_erapsubtype==5
recode flag_erap9 (0=100) if apc_erapsubtype==9  //  ctd codes 
recode flag_erap10 (0=200) if apc_erapsubtype==10  // generic 

** copies to each for that patient; does it chk; yes!!!
by patid spell: egen hes_subtype1 = max(flag_erap1)  //so = 1 of has a single 1 code 
by patid spell: egen hes_subtype2 = max(flag_erap2)  //so =5 if has a 2 code
by patid spell: egen hes_subtype3 = max(flag_erap3)  //so =10 of has a 3 code 
by patid spell: egen hes_subtype4 = max(flag_erap4)  //so =25 of has a  4 code pul sar
by patid spell: egen hes_subtype5 = max(flag_erap5)  //so =50 of has a 5 code other di
by patid spell: egen hes_subtype9 = max(flag_erap9)  // so = ctd
by patid spell: egen hes_subtype10 = max(flag_erap10)  //so = 200 of has a 10 vague cod

** sum of these 7 rows will vary deoping on the combos
** 1+2 only will be 6; sum will be th same for each paitne row
gen sum=(hes_subtype1 + hes_subtype2 + hes_subtype3 + hes_subtype4 + hes_subtype5 + hes_subtype9 + hes_subtype10) 
tab sum, m 
/*ab sum, m 

        sum |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |    134,090       12.93       12.93
          5 |     22,359        2.16       15.08
          6 |        582        0.06       15.14
         10 |    137,703       13.28       28.42
         11 |        480        0.05       28.46
         15 |         28        0.00       28.46
         25 |     30,939        2.98       31.45
         26 |        158        0.02       31.46
         30 |          6        0.00       31.46
         31 |          6        0.00       31.46
         35 |         10        0.00       31.46
         50 |      3,081        0.30       31.76
         51 |         78        0.01       31.77
         55 |          2        0.00       31.77
         60 |          8        0.00       31.77
        100 |    625,547       60.31       92.08
        101 |        238        0.02       92.10
        105 |        208        0.02       92.12
        110 |      6,862        0.66       92.78
        111 |        111        0.01       92.79
        115 |          9        0.00       92.80
        125 |        110        0.01       92.81
        150 |        100        0.01       92.82
        151 |          3        0.00       92.82
        160 |          3        0.00       92.82
        200 |     74,027        7.14       99.95
        201 |        318        0.03       99.98
        205 |         22        0.00       99.99
        210 |         30        0.00       99.99
        225 |         36        0.00       99.99
        235 |          3        0.00       99.99
        250 |          6        0.00       99.99
        300 |         64        0.01      100.00
        310 |          9        0.00      100.00
------------+-----------------------------------
      Total |  1,037,236      100.00




*/

** so get rid of spells  ctd codes only so sum ==200 



** assign final code to each spell; one row per spell  altered slightly now
gen hes_subtype=0  // thes to match aurum coding system so 6 is sarc (other is mix or 4 and 5)
recode hes_subtype (0=1) if sum==1 // ipf
  // 
recode hes_subtype (0=2) if sum==5   // hp
recode hes_subtype (0=2) if sum==6 
 
recode hes_subtype (0=3) if sum==10  // ctdild
recode hes_subtype (0=3) if sum==11 
// 
recode hes_subtype (0=8) if sum==15  // 2 and 3   conflicting
   
recode hes_subtype (0=4) if sum==25   //  ie pul sar
recode hes_subtype (0=4) if sum==26   // 
 
recode hes_subtype (0=8) if sum==30 // psar + hp 
recode hes_subtype (0=8) if sum==31  // new: psar and 2 and ipf
recode hes_subtype (0=8) if sum==35  //pulsar +ctdild 

recode hes_subtype (0=5) if sum==50  // specifc other 
recode hes_subtype (0=5) if sum==51  //
recode hes_subtype (0=8) if sum==55   // specifc other plus hp so mxed other
*recode hes_subtype (0=8) if sum==56 

recode hes_subtype (0=8) if sum==60  //specifc other plus ctd mixed other

** 100s are ctd
drop if sum==100 // lose just ctd code
recode hes_subtype (0=3) if sum==101 // ctd plus ipf so ctdild
recode hes_subtype (0=2) if sum==105 // ctd plus plus hp
*recode hes_subtype (0=2) if sum==106  // ctd plus plus hp +ipf so hp 
recode hes_subtype (0=3) if sum==110 // ctd plus ctdild  
recode hes_subtype (0=3) if sum==111  // ctd plus ctdild  plus ipf
recode hes_subtype (0=8) if sum==115  // 
recode hes_subtype (0=4) if sum==125  // ctd  plus sarcoid  

recode hes_subtype (0=5) if sum==150  // ctd plus specifc other
recode hes_subtype (0=8) if sum==151  

recode hes_subtype (0=8) if sum==160 // ctd  plus specific other plud ctdild 

 
** 200 deleted ctds codes alone
recode hes_subtype (0=10) if sum==200  // vague ild codes  
recode hes_subtype (0=1) if sum==201  //  vague + ipf
recode hes_subtype (0=2) if sum==205  //  vague +hp 

recode hes_subtype (0=3) if sum==210	// vague  plus cdtild  
recode hes_subtype (0=4) if sum==225 //  vague plus sar  ???

recode hes_subtype (0=8) if sum==235 //  vague plus sar plus ctdlid

recode hes_subtype (0=5) if sum==250  // vague plus specifc other

recode hes_subtype (0=3) if sum==300  // gen ild  plus ctd
recode hes_subtype (0=3) if sum==310	// gen ild  plus ctd  plus ctdild
 tab hes_subtype,m

 preserve
 keep if hes_subtype==0
 tab sum
 restore
 

drop if sum==0
drop obs num_obs
** reduce to one line per spell
  sort patid spell admidate 
  by patid spell: gen obs =_n
  by patid spell: gen num_obs=_N
  * keep the first/earliest
  order  patid spell admidate hes_subtype obs num_obs
  keep if obs==1  // keep first row of each spell 
  *one row per patid
  codebook spell //  

codebook patid // 173,634 
keep patid spell admidate hes_subtype discharged
compress
save "hes_apc_ild_spells_all_NEWprev.dta", replace
 
 tab hes_subtype, m


use hes_apc_ild_spells_all_NEWprev.dta, clear
 codebook patid  ////  sa217,846  218,091 (b232,090)
sort patid spell admidate
by patid : gen obs =_n
by patid : gen num_obs=_N
tab num_obs,m  // just over half sre multiple spells
  drop  obs num_obs
  
  ** chk no longwer have spells outside our study period;  only went to march 2023 
count if admidate > date("31dec2022", "dmy")
 browse if admidate > date("31dec2022", "dmy") // 0
 
sort patid spell admidat
 
gen ild=1
 by patid : replace ild=0 if hes_subtype==hes_subtype[_n-1]
drop if ild ==0

* do we have unique hosp
codebook patid  //
by patid: gen obs=_n
by patid : gen num_obs=_N


 ** 2. repeat sequence above; nb codes slightly differe 4 vs 6
 ** this matches the aurum coding
 gen flag_erap1 = 0 // ipf
gen flag_erap2 = 0 // hp
gen flag_erap3 = 0 // ctd-ild
gen flag_erap4 = 0 // pul sarc
gen flag_erap5 = 0 // specific other/drug induced
gen flag_erap9 = 0 // ctd code/RA
gen flag_erap10 = 0 //  the very generic code J98.4 J99.8

recode flag_erap1 (0=1) if hes_subtype==1
recode flag_erap2 (0=5) if hes_subtype==2
recode flag_erap3 (0=10) if hes_subtype==3
recode flag_erap4 (0=25) if hes_subtype==4
recode flag_erap5 (0=50) if hes_subtype==5
recode flag_erap9 (0=100) if hes_subtype==9  //  ctd codes 
recode flag_erap10 (0=200) if hes_subtype==10  // generic 

** copies to each row for for that patient but doesnt ...why???   doesnt like the fiel names...too simialr
sort patid spell
by patid : egen temp1 = max(flag_erap1) //so = 1 if has a hes- subtpe 1 
by patid : egen temp2 = max(flag_erap2)  //so =5 if has a 2 code
by patid : egen temp3 = max(flag_erap3)  //so =10 of has a 3 code 
by patid : egen temp4 = max(flag_erap4)  //so =25 of has a  4 code 
by patid : egen temp5 = max(flag_erap5)  //so =50 of has a  5 code 
by patid : egen temp9 = max(flag_erap9)  //so =100 of has a 6 code (cpul sarcoid)
by patid : egen temp10 = max(flag_erap10)  //so =100 of has a 6 code (cpul sarcoid)



** sum of these 6 rows will vary deoping on the combos of hes-sutypes
** 1+2 only will be 6; sum will be th same for each paitne row; it sisnt 
gen sum=(temp1 + temp2 + temp3 + temp4 + temp5 + temp9+temp10) 
tab sum, m 

 ** assign final code to each spell; one row per spell
gen hes_ild_cat=0
drop if sum==0
recode hes_ild_cat (0=1) if sum==1   // ipf only has ipf codes
  // 
recode hes_ild_cat (0=2) if sum==5   // hp only code
recode hes_ild_cat (0=2) if sum==6   // hp and ipf so hp
 
recode hes_ild_cat (0=3) if sum==10  // ctd ilds codes only so ctdild
recode hes_ild_cat (0=3) if sum==11  // ctd ilds codes + ipf  so ctdild
 
recode hes_ild_cat (0=8) if sum==15  //ctdild and hp
recode hes_ild_cat (0=8) if sum==16  //  ctdild and hp and ipf
recode hes_ild_cat (0=4) if sum==25   // psarc
recode hes_ild_cat (0=4) if sum==26   // psarc and ipf
 
recode hes_ild_cat (0=8) if sum==30   // hp plus psarc
recode hes_ild_cat (0=8) if sum==31   // hp plus psarc plus ipf
recode hes_ild_cat (0=8) if sum==35   // psarc ctdild
recode hes_ild_cat (0=8) if sum==36  // psarc ctdild ipf

recode hes_ild_cat (0=8) if sum==40   // ctdild psarc hp
recode hes_ild_cat (0=8) if sum==41  // ctdild psarc hp ipf

recode hes_ild_cat (0=5) if sum==50  // drug radiation
recode hes_ild_cat (0=5) if sum==51   // drug radiation ipf
recode hes_ild_cat (0=8) if sum==55   // drug radiation hp
recode hes_ild_cat (0=8) if sum==56   // drug radiation ipf hp

recode hes_ild_cat (0=8) if sum==60  // drug and ctdild
recode hes_ild_cat (0=8) if sum==61  // drug ctd ipf

recode hes_ild_cat (0=8) if sum==75  // drug and psarc
recode hes_ild_cat (0=8) if sum==76  // // drug and psarc + ipf

recode hes_ild_cat (0=8) if sum==81  

recode hes_ild_cat (0=10) if sum==200 //vague
recode hes_ild_cat (0=1) if sum==201 //ipf and vague
recode hes_ild_cat (0=2) if sum==205 //vague and hp
recode hes_ild_cat (0=2) if sum==206 //vague and hp and ipf
recode hes_ild_cat (0=3) if sum==210 //vague and ctd ild
recode hes_ild_cat (0=3) if sum==211 //vague ctdild ipf
recode hes_ild_cat (0=8) if sum==216 //vague ctdild hp ipf
recode hes_ild_cat (0=8) if sum==215 //vague ctdild hp
recode hes_ild_cat (0=4) if sum==225 //vague psarc
recode hes_ild_cat (0=4) if sum==226 //vague psarc ipf
recode hes_ild_cat (0=8) if sum==231 //vague psarc ipf hp
recode hes_ild_cat (0=8) if sum==235 //vague psarc ctdild
recode hes_ild_cat (0=8) if sum==236 //vague psarc ctdild ipf
recode hes_ild_cat (0=8) if sum>=241 //dogs dinne




tab hes_ild_cat,m
/*

hes_ild_cat |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     65,119       34.13       34.13
          2 |     17,391        9.11       43.24
          3 |     38,842       20.36       63.60
          4 |     13,662        7.16       70.76
          5 |      2,722        1.43       72.18
          8 |      2,037        1.07       73.25
         10 |     51,040       26.75      100.00
------------+-----------------------------------
      Total |    190,813      100.00

	  
sensitivity analysis
hes_ild_cat |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |    101,800       37.35       37.35
          2 |     38,091       13.98       51.33
          3 |     29,732       10.91       62.24
          4 |      9,056        3.32       65.56
          5 |     75,447       27.68       93.24
          6 |     18,413        6.76      100.00
------------+-----------------------------------
      Total |    272,539      100.00

*/

* remake counters 
drop obs num_obs
 sort patid spell admidate
  by patid : gen obs =_n
  by patid : gen num_obs=_N
 ** patients all have a unique hes-ild category which is copiedto all rows (hessutbtuype deatils the categorisation of the indivisld spell/hosp
 
 *drop redundant vars
 keep patid obs num_obs hes_ild_cat spell admidate discharged hes_subtype
 * copy ealiest admidate to all row for that patient
 by patid: egen hes_earliest_mention=min(admidate)
 format hes_earliest_mention %td
 save DA3_hes_apc_only_subtyped_byfullspellhistory_NEWprev.dta, replace

  
 ** reduce to one line per patid
  * keep the first row /earliest - use to cal incidecne and prevalence
  preserve
  keep if obs==1  // keep first row for each patiend 
  *one row per patid
  codebook patid //
  tab hes_ild_cat,m
  keep patid hes_earliest_mention hes_ild_cat
compress
save DA3_hes_apc_only_subtyped_bypatientall_NEWprev.dta, replace
restore

codebook patid // sa 217,846 //b218,091 (232,090) people have admissions with an ild code somewhere

use DA3_hes_apc_only_subtyped_bypatientall_NEWprev.dta, clear


 ** END ; next prep for inc and prev
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 