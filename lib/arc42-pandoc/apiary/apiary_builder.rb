require 'map'
require 'ruyml'

module Arc42Pandoc
  class ApiaryBuilder

    def initialize

    end

    def create(output, options = {})
      options = sanatize_options(options)

      template = find_template(options[:template], options[:language])
      abort "The template is not available for the language '#{options[:language]}'. Check 'apiary list' for available templates." unless File.file?(template)

      ruyml = Ruyml::Data.new(options)
      ruyml.render_file(template, output)
    end

    def list
      files = Dir[File.join(dirname, 'templates', '**/*')].select { |file| File.file?(file) }
      chunks = files.group_by { |file| file.split('/')[-2] }

      chunks.each { |lang, templates|
        puts "Templates available for language '#{lang}': \n  * #{templates.map { |t| t.split('/')[-1] }.join("\n  * ")}\n\n"
      }
    end

    private

    def find_template(template, language)
      template = template.split('.')[0]
      File.join(dirname, 'templates', language.to_s, "#{template}.md")
    end

    def dirname
      File.dirname(__FILE__)
    end

    def sanatize_options(options)
      options = Map[options]
      options[:language] = :en if options[:language].nil?
      options[:title] = '' if options[:title].nil?
      options[:author] = '' if options[:author].nil?
      options[:template] = 'basic' if options[:template].nil?

      options
    end

  end
end