class Api::V1::UniversityController < Api::V1::ApplicationController
  def index
    @universities = University.all
  end
end
