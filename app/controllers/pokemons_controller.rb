class PokemonsController < ApplicationController

  get '/pokemon' do
    redirect_if_not_logged_in
    @user=current_user
    erb :'/pokemons/pokemons'
  end

  get '/pokemon/new' do
    redirect_if_not_logged_in
    erb :'/pokemons/new'
  end

  post '/pokemon' do
    redirect_if_not_logged_in
    @pokemons=Pokemon.create(name: params[:name], nickname: params[:nickname], weight: params[:weight], height: params[:height], cp: params[:cp], user_id: current_user.id)
    redirect '/pokemon'
  end

  get '/pokemon/:id' do
    redirect_if_not_logged_in
    @pokemons=Pokemon.find(params[:id])
    erb :'/pokemons/show'
  end

  get '/pokemon/:id/edit' do
    redirect_if_not_logged_in
    @pokemons=Pokemon.find(params[:id])
    erb :'/pokemons/edit'
  end

  post '/pokemon/:id' do
    @pokemons = Pokemon.find(params[:id])
    @pokemons.nickname = params[:nickname]
    @pokemons.weight = params[:weight]
    @pokemons.height = params[:height]
    @pokemons.cp = params[:cp]
    @pokemons.save
    redirect "/pokemon/#{@pokemons.id}"
  end

  get '/pokemon/:id/delete' do
    redirect_if_not_logged_in
    @user=current_user
    @pokemons=Pokemon.find(params[:id])
    if @pokemons.user_id == @user.id
      @pokemons.delete
    end
    redirect '/pokemon'
  end

end
