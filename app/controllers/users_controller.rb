class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/new'
    else
      redirect '/pokemon'
    end
  end

  post '/users' do
    if params[:username] == '' || params[:password] == ''
      redirect '/signup'
    else
      @user=User.create(username: params[:username], password: params[:password])
      session[:user_id]= @user.id
      redirect '/pokemon'
    end
  end

end
