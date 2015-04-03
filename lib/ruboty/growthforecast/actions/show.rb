require 'growthforecast'
require 'erb'

module Ruboty
  module GrowthForecast
    module Actions
      class Show
        attr_reader :message
        def initialize(message)
          @message = message
        end

        def call
          number = client.by_name(*path).number
          message.reply reply_message(binding)
        rescue => e
          message.reply e.message
        end

        private

        def format
          message[:format] || '<%= number %>'
        end

        def reply_message(b = binding)
          ERB.new(format).result(b)
        end

        def path
          message[:path].split '/'
        end

        def client
          @client ||= ::GrowthForecast.new(host, port).tap do |client|
            if username
              client.username = username
              client.password = password
            end
          end
        end

        def host
          ENV['GROWTHFORECAST_HOST']
        end

        def port
          (ENV['GROWTHFORECAST_PORT'] || 80).to_i
        end

        def username
          ENV['GROWTHFORECAST_USERNAME']
        end

        def password
          ENV['GROWTHFORECAST_PASSWORD']
        end

      end
    end
  end
end
