class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
