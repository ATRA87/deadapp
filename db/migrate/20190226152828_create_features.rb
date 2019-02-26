class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.references :order, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
