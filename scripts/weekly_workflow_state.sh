if [ -z "$1" ] || [ -z "$2" ] ; then
  echo "You need to pass in start and end date in 'YYYY-mm-dd' format"
  exit 1
fi
cd ../
bundle exec rails "analytics:weekly_workflow_state[$1, $2]"
