get:
	fvm flutter pub get
clean:
	flutter clean
installpod:
	pod install
removepod:
	rm -rf Pods Podfile.lock
lcon:
	fvm flutter pub run flutter_launcher_icons
run:
	flutter run --release
brn:
	flutter pub run build_runner build -—delete-conflicting-outputs
appName:
	rename getAppName --targets android,ios 
bundleId:
	rename getBundleId --targets android,ios 
configure:
	flutterfire configure --project=benmore-74dd9
apk:
	flutter build apk --obfuscate --build-name=1.0.10 --build-number=30 --split-debug-info=./debug_info --release --dart-define=app.dev=dev