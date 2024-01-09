
datagroup: dg_employee_count_by_job_id {
  sql_trigger: SELECT count(*) FROM `projecttwo-365317.dataset_in_us.employee`;;
  #max_cache_age: "2 minutes"
}

view: employee_count_by_job_id {
  derived_table: {

     datagroup_trigger:dg_employee_count_by_job_id
    #increment_key: "HIRE_DATE"

     #sql_trigger_value:SELECT max(employee_id) FROM `projecttwo-365317.dataset_in_us.employee`;;
    sql: SELECT
        EMPLOYEE_ID AS EMPLOYEE_ID,
        JOB_ID AS JOB_ID,
        HIRE_DATE AS HIRE_DATE
        FROM `projecttwo-365317.dataset_in_us.employee`

      ;;
  }
  #sql_table_name:`dataset_in_us.employee`;;         #WHERE {% incrementcondition %} HIRE_DATE {% endincrementcondition %}

  #derived_table and sql_table_name can't be used together
  # Define your dimensions and measures here, like this:
  dimension: EMPLOYEE_ID {
    description: "Emplpoyee ID"
    type: string
    sql: ${TABLE}.EMPLOYEE_ID ;;
  }

  dimension: JOB_ID {
    description: "Job role short name"
    type: string
    sql: ${TABLE}.JOB_ID ;;
  }
  dimension_group: DIMENSION_CREATED_TIME {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: date
    sql:CURRENT_DATETIME() ;;
  }

  }
# If necessary, uncomment the line below to include explore_source.
# include: "bipul1.model.lkml"

# view: add_a_unique_name_1704707335 {
#   derived_table: {
#     explore_source: department {
#       column: department_id {}
#       column: location_id {}
#       column: department_name {}
#       filters: {
#         field: department.location_id
#         value: ">1700"
#       }
#     }
#   }
#   dimension: department_id {
#     description: ""
#     type: number
#   }
#   dimension: location_id {
#     description: ""
#     type: number
#   }
#   dimension: department_name {
#     description: ""
#   }
# }
