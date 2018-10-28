class WeathersController < ApplicationController
  layout 'search'

  def index
    @form = SearchForm.new
  end

  def search
    @form = SearchForm.new(search_form_params)

    uri = "http://api.openweathermap.org/data/2.5/forecast?q=#{@form.search_word}&APPID=10fa0f5908013c65b9f57aa28abc8bf3&lang=ja"
    conn = Faraday::Connection.new(:url => uri) do |builder|
      builder.use Faraday::Request::UrlEncoded
      builder.use Faraday::Response::Logger
      builder.use Faraday::Adapter::NetHttp
    end
    res = conn.get
    @weather = JSON.parse(res.body)
    render :index
  end

  def search_form_params
    params.require(:search_form).permit(:search_word)
  end
end
