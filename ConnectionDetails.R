library(DatabaseConnector)

# Connect to database
# please see examples to connect here:
# https://ohdsi.github.io/DatabaseConnector/articles/Connecting.html
dbms <- Sys.getenv("DBMS")
user <- Sys.getenv("DB_USER")
password <- Sys.getenv("DB_PASSWORD")
server <- Sys.getenv("DB_SERVER")
port <- Sys.getenv("DB_PORT")
pathToDriver <- Sys.getenv("PATH_TO_DRIVER")

connectionDetails <- DatabaseConnector::createConnectionDetails(
  dbms = dbms,
  server = server,
  port = port,
  user = user,
  password = password,
  pathToDriver = pathToDriver
)

cdmDatabaseSchema <- Sys.getenv("CDM_SCHEMA")
resultsDatabaseSchema <- Sys.getenv("RESULTS_SCHEMA")
vocabDatabaseSchema <- cdmDatabaseSchema
cdmVersion <- Sys.getenv("CDM_VERSION")
databaseId <- Sys.getenv("DATABASE_ID")
databaseName <- 'Biomeris demo' # Extended database name
databaseDescription <- "Lorem Ipsum Loriat" # a short description of the database
webapi_baseUrl <- Sys.getenv("WEBAPI_BASEURL")

# connectionDetails <- createConnectionDetails(
#   dbms = ,
#   server = '...',
#   user = '...',
#   password = '...',
#   port = '...',
#   pathToDriver = '...'
# )
# 
# # additional parameters to connect to cdm
# cdmDatabaseSchema <- '...' # schema where cdm tables are located
# resultsDatabaseSchema <- '...' # schema with writing permission
# vocabDatabaseSchema <- '...' # The fully qualified database name of the vocabulary schema (tipically is the same as cdmDatabaseSchema)
# cdmVersion <- '...' # The CDM version to target for the data source, e.g. '5.4'
# databaseId <- '...' # name of the database, use acronym in capital letters
# databaseName <- '...' # Extended database name
# databaseDescription <- '...' # a short description of the database
# webapi_baseUrl <- '...' # The base URL for the WebApi instance, for example: "http://atlas.your.organisation.com/WebAPI"