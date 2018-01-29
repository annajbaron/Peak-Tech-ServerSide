class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :start, :end, :url, :meet_up_id
  def title
    object.name
  end
  def start
    object.date.split(" ")[0].split("-").join(",").to_s
  end
  def end
    object.date.split(" ")[0].split("-").join(",").to_s
  end
end
