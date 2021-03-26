class CategoryDecorator < Draper::Decorator
  delegate_all

  def category_name
    doctor.category.name
  end
end
