class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string
    add_column :users, :profile, :text
  end
end
