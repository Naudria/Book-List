class GenresController < ApplicationController

get '/genres' do
	if logged_in?
	  @genres = Genre.all
	  erb :'genres/index'
	else
	  redirect '/login'
	end
end

get '/genres/:id' do
	if logged_in?
		@genre = Genre.find_by_id(params[:id])
		erb :'/genres/show'
	else
		redirect '/login'
	end
end

end