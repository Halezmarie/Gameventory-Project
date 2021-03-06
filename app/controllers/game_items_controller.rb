class GameItemsController < ApplicationController
 

  get '/game_items' do
    @game_items = GameItem.all
    erb :'game_items/index'
  end

  get '/game_items/new' do
    erb :'/game_items/new'
  end

  post '/game_items' do
    if params[:title] != ""
      @game_item = GameItem.create(title: params[:title], genre: params[:genre], url: params[:url], rating: params[:rating], user_id: current_user.id)
      flash[:message] = "Woohoo, your game has been created without any problems!"
      redirect to "/game_items/#{@game_item.id}"
    else
      redirect to '/game_items/new'
    end
  end


  get '/game_items/:id' do
    redirect_if_not_logged_in
    @game_item = GameItem.find_by(id: params[:id])
    erb :'game_items/show'
  end

  get '/game_items/:id/edit' do 
    redirect_if_not_logged_in
    @game_item = GameItem.find_by(id: params[:id])
    if @game_item.user == current_user
      erb :'/game_items/edit'
    else
      redirect "users/#{current_user.id}"
    end
  end
 
  patch '/game_items/:id' do
    redirect_if_not_logged_in
    @game_item = GameItem.find_by(id: params[:id])
    if logged_in? && @game_item.user == current_user
      @game_item.update(title: params[:title], genre: params[:genre], rating: params[:rating], url: params[:url])
      flash[:message] = "Your game has been edited without any problems!"
      redirect "/game_items/#{params[:id]}"
    else
      redirect "/users/#{current_user.id}/show"
    end
  end


  delete '/game_items/:id/delete' do
    @game_item = GameItem.find_by(id: params[:id])
    if logged_in? && @game_item.user.id == current_user.id
      @game_item.destroy
      flash[:message] = "You deleted the game without any problems!"
      redirect '/game_items'
    else
      redirect '/game_items'
    end
  end


  post '/search' do 
    @game_item = GameItem.find_by(title: params[:game_items][:title])
    if @game_item 
      erb :'/game_items/result'
    else
      redirect '/game_items'
    end
  end
end