#!/usr/bin/env ruby
require 'gli'
require 'arc42_pandoc'

include GLI::App

program_desc 'This is a micro gem for creating apiary blueprint boilerplate code and for converting it to various formats using aglio.'

version Arc42Pandoc::VERSION

subcommand_option_handling :normal
arguments :strict

desc 'Create an apiary markdown template'
arg_name 'filename'
command :create do |c|

  c.desc 'The root path of the api'
  c.flag [:a, :author]
  c.default_value '/api/v1'

  c.desc 'The title of the document'
  c.flag [:t, :title]

  c.desc 'The template type you want for the document'
  c.flag [:b, :template]
  c.default_value 'basic'

  c.desc 'The language of the document'
  c.default_value 'en'
  c.flag [:l, :language]

  c.action do |global_options, options, args|
    abort 'You have to provide an output filename' if args.nil? or args.length <= 0

    apiary_builder = Arc42Pandoc::ApiaryBuilder.new
    apiary_builder.create(args[0], options)

    puts "File #{args[0]} generated from template #{options[:language]}/#{options[:template]}"
  end
end

desc 'List all known template types by language'
command :list do |c|
  c.action do |global_options, options, args|
    markdown_builder = Arc42Pandoc::ApiaryBuilder.new
    markdown_builder.list
  end
end

on_error do |exception|
  true
end

exit run(ARGV)