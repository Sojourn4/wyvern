defmodule Wyvern.Cli do
  def start do
    player_name = IO.gets("Hello! Welcome to Wyvern. What's your name?  ")
    game = Wyvern.Game.init(player_name)
    
    message("Hi, #{player_name}! Welcome to your lab. It's not much, but it's what we can provide right now.")
    message("There's room for incubation racks over there, and space for some enclosures here.")
    message("Oh! And to get you started, some of the kids found these odd eggs on the beach")
    message("They aren't like chicken eggs, so I don't know what they are. Maybe some kind of reptile?")
    message("Anyways, here you are. There's four of them intact, the others washed away.")
    message("Good luck! And if you have any questions, just ask! (h)")
    
    new_clutch(game)
    
    message(" -- You now have a clutch of four eggs.")
    
    message("Check out your (i)ncubation tray!")
    
    await_instruction(game)
  end
  
  def new_clutch(game, options \\ []) do
    {father, mother} = Keyword.get(options, :parents, {
        Wyvern.Animal.new(:unknown_parent, gender: [:x, :y]),
        Wyvern.Animal.new(:unknown_parent, gender: [:x, :x])
      })
    
    Wyvern.Game.add_clutch(game, {father, mother})
  end
  
  def new_pairing(game, {father, mother}, _options \\ []) do
    message(" -- #{mother.name} looks gravid! She may lay eggs fairly soon.")
    Wyvern.Game.add_pairing(game, {father, mother})
  end
  
  defp await_instruction(game) do
    instruction = IO.gets("What would you like to do?  ")
    
    action(game, instruction)
  end
  
  defp action(game, "h\n") do
    message(" -- Help --")
    IO.puts("(h)elp")
    IO.puts("e(x)it")
    
    await_instruction(game)
  end
  
  defp action(game, "x\n") do
    message("Good-bye!")
    
    System.halt(0)
  end
  
  defp action(game, input) do
    message("I don't know what (#{input}) means...")
  end
  
  def message(message) do
    :timer.sleep(1000)
    IO.puts message
  end
end
