    class GradeCategoryController < ApplicationController
        def index
            @grade_categories = GradeCategory.all
        end

    def grades
        @grades = Grade.where(grade_category_id: params[ :id])
        respond_to do |format|
            format&.turbo_stream
        end
    end
end