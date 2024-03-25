class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @my_guides = @user.my_guides
    @previews_articles = session[:store]
    @reminders = @user.reminders
    @my_guide = MyGuide.find_by(user: @user)
    # @todo_reminders = @user.reminders.todo
    # @in_progress_reminders = @user.reminders.in_progress
    # @done_reminders = @user.reminders.done
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def profile
    @user = current_user
    @my_guides = MyGuide.where(user: @user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :occupation, :address, :birthday, :nationality, :social_security, :gender)
  end
end
