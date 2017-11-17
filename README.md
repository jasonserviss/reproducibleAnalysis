#Instructions

To recreate figures and show the steps used to preform the analysis do the following:

1) You will need to install [docker](https://www.docker.com)
2) Open R and install devtools (if not already installed) ```ìnstall.packages('devtools')```
3) Download and install the package ```devtools::install_github("jasonserviss/reproducibleAnalysis", host = "api.github.com")```
4) Load the package ```library(reproducibleAnalysis)```
5) Use the command ```plotFigure("figure1")``` to reproduce the environment used to preform the analysis, render the Rmd file, and open it in your web broswer.

Note: The package currently only contains "figure1".