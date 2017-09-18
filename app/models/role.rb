class Role < ApplicationRecord
  validates :name, prescence: true, uniqueness: true
end
