require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Expat
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    # config.exceptions_app = self.routes
    I18n.config.enforce_available_locales = true
    config.google_verification = ENV['GOOGLE']
    config.cache_store = :dalli_store
    
    config.middleware.insert_before(Rack::Cache, Mobvious::Manager)
    
    config.middleware.insert 0, 'Rack::Rewrite' do
      r301      '/index.html',          '/'
      r301      '/companyinfo.htm',     '/about'
      r301      '/expat.htm',           '/expat-tax-advisor'
      r301      '/taxservice.htm',      '/how-it-works'
      r301      '/Offshore.htm',        '/expat-tax-advisor'
      r301      '/accounting.htm',      '/expat-tax-advisor'
      r301      '/financial.htm',       '/expat-tax-advisor'
      r301      '/tax.htm',             '/expat-tax-advisor'
      r301      '/feedback.htm',        '/contact-us'
      r301      '/quotes.htm',          '/expat-investment-advice-and-planning/quotes'
      r301      '/Links.htm',           '/'
      r301      '/search.htm',          '/'
      r301      '/testimonials.htm',    '/about/testimonials'
      r301      '/CFC.htm',             '/expat-tax-advisor'
      r301      '/LateFilings.htm',     '/expat-investment-advice-and-planning/old-forms'
      r301      '/incorporation.htm',   '/expat-tax-advisor'
      r301      '/russian_tax.htm',     '/'
      r301      '/TIC.htm',             'http://www.cornerstonedst.com/'
      r302      '/Corporation_HQ.jpg',  'http://www.expattaxpreparers.com/Corporation_HQ.jpg'
      r301      '/01QuestUS.xls',       'http://d21c7j241p6103.cloudfront.net/questionnaires/01QuestUS.xls'
      r301      '/RussQuestionnaire_2003.xls',       'http://d21c7j241p6103.cloudfront.net/questionnaires/RussQuestionnaire_2003.xls'
      r301      '/RussQuestionnaire_2005.xls',       'http://d21c7j241p6103.cloudfront.net/questionnaires/RussQuestionnaire_2005.xls'
      r301      %r{/(\d+)%20US%20Tax%20Questionnaire.xls},    'http://d21c7j241p6103.cloudfront.net/questionnaires/$1.xls'
    end
  end
end
