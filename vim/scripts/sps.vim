" Vim syntax file
" Language:	SPSS
" Maintainer:	Brian Carper
" Last Change:	2005 June 30

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax keyword spsKeyword add aggregate alscal anova autorecode begin bmdp break by cas case clear
syntax keyword spsKeyword cluster compress compressed compute corr correlations count crosstabs
syntax keyword spsKeyword edit eject else end examine execute export factor file files finish flip
syntax keyword spsKeyword formats freq frequencies get graph handle help hiloglinear if import
syntax keyword spsKeyword info input into keep keyed label labels leave list logistic loglinear
syntax keyword spsKeyword loop manova map match matrix mconvert means missing mult nlr nonpar npar
syntax keyword spsKeyword numeric oneway osiris output partical plot point print probit procedure
syntax keyword spsKeyword program proximities quick rank recode record regression reliability
syntax keyword spsKeyword rename repeat repeating report reread response restore sample sas save
syntax keyword spsKeyword scss select set show sort space split string subtitle survival t-test
syntax keyword spsKeyword temporary tests title to transformations translate type update value
syntax keyword spsKeyword values var variable variables vars vector weight width write xsave
syntax keyword spsKeyword data define descriptives discriminant display do document documents drop
syntax keyword spsKeyword ADD AGGREGATE ALSCAL ANOVA AUTORECODE BEGIN BMDP BREAK BY CAS CASE CLEAR
syntax keyword spsKeyword CLUSTER COMPRESS COMPRESSED COMPUTE CORR CORRELATIONS COUNT CROSSTABS
syntax keyword spsKeyword EDIT EJECT ELSE END EXAMINE EXECUTE EXPORT FACTOR FILE FILES FINISH FLIP
syntax keyword spsKeyword FORMATS FREQ FREQUENCIES GET GRAPH HANDLE HELP HILOGLINEAR IF IMPORT
syntax keyword spsKeyword INFO INPUT INTO KEEP KEYED LABEL LABELS LEAVE LIST LOGISTIC LOGLINEAR
syntax keyword spsKeyword LOOP MANOVA MAP MATCH MATRIX MCONVERT MEANS MISSING MULT NLR NONPAR NPAR
syntax keyword spsKeyword NUMERIC ONEWAY OSIRIS OUTPUT PARTICAL PLOT POINT PRINT PROBIT PROCEDURE
syntax keyword spsKeyword PROGRAM PROXIMITIES QUICK RANK RECODE RECORD REGRESSION RELIABILITY
syntax keyword spsKeyword RENAME REPEAT REPEATING REPORT REREAD RESPONSE RESTORE SAMPLE SAS SAVE
syntax keyword spsKeyword SCSS SELECT SET SHOW SORT SPACE SPLIT STRING SUBTITLE SURVIVAL T-TEST
syntax keyword spsKeyword TEMPORARY TESTS TITLE TO TRANSFORMATIONS TRANSLATE TYPE UPDATE VALUE
syntax keyword spsKeyword VALUES VAR VARIABLE VARIABLES VARS VECTOR WEIGHT WIDTH WRITE XSAVE
syntax keyword spsKeyword DATA DEFINE DESCRIPTIVES DISCRIMINANT DISPLAY DO DOCUMENT DOCUMENTS DROP

