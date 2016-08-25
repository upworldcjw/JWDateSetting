
Pod::Spec.new do |s|
  s.name     = 'JWDateSetting'
  s.version  = '0.0.2'
  s.license  = 'MIT'
  s.summary  = 'This can help you get system setting 12Hours or 24Hours which all use public API.'
  s.homepage = 'https://github.com/upworldcjw'
  s.author   = { 'upowrld' => '1042294579@qq.com' }
  s.source   = { :git => 'https://github.com/upworldcjw/JWDateSetting.git', :tag => '0.0.2' }
  s.source_files = 'JWDateSetting/*.{h,m}'
  s.ios.frameworks = 'Foundation', 'UIKit'
  s.ios.deployment_target = '5.0' #
  s.requires_arc = true
end
