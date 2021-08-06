if(!require("plumber")) install.packages("plumber")
if(!require("jsonlite")) install.packages("jsonlite")
library(plumber)
library(jsonlite)

pr <- plumb("api_test.R")
# 
swaggerFile <- pr$getApiSpec()
swaggerFile$info$title <- "PlumberPOSApp"
swaggerFile$info$description <- "Return prediction"
swaggerFile$info$version <- "1.0.1"
swagger <- toJSON(swaggerFile, pretty = TRUE, auto_unbox = TRUE)
cat(swagger, file = "plumber-swaggers.json", append = FALSE)

pr$run(port = 7900)
# 
# pr(prapi) %>%
#   pr_run(port=8000)