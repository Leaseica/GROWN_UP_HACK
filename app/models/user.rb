class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :my_guides, dependent: :destroy
  accepts_nested_attributes_for :my_guides
  has_many :reminders

  validates :phone_number, format: { with: /\A(\+33\d{9}|(\+\d{1,3}\s?(\(\d{1,3}\))?\s?\d{3}[\s.-]?\d{3}[\s.-]?\d{4})|(0\d{9}))\z/ }
  validates :zip_code, format: { with: /\A\d{5}\z/ }



  def full_name
    components = [first_name, last_name&.capitalize].compact.join(' ')
    components.present? ? components : " Aucun nom fourni"
  end


  def full_title
    I18n.t("titles.full_titles.#{title}", default: title)
  end

  # Returns the full name with the title, if provided
  def full_name_title
    # Ensure that each component is present before including it in the full name.
    # Prevents leading/trailing spaces.
    components = [title, first_name, last_name&.capitalize].compact.join(' ')
    components.present? ? components : "Aucun nom fourni"
  end


  def full_name_full_title
    components = [full_title, first_name, last_name&.capitalize].compact.join(' ')
    components.present? ? components : "Aucun nom fourni"
  end

  def full_address
    components = [address, zip_code, city].compact.join(' ')
    components.present? ? components : "Aucune adresse fournie"
  end



end
