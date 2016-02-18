defmodule Physics.PlanetTest do
  alias Physics.Planet
  use ExUnit.Case

  test "creates earth planet structure" do
    planet = %Planet{}
    assert planet.name == "Earth"
  end

end
