defmodule Wyvern.Gene do
  @callback phenotype(arg :: list(any)) :: bitstring() # one or two word description of result
  @callback new(arg :: list(any), list(any)) :: list(any) # if you have two parents, use Wyvern.Gene.new(value1, value2)
  @callback new() :: list(any) # if it is wild caught, define your defaults. 
  
  @spec new([...], [...]) :: [...]
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
