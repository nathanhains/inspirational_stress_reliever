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

end