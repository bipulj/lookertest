connection: "pod2-sa-conn-test"

#include: "/views/employee_data.view.lkml"
include: "/views/department_data.view.lkml"

# explore: employee_data_qs {
#   query: qs_namefilter {
#     dimensions: [employee_data_qs.first_name,employee_data_qs.last_name]
#     label: "Quick start demo with filter on First and Last name"
#     filters: [employee_data_qs.first_name: "Bipul", employee_data_qs.last_name: "Joshi"]
#     #filters: [employee_data.email: ""]
#   }
#   query:  qs_description{
#     dimensions: [employee_data_qs.first_name,employee_data_qs.last_name]
#     label: "Quick start demo with description"
#   }

# }

# explore: department_data {
#   extends: [employee_data]
#   query: qs_deptnamefilter {
#     dimensions: [department_data.department_id,department_data.department_name]
#     label: "Quick start demo with filter on Department name"
#     filters: [department_data.department_name: ""]
#     #filters: [employee_data.email: ""]
#   }

# }
