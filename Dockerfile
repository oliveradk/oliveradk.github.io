FROM alpine

RUN apk add --no-cache bash

RUN apk add git

# ruby, gcc, and 
RUN apk add --no-cache ruby
RUN apk add --no-cache ruby-dev 
RUN apk add --no-cache build-base
RUN apk add --no-cache make 

RUN gem update && gem install jekyll bundler 

# install gems
WORKDIR "/tmp"
COPY /src/Gemfile /src/Gemfile.lock ./
RUN bundle install 
RUN rm /tmp/Gemfile && rm /tmp/Gemfile.lock 


EXPOSE 4000