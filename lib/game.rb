require_relative 'player'
require_relative 'comp'

class Game

	def self.create
    	@game = Game.new
  	end

	def self.last_instance
	  @game
	end
	
	def initialize(player_class=Player, comp=Comp.new)
		@player_class = player_class
		@comp = comp
		@win = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
		@player_pics = {"rock" => "/images/player_pics/rock_l.jpg", "paper" => "/images/player_pics/paper_l.jpg", "scissors" => "/images/player_pics/scissors_l.jpg"}
		@comp_pics = {"rock" => "/images/comp_pics/rock_r.jpg", "paper" => "/images/comp_pics/paper_r.jpg", "scissors" => "/images/comp_pics/scissors_r.jpg"}
	end

	attr_reader :player, :player_pics, :comp_pics, :comp

	def add_player(name)
		@player = @player_class.new(name)
	end

	def player_choose(choice)
		@player.choose(choice)
	end

	def outcome
		@comp.choose
		if win?
			return "The computer chose #{@comp.choice}. YOU WIN!"
		elsif draw?
			return "The computer chose #{@comp.choice}. IT'S A DRAW!"
		else
			return "The computer chose #{@comp.choice}. YOU LOSE!"
		end
	end

	private

	def win?
		@comp.choice == @win[@player.choice]
	end

	def draw?
		@comp.choice == @player.choice
	end
end