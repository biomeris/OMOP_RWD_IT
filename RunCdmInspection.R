library(here)
library(CdmInspection)

# *******************************************************
# SECTION 1: Set Local Details
# *******************************************************
# Load connection details
source(here("ConnectionDetails.R"))

# Database metadata
authors <- 'OHDSI Italy - OMOP_RWD_IT' # used on the title page

# For Oracle: define a schema that can be used to emulate temp tables:
oracleTempSchema <- NULL

# where should the results and logs go?
outputFolder <- file.path(here(), "results_CdmInspection")

# Url to check the version of your local Atlas
baseUrl <- webapi_baseUrl

# All results smaller than this value are removed from the results.
smallCellCount <- 5

verboseMode <- TRUE

# *******************************************************
# SECTION 2: Run the package
# *******************************************************
results <- cdmInspection(
  connectionDetails = connectionDetails,
  cdmDatabaseSchema = cdmDatabaseSchema,
  resultsDatabaseSchema = resultsDatabaseSchema,
  vocabDatabaseSchema = vocabDatabaseSchema,
  oracleTempSchema = oracleTempSchema,
  databaseId = databaseId,
  databaseName = databaseName,
  databaseDescription = databaseDescription,
  runVocabularyChecks = TRUE,
  runDataTablesChecks = TRUE,
  runPerformanceChecks = TRUE,
  runWebAPIChecks = TRUE,
  smallCellCount = smallCellCount,
  baseUrl = baseUrl,
  sqlOnly = FALSE,
  outputFolder = outputFolder,
  verboseMode = verboseMode
)

generateResultsDocument(
  results,
  outputFolder,
  authors = authors,
  databaseId = databaseId,
  databaseName = databaseName,
  databaseDescription = databaseDescription,
  smallCellCount = smallCellCount
)