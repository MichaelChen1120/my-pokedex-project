class SessionsController < ApplicationController

  get '/login' do
    erb :login
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
