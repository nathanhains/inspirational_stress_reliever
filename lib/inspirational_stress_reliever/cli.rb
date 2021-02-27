class InspirationalStressReliever::CLI
    @@stress = 0

    def call #will begin, start and end the process when called
        hello
        start
        goodbye
    end

    def hello #greets the user
        puts ""
        puts "-----------------------------------------".green
        puts "Welcome to Inspirational Stress Reliever!".green
        puts "-----------------------------------------".green
        puts ""                                                                              
    end

    def start #will start or end the program depending on user input
        prompt = TTY::Prompt.new
        if prompt.yes?("> Are you feeling stressed today?") == true
            sorry
        end
    end

    def wrong_input #outputs different message based on how many times the user inputs an unprompted character
        @@stress += 1
        if @@stress < 3
            puts "> I understand you might be stressed but please, read carefully.."
        elsif @@stress >=3 && @@stress <5
            puts "> You know, programs can get stressed too.."
        elsif @@stress >= 5 && @@stress <7
            puts "> Listen buddy, either read the prompts or start handing out some quotes of your own.".red
        else
            puts "> Would you look at that! Looks like break time!" 
            puts "> Goodbye!"
            puts ""
            exit
        end
    end

    def sorry #will output condolence & make a call to the api class for the quote depending on user input
        puts ""
        prompt = TTY::Prompt.new
        if prompt.yes?("> I'm sorry to hear that! Would you like an inspirational quote to boost those spirits?") == true
            another_options = 0
            while another_options != 2
                call_api
                if another? == false
                    another_options = 2
                end
            end
            history
            if InspirationalStressReliever::INSPIRATION_QUOTE.all.length > 1
                if author? == true
                    puts ""
                    puts "> Alright! Which quote can I grab that for?"
                    author
                end
            else
                if author? == true
                    puts ""
                    puts InspirationalStressReliever::INSPIRATION_QUOTE.all.last.print_author.cyan
                end
            end
        end
    end

    def call_api = #creates new instance, outputs quote
        puts ""
        InspirationalStressReliever::INSPIRATION_API.new.find_data
        puts InspirationalStressReliever::INSPIRATION_QUOTE.all.last.print_quote.cyan
        puts ""
    end



    def another? #method for asking user for another quote
        prompt = TTY::Prompt.new
        prompt.yes?("> Would you like another quote?")
    end

    def history
        if InspirationalStressReliever::INSPIRATION_QUOTE.all.length > 1
            puts ""
            puts "> Here is a list of all your quotes: "
            puts ""
            InspirationalStressReliever::INSPIRATION_QUOTE.all.each_with_index do |quote, index|
                sleep 0.5
                print "#{index + 1}. "
                puts "#{quote.print_quote.cyan}"
            end
        end
    end

    def author?
        if InspirationalStressReliever::INSPIRATION_QUOTE.all.length > 1
            prompt_1 = TTY::Prompt.new
            puts ""
            prompt_1.yes?("> Would you like to know any of the authors?")
        else
            prompt_2 = TTY::Prompt.new
            puts ""
            prompt_2.yes?("> Would you like to know the author of your quote before you go?")
        end
    end

    def author
        z = 0
        until z == 2
            puts ""
            print "Enter the number for which you would like the author of, or enter 'list' to see the list again: "
            input = gets.strip
            puts ""
            if input.capitalize == 'List'
                history
            elsif input.capitalize == 'Exit'
                goodbye
                exit
            elsif input.to_i > 0 && input.to_i <= InspirationalStressReliever::INSPIRATION_QUOTE.all.length
                puts InspirationalStressReliever::INSPIRATION_QUOTE.all[input.to_i - 1].print_author.cyan
                puts ""
                prompt = TTY::Prompt.new
                if prompt.yes?("> Are you finished?") == true
                    z = 2
                end
            else
                wrong_input
            end
        end
    end

    def goodbye #ends the program with a goodbye message for all exits
        puts ""
        puts "> Well then! Looks like my job here is done!"
        puts "> Goodbye!"
        puts ""
    end

end