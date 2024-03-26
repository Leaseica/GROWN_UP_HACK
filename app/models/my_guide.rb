class MyGuide < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_one_attached :photo
  has_many :reminders

  accepts_nested_attributes_for :user

  after_update :update_user_occupation

  enum business_structure: {
    entrepreneur_individuel: 'Entrepreneur individuel',
    personne_morale: 'Personne morale',
    exploitation_en_commun: 'Exploitation en commun'
  }

  enum representative_role: {
    establishment_representative: "Personne ayant le pouvoir d'engager l'établissement",
    joint_owner: "Indivisaire"
  }

  private

  def update_user_occupation
    # Check if the occupation attribute was changed during the update
    if saved_change_to_occupation?
      # Update the associated user's occupation
      user.update(occupation: self.occupation)
    end
  end
end
