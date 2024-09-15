class SearchGamesController < ApplicationController
  def search
    user = User.find(params[:user_id])
    @birth_date = user.birth_date.strftime("%Y-%m-%d")
    
    response = HTTParty.get("https://api.rawg.io/api/games", {
      query: {
        key: ENV['RAWG_API_KEY'],
        dates: "#{@birth_date},#{@birth_date}",
        page_size: 1
      },
      headers: { 'Cache-Control' => 'no-cache' }
    })

    @game = response.parsed_response["results"]&.first
    render :result
  end
end
