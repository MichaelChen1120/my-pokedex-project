class SessionsController < ApplicationController

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
