library(here)
library(CatalogueExport)

# *******************************************************
# SECTION 1: Set Local Details
# *******************************************************
# Load connection details
source(here("ConnectionDetails.R"))

# where should the results and logs go?
outputFolder <- file.path(here(), "results_CatalogueExport")

# *******************************************************
# SECTION 2: Run the package
# *******************************************************
catalogueExport(connectionDetails, 
                cdmDatabaseSchema = cdmDatabaseSchema, 
                resultsDatabaseSchema=resultsDatabaseSchema,
                vocabDatabaseSchema = vocabDatabaseSchema,
                sourceName = databaseId, 
                cdmVersion = cdmVersion,
                outputFolder = outputFolder)

## zip everything together
zip(
  zipfile = file.path(outputFolder, paste0("Results_Catalogue_", databaseId, ".zip")),
  files = list.files("results_CatalogueExport", recursive = TRUE, full.names = TRUE)
)
