# Ruby Ombre

Ombre provides gradients for your terminal between any number of RGB values.

## Features

* Horizontal, vertical, and diagonal gradients for any number of colors.
## True Color Support

This will only look good on terminals that support 24bit colors, for now.

## Setup

Add to `Gemfile`:

```ruby
gem 'ombre'
```

and run `bundle install`.

In Ruby do:

```ruby
require 'ombre'
```

## Usage

There are four main functions available for `Ombre`:

```ruby
# colors in the below functions should be an array of 24 bit hexidecimal RGB values as strings.

# Returns the block of text marked up with colors to create a horizontal gradient from left to right
Ombre.horizontal(text, colors)
Ombre.horizontal("############\n#          #\n# Horiz. ###\n# Ombre ####\n# Test #####\n# From #####\n# Red ######\n# To #######\n# Blue #####\n#          #\n############", ["FF0000", "0000FF"])

# Returns the block of text marked up with colors to create a vertical gradient from top to bottom
Ombre.vertical(text, colors)
Ombre.vertical("############\n#          #\n# Vertical #\n# Ombre ####\n# Test #####\n# From #####\n# Red ######\n# To #######\n# Blue #####\n#          #\n############", ["FF0000", "0000FF"])

# Returns the block of text marked up with colors to create a diagonal gradient from top-left to bottom-right
Ombre.diagonal(text, colors)
Ombre.diagonal("############\n#          #\n# Diagonal #\n# Ombre ####\n# Test #####\n# From #####\n# Red ######\n# To #######\n# Blue #####\n#          #\n############", ["FF0000", "0000FF"])

# Returns the block of text marked up with colors to create a diagonal gradient from bottom-left to top-right
Ombre.diagonal_up(text, colors)
Ombre.diagonal_up("############\n#          #\n# Diagonal #\n# Ombre ####\n# Test #####\n# From #####\n# Red ######\n# To #######\n# Blue #####\n#          #\n############", ["FF0000", "0000FF"])
```


Copyright (c) 2022 Justin Paulson, released under the
MIT license.