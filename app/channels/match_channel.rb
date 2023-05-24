class MatchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{connection.session[:user_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def startMatch
    match = Match.find_by(white_player: connection.session[:user_id])
    ActionCable.server.broadcast(match.white_player.to_s, { fun: "startMatch"})
    ActionCable.server.broadcast(match.black_player.to_s, { fun: "startMatch"})
  end
  def makeMove(data)
    puts data.class
    puts "stub for applying move: "
    puts data
    match = Match.find_by(white_player: connection.session[:user_id])
    if not match
      match = Match.find_by(black_player: connection.session[:user_id])
    end
    refreshBoard(match)
  end
  def refreshBoard(match)
    ActionCable.server.broadcast(match.white_player.to_s, { fun: "refreshBoard"})
    ActionCable.server.broadcast(match.black_player.to_s, { fun: "refreshBoard"})
  end
end
