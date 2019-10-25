Pod::Spec.new do |s|

  s.name         = "APLEmailAddress"
  s.version      = "0.0.1"
  s.summary      = "Implements  an EmailAddress Detector that returns instances EmailAddress containing valid email addresses"

  s.description  = <<-DESC
                   * APLEmailAddress contains the class EmailAddressDetector to detect valid email-Addresses in a string and return instances of the EmailAddressProtocol.     
                   DESC

  s.homepage     = "https://github.com/apploft/APLEmailAddress"
  
  s.swift_version = '5.0'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  
  s.author       = "Famara Kassama"
  
  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/apploft/APLEmailAddress.git", :tag => s.version.to_s }

  s.source_files  = "Classes", "Classes/**/*"
  
  s.framework  = "UIKit"
  s.requires_arc = true
  
end
