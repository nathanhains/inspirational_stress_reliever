class InspirationalStressReliever::API
    @@all_quotes = []

    def initialize
        @url = "https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"
    end

    def find_data
        response_hash = HTTParty.get(@url)
        self.get_quote(response_hash)
    end

    def get_quote(find_data)
        find_data["quoteText"]
    end

    def print_quote
        puts find_data
    end


end