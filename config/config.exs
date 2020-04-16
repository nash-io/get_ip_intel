# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
import Config

config :get_ip_intel,
  impl: GetIpIntel.DefaultImpl,
  cache_ttl_ms: 3_600_000 * 12,
  contact: "test",
  domain: "test"

config :http_client, http_client_impl: HTTPoison