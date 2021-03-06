% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/elementState.R, R/elementStateDoc.R
\name{getElementRect}
\alias{getElementRect}
\title{Return the dimensions and coordinates of an element}
\usage{
getElementRect(webElem, ...)
}
\arguments{
\item{webElem}{An object of class "wElement". A web Element object see \code{\link{wbElement}}.}

\item{...}{Additonal function arguments - Currently passes the \code{\link{retry}} argument.}
}
\value{
The returned value is a list including the following members:
\describe{
  \item{x}{X axis position of the top-left corner of the web element relative to the current browsing context’s document element in CSS reference pixels.}
  \item{y}{Y axis position of the top-left corner of the web element relative to the current browsing context’s document element in CSS reference pixels.}
  \item{height}{Height of the web element’s bounding rectangle in CSS reference pixels. }
  \item{width}{Width of the web element’s bounding rectangle in CSS reference pixels. }
}
}
\description{
\code{getElementRect} The getElementRect fuinction returns the dimensions and coordinates of the given web element.
}
\examples{
\dontrun{
  remDr <- remoteDr()
  remDr \%>\% go("http://www.google.com/ncr")

  # select the search box
  searchElem <- remDr \%>\% findElement("name", "q")

  # get the name of our element
  searchElem \%>\% getElementAttribute("name")

  # get the css background-color
  searchElem \%>\% getElementCssValue("background-color")
  blueScript <- "arguments[0].style.backgroundColor = 'blue';"
  remDr \%>\% executeScript(blueScript, list(searchElem))
  searchElem \%>\% getElementCssValue("background-color")

  # get the javascript property
  # searchElem \%>\% getElementProperty("backgroundColor")

  # get dimensions
  searchElem \%>\% getElementRect

  searchElem \%>\% getElementTagName

  # get some text and return it
  remDr \%>\% go("http://r-project.org")
  remDr \%>\% findElement("css", "h1") \%>\% getElementText

  # close browser
  remDr \%>\% deleteSession
}

}
\seealso{
Other elementState functions: \code{\link{getElementAttribute}},
  \code{\link{getElementCssValue}},
  \code{\link{getElementProperty}},
  \code{\link{getElementTagName}},
  \code{\link{getElementText}},
  \code{\link{isElementEnabled}},
  \code{\link{isElementSelected}}
}

