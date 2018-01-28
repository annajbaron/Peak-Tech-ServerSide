class AddStoryIdToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :story_id, :integer, index: true
  end
end
