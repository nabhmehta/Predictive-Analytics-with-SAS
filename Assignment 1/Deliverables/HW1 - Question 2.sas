/*Question 2 - Part b*/
PROC CONTENTS DATA = Work.Pizza;
Run;

/*Part d*/

    data WORK.Pizza    ;
    %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
    infile 'E:\Users\nsm190002\Desktop\Assignments\Pizza.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
       informat SurveyNum best32. ;
       informat Arugula best32. ;
       informat PineNut best32. ;
       informat Squash best32. ;
       informat Shrimp best32.;
       informat Eggplant best32.;
       format SurveyNum best12. ;
       format Arugula best12. ;
       format PineNut best12. ;
       format Squash best12. ;
       format Shrimp best32.;
       format Eggplant best32.;
    input
                SurveyNum
                Arugula
                PineNut
                Squash
                Shrimp
                Eggplant
    ;
    if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
    run;
PROC PRINT DATA = Work.Pizza;
Run;

/*Part e*/

    data WORK.Pizza    ;
    %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
    infile 'E:\Users\nsm190002\Desktop\Assignments\Pizza.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
       informat SurveyNum best32. ;
       informat Arugula best32. ;
       informat PineNut best32. ;
       informat Squash best32. ;
       informat Shrimp best32.;
       informat Eggplant best32.;
       format SurveyNum best12. ;
       format Arugula best12. ;
       format PineNut best12. ;
       format Squash best12. ;
       format Shrimp best32.;
       format Eggplant best32.;
    input
                SurveyNum
                Arugula
                PineNut
                Squash
                Shrimp
                Eggplant
    ;
    if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
    run;
PROC MEANS DATA = Work.Pizza;
TITLE 'Average';
VAR Arugula PineNut Squash Shrimp Eggplant;
Run;
