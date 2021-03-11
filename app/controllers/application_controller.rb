require './config/environment'

class ApplicationController < Sinatra::Base

  #creates an unqiue id for sessions to give security 
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security" 
    register Sinatra::Flash
  end

  get '/' do
    erb :welcome
  end


  helpers do

# if logged in, true if not false
    def logged_in?
      !!current_user
    end

    #locates current user with session id, puts in insta. var
    def current_user 
    @current_user ||= User.find_by(id: session[:user_id])
    end

#

  end
end