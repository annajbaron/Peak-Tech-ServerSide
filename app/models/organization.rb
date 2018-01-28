class Organization < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tech_stacks, through: :taggings
  validates :name, presence: true, uniqueness: true
  has_many :users, dependent: :nullify

  accepts_nested_attributes_for :tech_stacks

  geocoded_by :address
  before_validation :geocode

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]
  
end
