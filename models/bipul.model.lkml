connection: "pod2-sa-conn-test"

#include:"/models/*.dashboard.lookml"
include:  "/views/department.view.lkml"              # include all views in the views/ folder in this project
include:  "/views/employee.view.lkml"
include:  "/views/Students.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

datagroup: test {
  max_cache_age: "2 minutes"
}

explore: department {}
explore: employee {
  persist_with: test
}
explore: Base {}
