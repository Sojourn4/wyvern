defmodule Wyvern.Animal do
  defstruct [:id, :clutch_id, :dna, :name, :death_date]
  
  def new(id, clutch_id) do
    %Wyvern.Animal{
      id: id,
      clutch_id: clutch_id,
      name: "",
      death_date: nil,
      dna: Wyvern.Dna.new()
    }
  end
end
