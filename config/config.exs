# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
import Config

config :get_ip_intel,
  impl: GetIpIntel.DefaultImpl,
  contact: System.get_env("GET_IP_INTEL_CONTACT"),
  domain: System.get_env("GET_IP_INTEL_DOMAIN")

config :http_client, http_client_impl: HTTPoison
