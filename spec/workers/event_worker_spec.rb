require 'rails_helper'
describe EventWorker, type: :worker do
  describe '#perform' do
    it 'should create Event' do
      Sidekiq::Testing.inline! do
        expect{
          EventWorker.perform_async('123', 'action')
        }.to change{Event.count}.by(1)
      end
      event = Event.last
      expect(event.annonymous_key).to eql '123'
      expect(event.action).to eql 'action'
    end
    it 'should raise error if it cannot create Event' do
      Sidekiq::Testing.inline! do
        expect{
          EventWorker.perform_async(nil, nil)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
