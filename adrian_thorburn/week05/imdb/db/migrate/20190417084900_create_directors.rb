class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.text :name
      t.text :nationality
      t.date :dob
      t.text :style
      t.text :image
      t.timestamp # Created_at, updated_at
    end
  end
end
