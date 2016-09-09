class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "pokesecret"
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_if_pokemon_not_found
      redirect '/pokemon?error=ERROR: That Pokemon does not exist' if @pokemon.nil?
    end

    def redirect_if_not_valid_owner
      redirect '/pokemon?error=ERROR: that is not your Pokemon' if @pokemon != current_user.pokemons.find_by_id(params[:id])
    end

    def redirect_if_not_logged_in
      redirect '/login?error=ERROR: you must log in' if !logged_in?
    end

    def login(username,password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:user_id] = user.id
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end
  end

end
