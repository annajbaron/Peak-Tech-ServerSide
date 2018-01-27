class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :created_at, :updated_at, :full_name, :is_admin

  belongs_to :organization

  def author_full_name
    object.user&.full_name
  end
end
