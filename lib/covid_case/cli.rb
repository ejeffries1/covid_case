class CovidCase::CLI

    def call
        puts "Welcome to the Covid-Case CLI"
        puts "Please type the first letter of the state you would like to view or type list to view all states available."
        @input = ""
        until @input == "n"
        get_user_choice
        get_user_state
        are_you_done
        end
        finale
    end

    def get_states
        @states = CovidCase::States.all
    end

    def get_user_choice
        @choice = gets.chomp
        get_states.each.with_index(1) do |x, index|
            if x.name.start_with?(@choice.upcase)
                puts "#{index}. #{x.name.to_s}"
            elsif @choice == "list"
                puts "#{index}. #{x.name}"
            end
        end
    end

    def get_user_state
        @input = gets.strip.to_i
        show_state_details(@input) if valid_input(@input)
    end

    def valid_input(input)
        @index = input.to_i
        @index <= @states.count && @index > 0
    end

    def show_state_details(input)
        state = @states[input-1]
        state.get_state_stats
        state.stats.each do |stat|
            el = stat.split("\n")
            puts "Here are your results for #{state.name}"
            puts "#########################################"
            puts "Death ....................... #{el[8]}"
            puts "Cases ....................... #{el[6]}"
            puts "Vaccination ................. #{el[18]}"
            puts "Tested....................... #{el[10]}"
            puts "#########################################"
            puts "Please make another selection"
        end
    end

    def are_you_done
        puts "If you wish to exit, press n or type the first letter of the state you wish to view"
        @input = gets.strip
    end

    def finale
        puts "Thanks for using The Covid_case CLI!"
    end
end