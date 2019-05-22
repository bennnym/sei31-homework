class CreateMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|

    t.text :name
    t.float :elevation
    t.integer :prominence
    t.text :location
    t.text :image

    t.timestamps #created_at, updated_at
    end
  end
end
