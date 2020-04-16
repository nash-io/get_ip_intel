Mox.defmock(GetIpIntel.HttpClientMockImpl, for: HttpClient)

Application.put_env(:http_client, :http_client_impl, GetIpIntel.HttpClientMockImpl)

ExUnit.configure(formatters: [ExUnit.CLIFormatter, ExUnitSonarqube])
ExUnit.start()
