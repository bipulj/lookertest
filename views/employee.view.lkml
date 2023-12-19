# The name of this view in Looker is "Employee"
view: employee {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dataset_in_us.employee`
    ;;
  drill_fields: [employee_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: employee_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.EMPLOYEE_ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Commission Pct" in Explore.

  dimension: commission_pct {
    type: string
    sql: ${TABLE}.COMMISSION_PCT ;;
  }

  dimension: department_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DEPARTMENT_ID ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
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
      employee_id,
      last_name,
      first_name,
      department.department_name,
      department.department_id,
      employee_data.count
    ]
  }
}
