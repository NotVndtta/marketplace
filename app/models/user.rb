class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
              
  enum role: [:user, :seller, :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :username, length: { maximum: 15 }
  validates :first_name, length: { maximum: 20 }, presence: true
  validates :last_name, length: { maximum: 20 }, presence: true
  def set_default_role
    self.role ||= :user
  end
end


  

