class AddDefaultGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :defaultgroup, :integer
  end
end
