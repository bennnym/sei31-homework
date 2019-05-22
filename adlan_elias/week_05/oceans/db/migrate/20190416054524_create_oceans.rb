class CreateOceans < ActiveRecord::Migration[5.2]
  def change
    create_table :oceans do |t|
      t.text :name
      t.integer :depth
      t.integer :volume
      t.integer :size
      t.text :fact
      t.text :image

      t.timestamps
    end
  end
end
