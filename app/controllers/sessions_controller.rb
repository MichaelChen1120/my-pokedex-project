class SessionsController < ApplicationController

  get '/login' do
    if !session[:user_id]
      erb :login
    else
      redirect '/pokemon'
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
