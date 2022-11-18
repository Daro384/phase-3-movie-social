class CreateMovie < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :poster
      t.string :genre
      t.string :actors
      t.string :director
      t.string :plot
      t.string :rated
      t.string :runtime
      t.string :writer
      t.string :imdb_rating
      t.string :movieId
    end
  end
end
