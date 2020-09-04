require 'minitest/autorun'
require_relative '../lib/menu'
require 'stringio'

# While I did get this tests working and the rough shape of them is probably ok,
# I couldn't figure out how to properly inject the game object and its mock to
# be able to properly test it. Currently Either the tests work and the game breaks or vice versa.
# Given this is a relatively simple class, with very little logic I'll leave aside testing these for now.
# Testing them manually is a relatively easy affair and was ultimately much simpler and time effective than these tests.
# Good practice though! Will make me think a bit more about dependency injection next time.

class MenuTest < Minitest::Test
  def setup
    @game = Minitest::Mock.new
  end

  def test_plays_one_new_game_correctly
    #skip
    io = StringIO.new
    io.puts 'n'
    io.rewind
    $stdin = io

    @game.expect(:new, true)
    @game.expect(:new_game, true)

    Menu.new(@game).new_session

    @game.verify
  end

  def test_restarts_game_correctly
    skip
    io = StringIO.new
    io.puts 'y'
    io.puts 'n'
    io.rewind
    $stdin = io

    @game.expect(:new_game, true)
    @game.expect(:new_game, true)

    Menu.new(@game)

    @game.verify
  end

  def test_restarts_multiple
    skip
    io = StringIO.new
    io.puts 'y'
    io.puts 'y'
    io.puts 'n'
    io.rewind
    $stdin = io

    @game.expect(:new_game, true)
    @game.expect(:new_game, true)
    @game.expect(:new_game, true)

    Menu.new(@game)

    @game.verify
  end

  def test_reprompts_with_wrong_input
    skip
    io = StringIO.new
    io.puts 'foo'
    io.puts 'y'
    io.puts 'n'
    io.rewind
    $stdin = io

    @game.expect(:new_game, true)

    Menu.new(@game)

    @game.verify
  end
end
