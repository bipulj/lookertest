connection: "pod2-sa-conn-test"

include: "/views/employee_data.view.lkml"
include: "/views/department_data.view.lkml"

explore: employee_data {
  query: qs_namefilter {
    dimensions: [employee_data.first_name,employee_data.last_name]
    label: "Quick start demo with filter on First and Last name"
    filters: [employee_data.first_name: "Bipul", employee_data.last_name: "Joshi"]
    #filters: [employee_data.email: ""]
  }
  query:  qs_description{
    dimensions: [employee_data.first_name,employee_data.last_name]
    label: "Quick start demo with description"
    description: "Hi team"
  }

}

# explore: department_data {
#   extends: [employee_data]
#   query: qs_deptnamefilter {
#     dimensions: [department_data.department_id,department_data.department_name]
#     label: "Quick start demo with filter on Department name"
#     filters: [department_data.department_name: ""]
#     #filters: [employee_data.email: ""]
#   }

# }
