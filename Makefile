ios-sim:
	open -a Simulator

start: ios-sim
	flutter run

lint:
	flutter format .
	flutter analyze