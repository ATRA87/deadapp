class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :dev_state, default: 0
      t.integer :client_state, default: 0
      t.integer :estimated_time, default: 0
      t.date :due_date
      t.monetize :amount, currency: { present: true }
      t.json :payment
      t.string :notes

      t.timestamps
    end
  end
end
