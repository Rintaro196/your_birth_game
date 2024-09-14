require 'rawg_rb'
class RawgService
  def search_games_by_birth_date(query)
    rawg = RAWG::Client.new(user_agent: ENV['RAWG_API_KEY'])

    rawg.search_games(dates: "#{query}").first(1)
  end
end