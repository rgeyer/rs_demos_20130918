#!/usr/bin/env ruby

require 'rubygems'
require 'logger'

log = Logger.new(STDOUT)

log.info "Querying tags for server"

log.info "Tags before adding: #{`rs_tag --list`}"

log.info "Adding tag foo:bar=baz to server"
`rs_tag -a foo:bar=baz`

log.info "Tags after adding: #{`rs_tag --list`}"

log.info "Clearing tag foo:bar=baz to server"
`rs_tag -r foo:bar=baz`