VERSION := $(shell /usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" Weaver.xcodeproj/WeaverCodeGen_Info.plist)
PREFIX=/usr/local
SWIFT_BUILD_FLAGS=--configuration release

.PHONY: clean build install package generate_sources codecov

build:
	@swift build --disable-sandbox $(SWIFT_BUILD_FLAGS)

generate_sources:
	bash -c "(command -v sourcery && sourcery) || echo 'warning: Sourcery is not installed'"

clean:
	rm -rf .build

install: build
	$(call install_files,$(PREFIX)) 

uninstall:
	rm "$(PREFIX)/bin/weaver"
	rm -rf "$(PREFIX)/share/weaver"

package: build
	$(call install_files,./build/package/weaver)
	cd ./build/package/ && zip -r ../../weaver-$(VERSION).zip ./weaver

codecov: build
	xcodebuild test -scheme Tests -enableCodeCoverage YES
	bash -c "bash <(curl -s https://codecov.io/bash) -J Weaver -t eaa7c4af-5ca2-4e08-8f07-38a44671e5e0"
	rm *.coverage.txt

define install_files
	install -d $(1)/bin
	install -d $(1)/share/weaver/Resources
	install -C Resources/dependency_resolver.stencil $(1)/share/weaver/Resources
	install -C .build/release/WeaverCommand $(1)/bin/weaver
endef
