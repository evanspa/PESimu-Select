Pod::Spec.new do |s|
  s.name         = "PESimu-Select"
  s.version      = "1.0.2"
  s.license      = "MIT"
  s.summary      = "An iOS static library simplifying the functional testing of web service-enabled apps."
  s.author       = { "Paul Evans" => "evansp2@gmail.com" }
  s.homepage     = "https://github.com/evanspa/#{s.name}"
  s.source       = { :git => "https://github.com/evanspa/#{s.name}.git", :tag => "#{s.name}-v#{s.version}" }
  s.platform     = :ios, '8.3'
  s.source_files = '**/*.{h,m}'
  s.public_header_files = '**/*.h'
  s.exclude_files = "**/*Tests/*.*", "**/DemoApp/*"
  s.requires_arc = true
  s.dependency 'PEObjc-Commons', '~> 1.0.8'
  s.dependency 'PEWire-Control', '~> 1.0.2'
  s.xcconfig     = { 'HEADER_SEARCH_PATHS' => '"$(SDKROOT)/usr/include/libxml2"' }
end
