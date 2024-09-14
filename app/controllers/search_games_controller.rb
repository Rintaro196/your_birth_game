class SearchGamesController < ApplicationController
  def search
    user = User.find(params[:user_id])
    birth_date = user.birth_date
    
    rawg_service = RawgService.new
    @game = rawg_service.search_games_by_birth_date(birth_date)
    render :result
  end
end
