class CreateOceans < ActiveRecord::Migration[5.2]
  def change
    create_table :oceans do |t|
      t.text :name
      t.text :image
      t.float :size
    end
  end
end
