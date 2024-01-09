# Define the database connection to be used for this model.
connection: "pod2-sa-conn-test"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: bipul1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "3 hour"
}

persist_with: bipul1_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Bipul1"

explore: employee {
}

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: department {}

# explore: employee_data {
#   join: employee {
#     type: left_outer
#     sql_on: ${employee_data.employee_id} = ${employee.employee_id} ;;
#     relationship: many_to_one
#   }

#   join: department {
#     type: left_outer
#     sql_on: ${employee.department_id} = ${department.department_id} ;;
#     relationship: many_to_one
#   }
# }

explore: employee_data {
  query:  testquery{
    dimensions: [department.department_id,department.department_name]
    label: "Display Name in Field Picker"
  }
  join: employee {
    type: left_outer
    sql_on: ${employee_data.employee_id} = ${employee.employee_id} ;;
    relationship: many_to_one
  }

  join: department {
    type: left_outer
    sql_on: ${employee.department_id} = ${department.department_id} ;;
    relationship: many_to_one
  }
}


explore: links2 {
  join: links2__sort_keys {
    view_label: "Links2: Sort Keys"
    sql: LEFT JOIN UNNEST(${links2.sort_keys}) as links2__sort_keys ;;
    relationship: one_to_many
  }

  join: links2__source_metadata__primary_keys {
    view_label: "Links2: Source Metadata Primary Keys"
    sql: LEFT JOIN UNNEST(${links2.source_metadata__primary_keys}) as links2__source_metadata__primary_keys ;;
    relationship: one_to_many
  }
}

explore: department_data {
  join: department {
    type: left_outer
    sql_on: ${department_data.department_id} = ${department.department_id} ;;
    relationship: many_to_one
  }

  join: department_data__employee {
    view_label: "Department Data: Employee"
    sql: LEFT JOIN UNNEST(${department_data.employee}) as department_data__employee ;;
    relationship: one_to_many
  }
}

explore: links {
  join: links__sort_keys {
    view_label: "Links: Sort Keys"
    sql: LEFT JOIN UNNEST(${links.sort_keys}) as links__sort_keys ;;
    relationship: one_to_many
  }

  join: links__source_metadata__primary_keys {
    view_label: "Links: Source Metadata Primary Keys"
    sql: LEFT JOIN UNNEST(${links.source_metadata__primary_keys}) as links__source_metadata__primary_keys ;;
    relationship: one_to_many
  }
}
