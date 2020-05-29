class Member < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: { maximum: 6 }
end
