class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :my_guides, dependent: :destroy
  accepts_nested_attributes_for :my_guides
  has_many :reminders

  validates :phone_number, format: { with: /\A(\+33\d{9}|(\+\d{1,3}\s?(\(\d{1,3}\))?\s?\d{3}[\s.-]?\d{3}[\s.-]?\d{4})|(0\d{9}))\z/, message: "must be a valid phone number" }
  validates :zip_code, format: { with: /\A\d{5}\z/, message: "must be a valid zip code" }


  enum gender: {
    female: 'Femme',
    male: 'Homme',
    undefined: "Je préfère ne pas le dire"
  }
end
