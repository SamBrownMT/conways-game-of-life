require 'sinatra'
require './conway'
require 'yaml'
require './helper'
 
enable :sessions

get '/' do 
	erb :home
end

post '/' do 
	@grid = params["grid"]
	session[:grid] = @grid
	redirect '/game'
end

get '/game' do 
	erb :game, :locals => {:grid => session[:grid]}
end

post '/game' do 
	grid_array = Helper.convert_from_hash_hash(session[:grid])
	game = ConwayGame.new(grid_array)
	game.next_generation
	session[:grid] = game.grid
end

get '/test' do 
	grid_array = Helper.convert_from_hash_hash(session[:grid])
	game = ConwayGame.new(grid_array)
	game.next_generation
	session[:grid] = game.grid
	# convert session[:grid]
	# work on session[:grid]
	# return new session[:grid]
	# repeat? how to do this
	erb '<%= session[:grid] %>'
end