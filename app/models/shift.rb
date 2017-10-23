class Shift < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  searchkick word_start: [:name]

end
