connection: "pod2-sa-conn-test"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: employee_count_by_job_id {

  persist_with: dg_employee_count_by_job_id
}
