/*Data Import*/

libname HW4 'E:\Users\nsm190002\Desktop\Assignments\Assignment4';

PROC IMPORT OUT= HW4.HW4 
            DATAFILE= "E:\Users\nsm190002\Desktop\Assignments\Assignment4\HW4export.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
/*1. Create a variable LogPriceRatio = log (PriceHeinz/PriceHunts). */
/*Also create interaction terms between display and feature for both brands (e.g., DisplHeinz * FeatureHeinz for Heinz, and the same for Hunts).*/

data work.question1;
set HW4.HW4;

logPriceRatio  = log(PRICEHEINZ/PRICEHUNTS);
disp_featHeinz = DISPLHEINZ * FEATHEINZ;
disp_featHunts = DISPLHUNTS * FEATHUNTS;

run;

/*2. Randomly select 80% of the data set as the training sample, remaining 20% as test sample. Use the seed= option to set random seed to a value of 10.*/
proc surveyselect data=Question1 out=ketchup_sampled outall samprate=0.8 seed=10;
run;
* Split data into training vs. test set;
data ketchup_training ketchup_test;
 set ketchup_sampled;
 if selected=1 then output ketchup_training; 
 else output ketchup_test;
run;

/*3. Estimate a logit probability model for the probability that Heinz is */
/*   purchased ? using LogPriceRatio, DisplHeinz, FeatureHeinz, DisplHunts, FeatureHunts, and interaction terms (from part 1) as the explanatory variables.*/

proc logistic data=ketchup_sampled;
logit: model HEINZ(event='1') = logPriceRatio DisplHeinz FeatHeinz DisplHunts FeatHunts disp_featHeinz disp_featHunts / clodds = wald orpvalue;
weight selected;
title'Question 3';
run;

/*Q6*/
/*Step 1 - Plot ROC Curve(Optional)*/

proc logistic data=ketchup_training;
logit: model HEINZ(event='1') = logPriceRatio DisplHeinz FeatHeinz DisplHunts FeatHunts disp_featHeinz disp_featHunts / clodds = wald orpvalue;
score data=ketchup_test out=ketchup_logit_predit;
title'Question 6 - Part 1';
run;

proc logistic data = ketchup_logit_predit plots=roc(id=prob);
logit: model HEINZ(event='1') = logPriceRatio DisplHeinz FeatHeinz DisplHunts FeatHunts disp_featHeinz disp_featHunts;
roc pred=p_1;
title 'ROC-Logit-Model';
run;

/*create ROC Table*/
proc logistic data=ketchup_training outmodel=logitmodel;
logit: model HEINZ(event='1') = logPriceRatio DisplHeinz FeatHeinz DisplHunts FeatHunts disp_featHeinz disp_featHunts;
weight selected;
title'Question 6 - Step 1';
run;

proc logistic inmodel=logitmodel;
score data = ketchup_test outroc=ketchup_logit_roc;
title 'Q6 - step 2';
run;
proc contents data = ketchup_logit_roc;
run;









