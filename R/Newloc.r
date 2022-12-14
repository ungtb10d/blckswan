# Blckswan Security
#
# Hardended security-API with features from the  Blckswan-2.0 specification
#
# OpenAPI spec version: 3.0.0
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git

#' Newloc Class
#'
#' @field name 
#' @field tag 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Newloc <- R6::R6Class(
  'Newloc',
  public = list(
    `name` = NULL,
    `tag` = NULL,
    initialize = function(`name`, `tag`){
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!missing(`tag`)) {
        stopifnot(is.character(`tag`), length(`tag`) == 1)
        self$`tag` <- `tag`
      }
    },
    toJSON = function() {
      NewlocObject <- list()
      if (!is.null(self$`name`)) {
        NewlocObject[['name']] <- self$`name`
      }
      if (!is.null(self$`tag`)) {
        NewlocObject[['tag']] <- self$`tag`
      }

      NewlocObject
    },
    fromJSON = function(NewlocJson) {
      NewlocObject <- jsonlite::fromJSON(NewlocJson)
      if (!is.null(NewlocObject$`name`)) {
        self$`name` <- NewlocObject$`name`
      }
      if (!is.null(NewlocObject$`tag`)) {
        self$`tag` <- NewlocObject$`tag`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "name": %s,
           "tag": %s
        }',
        self$`name`,
        self$`tag`
      )
    },
    fromJSONString = function(NewlocJson) {
      NewlocObject <- jsonlite::fromJSON(NewlocJson)
      self$`name` <- NewlocObject$`name`
      self$`tag` <- NewlocObject$`tag`
    }
  )
)
