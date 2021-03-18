class PatientsController < ApplicationController
  def show
    @categories = Category.all
  end
end
