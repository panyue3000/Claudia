
DATA MACS_01;
SET WORK.X21076_2_MACS;

IF 
   NC_VF_1_0S1 IN ('1.0.S.1') OR 
   NC_VF_1_0S2 IN ('1.0.S.2') OR
   NC_VF_1_0S3 IN ('1.0.S.3') OR 
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
    NC_S_P4 IN  (
				"4.1",
				"4.1.1",
				"4.1.2"
				) OR
    NC_S_P5 > 5 OR 
	NC_S_P6 IN  (
				"6.1",
				"6.1.0",
				"6.1.1"
				) OR                                        

	NC_S_P7 > 7 OR                                    
	NC_S_P8 > 8 OR      
	NC_S_P9 > 9 OR      
	NC_S_P10 > 10 OR 
    MC_L1 IN  (
				
				"1.1.1",
				"1.1.2",
				"1.1.3",
				"1.2.1",
				"1.2.2",
				"1.3.1",
				"1.3.3",
				"1.3.8"
				) OR 
    MC_F1 IN  (
				
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
    MC_V1 IN  (
				
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
   2.5 > MC_C2 > 2 OR 
   MC_L4 IN  (
				
				"4.1.1",
				"4.1.2",
				"4.2",
				"4.3",
				"4.4"
				) OR 
   MC_F4 IN  (
				
				"4.1.1",
				"4.1.2",
				"4.2",
				"4.3",
				"4.4"
				) OR 
   MC_V4 IN  (
				
				"4.1.1",
				"4.1.2",
				"4.2",
				"4.3",
				"4.4"
				) OR 
   MC_L5 > 5 OR 
   MC_F5 > 5 OR 
   MCR_61 IN  (
				
				"6.1"
				) OR 
   MCR_62 IN  (
				
				"6.2.1",
				"6.2.2",
				"6.2.3"
				) OR 
   MCR_63 IN  (
				
				"6.3.1"
				) OR
   MCR_64 IN  (
				
				"6.4.1",
				"6.4.2"
				) OR	
   MCR_65 IN  (
				
				"6.5.1",
				"6.5.2"
				) OR	
   MCR_68 IN  (
				
				"6.8",
				"6.8.1"
				) OR	
   MC_C7 > 7 OR
   MCR_82 IN  (
				
				"8.2.1",
				"8.2.2",
				"8.2.3",
				"8.2.4"
				) OR	
   MCR_83 IN  (
				
				"8.3.1",
				"8.3.2",
				"8.3.3",
				"8.3.4"
				) OR
   MCR_84 IN  (
				
				"8.4.1",
				"8.4.2"
				) OR
   MCR_85 IN  (
				
				"8.5.1",
				"8.5.2"
				) OR
   MCR_86 IN  (
				
				"8.6.1",
				"8.6.2",
				"8.6.3",
				"8.6.4"
				) OR
   MCR_87 IN  (
				
				"8.7"
				) OR
   MCR_88 IN  (
				
				"8.8"
				) OR
   MCR_89 IN  (
				
				"8.9"
				) OR  
/***************************************************  #TYPO?  CODEBOOK IS 9.1 VS DATA HAS 9.1.1*/
  Mc_c91 IN  (
				
				"9.1.1"
				) OR
   Mc_L92 IN  (
				
				"9.2.1"
				) OR
   Mc_F92 IN  (
				
				"9.2.1"
				) OR
   Mc_V92 IN  (
				
				"9.2.1"
				) OR
   Mc_C93 IN  (
				
				"9.3.1"
				) OR
   Mc_C94 IN  (
				
				"9.4.1",
				"9.4.2"
				) OR
   Mc_C95 IN  (
				
				"9.5.1"
				) 

/***************************************************  #TYPO?  CODEBOOK IS 9.1 VS DATA HAS 9.1.1*/




THEN ECG_AB=1;

ELSE ECG_AB=0;
RUN;

PROC FREQ DATA=MACS_01;
TABLES ECG_AB;
RUN;



DATA MACS_02;
SET MACS_01;

IF MAX(MC_MI,
AFIB,
AFLUTTER,
/*CV*/
LVH_MINN,
LVH_SOK,
LVH_NC,
LVH_CV,    
 
NC_VF_0_5, 
NC_VF_0_6, 
/* NC_VF_1_2      */
/*                */
/* NC_VF_1_3      */
/*               */
/* NC_VF_1_4      */
/* NC_VF_1_5      */
/*           */
/* NC_VF_1_6      */
/* NC_VF_1_7      */
/* NC_VF_1_8      */
/* NC_VF_1_9      */
/* NC_VF_1_0S1    */

 NC_VF_1_0S1CNT, 
/* NC_VF_1_0S2    */
 NC_VF_1_0S2CNT,
/* NC_VF_1_0S3    */
/*NC_S_P3                                       */
/*NC_S_P4                                       */
/*NC_S_P5                                       */
/*NC_S_P6                                       */
/*NC_S_P7                                       */
/*NC_S_P9  */
/*         */
/*NC_S_P10 */
/*MC_L1    */
/*MC_F1                                         */
/*MC_V1                                         */
/*MC_C2                                         */
/*MC_L4                                         */
/*MC_F4                                         */
/*MC_V4                                         */
/*MC_L5                                         */
/*MC_F5                                         */
/*MC_V5   */
/* */
/*        */
/*MCR_61  */
/*       */
/*MCR_62  */
/*MCR_63  */
/*MCR_64  */
/*MC_C7                                         */
/*MCR_82                                        */
/*MCR_83  */
/*MCR_84  */
/*MCR_85  */
/*MCR_86  */
/*MCR_87  */
/*MCR_88  */
/*MCR_89 */
/*MC_C91 */
/*MC_L92 */
/*MC_F92 */
/*MC_V92 */
/*MC_C93 */
/*MC_C94 */
/*MC_C95 */
MAJOR1 	,
MAJOR2 	,
MAJOR3 	,
MAJOR4 	,
MAJOR5 	,
MAJOR6 	,
MAJOR7A	,
MAJOR7B	,
 MAJOR7C  	,
 MAJOR7D  	,
 MAJOR8   	,
 MAJOR9   	,
 MAJOR10A 	,
 MAJOR10B 	,
 MAJOR10C 	,
 MINOR1   	,
 MINOR2   	,
 MINOR3   	,
 MINOR4L  	,
 MINOR4F  	,
 MINOR4V  	,
 MINOR5L  	,
 MINOR5R  	,
 MINOR6   	,
 MINOR7   	,
 MINOR8   	,
 MINOR9   	,
 MINOR10  	,
 MINOR11A 	,
 MINOR11B 	,
 MINOR11C 	,
 MINOR11D 	,
 MINOR11E 	,
 MINOR11F 	,
 MINOR11G) > 0 THEN ECG_AB=1;
;
RUN;


PROC FREQ DATA=MACS_02;
TABLES ECG_AB;
RUN;
