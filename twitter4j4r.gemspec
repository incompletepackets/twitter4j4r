# -*- encoding: utf-8 -*-
require File.expand_path('../lib/twitter4j4r/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "incomeplte-twitter4j4r"
  gem.version       = Twitter4j4r::VERSION
  gem.authors       = ["Tobias Crawley", "Marek Jelen", "Thomas Claridge"]
  gem.email         = ["toby@tcrawley.org", "", "thomas.claridge@incompletepackets.co.nz"]
  gem.homepage      = "https://github.com/incompletepackets/twitter4j4r"
  gem.description   = %q{A thin, woefully inadequate wrapper around http://twitter4j.org/}
  gem.summary       = %q{A thin, woefully inadequate wrapper around http://twitter4j.org/ that only supports the stream api with keywords.}
  gem.license       = "MIT"

  gem.platform      = "java"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  
  gem.require_paths = ["lib"]
end
