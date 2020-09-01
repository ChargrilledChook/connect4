require 'minitest/autorun'
require_relative '../lib/menu'
require 'stringio'

class MenuTest < Minitest::Test
  def setup
    @game = Minitest::Mock.new
  end

  def test_plays_one_new_game_correctly
    io = StringIO.new
    io.puts 'n'
    io.rewind
    $stdin = io

    @game.expect(:new_game, true)

    Menu.new.new_session(@game)

    @game.verify
  end

  def test_restarts_game_correctly
    io = StringIO.new
    io.puts 'y'
    io.puts 'n'
    io.rewind
    $stdin = io

    @game.expect(:new_game, true)
    @game.expect(:new_game, true)

    Menu.new.new_session(@game)

    @game.verify
  end

  def test_restarts_multiple
    io = StringIO.new
    io.puts 'y'
    io.puts 'y'
    io.puts 'n'
    io.rewind
    $stdin = io

    @game.expect(:new_game, true)
    @game.expect(:new_game, true)
    @game.expect(:new_game, true)

    Menu.new.new_session(@game)

    @game.verify
  end

  def test_reprompts_with_wrong_input
    io = StringIO.new
    io.puts 'foo'
    io.puts 'y'
    io.puts 'n'
    io.rewind
    $stdin = io

    @game.expect(:new_game, true)
    @game.expect(:new_game, true)

    Menu.new.new_session(@game)

    @game.verify
  end
end
