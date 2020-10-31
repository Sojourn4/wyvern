defmodule Wyvern.Dna do
  defstruct [:gender, :fertility, :melanin, :conda]
  alias Wyvern.Genes.Gender
  alias Wyvern.Genes.Fertility
  alias Wyvern.Genes.Melanin
  alias Wyvern.Genes.Conda
    
  def new(options \\ []) do
    gender = Keyword.get(options, :gender, Gender.new())
    fertility = Keyword.get(options, :fertility, Fertility.new())
    melanin = Keyword.get(options, :melanin, Melanin.new())
    conda = Keyword.get(options, :conda, Conda.new())
    
    %Wyvern.Dna{
      gender: gender, 
      fertility: fertility, 
      melanin: melanin, 
      conda: conda
    }
  end
  
  def new(dna1, dna2) do
    %Wyvern.Dna{
      gender: Gender.new(dna1.gender, dna2.gender), 
      fertility: Melanin.new(dna1.fertility, dna2.fertility), 
      melanin: Melanin.new(dna1.melanin, dna2.melanin), 
      conda: Conda.new(dna1.conda, dna2.conda)
    }
  end
  
  def phenotype(dna) do
    gender = Gender.phenotype(dna.gender)
    melanin = Melanin.phenotype(dna.melanin)
    conda = Conda.phenotype(dna.conda)
    
    "#{gender} #{melanin} #{conda}"
  end
  
  # takes two dnas, returns the max value of eggs
  def fertility(dna1, dna2) do
    Integer.floor_div((Enum.sum(dna1.fertility) + Enum.sum(dna2.fertility)), 2)
  end
end
