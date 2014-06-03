class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :trackable, :timeoutable, :lockable


  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true

  def full_name
    name
  end
end
