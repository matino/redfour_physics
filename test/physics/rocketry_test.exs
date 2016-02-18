defmodule Physics.RocketryTest do
  use ExUnit.Case, async: true
  alias Physics.Rocketry

  test "escape_velocity/1 calculates velocity of a given planet" do
    assert Rocketry.escape_velocity(%{mass: 5, radius: 10}) == 0.1
  end

  test "escape_velocity/:earth calculates earth velocity" do
    assert Rocketry.escape_velocity(:earth) == 11.2
  end

end