syntax keyword spsSubcommands $casenum adevice adjpred aempirical afreq after against
syntax keyword spsSubcommands aic ainds align all alpha alphanumeric analysis andrew
syntax keyword spsSubcommands append approximate ar area aresid ascal association
syntax keyword spsSubcommands asymmetric automatic avalue averf avonly backward
syntax keyword spsSubcommands badcorr balanced bar barchart bart bartlett baverage
syntax keyword spsSubcommands bcon bcov beuclid bias binary binfer binomial blank
syntax keyword spsSubcommands block blom blwmn bonfer bootstrap both boundary bounds
syntax keyword spsSubcommands box boxm boxplot boxplots break brief brkspace bseuclid
syntax keyword spsSubcommands bshape bstep btau by calculate canada case casefile
syntax keyword spsSubcommands cases categorical cc cells center centroid cha chalign
syntax keyword spsSubcommands chdspace chebychev chisq cholesky choropleth ci cin
syntax keyword spsSubcommands cinterval ckder class classify classplot cluster
syntax keyword spsSubcommands cnlr cochran code coeff colconf collin collinearity
syntax keyword spsSubcommands colspace column columnwise combined comm comma compare
syntax keyword spsSubcommands complete compositional compressed condense condition
syntax keyword spsSubcommands conditional config constrain content continued contour
syntax keyword spsSubcommands contrast converge cook cor corr correlation cosine
syntax keyword spsSubcommands count cov covariates covratio criteria crossbreak
syntax keyword spsSubcommands crshtol ctau cutoff cutpoint cweight d data db2 db3
syntax keyword spsSubcommands db4 dbf decomp default delta dendrogram density
syntax keyword spsSubcommands dependent derivatives descending descriptives design
syntax keyword spsSubcommands det deviation dfbeta dfe dffit dfreq diagonal dice
syntax keyword spsSubcommands dictionary difference digits dimenr dimens direct
syntax keyword spsSubcommands directions disper distance document documents dollar
syntax keyword spsSubcommands double draw dresid drop duncan duplicate durbin dvalue
syntax keyword spsSubcommands econverge effects efsize eigen empirical end enter
syntax keyword spsSubcommands eps equal equamax error errors estim estimation eta
syntax keyword spsSubcommands euclid europe every exact exclude execute expected
syntax keyword spsSubcommands experimental external extraction extreme fac facilities
syntax keyword spsSubcommands factors fieldnames file fin first fits fixed footnote
syntax keyword spsSubcommands format forward fout fpair fprecision fraction free
syntax keyword spsSubcommands freq frequencies friedman from fscore fstep ftolerance
syntax keyword spsSubcommands ftspace full functions gamma gcmdfile gcov gdata
syntax keyword spsSubcommands gdevice gemscal gg gls gmemory gout gresid group
syntax keyword spsSubcommands grouped guttman hamann hampel harmonic haverage
syntax keyword spsSubcommands hazard hbar header helmert hf hicicle hierarchical
syntax keyword spsSubcommands high highest histogram history homogeneity horizontal
syntax keyword spsSubcommands hotelling hsize huber hypoth icin id image in include
syntax keyword spsSubcommands increment index indicator individual indscal initial
syntax keyword spsSubcommands input intermed interval into inv istep iter iterate
syntax keyword spsSubcommands jaccard joint k-s k-w k1 k2 kaiser kappa keep kendall
syntax keyword spsSubcommands key kmo kurtosis labels lambda large last lastres lcon
syntax keyword spsSubcommands left level lever lftolerance limit line linearity
syntax keyword spsSubcommands list listwise local logit logsurv loss low lower
syntax keyword spsSubcommands lowest lr lrecl lsd m-w macros mahal manual map
syntax keyword spsSubcommands margins masterfile mat matrix max maximum maxminf
syntax keyword spsSubcommands maxorder maxorders maxsteps mca mcin mcnemar mdgroup
syntax keyword spsSubcommands mean means meansub meansubstitution median menu
syntax keyword spsSubcommands mestimator method min mineigen minimum minkowski
syntax keyword spsSubcommands minorientation minresid missing mixed ml mode model
syntax keyword spsSubcommands modeltype modlsd moses mrgroup mse multiple multipunch
syntax keyword spsSubcommands multiv multivariate muplus mwithin n_matrix n_scalar
syntax keyword spsSubcommands n_vector name names natres negative negsum nested
syntax keyword spsSubcommands newnames newpage nobalanced nobox nocatlabs nodiagonal
syntax keyword spsSubcommands noindex noinitial nokaiser nolabels nolables nolastres
syntax keyword spsSubcommands nominal none nonmissing nonormal noorigin normal
syntax keyword spsSubcommands normprob norotate nosig nostep notable noulb noupdate
syntax keyword spsSubcommands novalllabs nowarn npplot ntiles ntolerance numbered
syntax keyword spsSubcommands numeric oblimin observations occurs ochiai offset
syntax keyword spsSubcommands omeans onepage onetail oneway optimal optolerance
syntax keyword spsSubcommands ordered ordinal origin ortho outfile outlier outliers
syntax keyword spsSubcommands outs overall overlay overview paf page pairwise parall
syntax keyword spsSubcommands parallel partialplot partition pattern pc pcon percent
syntax keyword spsSubcommands percentiles ph2 phi pie pillai pin plain plot plotwise
syntax keyword spsSubcommands pmeans poisson polynomial pooled pout power pref
syntax keyword spsSubcommands presorted previous print priors prism probs procedures
syntax keyword spsSubcommands program proportion province prox pwer pyramid qr
syntax keyword spsSubcommands quartiles quartimax quick radial range ranges rankit
syntax keyword spsSubcommands rao ratio raw rcon rconverge records rectangular
syntax keyword spsSubcommands redundancy reference reg region regwgt remove rename
syntax keyword spsSubcommands repeated replace report repr resid residual residuals
syntax keyword spsSubcommands return rfraction right risk rotate rotation round
syntax keyword spsSubcommands row rowconf rows rowtype_ roy rr rt runs rw sample
syntax keyword spsSubcommands saslib savage save scale scan scatterplot schedule
syntax keyword spsSubcommands scheffe scores scratch sdbeta sdfit sdresid sekurt
syntax keyword spsSubcommands select selection semean separate sepred sequential
syntax keyword spsSubcommands serial ses seskew seuclid shape sheffe sig sign signif
syntax keyword spsSubcommands significance similar simple since single singledf
syntax keyword spsSubcommands size skewness skip slk sm small snk solution sort
syntax keyword spsSubcommands sorted spearman special split spread spreadlevel sr1
syntax keyword spsSubcommands sresid ss1 ss2 ss3 ss4 ss5 sscon sscp sstype stacked
syntax keyword spsSubcommands standardize starts statistics stemleaf step stepdown
syntax keyword spsSubcommands steplimit stepwise stimwght stressmin strictparallel
syntax keyword spsSubcommands string structure subjwght subtitle sum summary sumspace
syntax keyword spsSubcommands survival symbols symmetric tables tape tcov test ties
syntax keyword spsSubcommands tiestore title to tol tolerance total tree tspace tukey
syntax keyword spsSubcommands tukeyb twotail type uc uls unclassified uncompressed
syntax keyword spsSubcommands unconditinoal unconditional underscore uniform unique
syntax keyword spsSubcommands univ univariate univf unnumbered unselected untie upper
syntax keyword spsSubcommands uscounty usstates variable variables variance varimax
syntax keyword spsSubcommands vector vertical vicicle vs vsize vw w-w wald ward warn
syntax keyword spsSubcommands waverage width wilcoxon wild wilks with within wk1 wks
syntax keyword spsSubcommands workfile world wr wrap write wrk wsdesign xprod xtx
syntax keyword spsSubcommands zcorr zpp zpred zresid
syntax keyword spsSubcommands $CASENUM ADEVICE ADJPRED AEMPIRICAL AFREQ AFTER AGAINST
syntax keyword spsSubcommands AIC AINDS ALIGN ALL ALPHA ALPHANUMERIC ANALYSIS ANDREW
syntax keyword spsSubcommands APPEND APPROXIMATE AR AREA ARESID ASCAL ASSOCIATION
syntax keyword spsSubcommands ASYMMETRIC AUTOMATIC AVALUE AVERF AVONLY BACKWARD
syntax keyword spsSubcommands BADCORR BALANCED BAR BARCHART BART BARTLETT BAVERAGE
syntax keyword spsSubcommands BCON BCOV BEUCLID BIAS BINARY BINFER BINOMIAL BLANK
syntax keyword spsSubcommands BLOCK BLOM BLWMN BONFER BOOTSTRAP BOTH BOUNDARY BOUNDS
syntax keyword spsSubcommands BOX BOXM BOXPLOT BOXPLOTS BREAK BRIEF BRKSPACE BSEUCLID
syntax keyword spsSubcommands BSHAPE BSTEP BTAU BY CALCULATE CANADA CASE CASEFILE
syntax keyword spsSubcommands CASES CATEGORICAL CC CELLS CENTER CENTROID CHA CHALIGN
syntax keyword spsSubcommands CHDSPACE CHEBYCHEV CHISQ CHOLESKY CHOROPLETH CI CIN
syntax keyword spsSubcommands CINTERVAL CKDER CLASS CLASSIFY CLASSPLOT CLUSTER
syntax keyword spsSubcommands CNLR COCHRAN CODE COEFF COLCONF COLLIN COLLINEARITY
syntax keyword spsSubcommands COLSPACE COLUMN COLUMNWISE COMBINED COMM COMMA COMPARE
syntax keyword spsSubcommands COMPLETE COMPOSITIONAL COMPRESSED CONDENSE CONDITION
syntax keyword spsSubcommands CONDITIONAL CONFIG CONSTRAIN CONTENT CONTINUED CONTOUR
syntax keyword spsSubcommands CONTRAST CONVERGE COOK COR CORR CORRELATION COSINE
syntax keyword spsSubcommands COUNT COV COVARIATES COVRATIO CRITERIA CROSSBREAK
syntax keyword spsSubcommands CRSHTOL CTAU CUTOFF CUTPOINT CWEIGHT D DATA DB2 DB3
syntax keyword spsSubcommands DB4 DBF DECOMP DEFAULT DELTA DENDROGRAM DENSITY
syntax keyword spsSubcommands DEPENDENT DERIVATIVES DESCENDING DESCRIPTIVES DESIGN
syntax keyword spsSubcommands DET DEVIATION DFBETA DFE DFFIT DFREQ DIAGONAL DICE
syntax keyword spsSubcommands DICTIONARY DIFFERENCE DIGITS DIMENR DIMENS DIRECT
syntax keyword spsSubcommands DIRECTIONS DISPER DISTANCE DOCUMENT DOCUMENTS DOLLAR
syntax keyword spsSubcommands DOUBLE DRAW DRESID DROP DUNCAN DUPLICATE DURBIN DVALUE
syntax keyword spsSubcommands ECONVERGE EFFECTS EFSIZE EIGEN EMPIRICAL END ENTER
syntax keyword spsSubcommands EPS EQUAL EQUAMAX ERROR ERRORS ESTIM ESTIMATION ETA
syntax keyword spsSubcommands EUCLID EUROPE EVERY EXACT EXCLUDE EXECUTE EXPECTED
syntax keyword spsSubcommands EXPERIMENTAL EXTERNAL EXTRACTION EXTREME FAC FACILITIES
syntax keyword spsSubcommands FACTORS FIELDNAMES FILE FIN FIRST FITS FIXED FOOTNOTE
syntax keyword spsSubcommands FORMAT FORWARD FOUT FPAIR FPRECISION FRACTION FREE
syntax keyword spsSubcommands FREQ FREQUENCIES FRIEDMAN FROM FSCORE FSTEP FTOLERANCE
syntax keyword spsSubcommands FTSPACE FULL FUNCTIONS GAMMA GCMDFILE GCOV GDATA
syntax keyword spsSubcommands GDEVICE GEMSCAL GG GLS GMEMORY GOUT GRESID GROUP
syntax keyword spsSubcommands GROUPED GUTTMAN HAMANN HAMPEL HARMONIC HAVERAGE
syntax keyword spsSubcommands HAZARD HBAR HEADER HELMERT HF HICICLE HIERARCHICAL
syntax keyword spsSubcommands HIGH HIGHEST HISTOGRAM HISTORY HOMOGENEITY HORIZONTAL
syntax keyword spsSubcommands HOTELLING HSIZE HUBER HYPOTH ICIN ID IMAGE IN INCLUDE
syntax keyword spsSubcommands INCREMENT INDEX INDICATOR INDIVIDUAL INDSCAL INITIAL
syntax keyword spsSubcommands INPUT INTERMED INTERVAL INTO INV ISTEP ITER ITERATE
syntax keyword spsSubcommands JACCARD JOINT K-S K-W K1 K2 KAISER KAPPA KEEP KENDALL
syntax keyword spsSubcommands KEY KMO KURTOSIS LABELS LAMBDA LARGE LAST LASTRES LCON
syntax keyword spsSubcommands LEFT LEVEL LEVER LFTOLERANCE LIMIT LINE LINEARITY
syntax keyword spsSubcommands LIST LISTWISE LOCAL LOGIT LOGSURV LOSS LOW LOWER
syntax keyword spsSubcommands LOWEST LR LRECL LSD M-W MACROS MAHAL MANUAL MAP
syntax keyword spsSubcommands MARGINS MASTERFILE MAT MATRIX MAX MAXIMUM MAXMINF
syntax keyword spsSubcommands MAXORDER MAXORDERS MAXSTEPS MCA MCIN MCNEMAR MDGROUP
syntax keyword spsSubcommands MEAN MEANS MEANSUB MEANSUBSTITUTION MEDIAN MENU
syntax keyword spsSubcommands MESTIMATOR METHOD MIN MINEIGEN MINIMUM MINKOWSKI
syntax keyword spsSubcommands MINORIENTATION MINRESID MISSING MIXED ML MODE MODEL
syntax keyword spsSubcommands MODELTYPE MODLSD MOSES MRGROUP MSE MULTIPLE MULTIPUNCH
syntax keyword spsSubcommands MULTIV MULTIVARIATE MUPLUS MWITHIN N_MATRIX N_SCALAR
syntax keyword spsSubcommands N_VECTOR NAME NAMES NATRES NEGATIVE NEGSUM NESTED
syntax keyword spsSubcommands NEWNAMES NEWPAGE NOBALANCED NOBOX NOCATLABS NODIAGONAL
syntax keyword spsSubcommands NOINDEX NOINITIAL NOKAISER NOLABELS NOLABLES NOLASTRES
syntax keyword spsSubcommands NOMINAL NONE NONMISSING NONORMAL NOORIGIN NORMAL
syntax keyword spsSubcommands NORMPROB NOROTATE NOSIG NOSTEP NOTABLE NOULB NOUPDATE
syntax keyword spsSubcommands NOVALLLABS NOWARN NPPLOT NTILES NTOLERANCE NUMBERED
syntax keyword spsSubcommands NUMERIC OBLIMIN OBSERVATIONS OCCURS OCHIAI OFFSET
syntax keyword spsSubcommands OMEANS ONEPAGE ONETAIL ONEWAY OPTIMAL OPTOLERANCE
syntax keyword spsSubcommands ORDERED ORDINAL ORIGIN ORTHO OUTFILE OUTLIER OUTLIERS
syntax keyword spsSubcommands OUTS OVERALL OVERLAY OVERVIEW PAF PAGE PAIRWISE PARALL
syntax keyword spsSubcommands PARALLEL PARTIALPLOT PARTITION PATTERN PC PCON PERCENT
syntax keyword spsSubcommands PERCENTILES PH2 PHI PIE PILLAI PIN PLAIN PLOT PLOTWISE
syntax keyword spsSubcommands PMEANS POISSON POLYNOMIAL POOLED POUT POWER PREF
syntax keyword spsSubcommands PRESORTED PREVIOUS PRINT PRIORS PRISM PROBS PROCEDURES
syntax keyword spsSubcommands PROGRAM PROPORTION PROVINCE PROX PWER PYRAMID QR
syntax keyword spsSubcommands QUARTILES QUARTIMAX QUICK RADIAL RANGE RANGES RANKIT
syntax keyword spsSubcommands RAO RATIO RAW RCON RCONVERGE RECORDS RECTANGULAR
syntax keyword spsSubcommands REDUNDANCY REFERENCE REG REGION REGWGT REMOVE RENAME
syntax keyword spsSubcommands REPEATED REPLACE REPORT REPR RESID RESIDUAL RESIDUALS
syntax keyword spsSubcommands RETURN RFRACTION RIGHT RISK ROTATE ROTATION ROUND
syntax keyword spsSubcommands ROW ROWCONF ROWS ROWTYPE_ ROY RR RT RUNS RW SAMPLE
syntax keyword spsSubcommands SASLIB SAVAGE SAVE SCALE SCAN SCATTERPLOT SCHEDULE
syntax keyword spsSubcommands SCHEFFE SCORES SCRATCH SDBETA SDFIT SDRESID SEKURT
syntax keyword spsSubcommands SELECT SELECTION SEMEAN SEPARATE SEPRED SEQUENTIAL
syntax keyword spsSubcommands SERIAL SES SESKEW SEUCLID SHAPE SHEFFE SIG SIGN SIGNIF
syntax keyword spsSubcommands SIGNIFICANCE SIMILAR SIMPLE SINCE SINGLE SINGLEDF
syntax keyword spsSubcommands SIZE SKEWNESS SKIP SLK SM SMALL SNK SOLUTION SORT
syntax keyword spsSubcommands SORTED SPEARMAN SPECIAL SPLIT SPREAD SPREADLEVEL SR1
syntax keyword spsSubcommands SRESID SS1 SS2 SS3 SS4 SS5 SSCON SSCP SSTYPE STACKED
syntax keyword spsSubcommands STANDARDIZE STARTS STATISTICS STEMLEAF STEP STEPDOWN
syntax keyword spsSubcommands STEPLIMIT STEPWISE STIMWGHT STRESSMIN STRICTPARALLEL
syntax keyword spsSubcommands STRING STRUCTURE SUBJWGHT SUBTITLE SUM SUMMARY SUMSPACE
syntax keyword spsSubcommands SURVIVAL SYMBOLS SYMMETRIC TABLES TAPE TCOV TEST TIES
syntax keyword spsSubcommands TIESTORE TITLE TO TOL TOLERANCE TOTAL TREE TSPACE TUKEY
syntax keyword spsSubcommands TUKEYB TWOTAIL TYPE UC ULS UNCLASSIFIED UNCOMPRESSED
syntax keyword spsSubcommands UNCONDITINOAL UNCONDITIONAL UNDERSCORE UNIFORM UNIQUE
syntax keyword spsSubcommands UNIV UNIVARIATE UNIVF UNNUMBERED UNSELECTED UNTIE UPPER
syntax keyword spsSubcommands USCOUNTY USSTATES VARIABLE VARIABLES VARIANCE VARIMAX
syntax keyword spsSubcommands VECTOR VERTICAL VICICLE VS VSIZE VW W-W WALD WARD WARN
syntax keyword spsSubcommands WAVERAGE WIDTH WILCOXON WILD WILKS WITH WITHIN WK1 WKS
syntax keyword spsSubcommands WORKFILE WORLD WR WRAP WRITE WRK WSDESIGN XPROD XTX
syntax keyword spsSubcommands ZCORR ZPP ZPRED ZRESID

