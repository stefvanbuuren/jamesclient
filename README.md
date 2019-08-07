
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jamesclient

<!-- badges: start -->

<!-- badges: end -->

The goal of `jamesclient` is to ease interaction for `R` users with the
**Joint Anthropometric Measurement and Evaluation System (JAMES)**.
JAMES is an **experimental** online resource for creating and analysing
growth charts.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
install.packages("remotes")
remotes::install_github("stefvanbuuren/jamesclient")
```

## Example

The primary functions are:

| Function          | Description                                     |
| ----------------- | ----------------------------------------------- |
| `upload_bds()`    | Upload BDS-data, convert to `individual` format |
| `request_chart()` | Upload BDS-data, draw chart with child data     |
| `request_site()`  | Upload BDS-data, creates a personalised site    |

### `upload_bds()`

Upload BDS data and create object of class `individual` on server:

``` r
library(jamesclient)
fn <- file.path(path.package("jamesclient"), "testdata", "client3.json")
r1 <- upload_bds(fn)
browseURL(get_url(r1, "return"))
```

### `request_chart()`

Make a combined upload and automatic chartcode choice:

``` r
r2 <- request_chart(fn)
browseURL(get_url(r2, "svg"))
```

### `request_site()`

Combine upload and construction of interactive site:

``` r
url <- request_site(fn)
browseURL(url)
```
