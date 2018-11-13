#
#  Be sure to run `pod spec lint CJKTAppGuideView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

 

  s.name         = "CJKTAppGuideView"
  s.version      = "0.0.1"
  s.summary      = "CJKTAppGuideView:APP的引导页"

 
  s.description  = <<-DESC
             CJKTAppGuideView:APP的好用的引导页
                   DESC

  s.homepage     = "https://github.com/Dxc123/CJKTAppGuideView"
  

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  

  s.author             = { "Dxc123" => "daixingchuang@163.com" }
 
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source       = { :git => 'https://github.com/Dxc123/CJKTAppGuideView.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.source_files  = "CJKTAppGuideView/**/*.{h,m}"
  #

  s.public_header_files = "CJKTAppGuideView/**/*.{h}"

  s.frameworks = 'UIKit', 'CoreFoundation','CoreText', 'QuartzCore', 'Accelerate', 'MobileCoreServices'

 
  
  # s.dependency "JSONKit", "~> 1.4"


end
