#
#  Be sure to run `pod spec lint JXLDayAndNightModeDemo.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.


Pod::Spec.new do |s|

  s.name         = "JXLDayAndNightMode"
  s.version      = "1.0.0"
  s.summary      = "a manager easy to set view backgroundColor or other color"

  s.homepage     = "https://github.com/JinXinLiang/JXLDayAndNightModeDemo"
  s.license      = 'MIT'
  s.author       = { "Eiwodetianna" => "jinxinliang1993@gmail.com" }
  s.platform     = :ios, "6.0"
  s.ios.deployment_target = "6.0"
  s.source       = { :git => "https://github.com/JinXinLiang/JXLDayAndNightModeDemo.git", :tag => s.version}
  s.source_files  = 'JXLDayAndNightModeDemo/JXLDayAndNightModeDemo/JXLDayAndNightMode/*.{h,m}'
  s.requires_arc = true


end
