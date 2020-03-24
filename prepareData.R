# prepare mindsteps data for monitoring covid19
#
# Author: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 24.03.2020
###############################################################################

file <- 'base_data_IBE.csv'

data_raw <- read.csv(file, as.is = TRUE)
