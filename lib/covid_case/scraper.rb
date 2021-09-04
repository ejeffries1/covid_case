class CovidCase::Scraper


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
        wait = Selenium::WebDriver::Wait.new(:timeout => 1)
        driver = Selenium::WebDriver.for :chrome
        begin
            driver.get "https://coronavirus.jhu.edu#{state.state_url}"
          #ensure
            #driver.quit
          end
        ele = wait.until { driver.find_element(css: '.RegionOverview_mainSections__3DQD7.RegionOverview_noBorder__1yP6L')}
            #death = ele.text.split("\n")[8]
            #cases = ele.text.split("\n")[6]
            #vaccinated = ele.text.split("\n")[18]
            #tested = ele.text.split("\n")[10]
            CovidCase::Covid_info.new(name, state)#death, cases, vaccinated, tested)
            state.stats << ele.text
            #binding.pry
    end
end