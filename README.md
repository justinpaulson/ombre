# Ruby Ombre

Ombre provides gradients for your terminal between any two hexidecimal RGB values.

## Features

* Horizontal, vertical, and diagonal (both directions) gradients from one color to another.
## True Color Support

This will only look gook on terminals that support 24bit colors, for now.

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

There are three main functions available for `Ombre`:

```ruby
# from_color and to_color in the below functions should be 24 bit hexidecimal RGB values as strings.

# Returns the block of text marked up with colors to create a horizontal gradient from left to right
Ombre.horizontal(from_color, to_color, text)
Ombre.horizontal("FF0000", "0000FF", "############\n#          #\n# Horiz. ###\n# Ombre ####\n# Test #####\n# From #####\n# Red ######\n# To #######\n# Blue #####\n#          #\n############")

# Returns the block of text marked up with colors to create a vertical gradient from top to bottom
Ombre.vertical(from_color, to_color, text)
Ombre.vertical("FF0000", "0000FF", "############\n#          #\n# Vertical #\n# Ombre ####\n# Test #####\n# From #####\n# Red ######\n# To #######\n# Blue #####\n#          #\n############")

# Returns the block of text marked up with colors to create a diagonal gradient
Ombre.diagonal(from_color, to_color, text)
# from top-left to bottom-right by default
Ombre.diagonal("FF0000", "0000FF", "############\n#          #\n# Diagonal #\n# Ombre ####\n# Test #####\n# From #####\n# Red ######\n# To #######\n# Blue #####\n#          #\n############")
# from bottom-left to top-right changing the last argument
Ombre.diagonal("FF0000", "0000FF", "############\n#          #\n# Diagonal #\n# Ombre ####\n# Test #####\n# From #####\n# Red ######\n# To #######\n# Blue #####\n#          #\n############", "up")
```


Copyright (c) 2022 Justin Paulson, released under the
MIT license.