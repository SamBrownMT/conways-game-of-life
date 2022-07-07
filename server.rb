require 'sinatra'
require './conway'
require 'yaml'
 
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
	redirect '/test'
end

get '/test' do 
	# convert session[:grid]
	# work on session[:grid]
	# return new session[:grid]
	# repeat? how to do this
	erb '<%= session[:grid] %>'
end