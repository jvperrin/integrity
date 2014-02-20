require "delayed_job"
require "active_record"

module Integrity
  class DelayedBuilder
    def initialize(options)
      ActiveRecord::Base.default_timezone = :utc
      ActiveRecord::Base.establish_connection(options)

      Delayed::Worker.backend = :active_record

      ActiveRecord::Migration.suppress_messages do
        unless Delayed::Job.table_exists?
          ActiveRecord::Schema.define {
            create_table :delayed_jobs, force: true do |table|
              table.string   :queue
              table.integer  :priority, default: 0
              table.integer  :attempts, default: 0
              table.text     :handler
              table.text     :last_error
              table.datetime :run_at
              table.datetime :locked_at
              table.datetime :failed_at
              table.string   :locked_by
              table.timestamps
            end
          }
        end
      end

      # TODO
      Delayed::Job.class_eval {
        def logger
          @_logger ||= Integrity.logger
        end
      }
    end

    def enqueue(build)
      Delayed::Job.enqueue(BuildJob.new(build))
    end

    class BuildJob
      def initialize(build)
        @build = build.id
      end

      def perform
        Build.get!(@build).run!
      end
    end
  end
end
