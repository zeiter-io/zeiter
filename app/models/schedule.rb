class Schedule < ApplicationRecord
  before_create :generate_special_code
  has_many :schedules_users, dependent: :destroy
  has_many :users, through: :schedules_users
  validates :name, presence: true
  validates :special_code, uniqueness: true


  protected

  def generate_special_code
    char = ('a'..'z').to_a; num = ('1'..'9').to_a
    new_special_code = 5.times.map{ [ *char, *num ].sample }.join
    code_check = Schedule.find_by_special_code(new_special_code)
    if code_check == nil
      self.special_code = new_special_code
      return
    else 
      while code_check != nil
      new_special_code = 5.times.map{ [ *char, *num ].sample }.join
      code_check = Schedule.find_by_special_code(new_special_code)
      end
      self.special_code = new_special_code
      return
    end
  end
  
end
