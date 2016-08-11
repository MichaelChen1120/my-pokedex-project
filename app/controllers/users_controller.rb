class UsersController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/users' do
    @user=User.new
    @user.username= params[:username]
    @user.password =params[:password]
    if @user.save
      redirect '/login'
    else
      redirect '/signup'
    end
  end

end
