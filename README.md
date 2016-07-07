# MCRI Palettes

<!-- README.md is generated from README.Rmd. Please edit that file -->



Colour palettes based on the MCRI branding.

Most of the code is taken from [Karthik Ram's `wesanderson` 
palette](https://github.com/karthik/wesanderson)

# Installation

```R
devtools::install_github("lazappi/mcriPalettes")
```

# Palettes


```r
library("mcriPalettes")

# See all palettes
pal.names <- names(mcri.palettes)
pal.names
##  [1] "themes"        "themesMid"     "themesLite"    "themesPaired" 
##  [5] "themesTripled" "blues"         "bluesMid"      "bluesLite"    
##  [9] "bluesPaired"   "bluesTripled"  "logo"

library("ggplot2")

gg <- ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
      geom_point(size = 3)
```

## Themes


```r
mcriPalette("themes")
```

![](figure/themes-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("themes"))
```

![](figure/themes-2.png)<!-- -->

## Themes - Mid


```r
mcriPalette("themesMid")
```

![](figure/themes-mid-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("themesMid"))
```

![](figure/themes-mid-2.png)<!-- -->

## Themes - Lite


```r
mcriPalette("themesLite")
```

![](figure/themes-lite-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("themesLite"))
```

![](figure/themes-lite-2.png)<!-- -->

## Themes - Paired


```r
mcriPalette("themesPaired")
```

![](figure/themes-paired-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("themesPaired"))
```

![](figure/themes-paired-2.png)<!-- -->

## Themes - Tripled


```r
mcriPalette("themesTripled")
```

![](figure/themes-tripled-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("themesTripled"))
```

![](figure/themes-tripled-2.png)<!-- -->

## Blues


```r
mcriPalette("blues")
```

![](figure/blues-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("blues"))
```

![](figure/blues-2.png)<!-- -->

## Blues - Mid


```r
mcriPalette("bluesMid")
```

![](figure/blues-mid-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("bluesMid"))
```

![](figure/blues-mid-2.png)<!-- -->

## Blues - Lite


```r
mcriPalette("bluesLite")
```

![](figure/blues-lite-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("bluesLite"))
```

![](figure/blues-lite-2.png)<!-- -->

## Blues - Paired


```r
mcriPalette("bluesPaired")
```

![](figure/blues-paired-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("bluesPaired"))
```

![](figure/blues-paired-2.png)<!-- -->

## Blues - Tripled


```r
mcriPalette("bluesTripled")
```

![](figure/blues-tripled-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("bluesTripled"))
```

![](figure/blues-tripled-2.png)<!-- -->

## Logo


```r
mcriPalette("logo")
```

![](figure/logo-1.png)<!-- -->

```r
gg + scale_color_manual(values = mcriPalette("logo"))
```

![](figure/logo-2.png)<!-- -->
