Pod::Spec.new do |s|  
    s.name                    = 'UserExperior'
    s.version                 = '5.1.7'
    s.summary                 = 'Understand and fix user experience issues.'
    s.homepage                = 'https://www.userexperior.com/'

    s.author                  = { 'UserExperior' => 'hello@userexperior.com' }
    s.license                 = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform                = :ios
    s.source                  = { :git => "https://github.com/UserExperior/ios-sdk", :tag => s.version }

    s.ios.deployment_target   = '10.0'
    s.ios.vendored_frameworks = 'UserExperiorSDK.xcframework'
    s.preserve_paths          = 'UserExperiorSDK.xcframework'
    s.dependency 'UECrashReporter', '~> 1.0.1'
end  
