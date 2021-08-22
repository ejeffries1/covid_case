class CovidCase::Covid_info
    attr_accessor :state, :covid_hash
   
    @@all = []
    def initialize(state)
        @state = state
        #@death = death
        #@cases = cases
        #@vaccinated = vaccinated
        save
    end

    #def self.get_details
    #    CovidCase::Scraper.scrape_state_page(self.state_url)
    #end

    def self.all
        @@all
    end

    #def add_to_state
    #    @state.stats << self unless @state.stats.include?(self)
    #end

    def save
        @@all << self
    end
end