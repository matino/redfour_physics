defmodule CalcsTest do
  use ExUnit.Case, async: true
  import Calcs

  test "squared/1 returns square of the number" do
    assert squared(16) == 256
  end

  test "square_root/1 returns a square root" do
    assert square_root(256) == 16
  end

  test "cubed/1 returns cude of the number" do
    assert cubed(4) == 64
  end

end