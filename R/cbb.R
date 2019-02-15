#' Colorblind-friendly palletes
#' 
#' @rdname cbb
#' @format cbb8 is a character vector with 8 values, and cbb12 is a tibble with 4 columns and 12 rows.
#' \describe{
#'    \item{cbb8}{A vector with hex codes for 8 colors.}
#'    \item{cbb12$col}{Hex strings specifying the colors.}
#'    \item{cbb12$dark2light}{Ordering of col from dark to light.}
#'    \item{cbb12$contrast}{Ordering of col optimized for contrast.}
#'    \item{cbb12$tritanopia}{Identifies three colors that are indistinguishable for individuals with tritanopia.}
#'    \item{cbb12$dropTrit}{Identifies the three colors to drop when not including colors indistinguishible for individuals with tritanopia.}
#' }
#' @source \url{http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/}
"cbb8"

#' @rdname cbb
#' @name cbb12
#' @source \url{http://mkweb.bcgsc.ca/colorblind/img/colorblindness.palettes.simple.png}
#' @note cbb12 is best accessed using the \code{\link{CBB12}} function.
"cbb12"

#' Convenience function to access the cbb12 color palette
#' 
#' @name CBB12
#' @description CBB12 provides an interface to the cbb12 tibble that includes compact notation for different orderings of the colors, based on what type of data you are plotting.
#' @param i Indicies for colors to pull from cbb12. If NULL, a vector of all unique colors is returned.
#' @param order A string in \code{c('d2l', 'c')} indicating the preferred order (see details).
#' @param trit A logical value. TRUE indicates tritanopia-friendly colors such that the colors returned should include only colors that are distinguishable for individuals with tritanopia (see details).
#' 
#' @details Ordering: \code{d2l} results in an ordering of the colors from dark to light (default), \code{l2d} results in an ordering of the colors from light to dark, and \code{c} results in an ordering of the colors that maximizes contrast.
#' 
#' Tritanopia: An effort has been made to order colors in such a way that they do not appear next to colors that might otherwise be indistinguishable for individuals with tritanopia. In general you should leave these out (the default), unless you need more than 9 colors, in which case you should be careful to avoid having two similar colors appear next to eachother.
#' 
#' @return A vector of colors
#' 
#' @examples 
#' plot(1:9, 1:9, pch = 18, col = CBB12(1:9))
#' 
#' @importFrom magrittr %>%
#' @importFrom dplyr filter
#' @importFrom dplyr arrange
#' @importFrom dplyr desc
#' @export
CBB12 <- function(i = NULL, order = 'd2l', trit = TRUE)
{
    if(!order %in% c('d2l', 'c', 'l2d'))
        stop("Unknown order")
    
    if(trit)
        cbb12 <- dplyr::filter(cbb12, !dropTrit)
 
    if(is.null(i))
        i <- 1:dim(cbb12)[1]
    
    if(order == 'd2l')
        return(cbb12$col[i])
       
    if(order == 'c')
        return(dplyr::arrange(cbb12, contrast)$col[i])
    
    # otherwise should be 'l2d'
    dplyr::arrange(cbb12, desc(dark2light))$col[i]
}
