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
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      driver = Selenium::WebDriver.for :chrome, options: options
      driver.navigate.to "https://coronavirus.jhu.edu#{state.state_url}"
      driver.manage.window.resize_to(800, 800)
      driver.save_screenshot "intoli-screenshot.png"
        ele =  driver.find_element(css: '.RegionOverview_mainSections__3DQD7.RegionOverview_noBorder__1yP6L')
            state.stats << ele.text
    end
end