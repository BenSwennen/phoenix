use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :rialto, Rialto.Endpoint,
  secret_key_base: "u0lFyPFe42D/9z342uhH1XrTI4zyI8rT//wS6VVqdRecMzv/n/zr8GUr1Vn/AGwW"

# Configure your database
config :rialto, Rialto.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rialto_prod",
  pool_size: 20
