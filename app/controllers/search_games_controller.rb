class SearchGamesController < ApplicationController
  def search
    user = User.find(params[:user_id])
    birth_date = user.birth_date
    
    response = HTTParty.get("https://api.rawg.io/api/games", {
      query: {
        key: ENV['RAWG_API_KEY'],
        dates: "#{birth_date}",
        page_size: 1
      }
    })

    @game = response.parsed_response["results"][0]
    render :result
  end
end
