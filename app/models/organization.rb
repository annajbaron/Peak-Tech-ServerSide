class Organization < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tech_stacks, through: :taggings
  validates :name, presence: true, uniqueness: true
  has_many :users, dependent: :destroy

end
