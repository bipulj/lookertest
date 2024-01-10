connection: "pod2-sa-conn-test"

include: "/views/Students.view.lkml"
include: "/views/StudentDetails.view.lkml"
include: "/views/department.view.lkml"
include: "/views/employee.view.lkml"
include: "/views/employee_data.view.lkml"
include: "/views/department_data.view.lkml"

##########################overriding starts##########################
# explore: employee {
#   description:"This is an employee detail explore"
# }

# explore: department {
#   extends: [employee]
# }
# explore: department {
#   extends: [employee]
#   description:"This is a department detail explore"
# }
##########################overriding ends##########################

##########################additive starts##########################
explore: employee {}

explore: department {
  join: employee {
    sql_on: ${department.department_id} = ${employee.department_id} ;;
    relationship:many_to_many
  }
}

explore: department_data {
  extends: [department]
  #after extending(line 33) , the join condition in extended explore(department line:26) also needs to be mentioned (line 35)
  join: employee {
    sql_on: ${department_data.department_id} = ${employee.department_id} ;;
  }
  #joins beyond this are additive.
  # join: employee_data{
  #   sql_on: ${department_data.department_id} = ${employee_data.department__department_id} ;;
  #   relationship:many_to_many
  # }
}
##########################additive ends##########################

# explore: Base {}
# explore: Extend1 {}
# explore: Extend2 {}
# explore: NewFileExtend {}
# explore: Link {}
# explore: AdditiveLink {}
