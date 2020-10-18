defmodule Wyvern.Game do
  defstruct [:date]
  
  def init(player_name) do
    %{
      date: ~D[2100-01-01],
      player_name: player_name,
      wyverns: Wyvern.Clutch.new(0, 0, 4, ~D[2100-01-01])
    }
  end
end
