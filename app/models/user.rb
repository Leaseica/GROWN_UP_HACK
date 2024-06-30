class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :my_guides, dependent: :destroy
  accepts_nested_attributes_for :my_guides
  has_many :reminders
  has_one_attached :file

  # Optional validations
  validates :phone_number, format: { with: /\A(\+33\d{9}|(\+\d{1,3}\s?(\(\d{1,3}\))?\s?\d{3}[\s.-]?\d{3}[\s.-]?\d{4})|(0\d{9}))\z/ }, allow_blank: true
  validates :zip_code, format: { with: /\A\d{5}\z/ }, allow_blank: true

  def self.ransackable_associations(auth_object = nil)
    ["my_guides", "reminders", "file_attachment", "file_blob"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "admin", "birthday", "city", "country", "created_at", "email", "encrypted_password", "first_name", "gender", "id", "id_value", "last_name", "occupation", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "title", "updated_at", "zip_code"]
  end

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
