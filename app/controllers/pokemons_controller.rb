class PokemonsController < ApplicationController

  get '/pokemon' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/pokemons/show'
    end
  end

  get '/pokemon/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/pokemons/new'
    end
  end

  get '/pokemon/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      if  pokemon=current_user.pokemons.find_by(params[:id])
        "An edit Pokemon form #{current_user.id} is editing #{pokemon.id}"
      else
        redirect '/pokemon'
      end
    end
  end

end
