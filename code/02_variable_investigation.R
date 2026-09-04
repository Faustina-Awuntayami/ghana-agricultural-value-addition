# ----------------------------------------------------
# current file is: 02_variable_investigation.R
# Purpose: to investigate GLSS variables before analysis.
# ----------------------------------------------------

library(labelled)

# value of sale of processed item
var_label(partB_sec8g$s8gq12)

# label value
val_labels(partB_sec8g$s8gq10)

# View summary statistics
summary(partB_sec8g$s8gq12)


sum(is.na(partB_sec8g$s8gq12))
#------------------------------------------------------------------------

# research question: Who (which households) engages in agricultural processing in Ghana?
# relevant vairiables: s8gact (processing activity), 