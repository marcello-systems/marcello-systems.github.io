FROM jekyll/jekyll:4.2.2

COPY Gemfile* ./

RUN gem install bundler:2.4.15 && bundle install

ENTRYPOINT [ "jekyll" ]

CMD [ "build" ]
