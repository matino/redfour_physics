defmodule Solar do

  def power(%{classification: :X, scale: s}), do: s * 1000
  def power(%{classification: :M, scale: s}), do: s * 10
  def power(%{classification: :C, scale: s}), do: s

  def no_eva(flares) do
    Enum.filter(flares, &(power(&1) > 1000))
  end

  def deadliest(flares) do
    Enum.map(flares, &(power(&1)))
      |> Enum.max
  end

end