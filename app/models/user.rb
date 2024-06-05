class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :my_guides
  has_many :reminders

  enum gender: {
    female: 'Femme',
    male: 'Homme',
    undefined: "Je préfère ne pas le dire"
  }

  # def nationakity_name
  #   country = ISO3166::Country
  #   country.find_country_by_alpha2(n
  #   ationality).name


end
