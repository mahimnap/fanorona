require_relative './All_Classes.rb'
require 'set'

class Location

    # need getters for xPos & yPos

    attr_accessor :xPos, :yPos
    
    def initialize(xPos, yPos, stone)
        @xPos = xPos
        @yPos = yPos

        @neighbouringLocations = Hash.new() # generating list of neighbouring edges(p21)? 
        @coordinates = Set.new([xPos,  yPos])

        if stone != nil 
            @stone = stone
        end 

    end

    def addNeighbour(direction, location)
        @neighbouringLocations[direction] = location
    end

    def getNeighbours()
        return @neighbouringLocations
    end

    def getStone()
        return @stone
    end 

    def removeStone()
        stone = @stone
        @stone = nil 
        return stone
    end 

    def placeStone(stone)
        @stone = stone
    end 
    
end