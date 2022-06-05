class PostPresenter < BasePresenter
  def intro
    if description.present?
      [
        tag.h3("Description"),
        tag.p(description),
      ].join
    end
  end

  def published_date
    if published_on && published_on <= Date.current
      "Published on #{formatted_published_date}"
    end
  end

  def written_by
    tag.p("Written by #{person.first_name}")
  end

  private

  def formatted_published_date
    l(published_on, format: :short)
  end
end
