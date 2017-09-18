class Schedule < ApplicationRecord
  has_many :schedules_users, dependent: :destroy
  has_many :users, through: :schedules_users
end
