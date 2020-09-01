require 'minitest/autorun'
require_relative '../lib/menu'
require 'stringio'

class MenuTest < Minitest::Test

  def setup
    @game = Minitest::Mock.new
  end

  def test_creates_new_game_on_startup
    io = StringIO.new
    io.puts 'foo'
    $stdin = io

    @game.expect(:new_game, true)

    Menu.new(@game).new_session

    #@game.new_game

    @game.verify
  end

  def test_restarts_game_correctly

  end

  def test_exits_game_correctly

  end

  def test_reprompts_with_wrong_input

  end
end
