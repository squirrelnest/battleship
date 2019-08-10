class VesselLocation < ApplicationRecord
    belongs_to :vessel

    # TODO: put constraints on vessel_locations based on vessel_type

    # validates :x, uniqueness: true
    # validates :y, uniqueness: true

    validates_inclusion_of :x, :in => 1..10
    validates_inclusion_of :y, :in => ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']


    # validates :x, uniqueness: true, unless: ->validates :y, uniqueness: true
    # validates :y, uniqueness: true, unless: ->validates :x, uniqueness: true

end
