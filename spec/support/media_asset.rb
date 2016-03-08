class MediaAsset
  attr_accessor :condition, :deliverable_product_type, :intent_type, :media_type, :source_url, :status, :tag

  def initialize(options={})
    @conditions               = options.fetch(:condition)
    @deliverable_product_type = options.fetch(:deliverable_product_type)
    @intent_type              = options.fetch(:intent_type)
    @media_type               = options.fetch(:media_type)
    @source_url               = options.fetch(:source_url)
    @status                   = options.fetch(:status)
    @tags                     = options.fetch(:tag)
  end
end