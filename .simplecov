# frozen_string_literal: true

SimpleCov.start 'rails' do
  enable_coverage :branch
  primary_coverage :branch
  add_filter '/bin/'
  add_filter '/config/'
  add_filter '/db/'
  add_filter '/log/'
  add_filter '/node_modules/'
  add_filter '/public/'
  add_filter '/spec/'
  add_filter '/storage/'
  add_filter '/tmp/'
  add_filter '/vendor/'
end
