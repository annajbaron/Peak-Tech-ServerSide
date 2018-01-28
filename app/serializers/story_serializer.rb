class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :search_term_id
end
