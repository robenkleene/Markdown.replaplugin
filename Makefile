.PHONY: ci ac autocorrect lint test loc

ci: lint
ac: autocorrect

lint:
	rubocop

autocorrect:
	rubocop -a

test:
	./Contents/Resources/test/run_tests.sh

loc:
	cloc --vcs=git --exclude-dir=bundle,.bundle

bundle_update:
	cd ./Contents/Resources/ &&\
		bundle update repla --full-index &&\
		bundle update &&\
		bundle clean &&\
		bundle install --standalone

patch: remove_symlinks recompile_fsevents sign_binaries

# patch_redcarpet:
# 	install_name_tool -change \
# 		/usr/local/opt/gmp/lib/libgmp.10.dylib \
# 		@loader_path/../../../../../../binary/libgmp.10.dylib \
# 		Contents/Resources/bundle/ruby/2.4.0/gems/redcarpet-3.5.0/lib/redcarpet.bundle

sign_binaries:
	codesign --force --options runtime --sign "Developer ID Application" \
		Contents/Resources/bundle/ruby/2.4.0/gems/redcarpet-3.5.0/lib/redcarpet.bundle
	codesign --force --options runtime --sign "Developer ID Application" \
		Contents/Resources/bundle/ruby/2.4.0/gems/rb-fsevent-0.10.3/bin/fsevent_watch
	# codesign --force --options runtime --sign "Developer ID Application" \
	# 	Contents/Resources/binary/libgmp.10.dylib

recompile_fsevents:
	cd Contents/Resources/bundle/ruby/2.4.0/gems/rb-fsevent-0.10.3/ext/ && rake

remove_symlinks:
	# This was used to fix an issue where symlinks were causing the app to
	# be quarantined by macOS Gatekeeper, this isn't run automatically but
	# documents how the symlinks were deleted.
	find ./Contents/Resources/bundle/ruby/2.4.0/gems/ffi-1.12.2/ext/ffi_c/libffi-x86_64-darwin18/ -type l -delete
