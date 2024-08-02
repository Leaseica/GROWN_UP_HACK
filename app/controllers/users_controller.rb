class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    @my_guides = @user.my_guides
    @previews_articles = session[:store]
    @reminders = Reminder.where(user: @user)
    @my_guide = MyGuide.find_by(user: @user)
  end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def profile
    @user = current_user
    @my_guides = MyGuide.where(user: @user)
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :occupation, :address, :birthday, :country, :phone_number, :gender, :zip_code, :city, :title, :admin, :file)
  end
end
