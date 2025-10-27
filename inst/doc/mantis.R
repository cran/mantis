## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----data---------------------------------------------------------------------
# first, attach the package if you haven't already
library(mantis)

# this example data frame contains numbers of antibiotic prescriptions
# in long format
data("example_prescription_numbers")

head(example_prescription_numbers)

## -----------------------------------------------------------------------------

# create a flat report, and include the "Location" and "Antibiotic" fields
# in the content
inspec_flat <- inputspec(
  timepoint_col = "PrescriptionDate",
  item_cols = c("Location", "Antibiotic"),
  value_col = "NumberOfPrescriptions",
  timepoint_unit = "day"
)

# create a flat report, and include the "Location", "Spectrum", and "Antibiotic"
# fields in the content
inspec_flat2 <- inputspec(
  timepoint_col = "PrescriptionDate",
  item_cols = c("Location", "Spectrum", "Antibiotic"),
  value_col = "NumberOfPrescriptions",
  timepoint_unit = "day"
)

# create a tabbed report, with a separate tab for each unique value of
# "Location", and include just the "Antibiotic" field in the content of each tab
inspec_tabbed <- inputspec(
  timepoint_col = "PrescriptionDate",
  item_cols = c("Antibiotic", "Location"),
  value_col = "NumberOfPrescriptions",
  tab_col = "Location",
  timepoint_unit = "day"
)

# create a tabbed report, with a separate tab for each unique value of
# "Location", and include the "Antibiotic" and "Spectrum" fields in the content
# of each tab
inspec_tabbed2 <- inputspec(
  timepoint_col = "PrescriptionDate",
  item_cols = c("Antibiotic", "Spectrum", "Location"),
  value_col = "NumberOfPrescriptions",
  tab_col = "Location",
  timepoint_unit = "day"
)

# create a tabbed report, with a separate tab for each unique value of
# "Antibiotic", and include just the "Location" field in the content of each tab
inspec_tabbed3 <- inputspec(
  timepoint_col = "PrescriptionDate",
  item_cols = c("Antibiotic", "Location"),
  value_col = "NumberOfPrescriptions",
  tab_col = "Antibiotic",
  timepoint_unit = "day"
)

## ----interactive-display, eval=FALSE------------------------------------------
# mantis_report(
#   df = example_prescription_numbers,
#   file = "example_prescription_numbers_interactive.html",
#   inputspec = inspec_tabbed2,
#   outputspec = outputspec_interactive(),
#   report_title = "mantis report",
#   dataset_description = "Antibiotic prescriptions by site",
#   show_progress = TRUE
# )

## ----heatmap-display, eval=FALSE----------------------------------------------
# mantis_report(
#   df = example_prescription_numbers,
#   file = "example_prescription_numbers_heatmap.html",
#   inputspec = inspec_tabbed,
#   outputspec = outputspec_static_heatmap(),
#   report_title = "mantis report",
#   dataset_description = "Antibiotic prescriptions by site",
#   show_progress = TRUE
# )

## ----multipanel-display, eval=FALSE-------------------------------------------
# mantis_report(
#   df = example_prescription_numbers,
#   file = "example_prescription_numbers_multipanel.html",
#   inputspec = inspec_tabbed,
#   outputspec = outputspec_static_multipanel(),
#   report_title = "mantis report",
#   dataset_description = "Antibiotic prescriptions by site",
#   show_progress = TRUE
# )

