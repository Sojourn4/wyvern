defmodule Wyvern do
  @moduledoc """
  Documentation for `Wyvern`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Wyvern.hello()
      :world

  """
  def start do
    player_name = IO.gets("Hello! Welcome to Wyvern. What's your name?  ")
    game = Wyvern.Game.init(player_name)
    
    message("Hi, #{player_name}! Welcome to your lab. It's not much, but it's what we can provide right now.")
    message("There's room for incubation racks over there, and space for some enclosures here.")
    message("Oh! And to get you started, some of the kids found these odd eggs on the beach")
    message("They aren't like chicken eggs, so I don't know what they are. Maybe some kind of reptile?")
    message("Anyways, here you are. There's four of them intact, the others washed away.")
    message("Good luck! And if you have any questions, just ask! (h)")
    
    message(" -- You now have a clutch of four eggs.")
    
    await_instruction()
  end
  
  defp await_instruction() do
    instruction = IO.gets("What would you like to do?  ")
    
    action(instruction)
  end
  
  defp action("h\n") do
    message(" -- Help --")
    IO.puts("(h)elp")
    IO.puts("e(x)it")
    
    await_instruction()
  end
  
  defp action("x\n") do
    message("Good-bye!")
    
    System.halt(0)
  end
  
  defp action(input) do
    message("I don't know what (#{input}) means...")
  end
  
  defp message(message) do
    :timer.sleep(1000)
    IO.puts message
  end
end
