defmodule Wyvern.Dna do
  defstruct [:gender, :melanin, :conda]
  alias Wyvern.Genes.Gender
  alias Wyvern.Genes.Melanin
  alias Wyvern.Genes.Conda
    
  def new() do
    %Wyvern.Dna{
      gender: Gender.new(), 
      melanin: Melanin.new(), 
      conda: Conda.new()
    }
  end
  
  def new(dna1, dna2) do
    %Wyvern.Dna{
      gender: Gender.new(dna1.gender, dna2.gender), 
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
end
