
DATA WIHS_01;
SET WORK.X21076_2_WIHS;

IF 
   NC_VF_1_0S1 IN ('1.0.S.1') OR 
   NC_VF_1_0S2 IN ('1.0.S.2') OR
   NC_VF_1_0S3 IN ('1.0.S.3') OR 

/*   #NEED DOUBLE CHECK FOR NC_S_P2_1 IF CHAR*/
   999> NC_S_P2_1> 2 OR   
   NC_S_P3 IN  (
				
				"3.1",
				"3.1.0",
				"3.1.1",
				"3.2",
				"3.2.0",
				"3.2.1",
				"3.3",
				"3.3.0",
				"3.3.1",
				"3.4",
				"3.4.1",
				"3.4.2"
				) OR 
    NC_S_P4_1 IN  (
				"4.1",
				"4.1.1",
				"4.1.2"
				) OR
    NC_S_P5_1 > 5 OR 
	NC_S_P6_1 IN  (
				"6.1.0",
				"6.1.1"
				) OR                                        

	NC_S_P7_1 > 7 OR                                    
	NC_S_P8_1 > 8 OR                                    
	NC_S_P9_1 > 9 OR      
	NC_S_P10_1 > 10 OR 
    MC_L1_1 IN  (
				
				"1.1.1",
				"1.1.2",
				"1.1.3",
				"1.2.1",
				"1.2.2",
				"1.3.1",
				"1.3.3",
				"1.3.8"
				) OR 
    MC_F1_1 IN  (
				
				"1.1.1",
				"1.1.2",
				"1.1.4",
				"1.1.5",
				"1.2.1",
				"1.2.2",
				"1.2.3",
				"1.2.4",
				"1.2.5",
				"1.3.1",
				"1.3.4",
				"1.3.5",
				"1.3.6"
				) OR 
    MC_V1_1 IN  (
				
				"1.1.1",
				"1.1.2",
				"1.1.6",
				"1.1.7",
				"1.2.1",
				"1.2.2",
				"1.2.7",
				"1.3.1",
				"1.3.2",
				"1.3.8"
				) OR 
   2.5 > MC_C2_1 > 2 OR 
   MC_L4_1 IN  (
				
				"4.1.1",
				"4.1.2",
				"4.2",
				"4.3",
				"4.4"
				) OR 
   MC_F4_1 IN  (
				
				"4.1.1",
				"4.1.2",
				"4.2",
				"4.3",
				"4.4"
				) OR 
   MC_V4_1 IN  (
				
				"4.1.1",
				"4.1.2",
				"4.2",
				"4.3",
				"4.4"
				) OR 
   MC_L5_1 > 5 OR 
   MC_F5_1 > 5 OR 
   MCR_61_1 IN  (
				
				"6.1"
				) OR 
   MCR_62_1 IN  (
				
				"6.2.1",
				"6.2.2",
				"6.2.3"
				) OR 
   MCR_63_1 IN  (
				
				"6.3.1"
				) OR
   MCR_64_1 IN  (
				
				"6.4.1",
				"6.4.2"
				) OR	
   MCR_65_1 IN  (
				
				"6.5.1",
				"6.5.2"
				) OR	
   MCR_68_1 IN  (
				
				"6.8",
				"6.8.1"
				) OR	
   MC_C7_1 > 7 OR
   MCR_81_1 IN  (
				
				"8.1.1",
				"8.1.2",
				"8.1.3",
				"8.1.4"
				) OR	
   MCR_82_1 IN  (
				
				"8.2.1",
				"8.2.2",
				"8.2.3",
				"8.2.4"
				) OR	
   MCR_83_1 IN  (
				
				"8.3.1",
				"8.3.2",
				"8.3.3",
				"8.3.4"
				) OR
   MCR_84_1 IN  (
				
				"8.4.1",
				"8.4.2"
				) OR
   MCR_85_1 IN  (
				
				"8.5.1",
				"8.5.2"
				) OR
   MCR_86_1 IN  (
				
				"8.6.1",
				"8.6.2",
				"8.6.3",
				"8.6.4"
				) 
OR

