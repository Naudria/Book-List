class UsersController < ApplicationController
 
 #CREATE new users
  get '/signup' do
    if logged_in?
      redirect "/books"
    else
      # THIS 'GETS' the form to create a new user
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params.values.any?{|v| v.nil? || v.length == 0}
      redirect to "/signup"
    else
      if User.find_by(username: params[:username])
        flash[:message] = "Username already taken."
        redirect to "/signup"
      elsif User.find_by(email: params[:email])
        flash[:message] = "Email already taken."
        redirect to "/signup"
      else
        # When you submit the form above, this POSTS the information to the route /signup and creates new user
        user = User.create(username: params[:username], password: params[:password], email: params[:email])
        session[:user_id] = user.id
        redirect to "/login"
      end
    end
  end

  

end