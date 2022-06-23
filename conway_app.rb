require 'sinatra'
require './conway'
# get site
# post new grid
# get new grid
# post start loop

get '/' do 
	erb :home
end

post '/' do 
	@subject = ConwayGame.new([[:dead,:dead,:dead],[:alive,:alive,:alive],
			 [:dead,:dead,:dead]])
	code = '<%= @subject.next_generation %>'
	erb code

end