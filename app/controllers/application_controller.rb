require './config/environment'

class ApplicationController < Sinatra::Base

  #this creates an unqiue id for sessions to give security 
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security" 
    register Sinatra::Flash #message will show if it passes 
  end

  get '/' do
    erb :welcome
  end


  helpers do

# if logged in, true if not false
    def logged_in?
      !!current_user
    end

    #locates current user with session id, puts in insta. var to be stored 
    def current_user 
    @current_user ||= User.find_by(id: session[:user_id])
    end

    #when logged in, it is redirecting - if statement 
    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/'
    end
  end

  end
end
