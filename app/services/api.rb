class Api 
  include HTTParty

  BASE_URL = ENV.fetch('BASE_URL', 'https://moat.ai/api').freeze
  TOKEN = ENV.fetch('TOKEN', 'default')

  def  initialize
    @options = {}
  end

  def task
    HTTParty.get(
      "#{BASE_URL}/task",
      headers: {"Basic" => "#{TOKEN}"},
    )
  end
end

