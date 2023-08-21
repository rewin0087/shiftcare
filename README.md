## Overview
Build a minimalist command-line application using Ruby. Given a JSON dataset with clients (attached), the application will need to offer two commands:

- Search through all clients and return those with names partially matching a given search query
- Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found.

## Setup

- Install ruby 3.2.0: https://github.com/rbenv/rbenv
- Install bundler: https://bundler.io/

Run:

```
bundle install
```

## Run console application

filter by name

```
bin/console  --name Jane Smith


Duplicate result based from email
{:id=>2, :full_name=>"Jane Smith", :email=>"jane.smith@yahoo.com"}
{:id=>15, :full_name=>"Another Jane Smith", :email=>"jane.smith@yahoo.com"} 
```

filter by specific field from data

```
bin/console  --filter full_name:John

Result
{:id=>1, :full_name=>"John Doe", :email=>"john.doe@gmail.com"}
{:id=>3, :full_name=>"Alex Johnson", :email=>"alex.johnson@hotmail.com"}
```

filter by default field and specific field from data

```
bin/console  --name Jane Smith --filter full_name:john

Duplicate result based from email
{:id=>2, :full_name=>"Jane Smith", :email=>"jane.smith@yahoo.com"}
{:id=>15, :full_name=>"Another Jane Smith", :email=>"jane.smith@yahoo.com"}

Result
{:id=>1, :full_name=>"John Doe", :email=>"john.doe@gmail.com"}
{:id=>3, :full_name=>"Alex Johnson", :email=>"alex.johnson@hotmail.com"}
```

## Run test

```
bundle exec rspec spec
```

## Future improvements

- Specify custom source path either file path or url
- More custom filters
- Different format result