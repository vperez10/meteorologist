require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]
    url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================
def temp
          require 'open-uri'
          url = "https://api.forecast.io/forecast/5fa7d55c02984ea9bcad2898c1e155c4/#{@lat},#{@lng}"

               parsed_data = JSON.parse(open(url).read)
latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
    end


    @current_temperature = "Replace this string with your answer."

    @current_summary = "Replace this string with your answer."

    @summary_of_next_sixty_minutes = "Replace this string with your answer."

    @summary_of_next_several_hours = "Replace this string with your answer."

    @summary_of_next_several_days = "Replace this string with your answer."

    render("street_to_weather.html.erb")
  end
end
