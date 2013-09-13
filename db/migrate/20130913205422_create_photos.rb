class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :name
      t.string :path
      t.references :gallery, index: true

      t.timestamps
    end
  end
end
