class RenameSocialSecurityToPhoneNumberInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :social_security, :phone_number
  end
end
