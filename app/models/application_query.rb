class ApplicationQuery
  class << self
    def query_model
      name.sub(/::[^\:]+$/, '').safe_constantize
    end

    delegate :resolve, to: :new

    alias call resolve
  end

  def initialize(relation = self.class.query_model.all)
    @relation = relation
  end
end
