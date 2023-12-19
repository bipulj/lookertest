# The name of this view in Looker is "Employee Data"
view: employee_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dataset_in_us.employee_data`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Commission Pct" in Explore.

  dimension: commission_pct {
    type: string
    sql: ${TABLE}.COMMISSION_PCT ;;
  }

  dimension: department__department_id {
    type: number
    sql: ${TABLE}.DEPARTMENT.DEPARTMENT_ID ;;
    group_label: "Department"
    group_item_label: "Department ID"
  }

  dimension: department__department_name {
    type: string
    sql: ${TABLE}.DEPARTMENT.DEPARTMENT_NAME ;;
    group_label: "Department"
    group_item_label: "Department Name"
  }

  dimension: department__location_id {
    type: number
    sql: ${TABLE}.DEPARTMENT.LOCATION_ID ;;
    group_label: "Department"
    group_item_label: "Location ID"
  }

  dimension: department__manager_id {
    type: string
    sql: ${TABLE}.DEPARTMENT.MANAGER_ID ;;
    group_label: "Department"
    group_item_label: "Manager ID"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.EMPLOYEE_ID ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: hire {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.HIRE_DATE ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.JOB_ID ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: manager_id {
    type: string
    sql: ${TABLE}.MANAGER_ID ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.PHONE_NUMBER ;;
  }

  dimension: salary {
    type: number
    sql: ${TABLE}.SALARY ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_salary {
    type: sum
    sql: ${salary} ;;
  }

  measure: average_salary {
    type: average
    sql: ${salary} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      last_name,
      first_name,
      department__department_name,
      employee.employee_id,
      employee.last_name,
      employee.first_name
    ]
  }
}
