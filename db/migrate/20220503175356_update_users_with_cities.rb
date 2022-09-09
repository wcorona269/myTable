class UpdateUsersWithCities < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :display_name, :dname
    add_column :users, :city_id, :integer
    # add_index :users, :session_token
  end
end
