class ChangeTextColumnToTextComments < ActiveRecord::Migration
  def change
    change_column :comments, :text, :text, limit: 500
  end
end
