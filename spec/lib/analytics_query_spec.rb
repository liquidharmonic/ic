require 'rails_helper'
require './lib/analytics_query'

describe AnalyticsQuery do
  describe '#weekly_workflow' do
    it 'should return result with count of events grouped by weekly date, and workflow action' do
      # TODO use factory girl to create models
      # count for this week and action should be 1
      Event.create(annonymous_key: 1, action: 'Onboarding - 1 homepage', created_at: Time.utc(2017,6,1))
      Event.create(annonymous_key: 1, action: 'Onboarding - 2 apply', created_at: Time.utc(2017,6,1))

      # count for this week and action should be 2
      Event.create(annonymous_key: 2, action: 'Onboarding - 1 homepage', created_at: Time.utc(2017,7,1))
      Event.create(annonymous_key: 2, action: 'Onboarding - 2 apply', created_at: Time.utc(2017,7,1))
      Event.create(annonymous_key: 3, action: 'Onboarding - 2 apply', created_at: Time.utc(2017,7,1))

      # count for this week and action should be 3
      Event.create(annonymous_key: 4, action: 'Onboarding - 4 signed up', created_at: Time.utc(2017,7,9))
      Event.create(annonymous_key: 5, action: 'Onboarding - 4 signed up', created_at: Time.utc(2017,7,9))
      Event.create(annonymous_key: 6, action: 'Onboarding - 4 signed up', created_at: Time.utc(2017,7,9))

      # count for this week and action should be 2
      Event.create(annonymous_key: 7, action: 'Onboarding - 3 ask for background check', created_at: Time.utc(2017,7,9))
      Event.create(annonymous_key: 7, action: 'Onboarding - 3 ask for background check', created_at: Time.utc(2017,7,9))
      Event.create(annonymous_key: 8, action: 'Onboarding - 3 ask for background check', created_at: Time.utc(2017,7,9))

      result = AnalyticsQuery.new('2017-06-01', '2017-07-30').weekly_workflow

      expect(result.columns).to eql ["count", "week", "workflow_state"]
      expect(result.rows).to include([1, "2017-05-28", "Onboarding - 2 apply"])
      expect(result.rows).to include([2, "2017-06-25", "Onboarding - 2 apply"])
      expect(result.rows).to include([2, "2017-07-09", "Onboarding - 3 ask for background check"])
      expect(result.rows).to include([3, "2017-07-09", "Onboarding - 4 signed up"])
    end
  end
end
