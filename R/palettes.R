#' Complete list of MCRI palettes
#'
#' Use \code{\link{mcriPalette}} to construct palettes of desired length.
#'
#' @export
mcri.palettes <- list(
    MCRI = c("#EC008C", "#00ADEF", "#8DC63F", "#00B7C6", "#F47920", "#7A52C7")
)

#' A MCRI palette generator
#'
#' These are a handful of colour palettes based on the MCRI branding.
#'
#' @param n Number of colors desired. If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{MCRI}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#' @return A vector of colours.
#'
#' @export
#' @keywords colours, colors
#' @examples
#' mcriPalette("MCRI")
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- mcriPalette(21, name = "MCRI", type = "continuous")
#' image(volcano, col = pal)
mcriPalette <- function(name, n, type = c("discrete", "continuous")) {
    type <- match.arg(type)

    pal <- mcriPalettes[[name]]
    if (is.null(pal))
        stop("Palette not found.")

    if (missing(n)) {
        n <- length(pal)
    }

    if (type == "discrete" && n > length(pal)) {
        stop("Number of requested colours greater than what palette can offer")
    }

    out <- switch(type,
                  continuous = colorRampPalette(pal)(n),
                  discrete = pal[1:n]
    )
    structure(out, class = "palette", name = name)
}

#' @export
print.palette <- function(x, ...) {
    n <- length(x)
    old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
    on.exit(par(old))

    image(1:n, 1, as.matrix(1:n), col = x,
          ylab = "", xaxt = "n", yaxt = "n", bty = "n")

    rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
    text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}