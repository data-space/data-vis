---
title: "Visualization_R"
author: "Hanh Nguyen"
date: "3/31/2017"
output: word_document
---

Libraries used
```{r setup, include = FALSE}
library(ggplot2)
library(dplyr)
library(ggrepel)
```

## Labels

```{r}
mtcars %>%
  ggplot(aes(x = hp, y = mpg)) +
  geom_point(color = 'red') +
  geom_text(aes(hp, mpg, label = rownames(mtcars)),size=3)
```

## Labels using ggrepel

ggrepel implements functions to repel overlapping text labels away from each other and away from the data points that they label.

```{r}
mtcars %>%
  ggplot(aes(x = hp, y = mpg)) +
  geom_point(color = 'red') +
  geom_text_repel(aes(hp, mpg, label = rownames(mtcars)),size=3)
```

## Two (2) numeric variables, one (1) categorical variable and data labels

```{r}
mtcars$cylF = factor(mtcars$cyl,
                    levels = c(4,6,8),
                    labels = c("4cyl","6cyl","8cyl"))

mtcars %>%
  ggplot(aes(x = hp, y = mpg)) +
  geom_point(aes(color = cylF)) +
  geom_text_repel(aes(hp, mpg, label = rownames(mtcars)),size=3)
```

## Facets

facet_wrap() defines subsets as the levels of a single grouping variable and splits the plot across categories.  
facet_grid() defines subsets as the crossing of two grouping variables, creates different grids and then plots each plot in the grids instead of creating different plots.  

```{r}
diamonds %>%
  ggplot(aes(x=price)) +
  geom_histogram(binwidth=1000) +
  facet_wrap(~ color)
```

The above example keeps the scales constant across all panels, but we can choose to the x scale, the y scale, or both.

```{r}
diamonds %>%
  ggplot(aes(x=cut)) +
  geom_bar() +
  facet_wrap(~ color, labeller=label_both, scale="free_y") +
  theme_light()
```

## Sources
https://cran.r-project.org/web/packages/ggrepel/vignettes/ggrepel.html
http://docs.ggplot2.org/0.9.3.1/facet_wrap.html


