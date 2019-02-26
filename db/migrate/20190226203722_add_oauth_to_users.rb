class AddOauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sign_in_count, :integer
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :inet
    add_column :users, :last_sign_in_ip, :inet
    add_column :users, :provider, :string
    add_column :users, :id, :string, unique: true
    add_column :users, :access_token, :string
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :profilePicture, :string
  end
end
