# Ruboty::Growthforecast

A [Ruboty](https://github.com/r7kamura/ruboty) plugin to show [GrowthForecast](http://kazeburo.github.io/GrowthForecast/) value.

```
> ruboty gf show service/member/register
1000
> ruboty gf show service/member/register 今日のユーザ登録数は<%= number %>人です。 前回より <%= delta %>人増加しています。
今日のユーザ登録数は100人です。 前回より 10人増加しています。
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-growthforecast'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-growthforecast

## Usage

```
ruboty gf show <service_name>/<section_name>/<graph_name> [format]
```

`format` is specified by ERB.

## Configure
You could set these environment variables

 * `GROWTHFORECAST_HOST`: host for GrowthForecast
 * `GROWTHFORECAST_PORT`: post for GrowthForecast(default: 80)
 * `GROWTHFORECAST_USERNAME`: username for basic authentication
 * `GROWTHFORECAST_PASSWORD`: password for basic authentication

## Author

@mzp
