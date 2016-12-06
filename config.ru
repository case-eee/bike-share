require 'bundler'
Bundler.require
require 'will_paginate'
require 'will_paginate/active_record'

require File.expand_path('../config/environment',  __FILE__)

run BikeShareApp
