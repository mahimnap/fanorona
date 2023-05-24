class MatchesController < ApplicationController
  def new
    match = Match.new()
    match.white_player = session[:user_id]
    match.save
    @match_id = match.match_id
    render layout: "special_layout"
  end
  def find
    render layout: "special_layout"
  end
  def join
    begin
      match_id = join_params[:match_id]
      puts match_id
      if (match = Match.where(match_id: match_id)).any?
        match = match.first
        match.black_player = session[:user_id]
        match.save
        ActionCable.server.broadcast(match.white_player.to_s, { fun: "loadMatch"})
        redirect_to matches_load_url
      end
    rescue => e
    end
  end
  def load_match
    if Match.find_by(white_player: session[:user_id])
      render 'load_match', layout: 'special_layout'
    elsif Match.find_by(black_player: session[:user_id])
      render 'load_match_waiting', layout: 'special_layout'
    end
  end
  def refresh_board
    render layout: "special_layout"
  end
  def forfeit
    if match = Match.find_by(white_player: session[:user_id])
      match.winning_colour = 0
      match.save
      ActionCable.server.broadcast(match.black_player.to_s, { fun: "endMatch"})
    elsif match = Match.find_by(black_player: session[:user_id])
      match.winning_colour = 1
      match.save
      ActionCable.server.broadcast(match.white_player.to_s, { fun: "endMatch"})
    end
    redirect_to matches_end_url
  end
  def end
    if match = Match.find_by(white_player: session[:user_id])
      winner = match.winning_colour == 1
    elsif match = Match.find_by(black_player: session[:user_id])
      winner = match.winning_colour == 0
    end
    if winner
      @remark = "You Win!"
    else
      @remark = "You Lose!"
    end
  end
  private
  def join_params
    params.require(:match_id)
    params.permit(:match_id)
  end
end
