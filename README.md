This was copied and modified from: https://github.com/echohack/pan

# Example Flavors

This is a Chef cookbook generator using [chef-gen-flavors](https://rubygems.org/gems/chef-gen-flavors). You can use it out of the box as an opinionated way of creating new cookbooks, or modify it to meet your organization needs.

## Features

- Automatically create boilerplate files for cookbooks.
- Drive organizational policy by setting standards and good defaults for what a cookbook should look like.
- Review existing cookbooks during code reviews or during your cookbook build.
- Automatically generate examples for developers brand new to Chef.

## Install of completed gem

- Make sure you have ChefDK installed: https://downloads.chef.io/chef-dk/, this was developed using chefdk 0.16.28, if you are experiencing issues, upgrade is recommended.
  - First uninstall ```source chefdk_uninstall.sh``` File is included in this cookbook
  - Then install 0.16.28 by link above

1. Then run this command:
`chef gem install chef-flavor-exmaple` the gem should install successfully and the output should be similar to:
  * `Successfully installed chef-flavor-exmaple-0.0.5
1 gem installed`
2. Now add this to your knife.rb (under your root .chef directory, usually under $home/.chef):

```
# only load ChefGen::Flavors if we're being called from the ChefDK CLI
if defined?(ChefDK::CLI)
  require 'chef_gen/flavors'
  chefdk.generator_cookbook = ChefGen::Flavors.path
end
```

- You're done! Let's get cooking.

## Usage

`chef generate cookbook my_cookbook_name`

```
[ChefGen Flavor Selector]: Flavors on the menu
1. example_openstack: Generate a base cookbook for organization wide policy. v1.0.0
2. example_vagrant: Generate a base cookbook for organization wide policy. v1.0.0
[ChefGen Flavor Selector]: Enter selection:
```

`2`

```
[ChefGen Flavor Selector]: Enter selection: 2
using ChefGen flavor 'example_vagrant'
Generating cookbook tees
- Ensuring correct cookbook file content

Your cookbook is ready. Type `cd tees` to enter it.

There are several commands you can run to get started locally developing and testing your cookbook.
Type `delivery local --help` to see a full list.

Why not start by writing a test? Tests for the default recipe are stored at:

test/recipes/default_test.rb

If you'd prefer to dive right in, the default recipe can be found at:

recipes/default.rb
```

## How to contribute

* Generate a generator cookbook `chef generate generator exmaple_[somename]`
* Build and test the generator locally on your machine to add the custom features you desire.
* Add features to the existing flavors if you choose
* Fork this repo `git@github.com:JoeTalbot/chef-flavor-example.git`
* place your completed generator cookbook in the flavor_cookbooks directory
* create a ruby file under lib/chef_gen/flavor that as this content, and replace [flavorname] with the name of your flavor.

```
require 'chef_gen/helpers/copy_helpers'

module ChefGen
  module Flavor
    class exmaple[flavorname]
      include ChefGen::CopyHelpers

      NAME = 'exmaple_[flavorname]'
      DESC = 'Generate a base cookbook for organization wide policy.'
      VERSION = '0.1.0'

      def initialize(temp_path:)
        @temp_path = temp_path
      end

      def add_content
        copy_content(NAME)
      end
    end
  end
end
```

* up the version in the chef-flavor-exmaple.gemspec file, and run:

`gem build chef-flavor-exmaple.gemspec`
if all succeeds you should end up with a new chef-flavor-exmaple-X.X.X.gem for the version you specified in the gemspec file.

- Then run this command:

`chef gem install chef-flavor-exmaple-X.X.X.gem` where X.X.X is the newest version you created, and make sure you have the knife.rb settings specified in step 3 of the install section above.

- Make sure the newest version of the gem passes rubocop tests.
- Make sure you are able to use chef gererate cookbook [my_cookbook_name] with the new version of the generator, and submit a pull request.
