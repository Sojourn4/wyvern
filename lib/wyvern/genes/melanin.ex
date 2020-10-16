defmodule Wyvern.Genes.Melanin do
  @behaviour Wyvern.Gene
  def phenotype(gene) do
    case Enum.sort(gene) do
      gene when gene in [[:a, :n], [:a, :h], [:h, :n], [:n, :n]]  -> "normal"
      [:a, :a]                                                    -> "amelanistic"
      [:h, :h]                                                    -> "hypermelanistic"
    end
  end
  def new(gene1, gene2) do
    Wyvern.Gene.new(gene1, gene2)
  end
  def new() do
    pick = Enum.random(1..5)
    case pick do
      1 -> [:a, :n]
      2 -> [:h, :n]
      _ -> [:n, :n]
    end
  end
end
