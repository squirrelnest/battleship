class Game < ApplicationRecord
    has_many :players
    has_many :vessels

    # TODO: add validations
end
