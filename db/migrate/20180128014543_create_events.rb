class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :url
      t.string :meet_up_id

      t.timestamps
    end
  end
end
