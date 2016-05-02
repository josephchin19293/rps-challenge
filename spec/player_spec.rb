require 'game'

describe Player do
	subject(:player) {described_class.new("Joseph")}
	describe "#initialize" do
		it 'initializes the player with a name' do
		expect(player.name).to eq("Joseph")
		end
	end
	describe '#choose' do
		it 'allows player to make a choice of rock paper or scissors' do
			player.choose("rock")
			expect(player.choice).to eq("rock")
		end
		
		it 'raises an error when the choice is not either rock paper or scissors' do
			expect{player.choose("helicopter")}.to raise_error("Please select a valid choice")
		end
	end
end