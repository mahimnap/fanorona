require_relative './All_Classes.rb'

class Player

    def initialize(userId, name)
        @name = name
        @userId = userId # wym mapping? (is that for database)
    end 

    def getColour
        return @colour
    end

    def setColour(colour)
        @colour = colour
    end    

    def createMove(location1, location2, captureType)
        # create a move object & returns it
        return Move.new(location1, location2, @colour)
    end

    def getUserId
        return @userId
    end
    
end