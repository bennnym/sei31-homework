class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :name
      t.text :genre
      t.date :released
      t.integer :duration
      t.float :rating
      t.text :image

      t.timestamps
    end
  end
end
