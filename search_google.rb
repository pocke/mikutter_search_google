# -*- coding: utf-8 -*-

require 'uri'

Plugin.create(:search_google) do
  url_base = 'google.com/search'
  on_posted do |service, megs|
    megs.each do |msg|
      if msg[:message] =~ /(.+)\[検索\]/ then
        puts 'if'
        query = $1.split.map {|x| URI.escape x }.map {|x| x.gsub('+', '%2B') }.join '+'
        url = url_base + '?' + 'q=' + query
        puts url
        Gtk.openurl(url)
      end
    end
  end
end
