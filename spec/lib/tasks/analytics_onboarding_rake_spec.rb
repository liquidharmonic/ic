require 'rails_helper'
require 'rake'

describe "analytics:onboarding" do
  before do
    Rake.application.rake_require "tasks/analytics"
    Rake::Task.define_task(:environment)
  end

  it "calls AnalyticsQuery#weekly_workflow" do
    expect(AnalyticsQuery).to receive(:new).with('2017-01-01', '2017-07-30').and_call_original
    expect_any_instance_of(AnalyticsQuery).to receive(:weekly_workflow).and_call_original
    Rake.application.invoke_task("analytics:onboarding[2017-01-01, 2017-07-30]")
  end
end

