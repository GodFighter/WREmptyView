#
# Be sure to run `pod lib lint WREmptyView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WREmptyView'
  s.version          = '0.8.0'
  s.summary          = '表示图 空数据的展示view'

  s.description      = '表示图空数据展示，包括UITableView、UICollectionView'

  s.homepage         = 'https://github.com/GodFighter/WREmptyView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GodFighter' => '{xianghui_ios@163.com}' }
  s.source           = { :git => 'https://github.com/GodFighter/WREmptyView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.source_files = 'WREmptyView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WREmptyView' => ['WREmptyView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
   s.dependency 'WRRuntime', '~> 1.3.0'
end
