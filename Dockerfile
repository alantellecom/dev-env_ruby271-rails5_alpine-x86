FROM ruby:2.6.1

# pre-requisitos
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -


RUN apt-get --ignore-missing install build-essential  imagemagick --fix-missing libmagickcore-dev libmagickwand-dev nodejs -y nano -y

RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

#rails
RUN gem install bundler -v 1.16.1
RUN gem install rails -v '5.2.3'

#deploy AWS
RUN apt-get install -y awscli
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-pip
RUN pip3 install awsebcli==3.10.0

RUN chmod +t /tmp
