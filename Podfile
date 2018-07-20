# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Centurion' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  project 'Centurion.xcodeproj'
  # Pods for Centurion
  pod 'Moscapsule', :git => 'https://github.com/flightonary/Moscapsule.git'
  pod 'OpenSSL-Universal'
  pod 'ionicons'  
  pod 'MQTTClient', :git => 'https://github.com/novastone-media/MQTT-Client-Framework'
  target 'CenturionTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CenturionUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
