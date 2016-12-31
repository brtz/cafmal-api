# encoding: UTF-8
# frozen_string_literal: true

%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
).each { |path| Spring.watch(path) }
