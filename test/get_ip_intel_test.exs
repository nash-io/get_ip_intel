defmodule GetIpIntelTest do
  use ExUnit.Case
  import Mox

  setup :set_mox_global

  test "resolve work with default flag" do
    expect(GetIpIntel.HttpClientMockImpl, :get, fn url ->
      assert String.contains?(url, "flags=m")
      {:ok, %HTTPoison.Response{body: "0.99", status_code: 200}}
    end)

    assert {:ok, %GetIpIntel.Result{score: 0.99}} = GetIpIntel.resolve("134.201.250.155")
  end

  test "resolve work with passed flag" do
    expect(GetIpIntel.HttpClientMockImpl, :get, fn url ->
      assert String.contains?(url, "flags=f")
      {:ok, %HTTPoison.Response{body: "0.99", status_code: 200}}
    end)

    assert {:ok, %GetIpIntel.Result{score: 0.99}} =
             GetIpIntel.resolve("134.201.250.155", flags: "f")
  end
end