syntax keyword spsfunctions abs any arsin artan cdfnorm cfvar concat cos ctime.days ctime.hours
syntax keyword spsfunctions ctime.minutes data.wkyr data.yrday date.dmy date.mdy date.moyr date.qyr
syntax keyword spsfunctions exp index lag length lg10 ln lower lpad ltrim max mean min missing mod
syntax keyword spsfunctions nmiss normal number nvalid probit range rindex rnd rpad rtrim sd sin
syntax keyword spsfunctions sqrt string substr sum sysmis time.days time.hms trunc uniform upcase
syntax keyword spsfunctions value variance xdate.date xdate.hour xdate.jday xdate.mday xdate.minute
syntax keyword spsfunctions xdate.month xdate.quarter xdate.second xdate.tday xdate.time xdate.week
syntax keyword spsfunctions xdate.wkday xdate.year yrmoda
syntax keyword spsfunctions ABS ANY ARSIN ARTAN CDFNORM CFVAR CONCAT COS CTIME.DAYS CTIME.HOURS
syntax keyword spsfunctions CTIME.MINUTES DATA.WKYR DATA.YRDAY DATE.DMY DATE.MDY DATE.MOYR DATE.QYR
syntax keyword spsfunctions EXP INDEX LAG LENGTH LG10 LN LOWER LPAD LTRIM MAX MEAN MIN MISSING MOD
syntax keyword spsfunctions NMISS NORMAL NUMBER NVALID PROBIT RANGE RINDEX RND RPAD RTRIM SD SIN
syntax keyword spsfunctions SQRT STRING SUBSTR SUM SYSMIS TIME.DAYS TIME.HMS TRUNC UNIFORM UPCASE
syntax keyword spsfunctions VALUE VARIANCE XDATE.DATE XDATE.HOUR XDATE.JDAY XDATE.MDAY XDATE.MINUTE
syntax keyword spsfunctions XDATE.MONTH XDATE.QUARTER XDATE.SECOND XDATE.TDAY XDATE.TIME XDATE.WEEK
syntax keyword spsfunctions XDATE.WKDAY XDATE.YEAR YRMODA

