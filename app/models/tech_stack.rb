class TechStack < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :organizations, through: :taggings
  validates :name, presence: true, uniqueness: true
end
