# Secuconnect

This gem provide a client for the secuconnect api. Currently it support only the payout contracts endpoint. Pr's for other endpoints are welcome.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'secuconnect'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install secuconnect

## Usage

### Configuration

First of all yout should provide secuconnect credentials. To do it just create an initializer file and add a configuration block inside it.

```ruby
Secuconnect.configure do |config|
  config.secuconnect_client_id = "your_client_id"
  config.secuconnect_client_secret = "your_client_secret"
  # optional
  config.secuconnect_base_url = "secucconect base url"
  config.secuconnect_token_expiration_seconds = "token expiration time"
end
```

### Contracts

The contract endpoint provide function to create and validate a contract sub-project

You could create a contract sub-project in this way

```ruby
contract = Secuconnect::Payment::Contract.new.create(account_id: account_id, body: body)

# body could look like this
body = {
    contact: {
        salutation: "Mr",
        forename: "John",
        surname: "Doe",
        dob: "1980-02-03",
        email: "john.doe@example.com",
        mobile: "",
        address: {
        street: "Test Street",
        street_number: "6",
        postal_code: "01234",
        city: "Examplecity",
        country: "Germany"
        }
    },
    project: "project_name",
    payout_account: {
        iban: "DE89370400440532013000",
        bic: "",
        owner: "Test 1"
    }
}
```

for further information which arguments are provided. Please check it on https://developer.secuconnect.com/

if you want to validate the contract use

```ruby
validation_result = Secuconnect::Payment::Contract.new.validate(account_id: account_id)
```

## Step 1

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/secuconnect.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
