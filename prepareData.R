# prepare mindsteps data for monitoring covid19
#
# Authors: Katharina Kaelin <katharina.kaelin@statistik.ji.zh.ch>, Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 08.03.2022
###############################################################################

library(dplyr)

# Number formatting
options(scipen = 1000000)
options(digits = 6)

# get and transform data function
getData <- function(file)
{
    if(missing(file)) file <- "base_data_IBE.csv"
    
    # import dat
    data_raw <- read.csv(file)
    
    # get meta and specs
    meta <- getMetadata()
    
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))
    
    # prepare data
    data_t <- data_raw %>%
        transmute(
            'date' := as.POSIXct(paste(.data$date, "00:00:00", sep=" "), format="%Y-%m-%d"),
            'value' := .data$n,
            'variable_short' := meta$variable_short,
            'location' := tidyr::replace_na(.data$region, meta$location))
    
    # add metadata
    data <- data_t %>%
        left_join(meta %>% select(-.data$location), by = 'variable_short') %>%
        arrange(.data$date) %>%
        select(df_spec$name)
    
    # return
    return(data)
}

# load metadata function
getMetadata <- function(file)
{
    if( missing(file) ) file <- 'mindsteps_meta.json'
    assertthat::assert_that(assertthat::is.string(file))
    assertthat::assert_that(file.exists(file))
    
    meta_raw <- jsonlite::read_json(file, simplifyVector = F)
    meta_t <- lapply(meta_raw, as.character)
    meta <- as.data.frame(meta_t, stringsAsFactors = F)
    return(meta)
}

# test result function
testTable <- function(df)
{
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))
    
    assertthat::assert_that(is(df, 'data.frame'))
    assertthat::assert_that(identical(names(df), df_spec$name))
    
    purrr::pwalk(as.list(df_spec), ~assertthat::assert_that(is(get(.x, df), .y)))
    
    return(invisible(NULL))
}

# main
data_prep <- getData()
test <- testTable(data_prep)
write.table(data_prep, "./Bildung_LernplattformMindsteps.csv", sep=",", fileEncoding="UTF-8", row.names = F)
