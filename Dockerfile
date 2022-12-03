FROM alpine

RUN apk add --no-cache bash

# ruby / jekyll and dependencies
RUN apk add --no-cache ruby
RUN apk add --no-cache ruby-dev 
RUN apk add --no-cache build-base
RUN apk add --no-cache make 
RUN gem update && gem install jekyll bundler 

# install gems
WORKDIR "/tmp"
COPY /dist/Gemfile /dist/Gemfile.lock ./
RUN bundle install 
RUN rm /tmp/Gemfile && rm /tmp/Gemfile.lock 

# install git
RUN apk add git
RUN apk add git-subtree

EXPOSE 4000