library(here)
library(Achilles)

# *******************************************************
# SECTION 1: Set Local Details
# *******************************************************
# Load connection details
source(here("ConnectionDetails.R"))

options(connectionObserver = NULL)

# where should the results and logs go?
outputFolder <- file.path(here(), "results_Achilles")

# small counts
smallCellCount <- 30 # To avoid patient identification, cells with small counts (<= smallCellCount) are deleted. Set to 0 for complete summary without small cell count restrictions.

# logging type 
verboseMode <- TRUE # set to FALSE if you don't want the logs to be printed to the console

# Achilles analyses to exclude
excludeAnalysisIds <- c()

# *******************************************************
# SECTION 2: Run the package
# *******************************************************
achilles(connectionDetails = connectionDetails,
         cdmDatabaseSchema = cdmDatabaseSchema,
         resultsDatabaseSchema = resultsDatabaseSchema,
         vocabDatabaseSchema = vocabDatabaseSchema,
         sourceName = databaseId,
         smallCellCount = smallCellCount,
         cdmVersion = cdmVersion,
         outputFolder = outputFolder,
         verboseMode = verboseMode,
         excludeAnalysisIds = excludeAnalysisIds)
