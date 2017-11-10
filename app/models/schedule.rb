class Schedule < ApplicationRecord
  before_create :generate_ucode

  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments, foreign_key: 'user_id'
  has_many :shifts

  validates :name, presence: true
  validates :ucode, uniqueness: true

  protected

  def generate_ucode
    char = ('a'..'z').to_a; num = ('1'..'9').to_a
    new_ucode = 5.times.map{ [ *char, *num ].sample }.join
    code_check = Schedule.find_by_ucode(new_ucode)
    if !code_check
      self.ucode = new_ucode
      return
    else 
      while code_check != nil
        new_ucode = 5.times.map{ [ *char, *num ].sample }.join
        code_check = Schedule.find_by_ucode(new_ucode)
      end
      self.ucode = new_ucode
      return
    end
  end
  
end
