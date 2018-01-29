class AddImageAndBodyToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :image, :text
    add_column :stories, :body, :text
  end
end
