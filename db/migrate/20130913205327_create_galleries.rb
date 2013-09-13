class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :archive
      t.references :group, index: true

      t.timestamps
    end
  end
end
