class PeopleController < ApplicationController
  before_action :require_admin, except: :show

  def create
    @person = CreateAndWelcomeUser.call(person_params)

    respond_with @person
  end

  def new
    @person = Person.new
  end

  def show
    @person = Person.find(params[:id])
  end

  private

  def person_params
    params.require(:person).permit(:admin, :email, :first_name, :last_name)
  end
end
