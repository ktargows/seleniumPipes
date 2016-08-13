#' addCookie
#'
#' @param remDr
#'
#' @family cookies functions
#' @return
#' @export
#'
#' @examples

addCookie <- function(remDr, name, value, path = NULL, domain = NULL, secure = FALSE, httpOnly = NULL, expiry = NULL,  ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
  cookie <- list(name = name, value = value, path = path, domain = domain
                , secure = secure, httpOnly = httpOnly, expiry = expiry)
  cookie <- cookie[!sapply(cookie, is.null)]
  jsonBody <- toJSON(list(cookie = cookie), null = "null", auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "addCookie", json = jsonBody,...)
  invisible(remDr)
}


#' deleteAllCookies
#'
#' @param remDr
#'
#' @family cookies functions
#' @return
#' @export
#'
#' @examples

deleteAllCookies <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "deleteAllCookies", json = NULL,...)
  invisible(remDr)
}


#' deleteCookie
#'
#' @param remDr
#'
#' @family cookies functions
#' @return
#' @export
#'
#' @examples

deleteCookie <- function(remDr, name = NULL,  ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  obj$name <- name
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "deleteCookie", json = NULL,...)
  invisible(remDr)
}


#' getAllCookies
#'
#' @param remDr
#'
#' @family cookies functions
#' @return
#' @export
#'
#' @examples

getAllCookies <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getAllCookies", json = NULL,...)
  res$value
}


#' getNamedCookie
#'
#' @param remDr
#'
#' @family cookies functions
#' @return
#' @export
#'
#' @examples

getNamedCookie <- function(remDr, name = NULL,  ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  obj$name <- name
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getNamedCookie", json = NULL,...)
  res$value
}


