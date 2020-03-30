# prepare mindsteps data for monitoring covid19
#
# Authors: Katharina Kaelin <katharina.kaelin@statistik.ji.zh.ch>, Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 30.03.2020
###############################################################################

# Import libraries
library(dplyr) # Version >= 0.8.5
library(assertthat) # Version >= 0.2.1

# Number formatting
options(scipen = 1000000)
options(digits = 6)

# get and transform data function
getData <- function(url_dat)
{
    if(missing(url_dat)) url_dat <- "https://raw.githubusercontent.com/bildungsmonitoringZH/covid19_edu_mindsteps/master/base_data_IBE.csv?token=AJX6OINGRDZVQ4TGPHEYQ3K6Q5TJS"
    
    # import dat
    dat <- read.csv(url(url_dat), header=T, sep=",", stringsAsFactors=FALSE, encoding="UTF-8")
    
    #prepare dat
    dat_prep <- dat %>%
        transmute(
            'date' := as.POSIXct(paste(.data$date, "00:00:00", sep=" "), format="%Y-%m-%d"),
            'value' := .data$n,
            'topic' := "Bildung",
            'variable_short' := "training_mindsteps",
            'variable_long' := "Nutzung der Lernplattform Mindsteps",
            'location' := tidyr::replace_na(.data$region, "Deutschschweiz"),
            'unit' := "Anzahl durchgef\u00fchrter Aufgabenserien",
            'source' := "Universit\u00e4t Zürich, Institut für Bildungsevaluation",
            'update' := "t\u00e4glich",
            'public' := "ja",
            'description' := "https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps"
        )
    
    # return
    return(dat_prep)
}

# test result function
testTable <- function(df)
{
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))
    
    assert_that(is(df, 'data.frame'))
    assert_that(identical(names(df), df_spec$name))
    
    purrr::pwalk(as.list(df_spec), ~assert_that(is(get(.x, df), .y)))
    
    return(invisible(NULL))
}

# main
url_dat <- "https://raw.githubusercontent.com/bildungsmonitoringZH/covid19_edu_mindsteps/master/base_data_IBE.csv?token=AJX6OINGRDZVQ4TGPHEYQ3K6Q5TJS"
dat_prep <- getData(url_dat)
test <- testTable(dat_prep)
write.table(dat_prep, "./Bildung_LernplattformMindsteps.csv", sep=",", fileEncoding="UTF-8", row.names = F)
