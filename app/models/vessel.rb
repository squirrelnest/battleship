class Vessel < ApplicationRecord
    belongs_to :player

    def size(string)
        case string
        when 'CARRIER'
            5
        when 'BATTLESHIP'
            4
        when 'DESTROYER'
            3
        when 'SUBMARINE'
            3
        when 'PATROL BOAT'
            2
        when 'PLANE'
            3
        end
    end
end
