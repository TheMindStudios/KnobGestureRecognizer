
Pod::Spec.new do |s|
  s.name             = 'KnobGestureRecognizer'
  s.version          = '1.0.0'
  s.summary          = 'Knob Gesture Recognizer'
  s.description      = 'Knob Gesture Recognizer which detects circular gestures'

  s.social_media_url = 'https://twitter.com/TheMindStudios'
  s.homepage         = 'https://github.com/TheMindStudios/KnobGestureRecognizer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hapichdima' => 'hapich@themindstudios.com' }
  s.source           = { :git => 'https://github.com/TheMindStudios/KnobGestureRecognizer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
 
  s.source_files = 'KnobGestureRecognizer/Classes/**/*'

end
