defmodule Wyvern.Animal do
  defstruct [:id, :clutch, :dna, :name, :death_date]
  
  
  
  def new(:unknown_parent, options \\ []) do
    gender = Keyword.get(options, :gender, Wyvern.Genes.Gender.new())
    %Wyvern.Animal{ 
      id: nil,
      clutch: nil,
      name: "wild",
      death_date: nil,
      dna: Wyvern.Dna.new(gender: gender)
    }
  end
  
  def new(id, clutch) do
    %Wyvern.Animal{
      id: id,
      clutch: clutch,
      name: "",
      death_date: nil,
      dna: Wyvern.Dna.new()
    }
  end
end
