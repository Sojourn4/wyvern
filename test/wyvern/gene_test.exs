defmodule Wyvern.GeneTest do
  use ExUnit.Case
  doctest Wyvern.Gene

  test "new returns a list of 2" do
    newgene = Wyvern.Gene.new([:a, :b], [:c, :d])
    IO.inspect(newgene)
    assert length(newgene) == 2
  end
end
