class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: %i[linkedin]

  has_many :projects, dependent: :destroy
  has_many :project_members
  has_many :side_projects, through: :project_members, source: :project, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :project_orders, through: :projects, source: :orders
  has_many :chats
  # has_many :owned_offices, foreign_key: 'user_id', class_name: 'Office', dependent: :destroy
  # has_many :booked_offices, through: :bookings, source: :office, dependent: :destroy


  def self.from_omniauth(auth)
    puts "auth = #{auth}"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.password = auth.id
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.profile_picture = auth.info.picture_url
    end
  end

  def full_name
    first = first_name.capitalize if first_name
    last = last_name.capitalize if last_name

    if first_name or last_name
      "#{first} #{last}"
    else
      email
    end
  end

  def identifier
    full_name
  end
end
