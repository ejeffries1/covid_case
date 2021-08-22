# frozen_string_literal: true

require_relative "covid_case/version"
require_relative "covid_case/cli"
require_relative "covid_case/scraper"
require_relative "covid_case/states"
require_relative "covid_case/covid_info"

require 'nokogiri'
require 'pry'
require 'open-uri'

module CovidCase
  class Error < StandardError; end
  # Your code goes here...
end
