class CovidCase::Covid_info
    attr_accessor :state, :death, :cases, :vaccinated
   
    @@all = []
    def initialize(state, death, cases, vaccinated)
        @state = state
        @death = death
        @cases = cases
        @vaccinated = vaccinated
        save
    end

    def self.all
        @@all
    end

    def add_to_state
        @state.covid_array << self unless @state.covid_array.include?(self)
    end

    def save
        @@all << self
    end
end