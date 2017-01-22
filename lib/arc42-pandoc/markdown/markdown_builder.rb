require 'map'
require 'ruyml'

module Arc42Pandoc
  class MarkdownBuilder

    def initialize

    end

    def create(output, template = nil, options = {})
      options = sanatize_options(options)

      template = File.join(dirname, 'templates', options[:lang].to_s, 'basic.md') if template.nil?

      ruyml = Ruyml::Data.new(options)
      ruyml.render_file(template, output)
    end

    def list
      files = Dir[File.join(dirname, 'templates', '**/*')].select { |file| File.file?(file) }
      chunks = files.group_by { |file| file.split('/')[-2] }

      chunks.each { |lang, templates|
        puts "Templates available for language '#{lang}': \n  * #{templates.map { |t| t.split('/')[-1] }.join("\n\t* ")}\n\n"
      }
    end

    private

    def dirname
      File.dirname(__FILE__)
    end

    def sanatize_options(options)
      options = Map[options]
      options[:lang] = :en if options[:lang].nil?
      options[:title] = '' if options[:title].nil?
      options[:author] = '' if options[:author].nil?

      options
    end

  end
end