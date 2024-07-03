namespace :populate do
    desc 'populate grade categories'
    task grade_categories: :environment do
        %w[
            Bouldering
            Ropes
        ].each do |name|
            GradeCategory.find_or_create_by(name: name)
        end
    end

    desc 'populate grades'
    task grades: :environment do
        category = GradeCategory.find_by(name: 'Ropes')
            %w[
            3
            4
            4+
            5
            5+
            6A
            6A+
            6B
            6B+
            6C
            6C+
            7A
            7A+
            7B
            7B+
            7C
            7C+
            8A
            8A+
            8B
            8B+
            8C
            8C+
            9A
        ].each do |grade|
            category.grades.find_or_create_by(name: grade)
        end

        category = GradeCategory.find_by(name: 'Bouldering')
        %w[
            VB
            V0
            V1
            V2
            V3
            V4
            V5
            V6
            V7
            V8
            V9
            V10
            V11
            V12
            V13
            V14
            V15
            V16
            V17
        ].each do |grade|
            category.grades.find_or_create_by(name: grade)
        end
    end
end 

