connection: "pod2-sa-conn-test"

include: "/views/pdt_demo.view.lkml"                # include all views in the views/ folder in this project
include: "/views/inmt_pdt_demo.view.lkml"

explore: employee_count_by_job_id {}
explore: inmt_pdt_demo {}
