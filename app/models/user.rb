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
end
