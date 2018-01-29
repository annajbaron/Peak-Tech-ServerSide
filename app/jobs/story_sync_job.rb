class StorySyncJob < ApplicationJob
  queue_as :default

  def perform
    # SearchTerm.limit(1).all.each do |search_term|
    SearchTerm.all.each do |search_term|
      last_published_at = Story.where(search_term_id: search_term.id).
        order(date: :desc).first.try(:date)

      unless last_published_at
        published_at_start = "NOW-30DAYS"
      else
        days = ((Time.now - last_published_at) / (3600 * 24)).ceil
        published_at_start = "NOW-#{days}DAYS"
      end

      puts "fetching news since #{published_at_start}"

      params = {
        title: search_term.title,
        published_at_start: published_at_start,
        published_at_end: "NOW"
      }

      news_api = AylienNewsApi::DefaultApi.new
      res = news_api.list_stories(params)
      res.stories.each do |story|
        next if Story.where(story_id: story.id).exists?

        Story.create!({
          search_term: search_term,
          title: story.title,
          body: story.body,
          image: story.media[0]&.url,
          story_id: story.id,
          url: story.links.canonical,
          date: story.published_at
        })
      end
    end
  end
end
