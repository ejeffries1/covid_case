class CovidCase::States
    attr_accessor :name, :state_url, :stats

    @@all = []
    
    def initialize(name, state_url)
        @name = name
        @state_url = state_url
        @stats = []
        save
    end

    def self.all
        CovidCase::Scraper.scrape_states if @@all.empty?
        @@all
    end

    def get_state_stats
        CovidCase::Scraper.scrape_covid_stat(self) if @stats.empty?
    end


    def save
        @@all << self
    end
end