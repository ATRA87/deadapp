class CreateProjectAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :project_assets do |t|
      t.references :project, foreign_key: true
      t.string :web_url
      t.integer :priority, defaul: 1

      t.timestamps
    end
  end
end
