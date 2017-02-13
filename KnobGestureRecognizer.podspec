#
# Be sure to run `pod lib lint KnobGestureRecognizer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KnobGestureRecognizer'
  s.version          = '1.0'
  s.summary          = 'Knob Gesture Recognizer'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Knob Gesture Recognizer'

  s.homepage         = 'https://github.com/TheMindStudios/KnobGestureRecognizer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hapichdima' => 'hapich@themindstudios.com' }
  s.source           = { :git => 'https://github.com/TheMindStudios/KnobGestureRecognizer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'KnobGestureRecognizer/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KnobGestureRecognizer' => ['KnobGestureRecognizer/Assets/*.png']
  # }

end
