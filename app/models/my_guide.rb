class MyGuide < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_one_attached :photo

  after_update :update_user_occupation

  private

  def update_user_occupation
    # Check if the occupation attribute was changed during the update
    if saved_change_to_occupation?
      # Update the associated user's occupation
      user.update(occupation: self.occupation)
    end
  end
end
