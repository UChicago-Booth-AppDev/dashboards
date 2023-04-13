class ForexController < ActionController::Base

  def first_currency_list
  
    currency_list_url = "https://api.exchangerate.host/symbols"

    require "open-uri"

    raw_response = URI.open(currency_list_url).read

    require "json"

    parsed_response = JSON.parse(raw_response)
    
    symbols_hash = parsed_response.fetch("symbols")

    symbols_hash_length = symbols_hash.length

    symbols_array = symbols_hash.to_a

    @clean_symbols_array = Array.new

    symbols_hash_length.times do |new_symbol|
    
      
      currency_symbol = symbols_array[new_symbol][0]
      @clean_symbols_array.push(currency_symbol)
    
    end
    
    
    render({:template => "/forex/forex_currency_one"})
  
  end





  def second_currency_list
  
    currency_list_url = "https://api.exchangerate.host/symbols"

    require "open-uri"

    raw_response = URI.open(currency_list_url).read

    require "json"
    
    parsed_response = JSON.parse(raw_response)
    
    symbols_hash = parsed_response.fetch("symbols")

    symbols_hash_length = symbols_hash.length

    symbols_array = symbols_hash.to_a

    @clean_symbols_array = Array.new

    symbols_hash_length.times do |new_symbol|
    
      
      currency_symbol = symbols_array[new_symbol][0]
      @clean_symbols_array.push(currency_symbol)
    
    end
    
    @user_first_currency = params.fetch("user_currency_one")
    
    render({:template => "/forex/forex_currency_two"})
  
  end


  def conversion
    
    @user_first_currency = params.fetch("user_currency_one")
    @user_second_currency = params.fetch("user_currency_two")

    conversion_url = "https://api.exchangerate.host/convert?from=#{@user_first_currency}&to=#{@user_second_currency}"

    require "open-uri"

    raw_response = URI.open(conversion_url).read

    require "json"
    
    parsed_response = JSON.parse(raw_response)

    @exchangerate = parsed_response.fetch("result")

    render({:template => "/forex/forex_conversion"})

  end 


end
