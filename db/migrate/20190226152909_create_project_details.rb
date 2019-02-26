class CreateProjectDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :project_details do |t|
      t.references :project, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
