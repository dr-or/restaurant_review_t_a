class ApplicationQuery
  class << self
    attr_writer :query_model_name

    def query_model_name
      @query_model_name ||= name.sub(/::[^\:]+$/, '')
    end

    def query_model
      query_model_name.safe_constantize
    end

    delegate :resolve, to: :new

    alias call resolve
  end

  def initialize(relation = self.class.query_model.all)
    @relation = relation
  end
end
