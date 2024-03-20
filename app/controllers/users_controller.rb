class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_guides = @user.my_guides
  end

  def profile
    @user = current_user
    @my_guides = MyGuide.where(user: @user)
  end
end
