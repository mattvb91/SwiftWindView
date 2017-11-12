Pod::Spec.new do |s|
s.name             = 'SwiftWindView'
s.version          = '0.1.0'
s.summary          = 'A Swift 4 view to show Wind & Pressure status'

s.description      = <<-DESC
Swift 4 view to show Wind & Pressure status. More weather details coming soon.
DESC

s.homepage         = 'https://github.com/mattvb91/SwiftWindView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Matthias von Bargen' => 'matt@mavon.ie' }
s.source           = { :git => 'https://github.com/mattvb91/SwiftWindView.git', :tag => '0.1.0' }

s.ios.deployment_target = '10.0'
s.source_files = 'SwiftWindView/SwiftWindView.swift'

end
