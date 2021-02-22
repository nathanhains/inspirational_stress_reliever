class InspirationalStressReliever::INSPIRATION_QUOTE

    @@all = []

    def initialize(response_hash)
        response_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def print_quote
        puts self.quoteText
    end

    def print_author
        puts self.quoteAuthor
    end

end