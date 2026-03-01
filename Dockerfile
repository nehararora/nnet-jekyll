FROM ruby:3.4.7-slim AS builder
RUN apt-get update -qq && apt-get install -y -qq build-essential && rm -rf /var/lib/apt/lists/*
WORKDIR /site
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4
COPY . .

FROM builder AS development
EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]

FROM builder AS production
RUN bundle exec jekyll build
FROM nginx:alpine AS serve
COPY --from=production /site/_site /usr/share/nginx/html
EXPOSE 80
