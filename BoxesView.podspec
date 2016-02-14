Pod::Spec.new do |s|
  s.name             = "BoxesView"
  s.version          = "0.1.0"
  s.summary          = "A UIView layed out in boxes"

  s.description      = <<-DESC
  BoxesView is a UIView that lays out subviews as boxes, much like a simplified version of a UICollectionView
                       DESC

  s.homepage         = "https://github.com/lammertw/BoxesView"
  s.screenshots     = "http://i.imgur.com/D7IqjMW.png", "http://i.imgur.com/wuWclAX.png"
  s.license          = 'MIT'
  s.author           = { "Lammert Westerhoff" => "westerhoff@gmail.com" }
  s.source           = { :git => "https://github.com/lammertw/BoxesView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lwesterhoff'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'BoxesView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SnapKit'
end
