start:
	flutter run -d macOS

ios-sim:
	open -a Simulator

start-ios: ios-sim
	flutter run

lint:
	flutter format .
	flutter analyze