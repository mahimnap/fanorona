require_relative './All_Classes.rb'

class MoveValidator

    def initialize()
        @movesList = []
    end 

    def validateMove(gameBoard, move)
        # How do we get coordinates no getters (attr?)
        locationChangeX = move.getStoneLocation2.xPos - move.getStoneLocation1.xPos
        locationChangeY = move.getStoneLocation2.yPos - move.getStoneLocation1.yPos

        oldLocation = gameBoard.getLocation(move.getStoneLocation1.xPos, move.getStoneLocation1.yPos)
        stone = oldLocation.getStone

        if stone.getStoneColour != move.getColour
            return false 
        end 

        if (locationChangeX <= 0 and locationChangeX > 2) and (locationChangeY <= 0 and locationChangeY > 2)
            return false 
        end 

        newLocation = move.getStoneLocation2

        if newLocation.getStone != nil 
            return false
        end 

        # Not given a direction 
        stoneLine = gameBoard.getStoneLine(newLocation, nil)

        #  Not implementable because: (write reasons later)
        # if move.captureType == :a and newLocation.getStone.getStoneColour != stone.getStoneColour
        #     return true
        # elsif move.captureType == :w and newLocation.getStone.getStoneColour != stone.getStoneColour
        #     return true 
        # else 
        #     if gameBoard.getPossibleCapture 
        #         return false 
        #     else 
        #         return true
        #     end
        # end 

        # Design not implementable 
        if move.oldLocation != @movesList[-1].newLocation
            return false
        end 

        @movesList.each do |currentMove|
            if currentMove.newLocation == move.newLocation
                return false  
            end 
        end 

        xPos = @movesList[-1].oldLocation.xPos - @movesList[-1].newLocation.xPos
        yPos = @movesList[-1].oldLocation.yPos - @movesList[-1].newLocation.yPos

        if xPos == locationChangeX and yPos == locationChangeY
            return false
        end 

        @movesList << move

        # Doesn't say what to return

    end 

    def hasNextMove(move)
        # Where is moves being initialized 

        if @moves.length > 0 
            locationChangeX = move.getStoneLocation2.xPos - move.getStoneLocation1.xPos
            locationChangeY = move.getStoneLocation2.yPos - move.getStoneLocation1.yPos

            if gameBoard.getPossibleCapture(move.getColour)
                # How do we figure out the location change direction 
                return true
            else 
                return false 
            end 
        end 

        return false 
    end 

    def clearMoves()
        @moves.clear 
    end
end 