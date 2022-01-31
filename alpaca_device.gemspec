# frozen_string_literal: true

require_relative "lib/alpaca_device/version"

Gem::Specification.new do |spec|
  spec.name = "alpaca_device"
  spec.version = AlpacaDevice::VERSION
  spec.authors = ["Sergio Gernyak"]
  spec.email = ["sergeg1990@gmail.com"]

  spec.summary = "Implements ASCOM Alpaca 🦙 device specification"
  spec.description = <<-DESC.strip
    Provides all needed resources - discovery service, management API, device API - for creating your own ASCOM alpaca devices.
  DESC
  spec.homepage = "https://github.com/sergio1990/alpaca-device"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sergio1990/alpaca-device"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "grape", "1.6.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
