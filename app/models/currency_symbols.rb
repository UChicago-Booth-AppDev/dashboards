class Currency
  def Currency.list
    currency_list_url = "https://api.exchangerate.host/symbols"

    require "open-uri"

    raw_response = URI.open(currency_list_url).read

    require "json"

    parsed_response = JSON.parse(raw_response)
    
    symbols_hash = parsed_response.fetch("symbols")

    symbols_hash_length = symbols_hash.length

    symbols_array = symbols_hash.to_a

    clean_symbols_array = Array.new

    symbols_hash_length.times do |new_symbol|
    
      
      currency_symbol = symbols_array[new_symbol][0]
      clean_symbols_array.push(currency_symbol)
    
    end
  
    p clean_symbols_array
    

  end
end
