defmodule Wyvern.Clutch do
  @moduledoc """
  A clutch is a collection of animals. Whenever a new animal is added, it's wrapped in a clutch.
  """
  defstruct [:id, :father, :mother, :pair_date, :lay_date, :hatch_date, :wyverns]
  
  @doc """
  New wild-caught wyvern(s). No father or mother provided.
  """
  def new(id, animal_id_start, number_of_hatchlings, pair_date) do
    hatchlings = (0..number_of_hatchlings) |> Enum.reduce(fn i, list -> [Wyvern.Animal.new(animal_id_start + i, id) | list] end) 
    
    
    %Wyvern.Clutch{
      id: id,
      pair_date: pair_date,
      lay_date: Date.add(pair_date, 30),
      hatch_date: Date.add(pair_date, 90),
      wyverns: hatchlings
    }
  end
end
