#!/usr/bin/env ruby

require 'rubygems'
require 'logger'
require 'right_api_client'

log = Logger.new(STDOUT)

email = ENV['RSEMAIL'] || 'your email here'
pass = ENV['RSPASS'] || 'your pass here'
account = ENV['RSACCT'] || 'your acct # here'
server_id = ENV['RSSERVERID'] || 'server id here'

log.info "Signing in to account #{account}"

client = RightApi::Client.new(:email => email, :password => pass, :account_id => account)

log.info "Finding server with id #{server_id}"

server = client.servers(:id => server_id).show
servername = server.name

log.info "Finding current running instance of server #{servername}"

resource_href = server.href

if server.links.select { |link| link['rel'] == 'current_instance' }.length > 0
  resource_href = server.current_instance.href
else
  log.warn "Server #{servername} does not have a running instance, performing tag operations on the inactive server"
end

log.info "Querying tags for server #{servername}"
tags = client.tags.by_resource(:resource_hrefs => [resource_href])

log.info "Tags before adding: #{tags.first.tags.join(',')}"

log.info "Adding tag foo:bar=baz to server #{servername}"
client.tags.multi_add(:resource_hrefs => [resource_href], :tags => ["foo:bar=baz"])

tags = client.tags.by_resource(:resource_hrefs => [resource_href])

log.info "Tags after adding: #{tags.first.tags.join(',')}"

log.info "Clearing tag foo:bar=baz to server #{servername}"
client.tags.multi_delete(:resource_hrefs => [resource_href], :tags => ["foo:bar=baz"])