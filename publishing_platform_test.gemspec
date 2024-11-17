# frozen_string_literal: true

require_relative "lib/publishing_platform_test/version"

Gem::Specification.new do |spec|
  spec.name = "publishing_platform_test"
  spec.version = PublishingPlatformTest::VERSION
  spec.authors = ["Publishing Platform"]

  spec.summary = "Test setup for Publishing Platform"
  spec.description = "Test configuration and dependencies for applications on Publishing Platform"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_dependency "capybara", ">= 3.36"
  spec.add_dependency "puma"
  spec.add_dependency "selenium-webdriver", ">= 4.0"

  spec.add_development_dependency "climate_control"
  spec.add_development_dependency "publishing_platform_rubocop"
  spec.add_development_dependency "simplecov"
end
