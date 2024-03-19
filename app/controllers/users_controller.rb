class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_guides = @user.my_guides
  end
end
