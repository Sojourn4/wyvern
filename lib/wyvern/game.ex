defmodule Wyvern.Game do
  defstruct [:date, :player_name, :clutches, :wyverns]
  
  def init(player_name) do
    %Wyvern.Game{
      date: ~D[2100-01-01],
      player_name: player_name,
      clutches: [],
      wyverns: []
    }
  end
  
  def add_clutch(game, {father, mother}) do
    clutch = Wyvern.Clutch.new(length(game.clutches), 4, game.date, {father, mother})
    %Wyvern.Game{
      date: game.date,
      player_name: game.player_name,
      clutches: [clutch | game.clutches],
      wyverns: game.wyverns
    }
  end
  
  def add_pairing(game, {father, mother}) do
    clutch = Wyvern.Clutch.new(length(game.clutches), 4, Date.add(game.date, - 30), {father, mother})
    %Wyvern.Game{
      date: game.date,
      player_name: game.player_name,
      clutches: [clutch | game.clutches],
      wyverns: game.wyverns
    }
  end
  
  # We need a calendar action, where we can see when certain things will happen. 
  # We need a skip-ahead option, which will go forward to the next event on the calendar
  # We need the clutches to hatch when they are ready.
  # We need the animals to have a "mature" age, before which they cannot be paired
  # We need to make sure we have one female and one male before pairing
end
