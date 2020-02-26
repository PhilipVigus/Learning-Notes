[Main TOC](../README.md) / [Ruby](./git-TOC.md)
# Ruby gems
Gems are reusable code libraries and there are many, many available. They carry out a similar role to the Node packages in Javascript.
#### Installation
There are two ways of installing gems.

To manually install a gem use the following command:
```
gem install gem_name
```
This downloads the gem from RubyGems.org and installs it on your system. It is important to remember that gem installations are specific to individual ruby versions, so if you switch from one version to another, you won't have the same gems installed.

Another problem with this approach is that it can be difficult to work out exactly which gems you are using in a project, particularly if it's large and complex. This makes it difficult for other developers to use your code. 

Also, when deploying your code it can be difficult/impossible to manually install all of the gems that it requires.

Enter bundler...

#### Bundler
Bundler is itself a gem, so you can install it with `gem install bundler`. It carries out a similar role to Node Package Manager in Javascript.

To use it you have to create a Gemfile in the root directory of your project where you list the gems you're using. A simple Gemfile might contain the following:
```
# where to download the gems from
source 'https://rubygems.org'

# a list of the gems used
gem 'twilio-ruby'
```
The command-line instruction `bundle install` will install all of the gems listed in Gemfile from the source specified, including any dependencies they might have.

The last step required is to include the following line in your application before you require any gems:
```
require 'bundler/setup'
```
#### Using gems
To use a gem in your code just include the following line of code:
```
require 'gem_name'
```

#### Finding gems
There are numerous sources, including [Ruby Toolbox](https://www.ruby-toolbox.com/) and failing that, googling usually does the trick.
