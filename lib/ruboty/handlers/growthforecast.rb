module Ruboty
    module Handlers
      class Growthforecast < Base
        on /gf show (?<path>\S+)(?<format> .*)?\z/, name: 'show', description: 'get latest value from GrowthForecast'

        def show(message)
          Ruboty::GrowthForecast::Actions::Show.new(message).call
        end
      end
    end
end
