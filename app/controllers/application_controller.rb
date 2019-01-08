require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "book_secrets"
    register Sinatra::Flash
  end

  get '/' do 
    erb :index
  end

  helpers do
  
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
 
    def user_authorized?(id)
      current_user.id == id.to_i
    end
  end

end

