CMEECourseWork

Title: Week 4/5 Statistical Analysis

Brief Description:

This repository contains coursework for the Computational Methods in Ecology and Evolution (CMEE), specifically focusing on biological computing tasks using Linux and shell scripting. The exercises are based on TheMulQuaBio course notes (https://mhasoba.github.io/TheMulQuaBio/intro.html) from the Biological Computing course at the Department of Life Sciences, Imperial College London.

Project Structure and Usage: The repository contains code scripts located in the Code folder. The Data folder includes input files used by some scripts, while the sandbox folder contains experimental files and is not essential to the main coursework. Output files are generated in the results folder for this week’s coursework.

Project Structure

    Code folder: Contains all scripts.
    Data folder: Includes input files used by scripts.
    Results folder: Stores output files generated by the scripts.
    Sandbox folder: Used for experimental work (not essential for the coursework).

Languages: 
R version 4.4.0 

Dependencies: 
ggplot2
ggpubr
lmer (Practical)
MASS (Practical) 
WebPower

Installation:

To clone this repository, use the following command:
bash
git clone git@github.com:Saskiapearce/CMEECourseWork.git

Project Structure and Usage:
The repository contains primary scripts located in the Code folder. The Data folder includes input files used by some scripts, while the sandbox folder contains experimental files and is not essential to the main coursework. Output files are generated in the results folder for this week’s coursework.

SWS01.R

    Purpose: Performes some basic maths in R, creates some vectors and prints whether they are strings or not.
    Usage: Run the script directly in R.
    Input: No external input. Results are generated internally.
    Output:
        Prints 2 x 2 + 1
        Prints 2 x (2 +1) 
        Prints (12/2) ^ 3
        assigns x as 5 
        creates vectors called myNumericVector, myCharacterVector and myLogicalVector
    Example Run:

    source("SWS01.R")
    # Output will show results of the calculations, num [1:8] 1.3 2.5 1.9 3.4 5.6 1.4 3.1 2.9, chr [1:8] "low" "low" "low" "low" "high" "high" "high" ... and logi [1:8] TRUE TRUE FALSE FALSE TRUE TRUE ...

GLM02.R

    Purpose: takes the results of the dataframe workerbees.csv and prints a sigmoidal curve of predicted cell size values and the effect of cell size on parasite number
    Usage: Run the script directly in R, have the workerbees.csv in the data file 
    Input: workerbees.csv
    Output: The results of a binomiol glm of parasites and cell size from the data 
    a ggplot of the relationship between cell size and the probability of infection
    also prints the range of cell size data
    Dependencies: 
    ggplot2
    ggpubr
    Example Run:

    source("GLM02.R")
    # Output will show summary table of glm, range of cell size data and a visualisation of the effect of cell size on the proability of parasites. 

SWS02.R

    Purpose: takes the results of the dataframe SparrowSize.txt and prints descriptive statsics and data visualisation of the sparrow dataset.
    Usage: Run the script directly in R, have the SparrowSize.txt in the data file 
    Input:  SparrowSize.txt 
    Output: 
    Plots:
    Histograms (various configurations).
    Density plot with reference lines.
    Boxplot of Tarsus by sex.
    Numerical summaries:
    Mean, variance, range, and head of the Tarsus column.

Statistical test result (t.test output).  
  Dependencies: non

    Example Run:

    source("SWS02.R")
    #  Histograms, Density plot with reference lines and boxplot of Tarsus by sex.
    Numerical summaries:

    Mean, variance, range, and head of the Tarsus column.
    Statistical test result (t.test output).

GLMS.R

 Purpose: takes the results of the dataframe fisheries.csv and prints scatterplots of the data, performs a GLM of total abundance versus mean depth. 
    Usage: Run the script directly in R, have thefisheries.csv in the data file 
    Input:  fisheries.csv
    Output: 
    Visualizations
    Scatter plot of total abundance vs. mean depth: 
        X-axis: Mean Depth (km) 
        Y-axis: Total Abundance 
        Created using ggplot2 with a clean and classic theme. 
    Residual Diagnostic Plots: 
        A 2x2 panel of diagnostic plots for the fitted GLM (M1) using base R. 
    Statistical Model 
    The GLM (M1) uses a Poisson family to model the relationship:
        Formula: TotAbund ~ MeanDepth
        Output includes:
            Coefficients for the intercept and mean depth.
            Model deviance, AIC, and p-values for significance.
     
    Dependencies: 
    ggpubr
    MASS
    ggplot2
    lmer

    Example Run:

    source("GLMS.R")
    #  Scatterplot Total Abundance, Statistical test result (glm output) and summary of data.
    
    
 
SWS04.R

    Purpose:  performs a preliminary variance-covariance analysis for bivariate models using sparrow        morphological data. It focuses on exploring relationships between traits such as tarsus length, wing length, and sex through visualizations and subsetting.
    Usage: Run the script directly in R, have SparrowSize.txt in the data file 
    Input: SparrowSize.txt
    Output: 
    Scatterplot Matrix
    The scatterplot matrix visualizes pairwise relationships among:

    Tarsus length
    Wing length
    Sex
     
    Dependencies: none

    Example Run:

    source("SWS04.R")
    #  Scatterplot Matrix    
    
 













