class Shift < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  # Background indexing + Only match start of name
  searchkick callbacks: :async, word_start: [:name]

  #
  # Search a user by Shift name
  #
  def self.search_by_name(keyword)
    # Nil check and make keyword case insensitive
    return nil unless keyword
    where("name = ?", "%#{keyword}%")
  end # search_by_name
end
