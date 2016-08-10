class SessionsController < ApplicationController

  get '/login' do
    erb :login
  end

  post '/sessions' do
    session[:username] = params[:username]
    redirect '/user'
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
end
