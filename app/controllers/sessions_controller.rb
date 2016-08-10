class SessionsController < ApplicationController

  get '/login' do
    erb :login
  end

  post '/sessions' do
    session[:username] = params[:username]
    redirect '/pokemon'
  end

  get '/logout' do
    logout!
    redirect '/login'
  end
end
