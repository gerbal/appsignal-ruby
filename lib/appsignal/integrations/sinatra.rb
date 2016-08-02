require 'appsignal'
require 'appsignal/rack/sinatra_instrumentation'

Appsignal.logger.info("Loading Sinatra (#{Sinatra::VERSION}) integration")

app_settings = ::Sinatra::Application.settings
Appsignal.config = Appsignal::Config.new(
  app_settings.root || Dir.pwd,
  app_settings.environment
)

Appsignal.start_logger
Appsignal.start

if Appsignal.active?
  ::Sinatra::Application.use(Appsignal::Rack::SinatraInstrumentation)
end
