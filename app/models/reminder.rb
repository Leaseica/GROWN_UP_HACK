class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :my_guide

  validates :title, presence: true
  validates :start_time, :end_time, presence: true

  default_scope -> { order(:start_time) }  # Our meetings will be ordered by their start_time by default

  def time
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end

  def multi_days?
    (end_time.to_date - start_time.to_date).to_i >= 1
  end

  STATUS = ['À faire', 'En cours', 'Terminé']
  validates :status, inclusion: {in: Reminder::STATUS}
  def status_class(status)
    status.parameterize(separator: '-')
  end

  def self.ransackable_associations(auth_object = nil)
    ["my_guide", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "end_time", "id", "id_value", "my_guide_id", "start_time", "status", "title", "updated_at", "url", "user_id"]
  end
end
