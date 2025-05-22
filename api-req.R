library(httr2)
library(tidyverse)

# https://fintualist.com/chile/tecnologia/el-api-de-fintual/

# Probando la API
url <- "https://fintual.cl/api/real_assets/186/days?from_date=2025-01-01&to_date=2025-05-21"

response <- request(url) |> req_perform()
data <- resp_body_json(response)
df <- data$data |>
  map_dfr(~ .x$attributes)

# Ajustando los parámetros
start_date <- "2025-01-01"
end_date <- "2025-05-21"
asset_id <- 186 # Risky Norris

url <- sprintf(
  "https://fintual.cl/api/real_assets/%s/days?from_date=%s&to_date=%s",
  asset_id,
  start_date,
  end_date
)

response <- request(url) |> req_perform()
data <- resp_body_json(response)
df <- data$data |> map_dfr(~ .x$attributes)

# Preprocesamieto
df <- df |>
  mutate(date = as.Date(date))
