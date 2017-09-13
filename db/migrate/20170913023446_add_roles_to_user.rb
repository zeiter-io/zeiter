class AddRolesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :god, :boolean, default: false
    add_column :users, :supervisor, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
