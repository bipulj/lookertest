# The name of this view in Looker is "Department Data"
view: department_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dataset_in_us.department_data`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Department ID" in Explore.

  dimension: department_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DEPARTMENT_ID ;;
  }

  dimension: department_name {
    type: string
    sql: ${TABLE}.DEPARTMENT_NAME ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: employee {
    hidden: yes
    sql: ${TABLE}.EMPLOYEE ;;
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
    drill_fields: [department_name, department.department_name, department.department_id]
  }
}

# The name of this view in Looker is "Department Data Employee"
view: department_data__employee {
  drill_fields: [employee_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: employee_id {
    primary_key: yes
    type: number
    sql: EMPLOYEE_ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Commission Pct" in Explore.

  dimension: commission_pct {
    type: string
    sql: COMMISSION_PCT ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: department_data__employee {
    type: string
    hidden: yes
    sql: department_data__employee ;;
  }

  dimension: email {
    type: string
    sql: EMAIL ;;
  }

  dimension: first_name {
    type: string
    sql: FIRST_NAME ;;
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
    sql: HIRE_DATE ;;
  }

  dimension: job_id {
    type: string
    sql: JOB_ID ;;
  }

  dimension: last_name {
    type: string
    sql: LAST_NAME ;;
  }

  dimension: manager_id {
    type: string
    sql: MANAGER_ID ;;
  }

  dimension: phone_number {
    type: string
    sql: PHONE_NUMBER ;;
  }

  dimension: salary {
    type: number
    sql: SALARY ;;
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
}

view: employee_data_qs {

  sql_table_name: `dataset_in_us.employee_data`
  ;;

  dimension: first_name {
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }


  dimension: last_name {
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: department_id {
    type: number
    sql: ${TABLE}.DEPARTMENT.DEPARTMENT_ID ;;
  }
}
