class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :url
      t.string :search_term_id
      t.datetime :date

      t.timestamps
    end
  end
end
