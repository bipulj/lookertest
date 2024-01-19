connection: "pod2-sa-conn-test"

#include: "/views/employee_data.view.lkml"
include: "/views/department_data.view.lkml"

explore: employee_data_qs {
  query: qs_namefilter {
    dimensions: [employee_data_qs.first_name,employee_data_qs.last_name]
    label: "Quick start demo with filter on First and Last name"
    filters: [employee_data_qs.first_name: "", employee_data_qs.last_name: ""]
    #filters: [employee_data.email: ""]
  }
  query:  qs_description{
    dimensions: [employee_data_qs.first_name,employee_data_qs.last_name]
    label: "Quick start demo with description"
    description: "Hi Team"
  }

}

# explore: department_data {
#   join: employee_data_qs {
#     sql_on: ${department_data.department_id}=${employee_data_qs.department_id} ;;
#   }
#   extends: [employee_data_qs]
#   query: qs_deptnamefilter {
#     dimensions: [department_data.department_id,department_data.department_name]
#     label: "Quick start demo with filter on Department name"
#     filters: [department_data.department_name: ""]
#     #filters: [employee_data.email: ""]
#   }

# }
