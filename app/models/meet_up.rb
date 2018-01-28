class MeetUp < ApplicationRecord
  validates :name, presence: true
  has_many :events, dependent: :destroy
end
