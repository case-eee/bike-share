require 'bundler'
require 'rubygems'
Bundler.require

require File.expand_path('bike_share_app.rb', File.dirname(__FILE__))

run BikeShareApp
