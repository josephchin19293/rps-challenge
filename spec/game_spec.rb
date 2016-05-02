require 'game' 

describe Game do
	subject(:game)     {described_class.new(player_class, comp_double)}
	let(:player_class) {double(:player_class, new: player)}
	let(:player)       {double(:player, choose: true, name: "Joseph")}
	let(:comp_double)  {double(:comp, choose: "true")}

	describe '#add_player' do
		it 'can add a player with a name' do
			expect(player_class).to receive(:new).with("Joseph")
			game.add_player("Joseph")
		end
	end

	describe '#player_choose' do
		before(:each) { game.add_player("Joseph") }
		it 'causes the player to choose an option' do
			expect(player).to receive(:choose).with("rock")
			game.player_choose("rock")
		end
	end

	describe '#outcome' do
		context 'player chooses rock' do
			before(:each) do
				game.add_player("Joseph")
				allow(player).to receive(:choice) {"rock"}
			end
			it 'rock beats scissors' do
				allow(comp_double).to receive(:choice) {"scissors"}
				expect(game.outcome).to eq("YOU WIN!")
			end
			it 'rock draws with rock' do
				allow(comp_double).to receive(:choice) {"rock"}
				expect(game.outcome).to eq("IT'S A DRAW!")
			end
			it 'rock loses to paper' do
				allow(comp_double).to receive(:choice) {"paper"}
				expect(game.outcome).to eq("YOU LOSE!")
			end
		end

		context 'player chooses scissors' do
			before(:each) do
				game.add_player("Joseph")
				allow(player).to receive(:choice) {"scissors"}
			end
			it 'scissors draws with scissors' do
				allow(comp_double).to receive(:choice) {"scissors"}
				expect(game.outcome).to eq("IT'S A DRAW!")
			end
			it 'scissors loses to rock' do
				allow(comp_double).to receive(:choice) {"rock"}
				expect(game.outcome).to eq("YOU LOSE!")
			end
			it 'scissors beats paper' do
				allow(comp_double).to receive(:choice) {"paper"}
				expect(game.outcome).to eq("YOU WIN!")
			end
		end

		context 'player chooses paper' do
			before(:each) do
				game.add_player("Joseph")
				allow(player).to receive(:choice) {"paper"}
			end
			it 'paper loses to scissors' do
				allow(comp_double).to receive(:choice) {"scissors"}
				expect(game.outcome).to eq("YOU LOSE!")
			end
			it 'paper beats rock' do
				allow(comp_double).to receive(:choice) {"rock"}
				expect(game.outcome).to eq("YOU WIN!")
			end
			it 'paper draws with paper' do
				allow(comp_double).to receive(:choice) {"paper"}
				expect(game.outcome).to eq("IT'S A DRAW!")
			end
		end
	end
end