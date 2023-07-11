FROM jekyll/jekyll:latest

COPY Gemfile* ./

RUN gem install bundler:2.4.15 && bundle install

ENTRYPOINT [ "jekyll" ]

CMD [ "build" ]
