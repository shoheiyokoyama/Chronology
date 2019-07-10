Pod::Spec.new do |spec|
    spec.name = 'Chronology'
    spec.version  = '1.0.4'
    spec.author = { 'Dave DeLong' => 'me@davedelong.com' }
    spec.homepage = 'https://github.com/shoheiyokoyama/Chronology'
    spec.summary = 'Building a better date/time library for Swift'
    spec.source = { :git => 'https://github.com/shoheiyokoyama/Chronology.git', :tag => spec.version.to_s }
    spec.source_files = 'Sources/**/*.swift'
    spec.license = { :type => 'MIT', :file => 'LICENSE' }
    spec.requires_arc = true
    spec.swift_version = '5.0'
    spec.ios.deployment_target = '10.0'
  end
