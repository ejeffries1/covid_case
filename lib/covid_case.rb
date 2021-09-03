# frozen_string_literal: true

require_relative "covid_case/version"
require_relative "covid_case/cli"
require_relative "covid_case/scraper"
require_relative "covid_case/states"
require_relative "covid_case/covid_info"

require 'rubygems'
require 'selenium-webdriver'
require 'nokogiri'
require 'pry'
require 'open-uri'
#require 'httparty'
#require 'json'


module CovidCase
  class Error < StandardError; end
  # Your code goes here...
end
