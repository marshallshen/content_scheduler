class ContentPorfolio
  attr_accessor :deliverable_product_type, :details, :media_assets, :name:, :playlist_queue,
                :include_tags, :include_conditions, :exclude_tags, :exclude_conditions

  def initialize(options={})
    @deliverable_product_type = options.fetch(:deliverable_product_type)
    @details                  = options.fetch(:details)
    @media_assets             = options.fetch(:media_assets)
    @name                     = options.fetch(:name)

    @include_tags             = options.fetch(:include_tags)
    @include_conditions       = options.fetch(:include_conditions)
    @exclude_tags             = options.fetch(:exclude_tags)
    @exclude_conditions       = options.fetch(:exclude_conditions)
  end

  def compute
    @playlist_queue = @media_asset
  end
end