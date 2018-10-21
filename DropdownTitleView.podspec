Pod::Spec.new do |spec|
  spec.name         = 'DropdownTitleView'
  spec.version      = '0.1.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/GitHawkApp/DropdownTitleView'
  spec.authors      = { 'Ryan Nystrom' => 'rnystrom@whoisryannystrom.com' }
  spec.summary      = 'Navigation item title view with subtitle and chevron.'
  spec.source       = { :git => 'https://github.com/GitHawkApp/DropdownTitleView.git', :tag => '#{s.version}' }
  spec.source_files = 'Source/*.swift'
  s.resources       = "Source/Assets.xcassets"
  spec.platform     = :ios, '10.0'
  spec.swift_version = '4.0'
end