syntax keyword spssysvars $casenum $date $jdate $length $sysmis $time $width

syntax match spscomment          "^/\?\*.*"  contains=NONE
syntax region spsstring          start="'" end="'"  contains=NONE
"syntax region spscomment          start="/\*"  end="\*\/" contains=NONE
"syntax region spscomment2         start="^\*"  end="\."  contains=NONE
"syntax match  spscommenterror     "\*/"
"syntax region  spsstring            start=+"+  skip=+\\\\\|\\"+  end=+"+  

syntax keyword spssysmis	sysmis copy 
syntax keyword spssysmis	SYSMIS COPY 
syntax keyword spslogic		eq ne gt ge lt le yes no not and or inap missing lo lowest hi highest thru
syntax keyword spslogic		EQ NE GT GE LT LE YES NO NOT AND OR INAP MISSING LO LOWEST HI HIGHEST THRU
syntax keyword spsfiles		file handle outfile lrecl records name write import export update
syntax keyword spsfiles		FILE HANDLE OUTFILE LRECL RECORDS NAME WRITE IMPORT EXPORT UPDATE
syntax keyword spsOperators     = =~ <> < >
syntax match spslogic2		"=\<\>\="
syntax match spsnumber "-\=\<[0-9]\+L\=\>\|\.0[0-9]\+\>"
syntax match spsnumber2 "[A-Za-z0-9#]*\|[A-Z0-9]*[_\.][A-Z0-9]*\|[_\.]*[A-Z]*[0-9]*[\.]\|_[0-9]*[\.]\|:[0-9]*[\.]\|[0-9]_[0-9]" contains=ALLBUT,spsKeyword

hi link spscomment comment
"hi link spscomment2 comment
hi link spssysmis keyword
hi link spserror error
hi link spsfiles character
hi link spskeyword statement
hi link spslogic string
hi link spsstring string
hi link spsfunctions Keyword
hi link spsOperators Conditional
hi link spsnumber number
hi link spsnumber2 Identifier
hi link spssubcommands statement


let b:current_syntax = "sps"

" vim: ts=8 sw=2
