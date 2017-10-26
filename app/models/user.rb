class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable

  has_many :enrollments, dependent: :destroy
  has_many :schedules, through: :enrollments
  has_many :shifts

  # Background indexing + Only match start of name
  searchkick callbacks: :async, word_start: [:first_name]

  #
  # Returns user's full name
  #
  def full_name
    "#{first_name} #{last_name}"
  end

  #
  # Search a user by first and last name
  #
  def self.search_by_name(keyword)
    # Nil check and make keyword case insensitive
    return nil unless keyword
    keyword = keyword.downcase.split(" ")
    where("lower(first_name) = ? AND lower(last_name) = ?", "%#{keyword[0]}%", "%#{keyword[1]}%")
  end # search_by_name
end
