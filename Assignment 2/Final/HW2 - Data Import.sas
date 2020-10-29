PROC EXPORT DATA= TMP2.study_gpa 
            OUTFILE= "E:\Users\nsm190002\Desktop\GPA.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;
