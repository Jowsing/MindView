#
# Be sure to run `pod lib lint MindView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MindView'
  s.version          = '1.0.2'
  s.summary          = 'A highly customizable nodeView of MindView.'
  s.homepage         = 'https://github.com/jowsing/MindView'
  s.screenshots     = 'https://github.com/Jowsing/MindView/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-07-27%20at%2013.30.49.png', 'https://github.com/Jowsing/MindView/blob/main/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-07-27%20at%2018.11.29.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jowsing' => 'jowsing169@gmail.com' }
  s.source           = { :git => 'https://github.com/jowsing/MindView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'MindView/Sources/**/*'

end
