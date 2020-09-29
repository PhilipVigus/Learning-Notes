# Setting up Ruby and Rails on Ubuntu

## Installing Ruby

As per the instructions here:

https://makandracards.com/makandra/28149-using-rbenv-on-ubuntu-18-04

```bash
# install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# reinitialise your shell

# install ruby-build
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# install ruby-aliases
git clone https://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases
rbenv alias --auto

# install ruby-default-gems
git clone https://github.com/rbenv/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

sudo apt-get update
# note the additional required library to prevent postgres issues with rails
apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libpq-dev

# list available ruby versions
rbenv install --list

# install the global version
rbenv install 2.6.5 # or whatever version you want

```

## Installing Rails

As per the instructions here:

https://www.howtoforge.com/tutorial/ubuntu-ruby-on-rails/

```bash
# Update rubygems to the latest version
gem update --system

# create a new config file
echo "gem: --no-document" >> ~/.gemrc

# make sure it's working
gem -v

# install rails
gem install rails

# check it's working
rails --version
```

## Configure rails for use with PostgreSQL

```bash
# log into psql as the postgres user
sudo -i -u postgres psql

# create a user with login and createdb privileges
create role <username> with createdb login password '<password>';

# confirm it's worked
\du
```

## Start a new rails project with postgresql

```bash
rails new <appname> -d postgresql
cd <appname>
code .

# change config/database.yml
host: localhost
port: 5432
username: <username>
password: <password>
# save

# set up the database
rails db:setup
rails db:migrate

# start the server
rails s

# open the browser at localhost:3000 to ensure it's running correctly
```
