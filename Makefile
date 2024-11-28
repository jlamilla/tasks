.PHONY: qa clean gen fix run deploy

OSTYPE := $(shell uname)

change-version-git:
	@echo "╠ Changing version..."
	make change-version
	make git-push COMMENT="Change version"

clean:
	@echo "╠ Cleaning project..."
	flutter clean
	@echo "╠ Get dependencies..."
	flutter pub get

change-version:
	@echo "╠ Changing version..."
	dart change_version.dart

gen:
	@echo "╠ Running generator..."
	dart run build_runner build --delete-conflicting-outputs

icon:
	@echo "╠ Generating icons..."
	dart run flutter_launcher_icons

fix:
	@echo "╠ Applying fix..."
	dart fix

run:
	@echo "╠ Running..."
	flutter run --release

git-push:
	@echo "╠ Commit and push Git"
	git add -A && git commit -m "$(COMMENT)" && git push

git-pull:
	@echo "╠ Pull Git"
	git pull

push:
	make git-push COMMENT="$(c)"
