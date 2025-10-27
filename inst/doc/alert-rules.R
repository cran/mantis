## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
# # alert if all values are NA
# ars <- alert_rules(alert_missing(extent_type = "all"))
# 
# # alert if there are 10 or more missing values in total
# # or if the last 3 or more values are missing
# # or if 5 or more values in a row are missing
# ars <- alert_rules(
#   alert_missing(extent_type = "any", extent_value = 10),
#   alert_missing(extent_type = "last", extent_value = 3),
#   alert_missing(extent_type = "consecutive", extent_value = 5)
# )

## ----eval=FALSE---------------------------------------------------------------
# # alert if the mean of last 3 values is more than 20% higher than
# # the mean of the preceding 12 values
# ars <- alert_rules(
#   alert_difference_above_perc(
#     current_period = 1:3,
#     previous_period = 4:15,
#     rule_value = 20
#   )
# )

## ----eval=FALSE---------------------------------------------------------------
# ars <- alert_rules(
#   alert_custom(
#     short_name = "my_rule_combo",
#     description = "Over 3 missing values and max value is > 10",
#     expression = quote(
#       sum(is.na(value)) > 3 && max(value, na.rm = TRUE) > 10
#     )
#   ),
#   alert_custom(
#     short_name = "my_rule_doubled",
#     description = "Last value is over double the first value",
#     expression = quote(
#       rev(value)[1] > 2 * value[1]
#     )
#   )
# )

## -----------------------------------------------------------------------------
library(mantis)

data("example_prescription_numbers")

## ----eval=FALSE---------------------------------------------------------------
# mantis_report(
#   df = example_prescription_numbers,
#   file = "example_prescription_numbers_interactive.html",
#   inputspec = inputspec(
#     timepoint_col = "PrescriptionDate",
#     item_cols = c("Antibiotic", "Spectrum", "Location"),
#     value_col = "NumberOfPrescriptions",
#     tab_col = "Location"
#   ),
#   outputspec = outputspec_interactive(
#     sync_axis_range = FALSE
#   ),
#   report_title = "mantis report",
#   dataset_description = "Antibiotic prescriptions by site",
#   show_progress = TRUE
# )

## ----eval=FALSE---------------------------------------------------------------
# ars <- alert_rules(
#   alert_missing(extent_type = "any", extent_value = 1),
#   alert_custom(
#     short_name = "my_rule_doubled",
#     description = "Last 7 values are over double the first 7 values",
#     expression = quote(
#       mean(rev(value)[1:7], na.rm = TRUE) > 2 * (mean(value[1:7], na.rm = TRUE))
#     )
#   )
# )
# 
# # create a new report
# mantis_report(
#   df = example_prescription_numbers,
#   file = "example_prescription_numbers_interactive_alerts.html",
#   inputspec = inputspec(
#     timepoint_col = "PrescriptionDate",
#     item_cols = c("Antibiotic", "Spectrum", "Location"),
#     value_col = "NumberOfPrescriptions",
#     tab_col = "Location"
#   ),
#   outputspec = outputspec_interactive(
#     sync_axis_range = FALSE
#   ),
#   alertspec = alertspec(
#     alert_rules = ars,
#     show_tab_results = c("FAIL", "NA")
#   ),
#   report_title = "mantis report with alerts",
#   dataset_description = "Antibiotic prescriptions by site",
#   show_progress = TRUE
# )

## ----eval=FALSE---------------------------------------------------------------
# ars_restricted <- alert_rules(
#   alert_missing(extent_type = "any", extent_value = 1),
#   alert_custom(
#     short_name = "my_rule_doubled",
#     description = "Last 7 values are over double the first 7 values",
#     expression = quote(
#       mean(rev(value)[1:7], na.rm = TRUE) > 2 * (mean(value[1:7], na.rm = TRUE))
#     ),
#     items = list("Spectrum" = c("Broad"))
#   )
# )
# 
# # create a new report
# mantis_report(
#   df = example_prescription_numbers,
#   file = "example_prescription_numbers_interactive_alerts_restricted.html",
#   inputspec = inputspec(
#     timepoint_col = "PrescriptionDate",
#     item_cols = c("Antibiotic", "Spectrum", "Location"),
#     value_col = "NumberOfPrescriptions",
#     tab_col = "Location"
#   ),
#   outputspec = outputspec_interactive(
#     sync_axis_range = FALSE
#   ),
#   alertspec = alertspec(
#     alert_rules = ars_restricted
#   ),
#   report_title = "mantis report with alerts - restricted",
#   dataset_description = "Antibiotic prescriptions by site",
#   show_progress = TRUE
# )

