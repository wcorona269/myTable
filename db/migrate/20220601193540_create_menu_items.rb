class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.integer :rest_id, null: false, unique: true
      t.text :items, array: true, default: [], null: false

      t.timestamps
      t.index :rest_id, unique: true
    end
  end
end
