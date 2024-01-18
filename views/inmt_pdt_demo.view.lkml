datagroup: dg_inmt_pdt_demo {
  #sql_trigger: SELECT count(*) FROM `projecttwo-365317.ds_looker_demo.inmt_data_table`;;
  interval_trigger: "24 hours"
  max_cache_age: "5 minutes"

}

######################################### Sql Derived Table syntax #########################################
view: inmt_pdt_demo {
  derived_table: {

    datagroup_trigger:dg_inmt_pdt_demo

    sql: SELECT
        idt.int_col AS a_number,
        idt.string_col AS a_string,
        DATE(idt.timestamp_col) AS a_timestamp
        FROM `projecttwo-365317.ds_looker_demo.inmt_data_table` as idt
        WHERE {% incrementcondition %} idt.timestamp_col {%  endincrementcondition %}

      ;;
    increment_key: "hire_date"  #"EMPLOYEE_ID"
  }
  # Define your dimensions and measures here, like this:
  dimension: EMPLOYEE_ID {
    description: "Emplpoyee ID"
    type: number
    sql: ${TABLE}.a_number ;;
  }

  dimension: JOB_NAME {
    description: "Job role name"
    type: string
    sql: ${TABLE}.a_string ;;
  }

  dimension_group: hire {
    type: time
    timeframes: [date, week, month, year]
    datatype: date
    sql:  ${TABLE}.a_timestamp
      ;;
  }

}
