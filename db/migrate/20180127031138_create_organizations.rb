class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name, index: true
      t.string :address
      t.text :overview
      t.integer :employees
      t.integer :team_size
      t.string :website
      t.string :twitter
      t.string :logo

      t.timestamps
    end
  end
end
