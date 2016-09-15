class RaidGroup < ApplicationRecord
  has_many :members, dependent: :destroy
end
