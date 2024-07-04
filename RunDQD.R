library(here)
library(DataQualityDashboard)

# *******************************************************
# SECTION 1: Set Local Details
# *******************************************************
# Load connection details
source(here("ConnectionDetails.R"))

# where should the results and logs go?
outputFolder <- file.path(here(), "results_DQD")
outputFile <- paste0(databaseId, "-dqd-result.json")

# determine how many threads (concurrent SQL sessions) to use 
numThreads <- 1 

# specify if you want to execute the queries or inspect them 
sqlOnly <- FALSE # set to TRUE if you just want to get the SQL scripts and not actually run the queries

# logging type 
verboseMode <- TRUE # set to FALSE if you don't want the logs to be printed to the console

# write results to table?
writeToTable <- FALSE # set to TRUE if you want to write to a SQL table in the results schema

# write results to a csv file?
writeToCsv <- TRUE # set to FALSE if you want to skip writing to csv file
csvFile <- "" # only needed if writeToCsv is set to TRUE

# which DQ check levels to run 
checkLevels <- c("TABLE", "FIELD", "CONCEPT")

# which CDM tables to exclude? 
tablesToExclude <- c("CONCEPT", "VOCABULARY", "CONCEPT_ANCESTOR", "CONCEPT_RELATIONSHIP", "CONCEPT_CLASS", "CONCEPT_SYNONYM", "RELATIONSHIP", "DOMAIN", "COHORT_DEFINITION")  

# *******************************************************
# SECTION 2: Run the package
# *******************************************************
executeDqChecks(connectionDetails = connectionDetails, 
                cdmDatabaseSchema = cdmDatabaseSchema, 
                resultsDatabaseSchema = resultsDatabaseSchema,
                cdmSourceName = databaseId, 
                numThreads = numThreads,
                sqlOnly = sqlOnly, 
                outputFolder = outputFolder,
                outputFile = outputFile,
                verboseMode = verboseMode,
                writeToTable = writeToTable,
                checkLevels = checkLevels,
                tablesToExclude = tablesToExclude,
                cdmVersion = gsub("([[:digit:]]).([[:digit:]]).([[:digit:]])", "\\1.\\2", cdmVersion))