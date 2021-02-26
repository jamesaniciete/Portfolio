/* Project 2 */
PROC IMPORT DATAFILE="/folders/myfolders/wpba2009_v2.xlsx"
		    OUT=data
		    DBMS=XLSX
		    REPLACE;
RUN;

/* GLM only used for model assumption checks since it gives the wrong F values */
PROC GLM DATA = data;
	CLASS Oil_Pattern Bowler;
	MODEL Score = Oil_Pattern Bowler Oil_Pattern*Bowler;
	RANDOM Bowler Oil_Pattern*Bowler;
	TEST H = Oil_Pattern E = Oil_Pattern*Bowler;
	OUTPUT OUT = data1 R = residual P = yhat;
RUN;

/* Equal Variance Check: */
PROC SGPLOT DATA = data1;
	SCATTER X = yhat Y = residual;
	RUN;

/* Normality Check: */
PROC UNIVARIATE DATA = data1 NORMAL PLOT;
	VAR residual;
	RUN;
/* ANOVA Table & analysis on interaction effects and main effects (if applicable) */
PROC MIXED DATA = data method = type3;
	CLASS Oil_Pattern Bowler;
	MODEL Score = Oil_Pattern / CL;
	RANDOM Bowler Oil_Pattern*Bowler;
RUN;

