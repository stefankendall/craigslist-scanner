require_relative '../config/boot'
require_relative '../config/environment'
require 'clockwork'
require 'tasks/scanning_job'
include Clockwork

every(3.seconds, 'refreshlistings') { Delayed::Job.enqueue ScanningJob.new }
