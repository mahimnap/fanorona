require_relative './All_Classes'
require 'test/unit'

class TestApplication < Test::Unit::TestCase
  
  ######################
  # TESTING STONE CLASS 
  ######################

  # create stone and check colour
  def test_stone_colour
    puts "Creating a black stone"
    stone = Stone.new(:black)
    assert_equal(stone.getStoneColour, :black, "Stone colour is not black")
  end

  ######################
  # TESTING LOCATION CLASS 
  ######################

  # create location and check coordinates
  def test_create_location
    puts "Creating a location at (1, 2) without a stone"
    location = Location.new(1, 2, nil)
    assert_equal(location.xPos, 1, "Location x coordinate is not 1")
    assert_equal(location.yPos, 2, "Location y coordinate is not 2")
  end

  # create location with stone and check stone
  def test_create_location_with_stone
    puts "Creating a location and placing a stone at (1, 2)"
    stone = Stone.new(:black)
    location = Location.new(1, 2, stone)
    assert_equal(location.getStone, stone, "Stone at location does not match stone passed in")
  end

  # create location with stone and check stone
  def test_remove_stone
    puts "Removing stone from location at (1, 2)"
    stone = Stone.new(:black)
    location = Location.new(1, 2, stone)
    location.removeStone
    assert_equal(location.getStone, nil, "Location should not have a stone")
  end

  # create location without stone and place stone
  def test_place_stone
    puts "Placing stone at location at (1, 2)"
    stone = Stone.new(:black)
    location = Location.new(1, 2, nil)
    location.placeStone(stone)
    assert_equal(location.getStone, stone, "Location should have a stone")
  end

  # addNeighbour and getNeighbours WILL BE TESTED IN BOARD CLASS TESTS

  ######################
  # TESTING BOARD CLASS
  ######################

  # create board and check size
  def test_create_board
    puts "Creating a board and checking size"
    board = Board.new()
    assert_equal(board.showBoard.length, 5, "Board size is not 45")
    board.showBoard.each { |b|
      assert_equal(b.length, 9)
    }
  end

  # create board and check num black and white stones
  def test_create_board_stones
    puts "Creating a board and checking num black and white stones"
    board = Board.new()
    assert_equal(board.getNumBlackStones, 22, "Board should have 22 black stones")
    assert_equal(board.getNumWhiteStones, 22, "Board should have 22 white stones")
  end

  # create board and check neighbouringLocations
  def test_neighbouring_locations
    puts "Creating a board and checking neighbouringLocations"
    board = Board.new()
    # topLeft location should have a bottom, right, and bottomRight neighbour
    assert_equal(board.getLocation(0,0).getNeighbours.length, 3, "Top left location should have 3 neighbours")
  end
  
  # test getting line of stones in the direction of the given location
  def test_get_stone_line
    puts "Creating a board and checking getStoneLine"
    board = Board.new()
    assert_equal(board.getStoneLine(board.getLocation(0,0), "right").length, 8, "There should be 8 stones to the right of location(0,0)")
  end

  # test getPossibleCapture; UNSURE ABOUT THIS ONE
  def test_get_possible_capture
    puts "Checking getPossibleCapture for player with black stones"
    board = Board.new()
    assert_equal(board.getPossibleCapture(:white), true, "A possible capture should exist for white stones upon board creation")
  end

  # TODO: test updateBoard

  ######################
  # TESTING PLAYER CLASS
  ######################

  # create player and check colour
  def test_create_player
    puts "Creating a player and checking its userId"
    player = Player.new("P1", "Player 1")
    assert_equal(player.getUserId, "P1", "Player userId is not P1")
  end

  # create player and check colour
  def test_create_player_colour
    puts "Creating a player with black stones"
    player = Player.new("P1", "Player 1")
    player.setColour(:black)
    assert_equal(player.getColour, :black, "Player colour is not black")
  end

  # test createMove
  def test_create_move
    puts "Creating a move for player P1"
    player = Player.new("P1", "Player 1")
    board = Board.new()
    move = player.createMove(board.getLocation(4,5), board.getLocation(3,5), :w) # what are the possible capture types?
    # ASSERT SOMETHING HERE
  end

  # TODO: complete createMove test

  ######################
  # TESTING MATCH CLASS
  ######################

  # NOTE: there is no way to test who the black and white players are; no getters
  # NOTE: there's no way to access isBlackWinner and isWhiteWinner; no getters

  # NOT IMPLEMENTABLE
  # create match and check players
  # def test_create_match
  #   puts "Creating a match and checking winners"
  #   player1 = Player.new("P1", "Player 1")
  #   player2 = Player.new("P2", "Player 2")
  #   match = Match.new()
  #   match.setWhitePlayer(player1)
  #   match.setBlackPlayer(player2)
  #   assert_equal(match.whitePlayer, player1, "Player 1 should be the white player")
  #   assert_equal(match.blackPlayer, player2, "Player 2 should be the black player")
  # end
  
  # test startMatch and check currentColourTurn
  def test_start_match
    puts "Starting a match"
    player1 = Player.new("P1", "Player 1")
    player2 = Player.new("P2", "Player 2")
    match = Match.new()
    match.setWhitePlayer(player1)
    match.setBlackPlayer(player2)
    match.startMatch
    assert_equal(match.currentColourTurn, "white", "White player should start")
  end

  #NOT IMPLEMENTABLE
  # test forfeitMatch and check winner
  # def test_forfeit_match
  #   puts "Forfeiting a match"
  #   player1 = Player.new("P1", "Player 1")
  #   player2 = Player.new("P2", "Player 2")
  #   match = Match.new()
  #   match.setWhitePlayer(player1)
  #   match.setBlackPlayer(player2)
  #   match.startMatch
  #   match.forfeitMatch(player1.getUserId)
  #   assert_equal(match.isWhiteWinner, :false, "Black player should win")
  # end

  # TODO: test makeMove, showCurrentBoardState, currentColourTurn

end
