class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable

  has_many :enrollments, dependent: :destroy
  has_many :schedules, through: :enrollments
  has_many :schedules, through: :enrollments, foreign_key: 'schedule_id'

  has_many :shifts

  # Match start of name
  searchkick text_start: [:first_name]

  # Control what data is indexed
  def search_data
    {
        first_name: first_name
    }
  end

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
    # Nil check, make keyword case insensitive, and strip whitespace
    return nil unless keyword
    keyword = keyword.downcase.strip

    # Start of name should match
    where("lower(first_name) LIKE ?", "#{keyword}%")
  end # search_by_name
end
