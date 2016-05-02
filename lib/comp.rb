class Comp
	attr_reader :choice
	def initialize
		@choices = ["rock", "paper", "scissors"]
		@choice = nil
	end

	def choose
		@choice = @choices.sample
	end
end