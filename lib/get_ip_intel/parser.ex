defmodule GetIpIntel.Parser do
  @moduledoc """
    GetIpIntel parser
  """

  def parse({:ok, result}) do
    {score, _} = Float.parse(result)
    {:ok, %GetIpIntel.Result{score: score}}
  end

  def parse(result), do: result
end
