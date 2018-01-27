class CreateTechStacks < ActiveRecord::Migration[5.1]
  def change
    create_table :tech_stacks do |t|
      t.string :name

      t.timestamps
    end
  end
end
