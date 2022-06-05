class BasePresenter < SimpleDelegator
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  def model
    __getobj__
  end

  def to_model
    self
  end
end
