# Use the official Ruby image as the base image
FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory inside the container
WORKDIR /application

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile /application/Gemfile
COPY Gemfile.lock /application/Gemfile.lock

# Install the Ruby gems
RUN bundle install

# Copy the entire application into the container
COPY . /application

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port 3000 to the host
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
