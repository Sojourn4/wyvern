defmodule Wyvern.Genes.Fertility do
  @behaviour Wyvern.Gene
  def phenotype(_gene) do
    ""
  end
  def new(gene1, gene2) do
    Wyvern.Gene.new(gene1, gene2)
  end
  def new() do
    a = Enum.random(5..10)
    b = Enum.random(0..5)
    [a, b]
  end
end
