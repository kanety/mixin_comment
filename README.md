# MixinComment

Mixin comment and verification for roughly designed module.

## Dependencies

* ruby 2.6+
* activesupport 5.0+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mixin_comment'
```

Then execute:

    $ bundle

## Usage

Add comments abount mixin module preceding to the module definition.
Its format is same as the label of rdoc as follows:

```ruby
# [required methods] method, method2
module A
  def call_method
    method
  end

  def call_method2
    method2
  end
end

class Item
  include A

  def method
  end
end
```

`[required methods]` means that the class `Item` which includes module `A` should have two methods named `method` and `method2`.
You can verify validity of classes as follows:

```ruby
# speficy your .rb files in glob format
results = MixinComment.verify('**/*.rb')

results[0].module_name
#=> "A"
results[0].label
#=> "required methods"
results[0].errors
#=> [[Item, "method2"]]
```

In this example the class `Item` does not have `method2`,
so the `verify` method returns `[[Item, "method2"]]` as errors.

### Supported labels

This gem supports following labels:

* `required methods`: verify existence of instance methods in classes.
* `required class methods`: verify existence of class methods in classes.
* `required override methods`: verify existence of override methods in classes.

This gem also supports special labels for ActiveRecord models:

* `required columns`: verify existence of columns in ActiveRecord models.
* `required associations`: verify existence of associations in ActiveRecord models.

### For Rails

Rake task is available for rails application.

```shell-session
$ bundle exec rake mixin_comment:verify
Item#method2 is required method by A
```

Note that database schema will be loaded to define attribute methods for ActiveRecord model.

## Contributing

Bug reports and pull requests are welcome at https://github.com/kanety/mixin_comment.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
