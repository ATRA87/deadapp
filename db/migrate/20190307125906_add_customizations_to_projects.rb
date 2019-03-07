class AddCustomizationsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :color_scheme, :boolean, default: false
    add_column :projects, :font, :boolean, default: false
    add_column :projects, :button_shape, :boolean, default: false
    add_column :projects, :social_log_in, :boolean, default: false
  end
end
