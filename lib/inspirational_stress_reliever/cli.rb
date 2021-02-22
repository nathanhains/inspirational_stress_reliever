class InspirationalStressReliever::CLI
    @@stress = 0

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

    def options_until(input)
        until input == '1' || input == '2'
            wrong_input
            print "Enter 1 for 'yes', 2 for 'no: "
            input = gets.strip
            puts ""
        end
        input.to_i
    end

    def wrong_input
        @@stress += 1
        if @@stress < 3
            puts "> I understand you might be stressed but please, read carefully.."
        elsif @@stress >=3 && @@stress <5
            puts "> Listen buddy, either read the prompts or start handing out some quotes of your own."
        elsif @@stress >= 5 && @@stress <7
            puts "> You know, programs can get stressed too.."
        else
            puts "> I need a break." 
            puts "> Goodbye!"
            exit
        end
    end

    def start
        if options == 1
            sorry
        end
    end

    def sorry
        puts "> I'm sorry to hear that! Would you like an inspirational quote to boost those spirits?"
        if options == 1
            another_options = 0
            while another_options != 2
                call_api
                if another? == 2
                    another_options = 2
                end
            end
        end
    end

    def call_api
        obj = InspirationalStressReliever::API.new
        obj.print_quote
        print "-"
        if obj.get_author.length > 0
            obj.print_author
        else
            puts "Unknown"
        end
        puts ""
    end

    def another?
        puts "> Would you like another quote?"
        options
    end

    def goodbye
        puts "> Well then! Looks like you do not require my services!"
        puts "> Goodbye!"
        puts ""
    end

end