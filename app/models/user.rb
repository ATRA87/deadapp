class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[linkedin]

  has_many :projects, dependent: :destroy
  has_many :project_members
  has_many :side_projects, through: :project_members, source: :project, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :project_orders, through: :projects, source: :orders
end
