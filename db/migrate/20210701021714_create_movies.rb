class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :imdb_id
      t.datetime :starts
      t.datetime :ends
      t.integer :price
      t.string :currency

      t.timestamps
    end
  end
end
