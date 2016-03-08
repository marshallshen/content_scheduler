module ContentScheduler
  class Validator
    attr_accessor :playlist_queue, :errors
    def initialize(playlist_queue)
      @playlist_queue = playlist_queue
      @errors = []
    end

    def valid?
      playlist_queue.each_slice(2) do |current_asset, next_asset|
        if current_asset.intent_type == 'target' && next_asset.intent_type == 'target'
          @errors = ["adjacency_error"]
          return false 
        end
      end

      return true
    end
  end

  module Validations; end
end