# frozen_string_literal: true

use Rack::MethodOverride

require_relative './app.rb'

run BookmarkApp
