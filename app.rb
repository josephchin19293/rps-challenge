require 'sinatra/base'
require './lib/game'

class Rps < Sinatra::Base

	get '/' do 
		erb :index
	end

	post '/start-game' do
		Game.create
		redirect '/enter-name'
	end

	before do
		@game = Game.last_instance
	end

	get '/enter-name' do
		erb :name
	end

	post '/name' do
		@game.add_player(params[:player_1_name])
		redirect '/play'
	end

	get '/play' do
		erb :play
	end

	post '/choice' do
		@game.player_choose(params[:player_1_choice])
		redirect '/outcome'
	end

	get '/outcome' do
		erb :outcome
	end
	# start the server if ruby files executed directly
  run! if app_file == $0
end