// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//import "@hotwired/turbo-rails"
import "controllers"
//= require jquery3
//= require popper
//= require bootstrap

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

import Rails from "@rails/ujs"
Rails.start()
import "@hotwired/turbo-rails"
import "controllers"