defmodule Wyvern.Genes.Gender do
  @behaviour Wyvern.Gene
  def phenotype(gene) do
    case Enum.sort(gene) do
      [:x, :y] -> "male"
      [:x, :x] -> "female"
    end
  end
  def new(gene1, gene2) do
    Wyvern.Gene.new(gene1, gene2)
  end
  def new() do
    Wyvern.Gene.new([:x, :x], [:x, :y])
  end
end
