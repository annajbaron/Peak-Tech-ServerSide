class Story < ApplicationRecord
  belongs_to :search_term
  validates :title, presence: true
  validates :story_id, uniqueness: true
end
