require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'Enigma coverage check'
require_relative 'keymaker_spec'
require_relative 'offsetmaker_spec'
require_relative 'shiftmaker_spec'
require_relative 'lettershift_spec'
