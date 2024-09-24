dd <- read.table(
  file = "data/practical_20240926.csv",
  header = TRUE,
  sep = ","
)

# Answer to question 2
nrow(dd[dd$outcome_id == 1, ])

# Answer to question 3
sum(dd[dd$outcome_id == 1, ]$n_celecoxib)
sum(dd[dd$outcome_id == 1, ]$n_placebo)

# Answer to question 4
mean(dd[dd$outcome_id == 1, ]$mean_celecoxib)
mean(dd[dd$outcome_id == 1, ]$mean_placebo)

# Answer to question 5
sum(is.na(dd[dd$outcome_id == 1, ]$year))

# Answer to question 6
nrow(dd[dd$outcome_id == 19, ])

# Answer to question 7
m_celecoxib <- dd[dd$id == "STD-Asmus-2014-Study-1" & dd$outcome_id == 1, ]$mean_celecoxib
m_placebo <-  dd[dd$id == "STD-Asmus-2014-Study-1" & dd$outcome_id == 1, ]$mean_placebo

sd_celecoxib <- dd[dd$id == "STD-Asmus-2014-Study-1" & dd$outcome_id == 1, ]$sd_celecoxib
sd_placebo <- dd[dd$id == "STD-Asmus-2014-Study-1" & dd$outcome_id == 1, ]$sd_placebo

sd_pooled <- sqrt((sd_celecoxib**2 + sd_placebo**2) / 2)

(m_celecoxib - m_placebo) / sd_pooled


# Answer to question 8
min(dd[dd$outcome_id == 1, ]$year, na.rm = T)
max(dd[dd$outcome_id == 1, ]$year, na.rm = T)
median(dd[dd$outcome_id == 1, ]$year, na.rm = T)

# Answer to question 9
sum(dd[dd$outcome_id == 19, ]$n_celecoxib)
sum(dd[dd$outcome_id == 19, ]$n_placebo)

# Answer to question 10
mean(dd[dd$outcome_id == 19, ]$event_celecoxib)
mean(dd[dd$outcome_id == 19, ]$event_placebo)

# Answer to question 11
events_celecoxib <- dd[dd$id == "STD-Asmus-2014-Study-1" & dd$outcome_id == 19, ]$event_celecoxib
n_celecoxib <- dd[dd$id == "STD-Asmus-2014-Study-1" & dd$outcome_id == 19, ]$n_celecoxib
events_placebo <- dd[dd$id == "STD-Asmus-2014-Study-1" & dd$outcome_id == 19, ]$event_placebo
n_placebo <- dd[dd$id == "STD-Asmus-2014-Study-1" & dd$outcome_id == 19, ]$n_placebo

(events_celecoxib/n_celecoxib) / (events_placebo/n_placebo)
