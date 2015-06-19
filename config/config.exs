# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :stripe,
  # Test keys
  test_secret_key: System.get_env("TEST_SECRET_KEY")
  test_publishable_key: System.get_env("TEST_PUBLISHABLE_KEY")
  # Live keys
  live_secret_key: System.get_env("LIVE_SECRET_KEY")
  live_publishable_key: System.get_env("LIVE_PUBLISHABLE_KEY")
