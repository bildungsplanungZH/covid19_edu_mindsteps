# minimal specification of output data for monitoring covid19
#
# Authors: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 30.03.2020
###############################################################################

# generate df spec
df_spec <- function()
{
    df_spec <- tibble('name' := c('date', 'value', 'topic', 'variable_short', 'variable_long', 'location', 'unit', 'source', 'update', 'public', 'description')) %>%
        mutate('class' := c('POSIXct', 'numeric', rep('character', n() -2)))
    
    saveRDS(df_spec, 'df_spec.rds')
    
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))
}
