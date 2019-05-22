class CreateMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|
      t.text :name
      t.text :country
      t.text :city
      t.text :image
    end
  end
end
