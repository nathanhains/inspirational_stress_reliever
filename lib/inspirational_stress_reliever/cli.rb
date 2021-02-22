class InspirationalStressReliever::CLI
    @@stress = 0

    def call #will begin, start and end the process when called
        hello
        start
        goodbye
    end

    def hello #greets the user
        puts ""
        puts "-----------------------------------------"
        puts "Welcome to Inspirational Stress Reliever!"
        puts "-----------------------------------------"
        puts ""
        puts "> Are you feeling stressed today?"
    end

    def start #will start or end the program depending on user input
        if options == 1
            sorry
        end
    end

    def options #takes user input
        print "Enter 1 for 'yes', 2 for 'no': "
        input = gets.strip
        puts ""
        options_until(input)
    end

    def options_until(input) #failsafe method
        until input == '1' || input == '2'
            wrong_input
            print "Enter 1 for 'yes', 2 for 'no: "
            input = gets.strip
            puts ""
        end
        input.to_i
    end

    def wrong_input #outputs different message based on how many times the user inputs an unprompted character
        @@stress += 1
        if @@stress < 3
            puts "> I understand you might be stressed but please, read carefully.."
        elsif @@stress >=3 && @@stress <5
            puts "> You know, programs can get stressed too.."
        elsif @@stress >= 5 && @@stress <7
            puts "> Listen buddy, either read the prompts or start handing out some quotes of your own."
        else
            puts "> I need a break." 
            puts "> Goodbye!"
            exit
        end
    end

    def sorry #will output condolence & make a call to the api class for the quote depending on user input
        puts "> I'm sorry to hear that! Would you like an inspirational quote to boost those spirits?"
        if options == 1
            another_options = 0
            while another_options != 2
                call_api
                if another? == 2
                    another_options = 2
                end
            end
            history
            if author? == 1 && InspirationalStressReliever::INSPIRATION_QUOTE.all.length > 1
                puts "> Alright! Which quote can I grab that for?"
                author
            else
                InspirationalStressReliever::INSPIRATION_QUOTE.all.last.print_author
                puts ""
            end
        end
    end

    def call_api #creates new instance, outputs quote
        InspirationalStressReliever::INSPIRATION_API.new.find_data
        InspirationalStressReliever::INSPIRATION_QUOTE.all.last.print_quote
        puts ""
    end

    def another? #method for asking user for another quote
        puts "> Would you like another quote?"
        options
    end

    def history
        if InspirationalStressReliever::INSPIRATION_QUOTE.all.length > 1
            puts "Here is a list of all your quotes: "
            puts ""
            InspirationalStressReliever::INSPIRATION_QUOTE.all.each_with_index do |quote, index|
                print "#{index + 1}. "
                puts "#{quote.print_quote}"
            end
        end
    end

    def author?
        if InspirationalStressReliever::INSPIRATION_QUOTE.all.length > 1
            puts "> Would you like to know any of the authors?"
        else
            puts "> Would you like to know the author of your quote?"
        end
        options
    end

    def author
        z = 0
        until z == 2
            print "Enter the number of which quote you would like the author of, or enter 'list' to see the list again: "
            input = gets.strip
            puts ""
            if input.capitalize == 'List'
                history
            elsif input.to_i > 0 && input.to_i <= InspirationalStressReliever::INSPIRATION_QUOTE.all.length
                puts InspirationalStressReliever::INSPIRATION_QUOTE.all[input.to_i - 1].print_author
                puts "> Are you finished?"
                if options == 1
                    z = 2
                end
            else
                wrong_input
            end
        end
    end

    def goodbye #ends the program with a goodbye message for all exits
        puts "> Well then! I hope you enjoy the rest of your day!"
        puts "> Goodbye!"
        puts ""
    end

end