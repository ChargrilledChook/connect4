# Strings go here
module Display
  def title
    <<~HERE

  _____                             _       ___
 /  __ \\                           | |     /   |
 | /  \\/ ___  _ __  _ __   ___  ___| |_   / /| |
 | |    / _ \\| '_ \\| '_ \\ / _ \\/ __| __| / /_| |
 | \\__/\\ (_) | | | | | | |  __/ (__| |_  \\___  |
  \\____/\\___/|_| |_|_| |_|\\___|\\___|\\__|     |_/


    HERE
  end

  def welcome_msg
    "\nWelcome to Connect 4!\n\n"
  end

  def move_prompt(player)
    "\n#{player}, it's your move! "
  end

  def win_msg(name)
    "\nCongratulations, #{name}! You won!"
  end

  def tie_msg
    "\nWell, that was anticlimatic. It's a draw."
  end

  def fancy_grid(board)
    board.grid.map { |line| line.map { |cell| " #{cell} " }.join }
  end

  def space
    "\n\n"
  end
end
