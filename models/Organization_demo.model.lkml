connection: "pod2-sa-conn-test"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
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

datagroup: bipul_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "3 hour"
}

persist_with: bipul_test_default_datagroup

explore: department {}

explore: employee {
  query:  testquery{
    dimensions: [department.department_id,department.department_name,employee.first_name,employee.last_name]
    label: "Display Employee Name and Department name in Field Picker"
  }
  query:  testquery2{
    dimensions: [department.department_id,department.department_name,employee.first_name,employee.last_name]
    label: "Display Name in Field Picker"

  }
  join: department {
    type: left_outer
    sql_on: ${employee.department_id} = ${department.department_id} ;;
    relationship: many_to_one
  }
}
