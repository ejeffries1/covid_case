class CovidCase::Covid_info
    attr_accessor :state, :death, :cases, :vaccinated, :tested
   
    @@all = []
    def initialize(state, death, cases, vaccinated, tested)
        @state = state
        @death = death
        @cases = cases
        @vaccinated = vaccinated
        @tested = tested
        save
    end

    def self.all
        @@all
    end

    def self.add_to_state
        @state.covid_array << self unless @state.covid_array.include?(self)
    end

    def save
        @@all << self
    end
end