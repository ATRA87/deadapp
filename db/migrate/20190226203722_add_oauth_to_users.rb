class AddOauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :inet
    add_column :users, :last_sign_in_ip, :inet
    add_column :users, :provider, :string
    add_column :users, :uid, :string, unique: true
    add_column :users, :access_token, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_picture, :string, null: false, default: "unofficial_hand.jpg"
  end
end
