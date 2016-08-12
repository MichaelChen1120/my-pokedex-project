class PokemonsController < ApplicationController

  get '/pokemon' do
    if !logged_in?
      redirect '/login'
    else
      @user=current_user
      erb :'/pokemons/pokemons'
    end
  end

  get '/pokemon/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/pokemons/new'
    end
  end

  post '/pokemon' do
    if !logged_in?
      redirect '/login'
    else
      @pokemons=Pokemon.new(name: params[:name], nickname: params[:nickname], weight: params[:weight], height: params[:height], cp: params[:cp], user_id: current_user.id)
      @pokemons.save
      redirect '/pokemon'
    end
  end

  get '/pokemon/:id' do
    if !logged_in?
      redirect '/login'
    else
      @pokemons=Pokemon.find_by_id(params[:id])
      erb :'/pokemons/show'
    end
  end

  get '/pokemon/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      @pokemons=Pokemon.find_by_id(params[:id])
      erb :'/pokemons/edit'
    end
  end

  patch '/pokemon/:id' do
    @pokemons = Pokemon.find_by_id(params[:id])
    @pokemons.nickname = params[:nickname]
    @pokemons.weight = params[:weight]
    @pokemons.height  =params[:height]
    @pokemons.cp = params[:cp]
    @pokemons.save
    redirect "/pokemon/#{@pokemons.id}"
  end

  get '/pokemon/:id/delete' do
    if !logged_in?
      redirect '/login'
    else
      @user=current_user
      @pokemons=Pokemon.find_by_id(params[:id])
      if @pokemons.user_id == @user.id
        @pokemons.delete
      end
      redirect '/pokemon'
    end
  end

end
