class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  has_many :tickets,dependent: :destroy
  has_many :transactions,dependent: :destroy
  has_one :wallet
  after_create :user_create_mail

   def user_create_mail
    
    UserWelcomeJob.perform_later(self)
   end
end
