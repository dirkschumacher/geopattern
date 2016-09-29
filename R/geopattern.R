#' Initiate a geopattern image
#'
#' @param string the string that will be encoded as an image
#' @param width width of the widget
#' @param height height of the widget
#' @param elementId the element-id
#'
#' @import htmlwidgets
#'
#' @export
geopattern <- function(string, width = NULL, height = NULL, elementId = NULL) {
  if (length(string) != 1) {
    stop("string must be of length 1")
  }
  if (!is.character(string)) {
    stop("string must be a character vector")
  }
  # forward options using x
  x = list(
    string = string
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'geopattern',
    x,
    width = width,
    height = height,
    package = 'geopattern',
    elementId = elementId
  )
}

#' Shiny bindings for geopattern
#'
#' Output and render functions for using geopattern within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a geopattern
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name geopattern-shiny
#'
#' @export
geopatternOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'geopattern', width, height, package = 'geopattern')
}

#' @rdname geopattern-shiny
#' @export
renderGeopattern <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, geopatternOutput, env, quoted = TRUE)
}
