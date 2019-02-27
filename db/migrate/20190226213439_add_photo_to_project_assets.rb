class AddPhotoToProjectAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :project_assets, :photo, :string
  end
end
