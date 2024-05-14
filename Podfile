platform :ios, '13.0'
use_frameworks!

target 'X' do
  # 基础网络
  pod 'Alamofire'
  # 图片
  pod 'Kingfisher'
  # JSON
  pod 'HandyJSON'
  # 响应式编程
  pod 'RxSwift'
  # 格式化
  pod 'SwiftLint'
  # 动画
  pod 'lottie-ios'
  # 专场
  pod 'Hero'
  # 自动生成代码
  pod 'SwiftGen'
  # 设备识别
  pod 'DeviceKit'
  # Log日志
  pod 'SwiftyBeaver'
  # 网络程序库
  pod 'Moya'
  # 数据库
  pod 'RealmSwift'
  # 布局
  pod 'SnapKit'
  # 音频
  pod 'AudioKit'
  # 处理输入
  pod 'IQKeyboardManagerSwift'
  # HUD
  pod 'ProgressHUD'
  # toast
  pod 'Toast-Swift'
  # socket
  pod 'Starscream'
  # 高德2D地图
  pod 'AMap2DMap'

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
   config.build_settings['CODE_SIGNING_ALLOWED'] ="NO"
  end
 end
end
