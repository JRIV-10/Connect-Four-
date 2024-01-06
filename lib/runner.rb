require './lib/start_game.rb'
require './lib/cell.rb'
require './lib/player.rb'
require './lib/board.rb'
require './lib/turn.rb'

player = Player.new('X', 'Jamison')
computer = Player.new('O', 'Computer')
game = StartGame.new
board = Board.new
cells = Cell.new(@column, @row)
# player.get_user_name(@name)

game.give_welcome
game.create_players_turn


