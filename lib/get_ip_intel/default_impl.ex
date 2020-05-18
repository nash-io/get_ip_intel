defmodule GetIpIntel.DefaultImpl do
  alias GetIpIntel.Parser

  @moduledoc """
    ```
      config :get_ip_intel, contact: "email@email.com,
                            domain: "aphetcq98"
    ```
  """
  require Logger

  @spec resolve(String.t()) :: {:ok, map} | {:error | atom}
  def resolve(ip_address) do
    ip_address
    |> call()
    |> Parser.parse()
  end

  def call(ip_address) do
    query = URI.encode_query(%{ip: ip_address, contact: contact(), flags: "m"})
    url = "http://#{domain()}.getipintel.net/check.php?#{query}"

    case HttpClient.get(url) do
      {:ok, %{body: score, status_code: 200}} ->
        {:ok, score}

      {:error, response} ->
        Logger.warn(inspect(response))
        {:error, :api}
    end
  end

  def contact do
    Application.fetch_env!(:get_ip_intel, :contact)
  end

  def domain do
    Application.fetch_env!(:get_ip_intel, :domain)
  end
end
