class EventSyncJob < ApplicationJob
  queue_as :default

  def perform
    MeetUp.all.each do |meet_up|
      params = {
        group_urlname: meet_up.name.downcase,
        status: "upcoming"
      }

      meetup_api = MeetupApi.new
      res = meetup_api.events(params)
      res["results"].each do |event|
        next if Event.where(event_id: event["id"].to_i).exists?

        Event.create!({
          meet_up: meet_up,
          name: event["name"],
          event_id: event["id"].to_i,
          url: event["event_url"],
          date: Time.at(event["time"]/1000),
        })
      end
    end
  end
end
