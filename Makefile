.PHONY: ci ac autocorrect lint

ci: lint
ac: autocorrect

lint:
	git ls-files *.rb *Rakefile *Gemfile -z | xargs -0 rubocop

autocorrect:
	git ls-files *.rb *Rakefile *Gemfile -z | xargs -0 rubocop -a

