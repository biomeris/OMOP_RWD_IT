library(here)
library(rlang)
library(Achilles)
library(AresIndexer)

# *******************************************************
# SECTION 1: Set Local Details
# *******************************************************
# Load connection details
source(here("ConnectionDetails.R"))

# where should the results go?
outputFolder <- "output_Ares"
aresDataRoot <- file.path(here(), outputFolder)

# *******************************************************
# SECTION 2: Run the package
# *******************************************************
# obtain the data source release key (naming convention for folder structures)
releaseKey <- getSourceReleaseKey(connectionDetails, cdmDatabaseSchema)
datasourceReleaseOutputFolder <- file.path(aresDataRoot, releaseKey)

# export the achilles results to the ares folder
inform("Exporting the achilles results to the ares folder")
exportToAres(
  connectionDetails = connectionDetails,
  cdmDatabaseSchema = cdmDatabaseSchema,
  resultsDatabaseSchema = resultsDatabaseSchema,
  vocabDatabaseSchema = vocabDatabaseSchema,
  outputPath = aresDataRoot,
  reports = c()
)

# perform temporal characterization
tryCatch(
  {
    inform("Performing temporal characterization")
    outputFile <- file.path(datasourceReleaseOutputFolder, "temporal-characterization.csv")
    
    performTemporalCharacterization(
      connectionDetails = connectionDetails,
      cdmDatabaseSchema = cdmDatabaseSchema,
      resultsDatabaseSchema = resultsDatabaseSchema,
      outputFile = outputFile
    )
    
    # augment concept files with temporal characterization data
    AresIndexer::augmentConceptFiles(releaseFolder = file.path(aresDataRoot, releaseKey))
  },
  error = function(cond) {
    inform("Your data does not support temporal characterization.")
    file.copy(from = file.path(here(), "extras", "temporal-characterization.csv"), datasourceReleaseOutputFolder, overwrite = FALSE)
  },
  warning = function(cond) {
    message(cond)
  },
  finally = {
    inform("Temporal characterization complete!")
  }
)

# Copy DQD results to data source release folder in ares data folder
inform("Copying DQD results to data source release folder in Ares data folder.")
file.copy(from = file.path(here(), "results_DQD", paste0(databaseId, "-dqd-result.json")), file.path(datasourceReleaseOutputFolder, "dq-result.json"), overwrite = FALSE)

## zip everything together
zip(
  zipfile = file.path(aresDataRoot, paste0("Results_Ares_", databaseId, ".zip")),
  files = list.files(outputFolder, recursive = TRUE, full.names = TRUE)
)