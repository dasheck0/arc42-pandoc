require 'map'
require 'ruyml'

module Arc42Pandoc
  class MarkdownBuilder

    def initialize

    end

    def create(output, template = nil, options = {})
      options = sanatize_options(options)

      puts options

      template = File.join(File.dirname(__FILE__), 'templates', options[:lang].to_s, 'basic.md') if template.nil?

      ruyml = Ruyml::Data.new(options)
      ruyml.render_file(template, output)
    end

    private

    def sanatize_options(options)
      options = Map[options]
      options[:lang] = :en if options[:lang].nil?
      options[:title] = '' if options[:title].nil?
      options[:author] = '' if options[:author].nil?

      options
    end

  end
end