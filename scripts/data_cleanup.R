dd1 <- meta::read.rm5("data/CD009865StatsDataOnly.rm5")

dd2 <- as.data.frame(dd1)

dd2 |>
  dplyr::filter(
    comp.no == 3,
    outcome.no %in% c(1, 19)
  ) |>
  dplyr::select(
    c(id, studlab, year, outcome.no,
      event.e, n.e, event.c,
      n.c, mean.e, sd.e,
      mean.c, sd.c)
  ) |>
  dplyr::mutate(
    outcome_name = ifelse(
      outcome.no == 1,
      "All pain < 24 weeks",
      "Number withdrawn due to adverse events"
    )
  ) |>
  dplyr::rename(
    c(
      "study" = "studlab",
      "outcome_id" = "outcome.no",
      "event_celecoxib" = "event.e",
      "event_placebo" = "event.c",
      "n_celecoxib" = "n.e",
      "n_placebo" = "n.c",
      "mean_celecoxib" = "mean.e",
      "mean_placebo" = "mean.c",
      "sd_celecoxib" = "sd.e",
      "sd_placebo" = "sd.c"
    )
  ) |>
  dplyr::relocate(outcome_name, .after = outcome_id) |>
  readr::write_csv("data/practical_20240926.csv")

