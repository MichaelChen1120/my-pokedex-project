class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/new'
    else
      redirect '/pokemon'
    end
  end

  post '/users' do
    @user=User.create(username: params[:username], password: params[:password])
    session[:user_id]= @user.id
    redirect '/pokemon'
  end

  get '/login' do
    if logged_in?
      redirect '/pokemon'
    else
      erb :login
    end
  end

  post '/sessions' do
    login(params[:username], params[:password])
    redirect '/pokemon'
  end

  get '/logout' do
    logout!
    redirect '/login'
  end

end
