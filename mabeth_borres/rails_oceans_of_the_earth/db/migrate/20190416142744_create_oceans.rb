class CreateOceans < ActiveRecord::Migration[5.2]
  def change
    create_table :oceans do |t|
      t.text :name
      t.text :continents
      t.float :area
      t.float :volume
      t.float :depth
      t.text :knownexplorers
      t.text :image

      t.timestamps #created_at, updated_at
    end
  end
end
