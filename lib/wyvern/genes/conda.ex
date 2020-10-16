defmodule Wyvern.Genes.Conda do
  @behaviour Wyvern.Gene
  def phenotype(gene) do
    case Enum.sort(gene) do
      [:n, :n] -> "normal"
      [:c, :n] -> "conda"
      [:c, :c] -> "superconda"
    end
  end
  def new(gene1, gene2) do
    Wyvern.Gene.new(gene1, gene2)
  end
  def new() do
    pick = Enum.random(1..3)
    case pick do
      1 -> [:c, :n]
      _ -> [:n, :n]
    end
  end
end
