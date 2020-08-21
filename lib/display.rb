# Strings go here
module Display
  def title
    <<~HERE
       _____                             _       ___
      /  __ \                           | |     /   |
      | /  \/ ___  _ __  _ __   ___  ___| |_   / /| |
      | |    / _ \| '_ \| '_ \ / _ \/ __| __| / /_| |
      | \__/\ (_) | | | | | | |  __/ (__| |_  \___  |
       \____/\___/|_| |_|_| |_|\___|\___|\__|     |_/

    HERE
  end

  def welcome_msg
    'Welcome to Connect 4!'
  end
end
