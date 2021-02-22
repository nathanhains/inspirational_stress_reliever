class InspirationalStressReliever::API
    @@all_quotes = []

    def initialize
        @url = "https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"
    end

    def find_data
        response_hash = HTTParty.get(@url)
    end

    def print_quote
        puts self.find_data["quoteText"]
    end

    def get_author
        self.find_data["quoteAuthor"]
    end

    def print_author
        puts self.find_data["quoteAuthor"]
    end

end