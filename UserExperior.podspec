Pod::Spec.new do |s|  
    s.name                    = 'UserExperior'
    s.version                 = '6.0.15'
    s.summary                 = 'Understand and fix user experience issues.'
    s.homepage                = 'https://www.userexperior.com/'

    s.author                  = { 'UserExperior' => 'hello@userexperior.com' }
    s.license                 = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform                = :ios
    s.source                  = { :http => "https://raw.githubusercontent.com/UserExperior/ios-sdk/6.0.15/UserExperiorSDK.xcframework.zip" }
    s.ios.deployment_target   = '12.0'
    s.ios.vendored_frameworks = 'UserExperiorSDK.xcframework'
    s.preserve_paths          = 'UserExperiorSDK.xcframework'
    s.dependency 'UECrashReporter', '~> 1.0.6'
end  
