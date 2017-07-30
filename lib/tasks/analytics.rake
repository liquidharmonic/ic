require './lib/analytics_query'

namespace :analytics do
  desc "Analytics tasks..."
  task :onboarding, [:start_date, :end_date] => :environment do |t, args|
    start_date = args[:start_date]
    end_date = args[:end_date]

    results = AnalyticsQuery.new(start_date, end_date).weekly_workflow
    puts results.columns.join(",")
    results.each {|row| puts row.values.join(",")}
    results
  end
end
