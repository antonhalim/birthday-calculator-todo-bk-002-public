# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require_relative '../birthday_calc.rb'
require "timecop"

RSpec.configure do |config|

  july_14th_2014 = Time.local(2014, 7, 14)
  Timecop.freeze(july_14th_2014)

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # A '.' represents a passing example, 'F' is failing, and '*' is pending.
  config.formatter = :progress

  # Use the treat_symbols_as_metadata_keys_with_true_values option to tell RSpec that :key is shorthand for :key => true.
  # config.treat_symbols_as_metadata_keys_with_true_values = true

  # Limit the spec run to only specs with the focus metadata. If no specs have
  # the filtering metadata and `run_all_when_everything_filtered = true` then
  # all specs will run.
  # config.filter_run :focus

  # Run all specs when none match the provided filter. This works well in
  # conjunction with `config.filter_run :focus`, as it will run the entire
  # suite when no specs have `:filter` metadata.
  # config.run_all_when_everything_filtered = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  # config.order = 'random'
  config.order = 'default'
  
end