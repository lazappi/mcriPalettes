#' Complete list of MCRI palettes
#'
#' Use \code{\link{mcriPalette}} to construct palettes of desired length.
#'
#' @export
mcri.palettes <- list(
    symbol = c("#56C7DA",  # Blue
               "#DA1A32",  # Red
               "#FFCE34",  # Yellow
               "#82C341",  # Lime
               "#F68D39",  # Orange
               "#007A3D",  # Green
               "#A4219B",  # Purple
               "#008385"), # Teal
    greys = c("#D1D3D3", "#A0A1A2", "#58585a"),
    themes = c("#EC008C",  # Pink
               "#00ADEF",  # Blue
               "#8DC63F",  # Green
               "#00B7C6",  # Teal
               "#F47920",  # Orange
               "#7A52C7"), # Purple
    themesMid = c("#F499C2", "#6BCFF6", "#C4DF9B", "#92D6DE", "#FAB783",
                  "#B09ECB"),
    themesLite = c("#F9CCDF", "#B9E5FA", "#DFEDCB", "#C8E8ED", "#FDD8BB",
                   "#D3CAE3"),
    themesPaired = c("#EC008C", "#F499C2", "#00ADEF", "#6BCFF6", "#8DC63F",
                     "#C4DF9B", "#00B7C6", "#92D6DE", "#F47920", "#FAB783",
                     "#7A52C7", "#B09ECB"),
    themesTripled = c("#EC008C", "#F499C2", "#F9CCDF", "#00ADEF", "#6BCFF6",
                      "#B9E5FA", "#8DC63F", "#C4DF9B", "#DFEDCB", "#00B7C6",
                      "#92D6DE", "#C8E8ED", "#F47920", "#FAB783", "#FDD8BB",
                      "#7A52C7", "#B09ECB", "#D3CAE3"),
    blues = c("#00A5D2", "#0053A1", "#092F5E"),
    bluesMid = c("#6FCEE7", "#78A7D7", "#717BAB"),
    bluesLite = c("#BAE4F2", "#B7CDE8", "#ACB1D0"),
    bluesPaired = c("#00A5D2", "#6FCEE7", "#0053A1", "#78A7D7", "#092F5E",
                    "#717BAB"),
    bluesTripled = c("#00A5D2", "#6FCEE7", "#BAE4F2", "#0053A1", "#78A7D7",
                     "#B7CDE8", "#092F5E", "#717BAB", "#ACB1D0"),
    logo = c("#092F5E", "#0053A1", "#00A5D2", "#EC008C")
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
#' @keywords colours, colors
#'
#' @examples
#' mcriPalette("symbol")
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- mcriPalette(21, name = "symbol", type = "continuous")
#' image(volcano, col = pal)
#'
#' @export
#' @importFrom grDevices colorRampPalette
mcriPalette <- function(name, n, type = c("discrete", "continuous")) {
    type <- match.arg(type)

    pal <- mcri.palettes[[name]]
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
#' @importFrom grDevices rgb
#' @importFrom graphics image par rect text
print.palette <- function(x, ...) {
    n <- length(x)
    old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
    on.exit(par(old))

    image(1:n, 1, as.matrix(1:n), col = x,
          ylab = "", xaxt = "n", yaxt = "n", bty = "n")

    rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
    text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
