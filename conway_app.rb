require 'sinatra'
require './conway'
require 'yaml'
# get site
# post new grid
# get new grid
# post start loop
 
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