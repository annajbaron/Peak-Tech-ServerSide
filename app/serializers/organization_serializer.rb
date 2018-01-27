class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :overview, :employees, :team_size, :website, :twitter, :logo, :created_at, :updated_at


  has_many :tech_stacks

  class TechStackSerializer < ActiveModel::Serializer
      attributes :id, :name, :created_at, :updated_at
  end

end
