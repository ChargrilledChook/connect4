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
    'Welcome to Connect 4!'
  end

  def move_prompt(player)
    "#{player}, it's your move!"
  end

  def win_msg(name)
    "Congratulations, #{name}! You won!"
  end

  def tie_msg
    'Well, that was anticlimatic. It\'s a draw.'
  end
end
