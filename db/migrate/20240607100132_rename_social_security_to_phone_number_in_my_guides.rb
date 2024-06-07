class RenameSocialSecurityToPhoneNumberInMyGuides < ActiveRecord::Migration[7.1]
  def change
    rename_column :my_guides, :social_security, :phone_number
  end
end
