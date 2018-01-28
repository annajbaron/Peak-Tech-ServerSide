class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :url, :meet_up_id

end
