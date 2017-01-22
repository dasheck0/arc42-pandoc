# Arc42-Pandoc

This is a micro gem for creating arc42 markdown boilerplate code and for converting it to various formats using pandoc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arc42-pandoc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arc42-pandoc

## Usage

Arc42-Pandoc provides a command line interfaces, which create a template for you. The basic command is

    arc42 create [command options] filename
    
    COMMAND OPTIONS
        -a, --author=arg   - The author of the document (default: none)
        -b, --template=arg - The template type you want for the document (default: basic)
        -l, --language=arg - The language of the document (default: en)
        -t, --title=arg    - The title of the document (default: none)

To find a suitable template, you can list the known templates to this gem with the following command

    arc42 list
    
which will generate something like this

    Templates available for language 'de': 
      * basic.md
    
    Templates available for language 'en': 
      * basic.md

You see that templates are available on different languages. Run this command to see what templates are available for you language.

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake rspec` to run the tests. 

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Templates

You can contribute by creating new templates or by translate existing ones. Create a directory under `lib/arc42-pandoc/markdown/templates` with an [ISO 639-1 language code](https://en.wikipedia.org/wiki/ISO_639-1)
of the language the template is suitable for. After that create a file with a meaningful and comprehensive name and create you boilerplate. Good names would be for example `arc42-full`, `arc42-light`.

## Roadmap

* [ ] Add and enforce section header to template files, which can be used to describe it within the list command
* [ ] Add pandoc integration, to build html, word or pdf from markdown
* [ ] Add support for detecting templates from a web resource

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[dasheck0]/arc42-pandoc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).

