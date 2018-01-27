class Tagging < ApplicationRecord
  belongs_to :organization
  belongs_to :tech_stack
end
