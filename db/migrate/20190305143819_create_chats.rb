class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.text :message
      t.string :identifier
      t.references :sender
      t.references :target
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
