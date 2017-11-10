class Shift < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  # Match start of name
  searchkick text_start: [:name]

  #
  # Search a user by Shift name
  #
  def self.search_by_name(keyword)
    # Nil check, make keyword case insensitive, and strip whitespace
    return nil unless keyword
    keyword = keyword.downcase.strip

    # Start of name should match
    where("lower(name) LIKE ?", "#{keyword.downcase}%")
  end # search_by_name
end
