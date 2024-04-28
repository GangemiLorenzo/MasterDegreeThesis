setup:
	@flutter pub get && \
	$(MAKE) build_runner

build_runner_watch:
	@dart run build_runner watch --delete-conflicting-outputs

build_runner_clean:
	@dart run build_runner clean

build_runner: build_runner_clean
	@dart run build_runner build --delete-conflicting-outputs

test-unit:
	@flutter test

test-coverage:
	@flutter test --coverage && lcov --remove coverage/lcov.info '**/*.g.dart' '**/env.dart' -o coverage/lcov.info && genhtml coverage/lcov.info --output=coverage && open coverage/index.html

clean:
	@rm -rf pubspec.lock
	@flutter clean

format:
	@dart format .

lint:
	@dart analyze .

pod-update:
	cd ios && pod deintegrate && pod update && cd ..