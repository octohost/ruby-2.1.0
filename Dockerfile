FROM stackbrew/ubuntu:saucy

RUN apt-get update && apt-get install -y git curl wget build-essential make libxslt-dev libxml2-dev libmysqlclient-dev libpq-dev libsqlite3-0 libsqlite3-dev software-properties-common libyaml-0-2 --force-yes
# Install from deb we built using these scripts: https://github.com/darron/ubuntu-ruby-package-builder
RUN curl -O http://handbill-cache.handbill.io/ubuntu/ruby/2.1/saucy/ruby-2.1.0_amd64.deb && dpkg -i ruby-2.1.0_amd64.deb && rm -f ruby-2.1.0_amd64.deb
RUN gem install foreman nokogiri bundler --no-ri --no-rdoc

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
