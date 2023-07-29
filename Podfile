source "https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git"
platform :ios, "13.0"
use_frameworks!

target "UIKitDemoApp" do
  pod 'Alamofire', '~> 4.7.3'
  pod 'AlamofireObjectMapper', '~> 5.2'
  pod 'AlamofireImage', '~> 3.3'
  pod "Kingfisher", "~> 6.3.1"
  pod "SnapKit"
  pod "R.swift"
  pod 'PKHUD', '~> 5.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 11.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      end
    end
  end
end
