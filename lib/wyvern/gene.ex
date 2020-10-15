defmodule Wyvern.Gene do
  def new([a, b], [c, d]) do
    pick = Enum.random(1..4)
    case pick do
      1 ->
        [a,c]
      2 ->
        [b,c]
      3 ->
        [a, d]
      4 ->
        [b,d]
    end
  end
end
