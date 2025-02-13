class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.integer :rest_id, null: false
      t.text :items, array: true, default: [], null: false

      t.timestamps
    end
  end
end
