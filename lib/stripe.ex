defmodule Stripe do
  use HTTPotion.Base

  @spec process_url(String.t) :: String.t
  def process_url(path) do
    "https://api.stripe.com/" <> path
  end

  @spec process_request_headers(map) :: map
  def process_request_headers(headers) do
    Dict.put headers, :Authorization, "Bearer #{test_secret_key}"
  end

  defp secret_key do
    System.get_env("TEST_SECRET_KEY") || Application.get_env(:stripe, :test_secret_key)
  end
end
