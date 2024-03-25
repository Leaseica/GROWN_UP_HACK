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

  # enum status: { todo: 0, in_progress: 1, done: 2 }

  # # Définition de scopes pour les rappels selon leur statut
  # scope :todo, -> { where(status: :todo) }
  # scope :in_progress, -> { where(status: :in_progress) }
  # scope :done, -> { where(status: :done) }

  enum status: {
    not_started: 'À faire',
    in_progress: 'En cours',
    done: 'Terminé'
  }
end
