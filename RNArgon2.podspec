require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "RNArgon2"
  s.version      = package["version"]
  s.description  = package["description"]
  s.summary      = package['description']
  s.homepage     = package['homepage']
  # brief license entry:
  s.license      = package['license']
  # optional - use expanded license entry instead:
  # s.license    = { :type => "MIT", :file => "LICENSE" }
  s.authors      = package['author']
  s.platform     = :ios, '12.3'
  s.source       = { :git => "https://github.com/mayavolt/argon2-rn.git", :tag => "#{s.version}" }

  s.source_files  = "ios/*.{h,m,swift}"
  #s.requires_arc = true

  s.dependency 'React-Core'
  s.dependency 'CatCrypto'
  # ...
end