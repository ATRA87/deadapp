class AddCustomizationsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :color_scheme, :boolean
    add_column :orders, :font, :boolean
    add_column :orders, :button_shape, :boolean
    add_column :orders, :social_log_in, :boolean
    add_column :orders, :order_notes, :text
  end
end
