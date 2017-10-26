class Schedule < ApplicationRecord
  before_create :generate_ucode

  has_many :users, through: :enrollments
  has_many :enrollments, dependent: :destroy
  has_many :shifts

  validates :name, presence: true
  validates :ucode, uniqueness: true

  # Background indexing + Only match start of name
  searchkick callbacks: :async, word_start: [:name]

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

  #
  # Search a user by Schedule name
  #
  def self.search_by_name(keyword)
    # Nil check and make keyword case insensitive
    return nil unless keyword
    where("name = ?", "%#{keyword}%")
  end # search_by_name
  
end
