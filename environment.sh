#memo　2018年作業時
Windows Subsystem for Linux Ubuntu18.04

sudo apt-get install curl

https://rubygems.org/pages/download

#rubyenv
 git clone git://github.com/sstephenson/rbenv.git .rbenv
 rbenv install 2.3.1
 rbenv rehash

#confirm

ruby --v
rails --v 
gem --v
gem list
gem environment

bundle install --path vendor/bundle

#nokogiri
sudo apt-get install ruby-dev
sudo apt-get install libxml2-dev
sudo aptitude install libxslt-dev


#Sqlite
sudo apt install sqlite3
sudo apt-get install mysql-server mysql-client
#FileMagick
sudo apt install libmagic-dev

#pg
sudo apt-get install libpq-dev
#For RMagick

sudo apt-get install pkg-config
sudo apt-get install libmagick++-dev

LpVgIkmOOF9aAHRM

#2021年追記　macOS10.15
## bundle installするのに必要
# rbenv
rbenv rehash

#filemagic
brew install libmagic

#mysql2
brew install mysql
bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"

#posgtre
brew install postgresql

#rmagick
brew install imagemagick@6
brew install pkg-config #入っているって言われるかも
echo 'export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"' >> ~/.zshrc

#ruby-debug-ide
rbenvで今落とせるruby2.5.8じゃ動かない
2.5.1に戻せと言われる。
バージョンの不整合のため、rbenv環境をruby2.5.1をにする

##rails
gem install rails -v 5.0.6
#rbenv使用時はbundlerがシステムを見ている

#bundle
rbenv exec gem install bundler
rbenv rehash
bundle update

#jsランタイム
#node.js
brew install nodebrew
mkdir -p ~/.nodebrew/src
nodebrew install-binary stable

#起動
rails s
