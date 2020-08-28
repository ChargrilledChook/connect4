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

  def move_prompt_msg(player)
    "\n#{player}, it's your move! => "
  end

  def win_msg(name)
    "\nCongratulations, #{name}! You won!"
  end

  def tie_msg
    "\nWell, that was anticlimatic. It's a draw."
  end

  def reprompt_msg
    "\nPlease enter a valid column between 1 and 7! => "
  end

  def play_again_msg
    "\nWould you like to play again? [Y / N] => "
  end

  def column_full_msg
    "\nOops! That column is full! Pick another one! => "
  end

  def rules_msg
    "\nThis is a game for two people. Get 4 in a row to win!"
  end

  def any_key_msg
    "\nEnter any key to begin."
  end
end
