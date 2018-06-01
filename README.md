# DoctorDoug

Run checkup and notify you on mail/slack when there are violations 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'doctor_doug'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doctor_doug

## Usage

```
# config/initializers/doctor_doug.rb

DoctorDoug.configure do |config|
  config.strategies = [:mail, :slack]
  config.mail_options = {
      address: 'smtp.gmail.com',
      port: 587,
      domain: 'gmail.com',
      user_name: 'youremail@gmail.com',
      password: 'password',
      authentication: 'plain',
      from: 'from@gmail.com',
      to: 'to@gmail.com'
  }
  config.slack_options = {
    token: 'your_slack_token',
    channel: '#general'
  }
end
```

```
DoctorDoug.checkup "user name should not be blank" do
  users = User.where(updated_at: 1.hour.ago..Time.now)
  notify :if, any: users do |user|
    violate? user.name.blank?
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gaotongfei/doctor_doug.
