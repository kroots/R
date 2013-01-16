#########################################################################
# Author: Kurt Roots
# Company: CogCubed
# Description: Code to easily create a parallel coordinate graph.
#
# Package: http://cran.r-project.org/web/packages/GGally/GGally.pdf
# Requires: ggplot2, reshape, plyr (rename,round_any)
#########################################################################

# Load library
library(GGally)

# Read in data file
RDATA <- read.csv("pcp.csv",header=TRUE,sep=",");

# Create parallel coordinate graph, where response in this case is column combined
ggparcoord(data=RDATA, columns=1:6, groupColumn="combined", scale="std", order="allClass", title="Combined to Control")