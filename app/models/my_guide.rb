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

  def self.ransackable_attributes(auth_object = nil)
    ["article_id", "business_structure", "created_at", "has_previous_self_employment", "id", "id_value", "is_business_extension", "is_micro_entrepreneur", "representative_role", "representative_type", "titre", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["article", "user", "reminders", "photo"]
  end

end
