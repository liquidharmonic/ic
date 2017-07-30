namespace :analytics do
  desc "Analytics tasks..."
  task :onboarding, [:start_date, :end_date] => :environment do |t, args|
    start_date = args[:start_date]
    end_date = args[:end_date]

    query = "
      SELECT count(*) as count, to_date(date, 'WW YYYY') as week, q1.action as workflow_state
      FROM
      (
        SELECT annonymous_key, to_char(created_at, 'WW YYYY') as date, max(action) as action
        FROM events
        WHERE created_at BETWEEN '#{start_date}' and '#{end_date}'
        GROUP BY annonymous_key,to_char(created_at, 'WW YYYY')
      ) q1
      GROUP BY to_date(date, 'WW YYYY'), q1.action
    "
    results = ActiveRecord::Base.connection.select_all(query)
    puts results.columns.join(",")
    results.each {|row| puts row.values.join(",")}
    end
  end
end
