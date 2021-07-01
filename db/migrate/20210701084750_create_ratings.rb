class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :movie, foreign_key: true
      t.integer :stars
      t.string :comment

      t.timestamps
    end
  end
end
