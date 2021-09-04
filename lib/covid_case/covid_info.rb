class CovidCase::Covid_info
    attr_accessor :name, :state, :url, :info #:death, :cases, :vaccinated, :tested
   
    @@all = []
    def initialize(name, state)#death, cases, vaccinated, tested)
        @name = name
        @state = state
        #@death = death
        #@cases = cases
        #@vaccinated = vaccinated
        #@tested = tested
        @info = []
        #add_to_state
        save
    end

    def self.all
        @@all
    end

    def add_to_state
        @state.stats << self unless @state.stats.include?(self)
    end

    def get_state_details
        CovidCase::Scraper.scrape_covid_stat(self) if @info.empty?
    end 

    def save
        @@all << self
    end
end