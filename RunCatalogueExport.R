library(here)
library(dplyr)
library(CatalogueExport)

# *******************************************************
# SECTION 1: Set Local Details
# *******************************************************
# Load connection details
source(here("ConnectionDetails.R"))

# where should the results and logs go?
outputFolder <- file.path(here(), "results_CatalogueExport")

# Which analysis will be performed?
analysisIds <- getAnalysisDetails()$ANALYSIS_ID %>% .[!(. %in% c(730))]

# *******************************************************
# SECTION 2: Run the package
# *******************************************************
catalogueExport(connectionDetails, 
                cdmDatabaseSchema = cdmDatabaseSchema, 
                resultsDatabaseSchema=resultsDatabaseSchema,
                vocabDatabaseSchema = vocabDatabaseSchema,
                sourceName = databaseId, 
                cdmVersion = cdmVersion,
                analysisIds = analysisIds,
                smallCellCount = 30,
                outputFolder = outputFolder)

## zip everything together
zip(
  zipfile = file.path(outputFolder, paste0("Results_Catalogue_", databaseId, ".zip")),
  files = list.files("results_CatalogueExport", recursive = TRUE, full.names = TRUE)
)
