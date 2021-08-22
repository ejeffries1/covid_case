class CovidCase::CLI

    #BASE_PATH = "https://www.nytimes.com/interactive/2021/us/covid-cases.html"

    def call
        puts "Welcome to the Covid-Case CLI"
        puts "Please make a selection"
        get_states
        list_states
        get_user_state
        show_state_details
        #binding.pry
        #get_case(state)
    end

    def get_states
        @place = CovidCase::States.all
    end

    def list_states
        @place.each.with_index(1) do |state, index|
            puts "#{index}.#{state.name}"
        end
    end

    def get_user_state
        input = gets.strip.to_i
        show_state_details(input)
    end

    def valid_input(input)
        @index = input.to_i
        @index <= @place.count && @index > 0
    end

    def show_state_details(input)
        location = @place[input-1]
        location.get_state_stat
        location.covid_array.each do |i|
            puts i
            binding.pry
        end
    end
end