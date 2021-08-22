class CovidCase::States
    attr_accessor :name, :state_url, :covid_array

    @@all = []
    
    def initialize(name, state_url)
        @name = name
        @state_url = state_url
        @@covid_array = []
        save
    end

    def self.all
        CovidCase::Scraper.scrape_states if @@all.empty?
        @@all
    end

    def get_state_stat
        CovidCase::Scraper.scrape_covid_stat(self.state_url) if @@covid_array.empty?
        @@covid_array
    end

    def save
        @@all << self
    end
end