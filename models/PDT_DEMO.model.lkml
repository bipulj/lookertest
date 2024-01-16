connection: "pod2-sa-conn-test"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: employee_count_by_job_id {

  persist_with: dg_employee_count_by_job_id
}
