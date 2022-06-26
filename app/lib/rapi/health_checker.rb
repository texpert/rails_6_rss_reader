# frozen_string_literal: true

module Rapi
  class HealthChecker
    def self.run
      { 'Rails DB':    ActiveRecord::Base.connected? ? :OK : :ERROR,
        Roda:          :OK,
        'Que workers': que_workers }
    end

    def self.que_workers
      Que::Worker.workers.map do |w|
        w.alive? ? :OK : :ERROR
      end
    end
  end
end
