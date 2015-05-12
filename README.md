# Freeflow

Freeflow is a simple filter pipeline utility for nanoc. Easily register filters
against file extensions and unify compilation and routing concerns.

For example, automatically have:

    foo.js.coffee.erb

get filtered recursively through `erb`, then `coffeescript`, and then route out
to `foo.js` without any extra configuration.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "freeflow", :git => "git@github.com:jaybee/freeflow.git"
```

And then execute:

    $ bundle

## Usage

Register any nanoc filter against a collection of extensions. For example, in
your nanoc `Rules` file:

```ruby
Freeflow.configure do
  filter "scss", :with => :sass, :syntax => :scss
  filter "coffeescript", "coffee", "cs", :with => :coffeescript
  filter "markdown", "md", :with => :kramdown
  filter "erb", "rb", :with => :erb
end
```

Then add `Freeflow` to your compile and route steps:

```ruby
compile "*" do
  Freeflow.compile item, self
end

route "*" do
  Freeflow.route item
end
```
