# MixinComment

Verification of comments for roughly designed mixin module.

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

Add comments with specific labels preceding to the module definition.
For example:

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

The label `[required methods]` means that the class `Item` which includes the module `A` should have two methods named `method` and `method2`.
You can verify validity of classes as follows:

```ruby
# speficy your directory which contains *.rb files
results = MixinComment.verify('app')

results[0].module_name
#=> "A"
results[0].label
#=> "required methods"
results[0].errors
#=> [[Item, "method2"]]
```

In this example the class `Item` does not have `method2`,
so `[[Item, "method2"]]` is returned as an error.

### Supported labels

Following labels are available:

* `required methods`: verify existence of instance methods in classes.
* `required class methods`: verify existence of class methods in classes.
* `required override methods`: verify existence of override methods in classes.

Special labels for ActiveRecord models are also available:

* `required columns`: verify existence of columns in ActiveRecord models.
* `required associations`: verify existence of associations in ActiveRecord models.

### For Rails

In case you develops rails application, rake task is available:

```ruby
# load only rake task
gem 'mixin_comment', require: 'mixin_comment/railtie'
```

```shell-session
$ bundle exec rake mixin_comment:verify
Item#method2 is required method by A
```

Note that database schema will be loaded to define attribute methods for ActiveRecord model.

## Contributing

Bug reports and pull requests are welcome at https://github.com/kanety/mixin_comment.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
