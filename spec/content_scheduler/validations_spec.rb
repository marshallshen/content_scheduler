require 'spec_helper'

describe ContentScheduler::Validations do
  let(:type_one_diabetes) { Condition.new(name: 'type_one_diabetes')}
  let(:arthritis        ) { Condition.new(name: 'arthritis')}
  let(:migraine         ) { Condition.new(name: 'migraine')}
  let(:obama_care       ) { Tag.new(intent_type: 'assign', name: 'obama_care_promotion')}
  let(:trump_care       ) { Tag.new(intent_type: 'assign', name: 'trump_care_promotion')}
  let(:merck_ads        ) { Tag.new(intent_type: 'target', name: 'merck_ads')}
  let(:assigned_media_asset_one) { MediaAsset.new(condition: type_one_diabetes, 
                                     deliverable_product_type: 'television', 
                                     intent_type: 'assign', 
                                     medija_type: 'mp4',
                                     source_url: 'http://example.com/test.mp4',
                                     status: 'active',
                                     tag: nil) }

  let(:assigned_media_asset_two) { MediaAsset.new(condition: type_one_diabetes, 
                                     deliverable_product_type: 'television', 
                                     intent_type: 'assign', 
                                     media_type: 'mp4',
                                     source_url: 'http://example.com/test.mp4',
                                     status: 'active',
                                     tag: nil) }

  let(:assigned_media_asset_three) { MediaAsset.new(condition: arthritis, 
                                       deliverable_product_type: 'television', 
                                       intent_type: 'assign', 
                                       media_type: 'mp4',
                                       source_url: 'http://example.com/test.mp4',
                                       status: 'active',
                                       tag: nil) }

  let(:targetd_media_asset_one) { MediaAsset.new(condition: arthritis, 
                                    deliverable_product_type: 'television', 
                                    intent_type: 'target', 
                                    media_type: 'mp4',
                                    source_url: 'http://example.com/test.mp4',
                                    status: 'active',
                                    tag: merck_ads) }

  let(:targetd_media_asset_two) { MediaAsset.new(condition: nil, 
                                    deliverable_product_type: 'television', 
                                    intent_type: 'target', 
                                    media_type: 'mp4',
                                    source_url: 'http://example.com/test.mp4',
                                    status: 'active',
                                    tag: trump_care) }

  let(:targetd_media_asset_three) { MediaAsset.new(condition: migraine, 
                                     deliverable_product_type: 'television', 
                                     intent_type: 'target', 
                                     media_type: 'mp4',
                                     source_url: 'http://example.com/test.mp4',
                                     status: 'active',
                                     tag: merck_ads) }

  context "adjacency validation" do
    it "validates a playlist queue based on validation rules" do
      playlist_queue = [targetd_media_asset_one, targetd_media_asset_two]
      validator = ContentScheduler::Validator.new(playlist_queue)
      expect(validator.valid?).to eq(true)
    end

    it "displays error for an invalid playlist queue" do
      playlist_queue = [targetd_media_asset_one, targetd_media_asset_two]
      validator = ContentScheduler::Validator.new(playlist_queue)
      expect(validator.valid?).to eq(false)
      expect(validator.errors).to match(/"adjacency_error"/)
    end
  end
end
