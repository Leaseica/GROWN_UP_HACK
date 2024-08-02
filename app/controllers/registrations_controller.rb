# Custom RegistrationsController to redirect after sign up
# app/controllers/devise/registrations_controller.rb for other methods
class RegistrationsController < Devise::RegistrationsController

  protected
  def after_sign_up_path_for(resource)
    edit_user_path(resource)
  end
end
