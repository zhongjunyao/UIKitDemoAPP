source "https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git"
platform :ios, "13.0"
use_frameworks!

target "DemoApp" do

  pod "Kingfisher", "~> 6.3.1"
  pod "SnapKit"
  pod "R.swift"

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