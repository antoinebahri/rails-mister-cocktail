class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses
  has_many :cocktails, through: :doses
  before_destroy :check_for_doses

  private

  def check_for_doses
    if doses.any?
      errors[:base] << "cannot delete ingredients that is used for some of your cocktails"
    return false
    end
  end
end
