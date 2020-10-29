ODS HTML;
ODS LISTING CLOSE;
ODS GRAPHICS ON;
libname logit 'HW4';

/* Adding Variables */
data parta;
set logit.heinzhunts;
LogPriceRatio = log(PriceHeinz/PriceHunts);
DisFeatHeinz = DisplHeinz*FeatHeinz;
DisFeatHunts = DisplHunts*FeatHunts;
run;

/* Separating Dataset */
proc surveyselect data=parta out=shop_sample outall samprate=0.8 seed=10;
run;
data shop_train shop_test;
 set shop_sample;
 if selected then output shop_train; 
 else output shop_test;
run;

/* Logistic Regression */
proc logistic data=shop_sample;
logit: model Heinz (event='1') = LogPriceRatio DisplHeinz FeatHeinz DisplHunts FeatHunts DisFeatHeinz DisFeatHunts / clodds= wald orpvalue;
weight selected;
title 'Logistic';
run;

/*Creating the ROC table*/
proc logistic data=shop_train outmodel=finalmodel;
 logit: model Heinz (event='1') = LogPriceRatio DisplHeinz FeatHeinz DisplHunts FeatHunts DisFeatHeinz DisFeatHunts;
 title 'ROC Table';
run;

proc logistic inmodel=finalmodel;
 score data=shop_test outroc=shop_logit_roc;
 title 'Score Data';
run;

/*Calculating Total Cost*/
data logit_roc_cost;
set shop_logit_roc;
False_positive_cost=0.25*_FALPOS_; 
False_negative_cost=1*_FALNEG_;
Total_cost=False_positive_cost+False_negative_cost;
run;






 


