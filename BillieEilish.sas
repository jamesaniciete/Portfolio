/* Read data into a variable named billie */
PROC IMPORT DATAFILE= '/home/aniciete70/Data/BillieConCorona.csv' DBMS=CSV OUT=billie REPLACE;
RUN; 

/* Print dataset */
PROC PRINT DATA = billie;
RUN;

/* Get summary statistics for all variables */
PROC UNIVARIATE DATA = billie;
	VAR resale_price type_rank days_until day_rank2 interested radio_plays face corona;
RUN;

/*** Regression Model 1 - code includes the correlation coefficients and the linearity check ***/
PROC REG DATA = billie;
	/* model y = x1 x2 ... xN / options */
	model resale_price = type_rank days_until day_rank2 interested radio_plays face corona / corrb;
	title 'Model 1';
	output out = out1 r = resid1;
RUN; 
	/* R^2 = 0.3782 & Adjsuted R^2 = 0.3749 */

/*** Model 2 - w/o Days_Until ***/
PROC REG DATA = billie;
	model resale_price = type_rank day_rank2 interested radio_plays face corona / corrb;
	title 'Model 2 - W/o Days Until';
	output out = out2 r = resid2;
RUN; 
	/* R^2 = 0.3782 & Adjsuted R^2 = 0.3753 */

/*** Model 3 - Box-Cox Transformation (Transforming Y) ***/
ods graphics on;
/* Box-Cox Transformation w/o days until */
PROC TRANSREG DATA = billie DETAIL;
	model boxcox (resale_price / convenient lambda = -3 to 3 by .125) = identity(type_rank day_rank2 interested radio_plays face corona);
	OUTPUT out = out3a;
RUN;
	/* lambda used = .125 */
/* Box-Cox Transformation w/ days until */
PROC TRANSREG DATA = billie DETAIL;
	model boxcox (resale_price / convenient lambda = -3 to 3 by .125) = identity(type_rank day_rank2 interested radio_plays face corona);
	OUTPUT out = out3b;
RUN;
	/* lambda used = .125 */
/* Model 3.1 - Box-Cox Transformation using convenient lambda = 0 */
DATA billie;
SET billie;
newcolumnname = transformed_resale_price;
transformed_resale_price = log(resale_price);
RUN;

PROC REG DATA = billie;
	model transformed_resale_price = type_rank day_rank2 interested radio_plays face corona / corrb;
	title 'Model 3.1a - Boxcox Transformation using convenient lambda = 0';
	output out = out31a r = resid31a;
RUN; 
	/* R^2 = 0.4552 & Adjsuted R^2 = 0.4527 */

PROC REG DATA = billie;
	model transformed_resale_price = type_rank days_until day_rank2 interested radio_plays face corona / corrb;
	title 'Model 3.1b - Boxcox Transformation including Days_Until & using convenient lambda = 0';
	output out = out31b r = resid31b;
RUN; 
	/* R^2 = 0.4611 & Adjsuted R^2 = 0.4582 --- note: same as R*/
	
/* Model 3.2 - Box-Cox Transformation using lambda = .125 */
data billie;
set billie;
newcolumnname = transformed_resale_price2;
transformed_resale_price2 = (resale_price**.125-1)/.125;
RUN;

PROC REG DATA = billie;
	model transformed_resale_price2 = type_rank day_rank2 interested radio_plays face corona / corrb;
	title 'Model 3.2a - Boxcox Transformation using lambda = .125';
	output out = out32a r = resid32a;
RUN; 
	/* R^2 = 0.4504 & Adjsuted R^2 = 0.4479 */
	
PROC REG DATA = billie;
	model transformed_resale_price2 = type_rank days_until day_rank2 interested radio_plays face corona / corrb;
	title 'Model 3.2b - Boxcox Transformation including Days_Until & using lambda = .125';
	output out = out32b r = resid32b;
RUN; 
	/* R^2 = 0.4553 & Adjsuted R^2 = 0.4523 */
	
/* Model 4 - Take Model 3.1b & do a square root transformation on Y to fix right-skewed curve */
data billie;
set billie;
newcolumnname = transformed_resale_price3;
transformed_resale_price3 = transformed_resale_price**.5;
RUN;

PROC REG DATA = billie;
	model transformed_resale_price3 = type_rank days_until day_rank2 interested radio_plays face corona / corrb;
	title 'Model 4';
	output out = out4 r = resid4;
RUN; 
	/* Before: R^2 = 0.4611 & Adjsuted R^2 = 0.4582 */
	/* After: R^2 = 0.4641 & Adjusted R^2 = 0.4612 */
	
/* ******************************************************************************************************************************* */
/* SAMPLE FORWARD STEP-WISE SELECTION MODEL

proc reg data=cdi outest=fits;
	model lphys = tot_pop tot_income land_area pop_elderly beds crimes hsgrad unemploy / selection=stepwise slentry=0.25 slstay=0.1;
run; 

*/
/* ******************************************************************************************************************************* */

/* forward models */
proc reg data = billie;
	model resale_price = type_rank days_until day_rank2 interested radio_plays face corona / selection = forward slentry=.25;
run;
	/* days_until not included */
proc reg data = billie;
	model transformed_resale_price3 = type_rank days_until day_rank2 interested radio_plays face corona / selection = forward slentry=.25;
run;
	/* radio_plays not included */

/* step-wise selection models */
proc reg data = billie;
	model resale_price = type_rank days_until day_rank2 interested radio_plays face corona / selection = stepwise slentry=.25 slstay=.1;
run;
	/* days_until not included */
proc reg data = billie;
	model transformed_resale_price3 = type_rank days_until day_rank2 interested radio_plays face corona / selection = stepwise slentry=.25 slstay=.1;
run;
	/* radio_plays not included */
	/* R^2 = .4641 & Adjusted R^2 = .4616 */
		/* Adjusted R^2 increased by .0004 */
		
/* backwards selection models */

proc reg data = billie;
	model resale_price = type_rank days_until day_rank2 interested radio_plays face corona / selection = backward slstay=.10;
run;
	/* days_until not included */
proc reg data = billie;
	model transformed_resale_price3 = type_rank days_until day_rank2 interested radio_plays face corona / selection = backward slstay=.10;
run;
	/* radio_plays not included */






















