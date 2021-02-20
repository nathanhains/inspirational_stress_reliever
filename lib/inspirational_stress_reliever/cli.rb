class InspirationalStressReliever::CLI
    def call
        hello
        start
        goodbye
    end

    def hello
        puts ""
        puts "-----------------------------------------"
        puts "Welcome to Inspirational Stress Reliever!"
        puts "-----------------------------------------"
        puts ""
        puts "> Are you feeling stressed today?"
    end

    def options
        print "Enter 1 for 'yes', 2 for 'no': "
        input = gets.strip
        puts ""
        options_until(input)
    end

end