defmodule GetIpIntel.DefaultImpl do
  @moduledoc """
    ```
      config :get_ip_intel, contact: "email@email.com,
                            domain: "aphetcq98"
    ```
  """

  alias GetIpIntel.Parser

  require Logger

  @default_flags "m"

  @spec resolve(String.t(), GetIpIntel.options()) :: {:ok, map} | {:error | atom}
  def resolve(ip_address, options) do
    ip_address
    |> call(options)
    |> Parser.parse()
  end

  def call(ip_address, options) do
    flags = Keyword.get(options, :flags, @default_flags)
    query = URI.encode_query(%{ip: ip_address, contact: contact(), flags: flags})
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
