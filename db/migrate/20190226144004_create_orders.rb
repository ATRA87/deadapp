class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.string :state, default: 'pending'

      t.timestamps
    end
  end
end
