class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :organization, foreign_key: true
      t.references :tech_stack, foreign_key: true

      t.timestamps
    end
  end
end
