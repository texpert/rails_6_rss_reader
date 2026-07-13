# frozen_string_literal: true

SimpleCov.load_profile 'rails'
SimpleCov.enable_coverage :branch
SimpleCov.primary_coverage :branch
SimpleCov.skip '/bin/'
SimpleCov.skip '/config/'
SimpleCov.skip '/db/'
SimpleCov.skip '/log/'
SimpleCov.skip '/node_modules/'
SimpleCov.skip '/public/'
SimpleCov.skip '/spec/'
SimpleCov.skip '/storage/'
SimpleCov.skip '/tmp/'
SimpleCov.skip '/vendor/'
