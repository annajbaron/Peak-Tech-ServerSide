class CreateMeetUps < ActiveRecord::Migration[5.1]
  def change
    create_table :meet_ups do |t|
      t.string :name

      t.timestamps
    end
  end
end
