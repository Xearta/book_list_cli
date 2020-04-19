
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "book_list/version"

Gem::Specification.new do |spec|
  spec.name          = "book_list"
  spec.version       = BookList::VERSION
  spec.authors       = ["Tanner Townsend"]
  spec.email         = ["rsmcwow@gmail.com"]

  spec.summary       = %q{This gem will scrape the NYT best seller list for a given week and return the corresponding books.}
  spec.homepage      = "https://github.com/Xearta/book_list_cli"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.executables   = ["book_list"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
end
