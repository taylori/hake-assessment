## -----------------------------------------------------------------------------
## The forecasting yrs and probs can be set to whatever is required, the
##  code is set up to automatically accomodate changes
## -----------------------------------------------------------------------------
forecast.yrs <- end.yr:(end.yr + 2)
forecast.probs <- c(0.05, 0.25, 0.5, 0.75, 0.95)

## -----------------------------------------------------------------------------
## catch.levels is a list of N lists of catch levels with 3 items each:
##  1. values for catch to forecast
##  2. their pretty names
##  3. their directory names
## Each element of the list is a list of length equal to the
## number of elements in forcast.yrs.
## -----------------------------------------------------------------------------
catch.levels <-
  list(list(rep(0.01, 3), "No Fishing", "01-0"),
       list(rep(180000, 3), "180,000 t", "02-180000"),
       list(rep(350000, 3), "350,000 t", "03-350000"),
       list(rep(440000, 3), "440,000 t", "04-440000"),
       list(rep(500000, 3), "500,000 t", "05-500000"),
       list(c(785000, 900000, 825000), "SPR 100", "06-spr-100"),
       list(c(830124, 955423, 837352), "Default HR", "07-default-hr"),
       list(c(928100, 928100, 820224), "Stable Catch", "08-stable-catch"))

## -----------------------------------------------------------------------------
## Indicies for the forecasts list, which list items above are the TAC case and
##  default policy case
## This is used in the one-page summary and a plot comparing several catch cases
## -----------------------------------------------------------------------------
catch.tac.ind <- 4
catch.default.policy.ind <- 6
catch.default.policy <- catch.levels[[catch.default.policy.ind]][[1]]

## The verify.catch.levels function is in verify.r
verify.catch.levels(catch.levels,
                    c(catch.tac.ind, catch.default.policy.ind),
                    forecast.yrs)

