# MCRI Palettes

<!-- README.md is generated from README.Rmd. Please edit that file -->



Colour palettes based on the MCRI branding.

Most of the code is taken from [Karthik Ram's `wesanderson` 
palette](https://github.com/karthik/wesanderson)

# Installation

```R
devtools::install_github("lazappi/mcriPalettes")
```

# Usage


```r
library("mcriPalettes")

# See all palettes
names(mcri.palettes)
## [1] "MCRI"
```

# Palettes

## MCRI


```r
library("ggplot2")

mcriPalette("MCRI")
```

![](figure/MCRI-1.png)<!-- -->

```r

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point(size = 3) + 
  scale_color_manual(values = mcriPalette("MCRI")) + 
  theme_gray()
```

![](figure/MCRI-2.png)<!-- -->
