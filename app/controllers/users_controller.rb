class UsersController < ApplicationController

  
get '/signup' do
       erb :'users/signup'
    end


post '/signup' do
    if User.find_by(email: params[:email])
      flash[:message] = "Oh no! This email is already in use. Try again!"
      redirect to '/signup'
    end
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
       @user = User.new(name: params[:name], email: params[:email], password: params[:password])
       @user.save
       session[:user_id] = @user.id
    redirect to "/users/#{@user.id}"
  else
    redirect to '/signup'
  end
end



get '/login' do
  erb :login
end

post '/login' do
   @user = User.find_by(:email => params[:email])
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id 
     redirect to "/users/#{@user.id}"
   else
     flash[:message] = "Oh no! Try again!"
     redirect to '/login'
   end
 end

  get '/users/:id' do
    @game_items = current_user.game_items
    erb :'users/show'
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end
