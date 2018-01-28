class StorySyncJob < ApplicationJob
  queue_as :default

  def perform
    SearchTerm.all.each do |search_term|
      params = {
        title: search_term.title,
        published_at_start:  "NOW-1DAYS",
        published_at_end: "NOW"
      }

      news_api = AylienNewsApi::DefaultApi.new
      res = news_api.list_stories(params)
      res.stories.each do |story|
        next if Story.where(story_id: story.id).exists?

        Story.create!({
          search_term: search_term,
          title: story.title,
          story_id: story.id,
          url: story.links.canonical,
          date: story.published_at
        })
      end
    end
  end
end
