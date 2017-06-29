# CancanExplainer

Troubleshoot [cancan][1] rules.

## Install

```
# Gemfile
gem "cancancan"
gem "cancan_explainer"
```

The order matters.

## Usage

Consider these bananas:

```
class Banana
  attr_reader :color
  def initialize(color)
    @color = color
  end
end
green_banana = Banana.new("green")
yellow_banana = Banana.new("yellow")
```

Consider the following [ability definition][2]:

```
# app/models/ability.rb
class Ability
  include CanCan::Ability
  def initialize(user)
    can :eat, Banana
    cannot :eat, Banana, color: "green"
  end
end
ability = Ability.new(nil)
ability.can? :eat, yellow_banana
ability.can? :eat, green_banana
```

This [ability definition][2] is pretty simple, but they are often much more
complex, and it can be hard to figure out which rules are relevant to a query.

```
CanCanExplainer.explain { ability.can? :eat, green_banana }.to_s
#=> "eat #<Banana:0x007fa2190083a0> [] /../app/models/ability.rb:5:in `initialize'"
```

This is just a proof-of-concept, and the output can certainly be improved, but
they key piece of information here is the file and line number where the rule
was defined.

[1]: https://github.com/CanCanCommunity/cancancan
[2]: https://github.com/CanCanCommunity/cancancan/wiki/defining-abilities
