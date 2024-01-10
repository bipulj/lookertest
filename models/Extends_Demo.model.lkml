connection: "pod2-sa-conn-test"

include: "/views/Students.view.lkml"                # include all views in the views/ folder in this project
include: "/views/StudentDetails.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: Students {}
explore: Class {}
explore: Section {}
explore: ClassTeacher {}
explore: StudentDetails {}
explore: StudentMarks {}
explore: Marks {}
