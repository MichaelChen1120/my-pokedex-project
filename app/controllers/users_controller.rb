class UsersController < ApplicationController

  get '/user' do
    "You are logged in as #{session[:username]}"
  end

end
