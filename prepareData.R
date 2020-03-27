# prepare mindsteps data for monitoring covid19
#
# Author: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 24.03.2020
###############################################################################

# Import libraries
library(dplyr) # Version: ‘0.8.5’
library(tidyr) # ‘1.0.2’

# Number formatting
options(scipen = 1000000)
options(digits = 6)

# import dat
url_dat  <- "https://raw.githubusercontent.com/bildungsmonitoringZH/covid19_edu_mindsteps/master/base_data_IBE.csv?token=AJX6OINGRDZVQ4TGPHEYQ3K6Q5TJS"
dat <- read.csv(url(url_dat), header=T, sep=",", stringsAsFactors=FALSE, encoding="UTF-8")

#prepare dat
dat_prep <- dat %>%
  mutate(
    value = n,
    topic = "Bildung",
    variable_short = "training_mindsteps",
    variable_long = "Nutzung der Lernplattform Mindsteps",
    location = "Deutschschweiz",
    unit= "Anzahl durchgeführter Aufgabenserien",
    source = "Universität Zürich, Institut für Bildungsevaluation",
    update = "täglich",
    public = "ja",
    description = "https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps"
  ) %>%
  select(-region, -comment,) %>%
  select(date, value, topic, variable_short, variable_long, location, unit, source, update, public, description) 

# export dat
write.table(dat_prep, "./Bildung_LernplattformMindsteps.csv", sep=",", fileEncoding="UTF-8", row.names = F)

