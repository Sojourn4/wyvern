defmodule Wyvern.Clutch do
  @moduledoc """
  A clutch is a collection of animals. Whenever a new animal is added, it's wrapped in a clutch.
  """
  defstruct [:id, :father, :mother, :pair_date, :lay_date, :hatch_date, :number_of_eggs, :fertility]
  
  @doc """
  New wild-caught wyvern(s). No father or mother provided. Returns the clutch.
  """
  def new(id, number_of_eggs, pair_date, {father, mother}) do
    fertility = Wyvern.Dna.fertility(father.dna, mother.dna)
    
    clutch = %Wyvern.Clutch{
      id: id,
      pair_date: pair_date,
      lay_date: Date.add(pair_date, 30),
      hatch_date: Date.add(pair_date, 90),
      number_of_eggs: number_of_eggs,
      fertility: fertility
    }
    # hatchlings = (0..number_of_hatchlings) |> Enum.reduce(fn i, list -> [Wyvern.Animal.new(animal_id_start + i, clutch) | list] end) 
    
    clutch
  end
  
  def hatch(clutch) do
    fertility = clutch.fertility
    
    low = Integer.floor_div(fertility, 2)
    high = fertility * 2
    
    Enum.random(low..high)
  end
  
end
