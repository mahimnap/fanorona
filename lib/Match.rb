require_relative './All_Classes.rb'

class Match 

    def initialize()
        @board = Board.new 
        @isBlackWinner = false 
        @isWhiteWinner = false 
    end 

    def setWhitePlayer(userId)
        # need name?
        @whitePlayer = Player.new(userId, "name")
        @whitePlayer.setColour(COLOURS[:white])
    end 

    def setBlackPlayer(userId)
        @blackPlayer = Player.new(userId, "name")
        @blackPlayer.setColour(COLOURS[:black])
    end

    def startMatch()
        # not implementable because we can't get userId of white or black player
        # Ensures that all players, variables, and board is set (Are we setting stuff in here)
        # self.setWhitePlayer(userId) # where do we get userID from?
        # self.setBlackPlayer(userId)

        # How do we start the game
        self.setCurrentPlayer(@whitePlayer)
    end 

    def forfeitMatch(userId)
        if userId == @whitePlayer.getUserId
            @setWhiteWinner = true 
            # Shouldn't black be the winner 
            # "Calls set<colour>Winner, based on which player is given, which will end the game"
        else 
            @setBlackWinner = true 
        end 
    end 

    def makeMove(location1, location2, colour, captureType)
        # Need move validators 
        if self.currentColourTurn == COLOURS.black
            player = @blackPlayer
        else 
            player = @whitePlayer
        end 

        move = player.createMove(location1, location2)

        if (moveVaidator.validateMove(move, board) == true)
            board.updateBoard(move)

            if board.getNumBlackStones == 0
                self.setWhiteWinner
                return self 
            elsif board.getNumWhiteStones == 0
                self.setBlackWinner 
                return self
            end 

            if (moveValidator.hasNextMove(move) == true)
                # tell the player to make another move
            else
                moveValidator.clearMoves

                if player.getColour == COLOURS.white
                    self.setCurrentPlayer(@blackPlayer)
                else 
                    self.setCurrentPlayer(@whitePlayer)
                end 
                # set the current player to the other player
                # inform both players who's current turn it is...
            end 
            return true 
        else
            # tell the currentplayre its not a valid move and they gotta try again
            return false 
        end 
    end

    def showCurrentBoardState()
        return @board.showBoard
    end

    def currentColourTurn()
        # need get colour for player
        return @currentPlayer.getColour 
    end 
    
    private 

    def setWhiteWinner()
        @isWhiteWinner = true

        # MatchChannel.endMatch(:white)
    end 

    def setBlackWinner()
        @isBlackWinner = true
    end 

    def setCurrentPlayer(player)
        @currentPlayer = player
    end 
end 