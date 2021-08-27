class CovidCase::Scraper
    attr_accessor :states_info

    def self.scrape_states
        doc = Nokogiri::HTML(open("https://www.nytimes.com/interactive/2021/us/covid-cases.html"))
        states = doc.css("tbody.children tr .name")
        states.each do |state|
                name = state.text.gsub(/[\W]/, "")
                state_url = state.css("a").attribute("href").value
                CovidCase::States.new(name, state_url)
        end
    end

    def self.scrape_covid_stat(state)
        page = "http://nytimes.com#{state}"
        doc = Nokogiri::HTML(open(page))
        doc.css(".covid-tracker").collect do |element|
            death = element.css(".num.deaths.svelte-6tbkhx")[2].text,
            cases = element.css(".num.cases.svelte-6tbkhx")[2].text,
            vaccinated = element.css(".num.vax.td-end")[0].text
            CovidCase::Covid_info.new(state, death, cases, vaccinated)
        end
    end
end