class PokemonsController < ApplicationController

  get '/pokemon' do
    redirect_if_not_logged_in
    @user=current_user
    erb :'/users/show'
  end

  get '/pokemon/new' do
    redirect_if_not_logged_in
    erb :'/pokemons/new'
  end

  post '/pokemon' do
    redirect_if_not_logged_in
    if Pokemon.not_missing_params?(params)
      @pokemon=Pokemon.create(name: params[:name], nickname: params[:nickname], p_type: params[:p_type], weight: params[:weight], height: params[:height], cp: params[:cp],
      attack_move: params[:attack_move], attack_move_damage: params[:attack_move_damage], special_move: params[:special_move], special_move_damage: params[:special_move_damage], user_id: current_user.id)
      erb :'/pokemons/show'
    else
      redirect '/pokemon/new?error=fill-in-missing-fields'
    end
  end

  get '/pokemon/:id' do
    redirect_if_not_logged_in
    @pokemon = Pokemon.find(params[:id])
    redirect_if_not_valid_owner
    erb :'/pokemons/show'
  end

  get '/pokemon/:id/edit' do
    redirect_if_not_logged_in
    @pokemon=Pokemon.find(params[:id])
    redirect_if_not_valid_owner
    erb :'/pokemons/edit'
  end

  post '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    if Pokemon.not_missing_params?(params)
      @pokemon.update(nickname: params[:nickname], p_type: params[:p_type], weight: params[:weight], height: params[:height], cp: params[:cp],
      attack_move: params[:attack_move], attack_move_damage: params[:attack_move_damage], special_move: params[:special_move], special_move_damage: params[:special_move_damage])
      redirect "/pokemon/#{@pokemon.id}"
    else
      redirect "/pokemon/#{@pokemon.id}/edit?error=fill-in-missing-fields"
    end
  end

  get '/pokemon/:id/delete' do
    redirect_if_not_logged_in
    @pokemon=Pokemon.find(params[:id])
    redirect_if_not_valid_owner
    @pokemon.delete
    redirect '/pokemon'
  end

end
