#########################################################################
# Author: Kurt Roots
# Company: CogCubed
# Description: Code to easily create Google Motion Chart - and more.
#
# Package: http://code.google.com/p/google-motion-charts-with-r/
# Requires: NA
#########################################################################

# Load library
library(googleVis)

# Read in data file
RDATA <- read.csv("demo2.txt",header=FALSE,sep=",");

# Create motion chart object
Motion=gvisMotionChart(RDATA, idvar="PLAYER", timevar="ELAPSED", options=list(height=350, width=400))

# Display chart immediately
#plot(Motion) 

# Create Google Gadget to file
cat(createGoogleGadget(Motion), file="motionchart.xml")