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

  @type options :: [flags: String.t()] | Keyword.t()

  @callback resolve(String.t(), options()) :: {:ok, GetIpIntel.Result.t()} | {:error | atom}
  def resolve(ip_address, options \\ []) do
    impl().resolve(ip_address, options)
  end

  defp impl, do: Application.fetch_env!(:get_ip_intel, :impl)
end
