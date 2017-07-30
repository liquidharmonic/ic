# Requirements
# This script requires to be in the provided rails project (https://github.com/liquidharmonic/ic) in the scripts dir.
# The bash script simply invokes the rake task which performs the query. I did this so I could easily test it's functionality using rspec.
# You can call the rake task directly by running
# `rails "analytics:weekly_workflow_state[<start_date>, <end date>]"`

if [ -z "$1" ] || [ -z "$2" ] ; then
  echo "You need to pass in start and end date in 'YYYY-mm-dd' format"
  exit 1
fi
cd ../
bundle exec rails "analytics:weekly_workflow_state[$1, $2]"
