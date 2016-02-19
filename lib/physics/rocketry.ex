defmodule Physics.Rocketry do

  import Calcs
  import Planets
  import Physics.Laws

  def escape_velocity(:earth) do
    Planets.earth
      |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  def orbital_acceleration(height), do: orbital_acceleration(Planets.earth, height)
  def orbital_acceleration(:earth, height), do: orbital_acceleration(Planets.earth, height)
  def orbital_acceleration(:mars, height), do: orbital_acceleration(Planets.mars, height)
  def orbital_acceleration(:moon, height), do: orbital_acceleration(Planets.moon, height)
  def orbital_acceleration(planet, height) do
    (orbital_speed(planet, height) |> squared) / orbital_radius(planet, height)
  end

  def orbital_speed(height), do: orbital_speed(Planets.earth, height)
  def orbital_speed(:earth, height), do: orbital_speed(Planets.earth, height)
  def orbital_speed(:mars, height), do: orbital_speed(Planets.mars, height)
  def orbital_speed(:moon, height), do: orbital_speed(Planets.moon, height)
  def orbital_speed(planet, height) do
    newtons_gravitational_constant * planet.mass  / orbital_radius(planet, height)
      |> square_root
  end

  def orbital_term(planet, height) do
    4 * (:math.pi |> squared) * (orbital_radius(planet, height) |> cubed) / (newtons_gravitational_constant * planet.mass)
      |> square_root
      |> seconds_to_hours
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_radius(planet, height) do
    planet.radius + (height |> to_m)
  end

end
