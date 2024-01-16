connection: "pod2-sa-conn-test"

include: "/views/employee_data.view.lkml"
include: "/views/department.view.lkml"

explore: employee_data {
  query: qs_namefilter {
    dimensions: [employee_data.first_name,employee_data.last_name]
    label: "Quick start demo with filter on First and Last name"
    filters: [employee_data.first_name: "", employee_data.last_name: ""]
    #filters: [employee_data.email: ""]
  }
  query:  qs_description{
    dimensions: [employee_data.first_name,employee_data.last_name]
    label: "Quick start demo with description"
    description: "Information about this query"
  }

}
