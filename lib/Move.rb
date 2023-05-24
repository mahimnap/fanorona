require_relative './All_Classes.rb'

class Move 

    def initialize(location1, location2, playerColour)
        @oldLocation = location1
        @newLocation = location2

        # Which player is a player object, but player colour is a string
        #  should colour be a string or a symbol
        if playerColour == "white"
            @whichPlayer = COLOURS[:white]
        else 
            @whichPlayer = COLOURS[:black]
        end 
        # @whichPlayer = playerColour
    end 

    def getColour()
        return @whichPlayer
    end 

    def getStoneLocation1()
        return @oldLocation
    end 

    def getStoneLocation2()
        return @newLocation
    end 
    
end 