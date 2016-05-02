require 'game'

describe Comp do
	subject(:comp) {described_class.new}
	describe '#initialize' do
		it 'is initialized with no choice' do
			expect(comp.choice).to eq(nil)
		end
	end
	describe '#choose' do
		before(:each) {comp.choose}
		it 'chooses a random choice from the choices array' do
			expect(["rock", "paper", "scissors"]).to include(comp.choice)
		end
	end
end