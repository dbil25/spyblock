class Room < ApplicationRecord
  has_many :players
  attribute :code, default: -> { SecureRandom.base36(4).upcase }
end