/*CODEBOOK HAS 8.7 BUT DATA HAS 8.7.1*/
   MCR_87_1 IN  (
				
				"8.7.1"
				) OR
   MCR_88_1 IN  (
				
				"8.8.1"
				) OR
   MCR_89_1 IN  (
				
				"8.9.1"
				) OR
   Mc_c91_1 IN  (
				
				"9.1.1"
				) OR
   Mc_L92_1 IN  (
				
				"9.2.1"
				) OR
   Mc_F92_1 IN  (
				
				"9.2.1"
				) OR
   Mc_V92_1 IN  (
				
				"9.2.1"
				) OR
   Mc_C93_1 IN  (
				
				"9.3.1"
				) OR
   Mc_C94_1 IN  (
				
				"9.4.1",
				"9.4.2"
				) OR
   Mc_C95_1 IN  (
				
				"9.5"
				) 


THEN ECG_AB=1;

ELSE ECG_AB=0;
RUN;

PROC FREQ DATA=WIHS_01;
TABLES ECG_AB;
RUN;



DATA WIHS_02;
SET WIHS_01;

IF MAX(
/*NC_VF_0_5_1,*/
/**/
/*NC_VF_0_6_1,*/
/**/
/*NC_VF_1_0_1,*/
/**/
/*NC_VF_1_1_1,*/
/*NC_VF_1_2_1,*/
/*NC_VF_1_3_1,*/
/*NC_VF_1_4_1,*/
/*NC_VF_1_5_1,*/
/*NC_VF_1_6_1,*/
/*NC_VF_1_7_1,*/
/*NC_VF_1_8_1,*/
/*NC_VF_1_9_1,*/
/*NC_VF_1_0S1_1,*/
/*NC_VF_1_0S1cnt_1,*/
/*NC_VF_1_0S2_1,*/
/*NC_VF_1_0S2cnt_1,*/
/*NC_VF_1_0S3_1,*/
/*NC_S_P2_1,*/
/*NC_S_P3_1,*/
/**/
/*NC_S_P4_1,*/
/*NC_S_P5_1,*/
/*NC_S_P6_1,*/
/*NC_S_P7_1,*/
/**/
/*NC_S_P8_1,*/
/*NC_S_P9_1,*/
/*NC_S_P10_1,*/
/*MC_L1_1,*/
/*MC_F1_1,*/
/*MC_V1_1,*/
MC_C2_1,
MC_C3_1,
/*MC_L4_1,*/
/*MC_F4_1,*/
/*MC_V4_1,*/
/**/
/*MC_L5_1,*/
/*MC_F5_1,*/
/*MC_V5_1,*/
/*MCR_61_1,*/
/*MCR_62_1,*/
/*MCR_63_1,*/
/*MCR_64_1,*/
/*MCR_65_1,*/
/*MCR_68_1,*/
/*MC_C7_1,*/
/*MCR_81_1,*/
/**/
/*MCR_82_1,*/
/*MCR_83_1,*/
/*MCR_84_1,*/
/*MCR_85_1,*/
/*MCR_86_1,*/
/*MCR_87_1,*/
/*MCR_88_1,*/
/*MCR_89_1,*/
/*MC_C91_1,*/
/*MC_L92_1,*/
/*MC_F92_1,*/
/*MC_V92_1,*/
/*MC_C93_1,*/
/*MC_C94_1,*/
/**/
/*MC_C95_1,*/
MAJOR1_1,
MAJOR2_1,
MAJOR3_1,
MAJOR4_1,
MAJOR5_1,
MAJOR6_1,
MAJOR7A_1,
MAJOR7B_1,
MAJOR7C_1,
MAJOR7D_1,
MAJOR8_1,
MAJOR9_1,
MAJOR10A_1,
MAJOR10B_1,
MAJOR10C_1,
MINOR1_1,
MINOR2_1,
MINOR3_1,
MINOR4L_1,
MINOR4F_1,
MINOR4V_1,
MINOR5L_1,
MINOR5R_1,
MINOR6_1,
MINOR7_1,
MINOR8_1,
MINOR9_1,
MINOR10_1,
MINOR11A_1,
MINOR11B_1,
MINOR11C_1,
MINOR11D_1,
MINOR11E_1,
MINOR11F_1,
MINOR11G_1
) > 0 THEN ECG_AB=1;
;
RUN;


PROC FREQ DATA=WIHS_02;
TABLES ECG_AB;
RUN;


