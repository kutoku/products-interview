module Service
  extend ActiveSupport::Concern

  included do
    def self.call(*, **, &block)
      new(*, **).call(&block)
    end
  end
end
