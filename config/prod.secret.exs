use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :beam_toolbox, BeamToolbox.Endpoint,
  secret_key_base: "jR0/80laO7f98UFKK8435NHTulQSZhBc8giga3mDdHNdAYO3y5943h5Mpgm8pITA"

# Configure your database
config :beam_toolbox, BeamToolbox.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "beam_toolbox_prod"
