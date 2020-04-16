defmodule GetIpIntelTest do
  use ExUnit.Case
  import Mox

  setup :set_mox_global

  setup do
    GetIpIntel.reset_cache()
    :ok
  end

  test "resolve work and cache" do
    GetIpIntel.HttpClientMockImpl
    |> expect(:get, fn _ ->
      {:ok, %HTTPoison.Response{body: "0.99", status_code: 200}}
    end)

    assert {:ok, %GetIpIntel.Result{score: 0.99}} = GetIpIntel.resolve("134.201.250.155")

    assert {:ok, 1} == Cachex.size(:get_ip_intel_lookup_cache)
    assert {:ok, %GetIpIntel.Result{score: 0.99}} = GetIpIntel.resolve("134.201.250.155")
  end
end
