require 'rack/neverlocal/version'
require 'rack/neverlocal/remove_local_host'

module Rack
  class NeverLocal
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call RemoveLocalHost.from(env)
    end

  end
end
