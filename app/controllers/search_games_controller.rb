class SearchGamesController < ApplicationController
  def search_by_birth_date
    user = User.find(params[:user_id])
    birth_date = user.birth_date
    
    # birth_dateをUnixタイムスタンプに変換
    release_date_unix = birth_date.to_time.to_i
    
    igdb_service = IgdbService.new
    @game = igdb_service.search_game_by_release_date_unix(release_date_unix)
    
    if @game.present?
        render :result
    else
      redirect_to games_path, notice: "No game found for the given release date."
    end
  end
end
