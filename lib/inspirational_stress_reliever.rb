require 'pry'
require 'httparty'
require 'tty-prompt'
require 'colorize'

require_relative "inspirational_stress_reliever/version"
require_relative "inspirational_stress_reliever/cli"
require_relative "inspirational_stress_reliever/inspiration_api"
require_relative "inspirational_stress_reliever/inspiration_quote"


module InspirationalStressReliever
  class Error < StandardError; end
  
end
