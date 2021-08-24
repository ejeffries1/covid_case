class CovidCase::CLI


    def call
        puts "Welcome to the Covid-Case CLI"
        puts "Please type the first letter of the state you would like to view or type list to view all states available."
        get_states
        #list_states
        get_user_input
        #binding.pry
        #get_case(state)
    end

    def get_states
        @place = CovidCase::States.all
    end

    def get_user_input
        @input = gets.strip
        if @input == "list"
            list_states
            get_user_input
        elsif @input == int.to_i > @place.count
            get_user_state
        else state.name.start_with?(input)
            @place.select.with_index(1) do |state, index|
                puts "#{index}. #{state.name}"
            end
        end
    end

    def list_states
        @place.each.with_index(1) do |state, index|
                puts "#{index}. #{state.name}"
        end
    end

    def get_user_state
        #@input = gets.strip.to_i
        show_state_details(input)
    end

    #def valid_input(input)
    #    @index = input.to_i
    #    @index <= @place.count && @index > 0
    #end

    def show_state_details(chosen_state)
        location = @place[chosen_state-1]
        CovidCase::States.get_state_stat(location.state_url)
        CovidCase::Covid_info.all.each do |stat|
            puts "Here are your results for #{location.name}"
            puts "#########################################"
            puts "Death ....................... #{stat.death[2]}"
            puts "Cases ....................... #{stat.cases}"
            puts "Vaccination ................. #{stat.vaccinated}"
        end
            puts "#########################################"
            puts "Please make another selection"
            puts "If you wish to exit, press n"
            input = gets.strip
            call unless input == "n"
    end
end