class MeetUp < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :events, dependent: :destroy
end
