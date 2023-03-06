/**/
/*FROM ADAM LIEBERMAN*/
/**/
/*I HAVE SHARED THE IMPORT CODE FILES ("X21076_2_MACS.INP" "X21076_2_WIHS.INP") IN THE SHARED FOLDER. WE USE THIS FILE TO 
IMPORT THE DATA TO ENSURE THAT ALL VARIABLES ARE IN THE CORRECT FORMAT. MOST OF US HERE AT THE*/
/*DACC TYPICALLY USE SAS AS WELL. I'VE ATTACHED SAS CODE BELOW WHICH YOU CAN USE TO INCLUDE THE IMPORT FILE*/
/*WHEN READING THE DATA SETS IN. */
/**/
/*DATA DATASET_NAME;*/
/*      INFILE "DATASET_FILEPATH" LRECL = 8000 MISSOVER;*/
/*      %INCLUDE "INPUTFILE_FILEPATH";*/
/*RUN;*/
/**/
/*WE DON'T HAVE LABELS FOR THE VARIABLES AND TYPICALLY DON'T CREATE LABEL FILES FOR DATA REQUESTS. I APOLOGIZE */
/*FOR THIS INCONVENIENCE. PLEASE LET ME KNOW IF YOU HAVE ANY FURTHER QUESTIONS.*/


/*CHECK DATA FIRST*/
PROC FREQ DATA= X21076_2_MACS;
TABLES 
MC_MI
AFIB
AFLUTTER
/*CV*/
LVH_MINN
LVH_SOK
LVH_NC
LVH_CV                                        
NC_VF_0_5 
NC_VF_0_6 
 NC_VF_1_2      
                
 NC_VF_1_3      
               
 NC_VF_1_4      
 NC_VF_1_5      
           
 NC_VF_1_6      
 NC_VF_1_7      
 NC_VF_1_8      
 NC_VF_1_9      
 NC_VF_1_0S1    
 NC_VF_1_0S1CNT 
 NC_VF_1_0S2    
 NC_VF_1_0S2CNT 
 NC_VF_1_0S3    
NC_S_P3                                       
NC_S_P4                                       
NC_S_P5                                       
NC_S_P6                                       
NC_S_P7                                       
NC_S_P9  
         
NC_S_P10 
MC_L1    
MC_F1                                         
MC_V1                                         
MC_C2                                         
MC_L4                                         
MC_F4                                         
MC_V4                                         
MC_L5                                         
MC_F5                                         
MC_V5   
 
        
MCR_61  
       
MCR_62  
MCR_63  
MCR_64  
MC_C7                                         
MCR_82                                        
MCR_83  
MCR_84  
MCR_85  
MCR_86  
MCR_87  
MCR_88  
MCR_89 
MC_C91 
MC_L92 
MC_F92 
MC_V92 
MC_C93 
MC_C94 
MC_C95 
MAJOR1 
MAJOR2 
MAJOR3 
MAJOR4 
MAJOR5 
MAJOR6 
MAJOR7A
MAJOR7B
 MAJOR7C  
          
 MAJOR7D  
 MAJOR8   
 MAJOR9   
 MAJOR10A 
 MAJOR10B 
 MAJOR10C 
 MINOR1   
 MINOR2   
 MINOR3   
 MINOR4L  
 MINOR4F  
 MINOR4V  
 MINOR5L  
 MINOR5R  
 MINOR6   
 MINOR7   
 MINOR8   
 MINOR9   
 MINOR10  
 MINOR11A 
 MINOR11B 
 MINOR11C 
 MINOR11D 
 MINOR11E 
 MINOR11F 
 MINOR11G 

;
RUN;



/*CHECK DATA FIRST*/
PROC FREQ DATA= X21076_2_WIHS;
TABLES 

NC_VF_0_5_1 
            
NC_VF_0_6_1 

NC_VF_1_0_1               
                          
NC_VF_1_1_1               
NC_VF_1_2_1               
NC_VF_1_3_1               
NC_VF_1_4_1               
NC_VF_1_5_1               
NC_VF_1_6_1               
NC_VF_1_7_1               
NC_VF_1_8_1               
NC_VF_1_9_1               
NC_VF_1_0S1_1             
NC_VF_1_0S1cnt_1          
NC_VF_1_0S2_1             
NC_VF_1_0S2cnt_1          
NC_VF_1_0S3_1             
NC_S_P2_1     
NC_S_P3_1           
                    
NC_S_P4_1           
NC_S_P5_1           
NC_S_P6_1           
NC_S_P7_1  
           
NC_S_P8_1  
NC_S_P9_1  
NC_S_P10_1 
MC_L1_1    
MC_F1_1    
MC_V1_1 
MC_C2_1     
MC_C3_1    
MC_L4_1    
MC_F4_1    
MC_V4_1   
          
MC_L5_1   
MC_F5_1   
MC_V5_1   
MCR_61_1  
MCR_62_1  
MCR_63_1  
MCR_64_1  
MCR_65_1  
MCR_68_1   
MC_C7_1    
MCR_81_1 
         
MCR_82_1 
MCR_83_1 
MCR_84_1 
MCR_85_1 
MCR_86_1 
MCR_87_1 
MCR_88_1 
MCR_89_1 
MC_C91_1 
MC_L92_1 
MC_F92_1 
MC_V92_1 
MC_C93_1 
MC_C94_1         
                 
MC_C95_1         
MAJOR1_1         
MAJOR2_1         
MAJOR3_1         
MAJOR4_1         
MAJOR5_1         
MAJOR6_1         
MAJOR7A_1        
MAJOR7B_1        
MAJOR7C_1        
MAJOR7D_1        
MAJOR8_1         
MAJOR9_1         
MAJOR10A_1       
MAJOR10B_1       
MAJOR10C_1       
MINOR1_1         
MINOR2_1         
MINOR3_1         
MINOR4L_1        
MINOR4F_1        
MINOR4V_1        
MINOR5L_1        
MINOR5R_1        
MINOR6_1         
MINOR7_1            
MINOR8_1            
MINOR9_1            
MINOR10_1           
MINOR11A_1          
MINOR11B_1          
MINOR11C_1          
MINOR11D_1          
MINOR11E_1          
MINOR11F_1          
MINOR11G_1          



;
RUN;

