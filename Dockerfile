FROM ruby:3.2.2

WORKDIR /opt
RUN curl -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar -jxf -
RUN apt-get -qq update && apt-get -qq install fontconfig curl gnupg dos2unix
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn
RUN ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/
RUN sed -ri '/policy.*name="height"/s/value="([^"]*)"/value="32KP"/' /etc/ImageMagick-6/policy.xml

WORKDIR /app
ADD Gemfile* /app/
ADD package.json yarn.lock* /app/
RUN gem install bundler && bundle config build.nokogiri --use-system-libraries && bundle install --quiet --jobs 16 --retry 5 --without test
RUN bundle install
RUN yarn install

ADD . /app
RUN find script -type f -exec dos2unix {} +

EXPOSE 3000
CMD ["script/server"]
