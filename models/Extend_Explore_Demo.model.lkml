connection: "pod2-sa-conn-test"

include: "/views/department.view.lkml"
include: "/views/employee.view.lkml"
include: "/views/employee_data.view.lkml"
include: "/views/department_data.view.lkml"

##########################overriding starts##########################
# explore: employee {
#   description:"This is an employee detail explore"
# }

# # explore: department {
# #   extends: [employee]
# # }
# explore: department {
#   extends: [employee]
#   description:"This is a department detail explore"
# }
##########################overriding ends##########################

##########################additive starts##########################
# explore: employee {}

# explore: department {
#   join: employee {
#     sql_on: ${department.department_id} = ${employee.department_id} ;;
#     relationship:many_to_many
#   }
# }

# explore: department_data {
#   extends: [department]
#   #after extending(line 35) , the join condition in extended explore(department line:29) also needs to be mentioned (line 37)
#   join: employee {
#     sql_on: ${department_data.department_id} = ${employee.department_id} ;;
#   }
#   #joins beyond this are additive.
#   join: employee_data{
#     sql_on: ${department.department_id} = ${employee_data.department__department_id} ;;
#     relationship:many_to_many
#   }
# }
##########################additive ends##########################
