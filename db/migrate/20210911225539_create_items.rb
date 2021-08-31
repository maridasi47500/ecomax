class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
t.string :name
t.float :price
t.string :city_id
    end
create_table :suggestions do |t|
t.string :title
t.date :start_at
t.date :end_at

t.string :content
t.integer :item_id

end
create_table :images do |t|
t.string :type
t.string :image
t.integer :item_id

end
  end
end
