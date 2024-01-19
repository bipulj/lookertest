######################################### Sql Derived Table syntax #########################################
datagroup: dg_employee_count_by_job_id {
  sql_trigger: SELECT count(*) FROM `projecttwo-365317.dataset_in_us.employee`;;

  max_cache_age: "5 minutes"
}


view: employee_count_by_job_id {
  derived_table: {

    ####persistent startegies for a PDT####

    datagroup_trigger:dg_employee_count_by_job_id

    #sql_trigger_value:SELECT max(id) FROM `projecttwo-365317.dataset_in_us.employee`;;

    #interval_trigger: "24 hours"

    #persist_for: "24 hours"

    ####persistent startegies for a PDT####

    sql: SELECT
        EMPLOYEE_ID AS EMPLOYEE_ID,
        JOB_ID AS JOB_ID,
        HIRE_DATE AS HIRE_DATE
        FROM `projecttwo-365317.dataset_in_us.employee`
      ;;

  }
  # Define your dimensions and measures here, like this:
  dimension: EMPLOYEE_ID {
    description: "Emplpoyee ID"
    type: number
    sql: ${TABLE}.EMPLOYEE_ID ;;
  }

  dimension: JOB_ID {
    description: "Job role short name"
    type: string
    sql: ${TABLE}.JOB_ID ;;
  }

  # dimension_group: hire {
  #   type: time
  #   timeframes: [date, week, month, year]
  #   datatype: date
  #   sql:  ${TABLE}.HIRE_DATE
  #     ;;
  # }

  }


######################################### Native Derived Table syntax #########################################
# datagroup: dg_inmt_pdt_demo {
#   sql_trigger: SELECT count(*) FROM `projecttwo-365317.ds_looker_demo.inmt_data_table`;;
#   #interval_trigger: "24 hours"
#   max_cache_age: "5 minutes"

# }

# view: inmt_pdt_demo {
#   derived_table: {

#     ####persistent startegies for a PDT####

#     # datagroup_trigger:dg_employee_count_by_job_id

#     # sql_trigger_value:SELECT max(id) FROM `projecttwo-365317.dataset_in_us.employee`;;

#     # interval_trigger: "24 hours"

#     # persist_for: "24 hours"

#     ####persistent startegies for a PDT####


#     datagroup_trigger:dg_inmt_pdt_demo

#     explore_source: inmt_pdt_data {
#       column: int_col {}
#       column: string_col {}
#       column:timestamp_col_date {}

#     }

#     increment_key:"timestamp_col_date"
#   }
#   # Define your dimensions and measures here, like this:
#   dimension: int_col {
#     type: number
#   }

#   dimension: string_col {
#     type: string
#   }

#   dimension: timestamp_col_date {
#     type: date
#   }
# }
