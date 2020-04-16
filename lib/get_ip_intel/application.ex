defmodule GetIpIntel.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  @cache_expiration Application.fetch_env!(:get_ip_intel, :cache_ttl_ms)

  import Cachex.Spec
  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    import Supervisor.Spec

    children = [
      worker(Cachex, [
        :get_ip_intel_lookup_cache,
        [expiration: expiration(default: @cache_expiration)]
      ])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GetIpIntel.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
