class CovidCase::Scraper
    attr_accessor :states_info

    def self.scrape_states
        doc = Nokogiri::HTML(open("https://coronavirus.jhu.edu/region"))
        states = doc.css("div.RegionMenu_items__3D_d2 a.Button_base__2nEBG.Button_style-filled-light__14tVT.Button_shape-square__31KW9.has-icon.null")
        states.collect do |state|
                name = state.text
                state_url = state.attribute("href").value
                CovidCase::States.new(name, state_url)
        end

    end

    def self.scrape_covid_stat(state)
        page = Nokogiri::HTML(open("https://coronavirus.jhu.edu#{state}"))
        doc = page.css(".RegionOverview_mainSections__3DQD7.RegionOverview_noBorder__1yP6L")
        doc.collect do |element|
            death = element.css("span").children.text
            #cases = element.css(".num.cases.svelte-6tbkhx")[2].text,
            #vaccinated = element.css(".num.vax.td-end")[0].text
            #CovidCase::Covid_info.new(state, death, cases, vaccinated)
            binding.pry
        end
    end
end