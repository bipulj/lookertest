# The name of this view in Looker is "Department"
view: department {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dataset_in_us.department`
    ;;
  drill_fields: [department_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: department_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.DEPARTMENT_ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Department Name" in Explore.

  dimension: department_name {
    type: string
    sql: ${TABLE}.DEPARTMENT_NAME ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.LOCATION_ID ;;
  }

  dimension: manager_id {
    type: string
    sql: ${TABLE}.MANAGER_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [department_id, department_name, employee.count, department_data.count]
  }
}
