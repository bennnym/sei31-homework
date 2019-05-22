class CreateMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|
      t.text :name
      t.text :country
      t.float :height
      t.text :image
    end
  end
end
