 /**********************************************************************
 *   PRODUCT:   SAS
 *   VERSION:   9.4
 *   CREATOR:   External File Interface
 *   DATE:      07SEP20
 *   DESC:      Generated SAS Datastep Code
 *   TEMPLATE SOURCE:  (None Specified.)
 ***********************************************************************/
    data WORK.Pizza    ;
    %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
    infile 'E:\Users\nsm190002\Desktop\Assignments\Pizza.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
       informat SurveyNum best32. ;
       informat Arugula best32. ;
       informat PineNut best32. ;
       informat Squash best32. ;
       informat Shrimp $1. ;
       informat Eggplant $1. ;
       format SurveyNum best12. ;
       format Arugula best12. ;
       format PineNut best12. ;
       format Squash best12. ;
       format Shrimp $1. ;
       format Eggplant $1. ;
    input
                SurveyNum
                Arugula
                PineNut
                Squash
                Shrimp  $
                Eggplant  $
    ;
    if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
    run;
PROC CONTENTS DATA = Work.Pizza;
Run;
PROC IMPORT OUT= WORK.Pizza 
            DATAFILE= "E:\Users\nsm190002\Desktop\Assignments\Pizza.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
