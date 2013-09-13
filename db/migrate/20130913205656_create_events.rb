class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :when
      t.string :where
      t.references :user, index: true
      t.string :text
      t.references :group, index: true

      t.timestamps
    end
  end
end
