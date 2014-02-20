require 'pry'

module Integrity
  class PayloadBuilder
    def self.build(payload, build_all)
      new(payload, build_all).build
    end

    def initialize(payload, build_all)
      @payload   = payload
      @build_all = build_all
    end

    def build
      if Integrity.config.trim_branches? && @payload.deleted?
        projects.each { |project| project.destroy }
        0
      else
        builds.each { |build| build.run }.size
      end
    end

    def builds
      @builds ||=
        projects.inject([]) { |acc, project|
          acc.concat commits.map { |c| project.builds.create(commit: c) }
        }
    end

    def commits
      @commits ||= @build_all ? @payload.commits : [@payload.head]
    end

    def projects
      @projects ||= ProjectFinder.find(@payload.repo)
    end
  end
end
