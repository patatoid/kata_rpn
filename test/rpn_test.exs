defmodule RpnTest do
  use ExUnit.Case
  doctest Rpn

  test "greets the world" do
    assert Rpn.hello() == :world
  end
end
