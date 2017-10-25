class Shift < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  searchkick callbacks: :async # Background indexing
  searchkick word_start: [:name]

  #
  # Search a user by Shift name
  #
  def self.search_by_name(keyword)
    # Nil check and make keyword case insensitive
    return nil unless keyword
    where("name = ?", "%#{keyword}%")
  end # search_by_name
end
