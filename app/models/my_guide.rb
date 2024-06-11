class MyGuide < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_one_attached :photo
  has_many :reminders, dependent: :destroy
  accepts_nested_attributes_for :user

  enum business_structure: {
    entrepreneur_individuel: 'Entrepreneur individuel',
    personne_morale: 'Personne morale',
    exploitation_en_commun: 'Exploitation en commun'
  }

  enum representative_role: {
    establishment_representative: "Personne ayant le pouvoir d'engager l'établissement",
    joint_owner: "Indivisaire"
  }

  enum representative_type: {
    natural_person: 'Personne physique',
    legal_person: 'Personne morale'
  }

end
