defmodule WyvernTest do
  use ExUnit.Case
  doctest Wyvern

  test "greets the world" do
    assert Wyvern.hello() == :world
  end
end
