class CovidCase::CLI


    def call
        puts "Welcome to the Covid-Case CLI"
        puts "Please type the first letter of the state you would like to view or type list to view all states available."
        get_states
        get_user_choice
        get_user_state
        #get_case(state)
        #finale
    end

    def get_states
        @place = CovidCase::States.all
    end

    def get_user_choice
        choice = gets.chomp
        @place.each.with_index(1) do |x, index|
            if x.name.start_with?(choice)
                puts "#{index}. #{x.name.to_s}"
            elsif choice == "list"
                puts "#{index}. #{x.name}"
                #binding.pry
            end
        end
    end

    def get_user_state
        @input = gets.chomp.to_i
        show_state_details(@input)
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
            puts "Death ....................... #{stat.death}"
            puts "Cases ....................... #{stat.cases}"
            puts "Vaccination ................. #{stat.vaccinated}"
            puts "Tested....................... #{stat.tested}"
            puts "#########################################"
            puts "Please make another selection"
            puts "If you wish to exit, press n"
            #input = gets.strip
            #call until @input == "n"
        end
    end

    def finale
        puts "Thanks for using The Covid_case CLI!"
    end
end