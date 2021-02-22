class InspirationalStressReliever::INSPIRATION_API

    def initialize #instantiates with a call to the api
        @url = "https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"
    end

    def find_data #manipulates data from api & calls on instance method to create an object of a quote
        response_hash = HTTParty.get(@url)
        self.create_object(response_hash)
    end

    def create_object(response_hash)
        InspirationalStressReliever::INSPIRATION_QUOTE.new(response_hash)
    end

end