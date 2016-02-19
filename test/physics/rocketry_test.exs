defmodule Physics.RocketryTest do
  use ExUnit.Case, async: true
  alias Physics.Rocketry
  import Calcs

  test "escape_velocity calculates velocity of Mars" do
    assert Rocketry.escape_velocity(%{mass: 6.39e23, radius: 3.4e6}) == 5.1
  end

  test "escape_velocity calculates velocity of Moon" do
    assert Rocketry.escape_velocity(%{mass: 7.35e22, radius: 1.738e6}) == 2.4
  end

  test "escape_velocity/:earth calculates Earth velocity" do
    assert Rocketry.escape_velocity(:earth) == 11.2
  end

  test "orbital_speed/1 calculates orbital speed of Earth" do
    assert Rocketry.orbital_speed(10) |> to_nearest_tenth == 7901.6
  end

  test "orbital_speed calculates orbital speed of Moon" do
    assert Rocketry.orbital_speed(:moon, 10) |> to_nearest_tenth == 1674.7
  end

  test "orbital_speed calculates orbital speed of Mars" do
    assert Rocketry.orbital_speed(:mars, 10) |> to_nearest_tenth == 3535.4
  end

  test "orbital_acceleration/1 calculates orbital speed of Earth" do
    assert Rocketry.orbital_acceleration(10) |> to_nearest_tenth == 9.8
  end

  test "orbital_acceleration calculates orbital speed of Moon" do
    assert Rocketry.orbital_acceleration(:moon, 10) |> to_nearest_tenth == 1.7
  end

  test "orbital_acceleration calculates orbital speed of Mars" do
    assert Rocketry.orbital_acceleration(:mars, 10) |> to_nearest_tenth == 3.7
  end

end
