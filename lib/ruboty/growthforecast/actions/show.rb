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
          delta = update_number(number) { |previous, current| current - previous }
          message.reply reply_message(binding)
        rescue => e
          message.reply e.message
        end

        private

        def brain
          message.robot.brain.data
        end

        def previous_number
          brain['number'] || 0
        end

        def update_number(number, &f)
          f.call(previous_number, number).tap do
            brain['number'] = number
          end
        end

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
