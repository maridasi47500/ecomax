class CreateIsland < ActiveRecord::Migration[6.0]
  def change
    create_table :islands do |t|
      t.string :name
      t.string :dpt
    end
    create_table :cities do |t|
      t.string :name

      t.integer :island_id
    end
  end
end
