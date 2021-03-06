make.reference.points.table <- function(model,
                                        xcaption = "default",
                                        xlabel   = "default",
                                        font.size = 9,
                                        space.size = 10,
                                        placement = "H"){
  ## Returns an xtable in the proper format for the executive summary
  ##  reference points. The values are calculated previously in the calc.mcmc
  ##  function in load-models.r.
  ##
  ## model - an mcmc run, output of the r4ss package's function SSgetMCMC()
  ## probs - values to use for the quantile funcstion
  ## xcaption - caption to appear in the calling document
  ## xlabel - the label used to reference the table in latex
  ## font.size - size of the font for the table
  ## space.size - size of the vertical spaces for the table

  m <- model$mcmccalcs
  tab <- rbind(m$unfish.fem.bio,
               m$unfish.recr,
               m$f.spawn.bio.bf40,
               m$spr.msy.proxy,
               m$exp.frac.spr,
               m$yield.bf40,
               m$fem.spawn.bio.b40,
               m$spr.b40,
               m$exp.frac.b40,
               m$yield.b40,
               m$fem.spawn.bio.bmsy,
               m$spr.msy,
               m$exp.frac.sprmsy,
               m$msy)
  descr <- c("Unfished female spawning biomass ($B_0$, thousand t)",
             "Unfished recruitment ($R_0$, millions)",
             "Female spawning biomass at $\\Fforty$ (thousand t)",
             "SPR at $\\Fforty$",
             "Exploitation fraction corresponding to $\\Fforty$",
             "Yield associated with $\\Fforty$ (thousand t)",
             "Female spawning biomass ($B_{40\\%}$, thousand t)",
             "SPR at $B_{40\\%}$",
             "Exploitation fraction resulting in $B_{40\\%}$",
             "Yield at $B_{40\\%}$ (thousand t)",
             "Female spawning biomass ($B_{\\text{MSY}}$, thousand t)",
             "SPR at MSY",
             "Exploitation fraction corresponding to SPR at MSY",
             "MSY (thousand t)")
  tab <- cbind(descr, tab)
  colnames(tab) <- c(latex.bold("Quantity"),
                     latex.mlc(c(latex.supscr("2.5", "th"),
                                 "percentile")),
                     latex.bold("Median"),
                     latex.mlc(c(latex.supscr("97.5", "th"),
                                 "percentile")))
  addtorow <- list()
  addtorow$pos <- list()
  addtorow$pos[[1]] <- 2
  addtorow$pos[[2]] <- 6
  addtorow$pos[[3]] <- 10
  addtorow$command <-
    c(paste0(latex.nline,
             latex.bold(latex.under(paste0("Reference points (equilibrium) ",
                                           "based on $\\Fforty$"))),
      latex.nline),
      paste0(latex.nline,
             latex.bold(latex.under(paste0("Reference points (equilibrium) ",
                                           "based on $B_{40\\%}$ (40\\% of ",
                                           "$B_0$)"))),
      latex.nline),
      paste0(latex.nline,
             latex.bold(latex.under(paste0("Reference points (equilibrium) ",
                                           "based on estimated MSY"))),
      latex.nline))

  size.string <- latex.size.str(font.size, space.size)
  print(xtable(tab,
               caption = xcaption,
               label = xlabel,
               align = get.align(ncol(tab),
                                 just="c")),
        caption.placement = "top",
        include.rownames = FALSE,
        sanitize.text.function = function(x){x},
        size = size.string,
        add.to.row = addtorow,
        table.placement = placement)
}

