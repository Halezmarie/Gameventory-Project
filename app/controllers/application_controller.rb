require './config/environment'

class ApplicationController < Sinatra::Base


  #this creates an unqiue id for sessions to give security 
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security" 
    register Sinatra::Flash #message will show, may delete later b/c I can't figure out how to change font color
  end

  get '/' do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
    erb :welcome
    end
    #ERB is a Ruby class, known for templating system. erb is embedded ruby, view files will use erb so we can write html code 
  end



helpers do 
# if logged in, true if not then false - is !! boolean
    def logged_in?
      !!current_user
    end


    #locates current user with session id, puts in insta. var to be stored. making sure its their session
    def current_user 
    @current_user ||= User.find_by(id: session[:user_id])
    end

    #when logged in, it is redirecting - if statement 
    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/welcome' 
    end
  end
  end
  end
