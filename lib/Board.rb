require_relative './All_Classes.rb'

class Board
    attr_accessor :locations

    def initialize()
        # Why is this a list inside a list. 2D array?
        @locations = [[], [], [], [], []]

        for row in 0..4 do 
            for col in 0..8 do 
                if row < 2
                    # make first two rows black & store in list
                    @locations[row][col] = Location.new(row, col, Stone.new(COLOURS[:black]))
                elsif row > 2
                    # make last two rows white & store in list
                    @locations[row][col] = Location.new(row, col, Stone.new(COLOURS[:white]))
                else 
                    # every second column is white for the third row 
                    if col < 4
                        if col.modulo(2) == 1
                            @locations[row][col] = Location.new(row, col, Stone.new(COLOURS[:black]))
                        else 
                            @locations[row][col] = Location.new(row, col, Stone.new(COLOURS[:white]))
                        end
                    elsif col > 4
                        if col.modulo(2) == 1
                            @locations[row][col] = Location.new(row, col, Stone.new(COLOURS[:white]))
                        else 
                            @locations[row][col] = Location.new(row, col, Stone.new(COLOURS[:black]))
                        end
                    else
                        @locations[row][col] = Location.new(row,col,nil)
                    end
                end
            end 
        end 

        setupNeighbours()

        @playerOneStones = 22
        @playerTwoStones = 22
        # Implement Player class to pass locations to P1 & P2
    end
    

    def updateBoard(move)
        #  Need to implement move class 
        return self
    end

    def getNumBlackStones()
        count = 0
        @locations.each do |location_sub_array|
            location_sub_array.each do |location|
                if location.getStone and location.getStone.getStoneColour == COLOURS[:black]
                    count += 1
                end
            end 
        end  
        return count
    end

    def getNumWhiteStones()
        count = 0
        @locations.each do |location_sub_array|
            location_sub_array.each do |location|
                if location.getStone and location.getStone.getStoneColour == COLOURS[:white]
                    count += 1
                end
            end 
        end  
        return count
    end 

    def showBoard()
        @locations
    end 

    def getPossibleCapture(colour)
        # Checks if the given player (by colour) has an available capture move or not
        @locations.each do |location_sub_array|
            location_sub_array.each do |location|
                if location.getStone.getStoneColour == colour
                    location.getNeighbours.each do |dir, neighbour|
                        if neighbour.getStone == nil 
                            nextLocation = nil 
                            if dir == DIRECTIONS[:top]
                                xPos = neighbour.xPos - 1
                                yPos = neighbour.yPos
                                nextLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:topLeft]
                                xPos = neighbour.xPos - 1
                                yPos = neighbour.yPos - 1
                                nextLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:topRight]
                                xPos = neighbour.xPos - 1
                                yPos = neighbour.yPos + 1
                                nextLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:right]
                                xPos = neighbour.xPos 
                                yPos = neighbour.yPos + 1
                                nextLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:left]
                                xPos = neighbour.xPos 
                                yPos = neighbour.yPos - 1
                                nextLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:bottom]
                                xPos = neighbour.xPos + 1
                                yPos = neighbour.yPos 
                                nextLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:bottomLeft]
                                xPos = neighbour.xPos + 1
                                yPos = neighbour.yPos - 1
                                nextLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:bottomRight]
                                xPos = neighbour.xPos + 1
                                yPos = neighbour.yPos + 1
                                nextLocation = getLocation(xPos, yPos)
                            end 

                            if nextLocation != nil and nextLocation.getStone != nil

                                if nextLocation.getStone.getStoneColour != colour
                                    return true
                                end 
                            end 
                            
                        elsif neighbour.getStone.getStoneColour != colour
                            oppsiteLocation = nil 

                            if dir == DIRECTIONS[:top]
                                xPos = location.xPos + 1
                                yPos = location.yPos 
                                oppsiteLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:topLeft]
                                xPos = location.xPos + 1
                                yPos = location.yPos + 1
                                oppsiteLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:topRight]
                                xPos = location.xPos + 1
                                yPos = location.yPos - 1
                                oppsiteLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:right]
                                xPos = location.xPos 
                                yPos = location.yPos - 1
                                oppsiteLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:left]
                                xPos = location.xPos 
                                yPos = location.yPos + 1
                                oppsiteLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:bottom]
                                xPos = location.xPos - 1
                                yPos = location.yPos 
                                oppsiteLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:bottomLeft]
                                xPos = location.xPos - 1
                                yPos = location.yPos + 1
                                oppsiteLocation = getLocation(xPos, yPos)
                            elsif dir == DIRECTIONS[:bottomRight]
                                xPos = location.xPos - 1
                                yPos = location.yPos - 1
                                oppsiteLocation = getLocation(xPos, yPos)
                            end 

                            if oppsiteLocation.getStone == nil 
                                return true 
                            end 
                        end 
                    end 
                end 
            end 
        end 

        return false 
        # Checks the board 2D array for all players' stones (by colour)
        # Need to wait for algorithm for neighbouring locations 
    end

    def getStoneLine(location, dir)
        # Need to figure out directions & location class (is it an enum)
        stoneLine = []
        xPos = location.xPos
        yPos = location.yPos

        while xPos >=0 and xPos < 5 and yPos >= 0 and yPos < 9 do 
            if dir == DIRECTIONS[:top]
                xPos = xPos - 1
                yPos = yPos
                
            elsif dir == DIRECTIONS[:topLeft]
                xPos = xPos - 1
                yPos = yPos - 1
                
            elsif dir == DIRECTIONS[:topRight]
                xPos = xPos - 1
                yPos = yPos + 1
                
            elsif dir == DIRECTIONS[:right]
                xPos = xPos 
                yPos = yPos + 1
                
            elsif dir == DIRECTIONS[:left]
                xPos = xPos 
                yPos = yPos - 1
                
            elsif dir == DIRECTIONS[:bottom]
                xPos = xPos + 1
                yPos = yPos 
                
            elsif dir == DIRECTIONS[:bottomLeft]
                xPos = xPos + 1
                yPos = yPos - 1
                
            elsif dir == DIRECTIONS[:bottomRight]
                xPos = xPos + 1
                yPos = yPos + 1
                
            end 

            location = getLocation(xPos, yPos)

            if location != nil 
                stoneLine << location
            end 

        end 
        
        return stoneLine
    end

    def getLocation(row, col)
        @locations[row][col]
    end 

    private 

    def setupNeighbours
        # TODO: potentially need to fix the indices (start from 0)
        for row in 0..4 do 
            for col in 0..8 do

                #add top
                if row != 0
                    @locations[row][col].addNeighbour(DIRECTIONS[:top], @locations[row-1][col])                 
                end

                #add top left
                if row != 0 && col != 0
                    if row.modulo(2) == 0
                        if col.modulo(2) == 0
                            @locations[row][col].addNeighbour(DIRECTIONS[:topLeft], @locations[row-1][col-1])
                        end
                    else
                        if col.modulo(2) == 1
                            @locations[row][col].addNeighbour(DIRECTIONS[:topLeft], @locations[row-1][col-1])
                        end
                    end
                end

                #add top right
                if row != 0 && col != 8
                    if row.modulo(2) == 0
                        if col.modulo(2) == 0
                            @locations[row][col].addNeighbour(DIRECTIONS[:topRight], @locations[row-1][col+1])
                        end
                    else
                        if col.modulo(2) == 1
                            @locations[row][col].addNeighbour(DIRECTIONS[:topRight], @locations[row-1][col+1])
                        end
                    end
                end

                #add bottom
                if row != 4
                    @locations[row][col].addNeighbour(DIRECTIONS[:bottom], @locations[row+1][col])
                end

                
                #add bottom left
                if row != 4 && col != 0
                    #when its an odd row #, only add it if an odd col #
                    if row.modulo(2) == 1
                        if col.modulo(2) == 1
                            @locations[row][col].addNeighbour(DIRECTIONS[:bottomLeft], @locations[row+1][col-1])
                        end
                    else
                        #when its an even row #, only add it if an even col #
                        if col.modulo(2) == 0
                            @locations[row][col].addNeighbour(DIRECTIONS[:bottomLeft], @locations[row+1][col-1])
                        end
                    end
                end

                #add bottom right
                if row != 4 && col != 8
                    #when its an odd row #, only add it if an odd col #
                    if row.modulo(2) == 1
                        if col.modulo(2) == 1
                            @locations[row][col].addNeighbour(DIRECTIONS[:bottomLeft], @locations[row+1][col+1])
                        end
                    else
                        #when its an even row #, only add it if an even col #
                        if col.modulo(2) == 0
                            @locations[row][col].addNeighbour(DIRECTIONS[:bottomLeft], @locations[row+1][col+1])
                        end
                    end
                end

                #add left
                if col != 0
                    @locations[row][col].addNeighbour(DIRECTIONS[:left], @locations[row][col-1])
                end

                #add right
                if col != 8
                    @locations[row][col].addNeighbour(DIRECTIONS[:right], @locations[row][col+1])
                end

            end 
        end 
    end

end 