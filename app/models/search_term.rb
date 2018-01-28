class SearchTerm < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :stories, dependent: :destroy
end
