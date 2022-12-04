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

# Install program to configure locales
RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8

# Install needed default locale for Makefly
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8


# developer tools
RUN apt-get install -y git
RUN apt-get install -y vim
