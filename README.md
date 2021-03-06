### Installation

- Ruby 3.0.1
- Rails 6.1.4

- Clone repository
- Install dependencies and database
```sh
$ setup
```
- Start server
```sh
$ rails s
```

### Basic usage
User must register before they can use the app

There are two main page in the app:
- An index to list all the URLs which have been generated. URLs can be deleted using this page. The user can also copy the shortened URL using the "copy" button.
- A form to submit new URLs.

There is a validation to only allow URLs of a valid format.
Valid example: `http://example.com`
Invalid: `example.com`

### Specs and linting
Tests and linters can be run using:
```sh
bundle exec rspec # rspec test suite
bundle exec rubocop #rubocop
bundle exec yalphabetize # yalphabetize (YAML alphabetiser)
```

RSpec tests, rubocop, and yalphabetize can all be run against the code using the default rake task:
```sh
bundle exec rake
```

Each rake task can be run individually:
```sh
bundle exec rake rspec
bundle exec rake rubocop
bundle exec rake yalphabetize
```

### Development decisions

**Devise gem**
- For user registration/authentication
- Why reinvent the wheel?
- Very popular Ruby gem

**Shortener gem**
- To generate the shortened URLs
- Why reinvent the wheel?
- Activly maintained gem with updates for Rails 6 support

**Tailwind CSS**
- Follows a utility-first CSS philosophy: https://adamwathan.me/css-utility-classes-and-separation-of-concerns/

**Stimulus JS**
- Lightweight JS framework for adding JS sprinkles

### TODO
- Styling of devise session/registration forms
- Internationalise (I18n)
- Migrate to MySQL or PostgreSQL
- Speed up tests (compilation of assets is slow and unneccessary)
- Move validation from model to form object
