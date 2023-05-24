require_relative './Enumerations'

class Stone

    # COLOURS = {
    #     black: 1,
    #     white: 2
    # }.freeze

    def initialize(colour)
        @colour = colour
        
        return self
    end

    def getStoneColour()
        return @colour
    end 

end