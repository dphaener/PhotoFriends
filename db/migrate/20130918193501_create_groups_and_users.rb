class CreateGroupsAndUsers < ActiveRecord::Migration
  def change
    create_table :groups_and_users do |t|
      t.belongs_to :group
      t.belongs_to :user

      t.timestamps
    end
  end
end
