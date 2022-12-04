FROM ubuntu 

RUN apt-get update

# jekyll dependencies 
RUN apt-get install -y ruby-full build-essential zlib1g-dev

# instal jekyll 
RUN gem install jekyll bundler

# install gems
WORKDIR "/tmp"
COPY /dist/Gemfile /dist/Gemfile.lock ./
RUN bundle install 
RUN rm /tmp/Gemfile && rm /tmp/Gemfile.lock 

# developer tools
RUN apt-get install -y git
RUN apt-get install -y vim
