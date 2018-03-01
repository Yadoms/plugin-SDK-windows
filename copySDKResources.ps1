

$cmakeRoot = ".\extra_libs\cmake-3.10.2"

$yadomsRoot = ".\yadoms"
$boostRoot = ".\extra_libs\boost_1_65_1"
$pocoRoot = ".\extra_libs\poco-1.7.9-all"
$protobufRoot = ".\extra_libs\protobuf-3.4.1"
$sdkOut=".\SDK"

$robocopyFlags="/MT","/np","/njh","/ns","/nc","/nfl","/ndl"
  
# Copy Boost
Write-Host "Copy Boost folder..."
robocopy "$boostRoot\boost" "$sdkOut\libs\boost\boost" $robocopyFlags /e
robocopy "$boostRoot\stage" "$sdkOut\libs\boost\stage" $robocopyFlags /e
#TODO vérifier que les fichiers dans "$sdkOut\libs\boost\*" soient aussi copiés

# Copy Poco
Write-Host "Copy Poco folder..."
robocopy "$pocoRoot\lib" "$sdkOut\libs\poco\lib" $robocopyFlags /e
robocopy "$pocoRoot" "$sdkOut\libs\poco" "VERSION" $robocopyFlags
robocopy "$pocoRoot\Util\src" "$sdkOut\libs\poco\Util\src" $robocopyFlags /e
robocopy "$pocoRoot\Util\include" "$sdkOut\libs\poco\Util\include" $robocopyFlags /e
robocopy "$pocoRoot\NetSSL_OpenSSL\src" "$sdkOut\libs\poco\NetSSL_OpenSSL\src" $robocopyFlags /e
robocopy "$pocoRoot\NetSSL_OpenSSL\include" "$sdkOut\libs\poco\NetSSL_OpenSSL\include" $robocopyFlags /e
robocopy "$pocoRoot\Crypto\src" "$sdkOut\libs\poco\Crypto\src" $robocopyFlags /e
robocopy "$pocoRoot\Crypto\include" "$sdkOut\libs\poco\Crypto\include" $robocopyFlags /e
robocopy "$pocoRoot\Zip\src" "$sdkOut\libs\poco\Zip\src" $robocopyFlags /e
robocopy "$pocoRoot\Zip\include" "$sdkOut\libs\poco\Zip\include" $robocopyFlags /e
robocopy "$pocoRoot\XML\src" "$sdkOut\libs\poco\XML\src" $robocopyFlags /e
robocopy "$pocoRoot\XML\include" "$sdkOut\libs\poco\XML\include" $robocopyFlags /e
robocopy "$pocoRoot\Net\src" "$sdkOut\libs\poco\Net\src" $robocopyFlags /e
robocopy "$pocoRoot\Net\include" "$sdkOut\libs\poco\Net\include" $robocopyFlags /e
robocopy "$pocoRoot\JSON\src" "$sdkOut\libs\poco\JSON\src" $robocopyFlags /e
robocopy "$pocoRoot\JSON\include" "$sdkOut\libs\poco\JSON\include" $robocopyFlags /e
robocopy "$pocoRoot\Foundation\src" "$sdkOut\libs\poco\Foundation\src" $robocopyFlags /e
robocopy "$pocoRoot\Foundation\include" "$sdkOut\libs\poco\Foundation\include" $robocopyFlags /e

# Copy Protobuf
Write-Host "Copy Protobuf folder..."
robocopy "$protobufRoot\src" "$sdkOut\libs\protobuf\src" $robocopyFlags /e
robocopy "$protobufRoot\vsprojects\Debug" "$sdkOut\libs\protobuf\vsprojects\Debug" $robocopyFlags /e /xf "*.ilk" "*.pdb"
robocopy "$protobufRoot\vsprojects\Release" "$sdkOut\libs\protobuf\vsprojects\Release" $robocopyFlags /e /xf "*.ilk" "*.pdb"

# Copy CMake
Write-Host "Copy CMake folder..."
robocopy "$cmakeRoot" "$sdkOut\libs\cmake" $robocopyFlags /e

# Copy Yadoms
Write-Host "Copy Yadoms folder..."
robocopy "$yadomsRoot\sources" "$sdkOut\yadoms\sources" $robocopyFlags /e /xd "plugins"
robocopy "$yadomsRoot\sources\plugins" "$sdkOut\yadoms\sources\plugins" $robocopyFlags 
robocopy "$yadomsRoot\sources\plugins\common" "$sdkOut\yadoms\sources\plugins\common" $robocopyFlags /e
robocopy "$yadomsRoot\sources\plugins\dev-EmptyPlugin" "$sdkOut\yadoms\sources\plugins\dev-EmptyPlugin" $robocopyFlags /e
robocopy "$yadomsRoot\sources\plugins\dev-FakePlugin" "$sdkOut\yadoms\sources\plugins\dev-FakePlugin" $robocopyFlags /e
robocopy "$yadomsRoot\licensing" "$sdkOut\yadoms\licensing" $robocopyFlags /e
robocopy "$yadomsRoot\psd" "$sdkOut\yadoms\psd" $robocopyFlags /e
robocopy "$yadomsRoot\builds\DEBUG" "$sdkOut\yadoms\builds\DEBUG" $robocopyFlags /e /xf "*.ilk"
robocopy "$yadomsRoot\builds\RELEASE" "$sdkOut\yadoms\builds\RELEASE" $robocopyFlags /e /xf "*.ilk"
robocopy "$yadomsRoot\projects\shared\DEBUG" "$sdkOut\yadoms\projects\shared\DEBUG" $robocopyFlags /e /xf "*.ilk"
robocopy "$yadomsRoot\projects\shared\RELEASE" "$sdkOut\yadoms\projects\shared\RELEASE" $robocopyFlags /e /xf "*.ilk"
robocopy "$yadomsRoot\projects\plugin_cpp_api\DEBUG" "$sdkOut\yadoms\projects\plugin_cpp_api\DEBUG" $robocopyFlags /e /xf "*.ilk"
robocopy "$yadomsRoot\projects\plugin_cpp_api\RELEASE" "$sdkOut\yadoms\projects\plugin_cpp_api\RELEASE" $robocopyFlags /e /xf "*.ilk"
robocopy "$yadomsRoot\projects\plugin_IPC\DEBUG" "$sdkOut\yadoms\projects\plugin_IPC\DEBUG" $robocopyFlags /e /xf "*.ilk"
robocopy "$yadomsRoot\projects\plugin_IPC\RELEASE" "$sdkOut\yadoms\projects\plugin_IPC\RELEASE" $robocopyFlags /e /xf "*.ilk"

# Copy SDK specific files
Write-Host "Copy SDK specific files..."
robocopy "cmake" "$sdkOut\sdk\cmake" $robocopyFlags /e
