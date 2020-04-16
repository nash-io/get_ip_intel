defmodule GetIpIntel do
  @moduledoc """
  Documentation for GetIpIntel.
  """

  defmodule Result do
    @moduledoc false
    @type t :: %__MODULE__{
            score: number
          }
    defstruct score: nil
  end

  @callback resolve(String.t()) :: {:ok, GetIpIntel.Result.t()} | {:error | atom}
  def resolve(ip_address) do
    impl().resolve(ip_address)
  end

  defp impl, do: Application.fetch_env!(:get_ip_intel, :impl)

  def reset_cache, do: Cachex.clear(:get_ip_intel_lookup_cache)
end
