class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable
  has_many :enrollments, dependent: :destroy
  has_many :schedules, through: :enrollments, foreign_key: 'schedule_id'

  has_many :shifts

  def full_name
    "#{first_name} #{last_name}"
  end

  #
  # Search a user by first and last name
  #
  def self.search_by_name(keyword)
    # Nil check and make keyword case insensitive
    keyword ? keyword.downcase! : (return nil)
    where("lower(first_name) LIKE ? or lower(last_name) LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end # search_by_name
end
