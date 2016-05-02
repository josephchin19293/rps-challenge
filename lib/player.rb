class Player
	attr_reader :choice, :name
	INVALID_CHOICE = "Please select a valid choice"
	def initialize(name)
		@name = name
		@choices = ["rock", "paper", "scissors"]
		@choice = nil
	end

	def choose(choice)
		fail INVALID_CHOICE if invalid_choice?(choice)
		@choice = choice.downcase
	end

	private

	def invalid_choice?(choice)
		!(@choices.include?(choice.downcase))
	end
end