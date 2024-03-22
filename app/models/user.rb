class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :my_guides

  enum gender: {
    female: 'Femme',
    male: 'Homme',
    undefined: "Je préfère ne pas le dire"
  }
end
