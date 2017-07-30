class AnalyticsQuery

  attr_reader :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def weekly_workflow
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
  end
end
