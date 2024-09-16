class SearchGamesController < ApplicationController
  def search
    user = User.find(params[:user_id])
    @birth_date = user.birth_date.strftime("%Y-%m-%d")

    response = HTTParty.get("https://api.rawg.io/api/games", {
      query: {
        key: ENV["RAWG_API_KEY"],
        dates: "#{@birth_date},#{@birth_date}",
        page_size: 1
      },
      headers: { "Cache-Control" => "no-cache" }
    })

    game_data = response.parsed_response["results"]&.first
    @game = game_data
    @genres = game_data["genres"].map { |genre| genre["name"] } if game_data.present?

    render :result
  end
end
