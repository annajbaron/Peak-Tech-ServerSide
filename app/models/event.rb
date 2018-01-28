class Event < ApplicationRecord
  belongs_to :meet_up
  validates :name, presence: true
  validates :event_id, uniqueness: true
end
