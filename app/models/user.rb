class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
              
  enum role: [:user, :seller, :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates :first_name, length: { maximum: 20 }
  validates :last_name, length: { maximum: 20 }
  def set_default_role
    self.role ||= :user
  end
end
