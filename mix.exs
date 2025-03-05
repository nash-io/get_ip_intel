defmodule GetIpIntel.MixProject do
  use Mix.Project

  def project do
    [
      app: :get_ip_intel,
      version: "0.1.1",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      test_coverage: [tool: ExCoveralls],
      dialyzer: [
        ignore_warnings: ".dialyzer_ignore.exs",
        list_unused_filters: true,
        plt_core_path: "priv/plts/",
        plt_add_apps: [:mix]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:http_client, "~> 0.2.0"},
      {:mox, "~> 0.5", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.12"},
      {:ex_unit_sonarqube, "~> 0.1.2"},
      {:credo, "~> 1.0", runtime: false},
      {:git_hooks, "~> 0.3", runtime: false},
      {:dialyxir, "~> 1.0", runtime: false}
    ]
  end

  defp description do
    "getipintel lib."
  end

  defp package do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "get_ip_intel",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/nash-io/get_ip_intel"}
    ]
  end
end
