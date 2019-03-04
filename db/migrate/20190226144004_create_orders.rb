class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :state, default: 0
      t.monetize :amount, currency: { present: true }
      t.json :payment


      t.timestamps
    end
  end
end
