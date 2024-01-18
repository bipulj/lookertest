datagroup: dg_inmt_pdt_demo {
  sql_trigger: SELECT count(*) FROM `projecttwo-365317.ds_looker_demo.inmt_employee`;;
  max_cache_age: "5 minutes"

}

######################################### Sql Derived Table syntax #########################################
view: inmt_pdt_demo {
  derived_table: {

    datagroup_trigger:dg_inmt_pdt_demo

    sql: SELECT
        EMPLOYEE_ID AS EMPLOYEE_ID,
        JOB_ID AS JOB_ID,
        HIRE_DATE AS HIRE_DATE
        FROM `projecttwo-365317.ds_looker_demo.inmt_employee`
        WHERE {% incrementcondition %} HIRE_DATE {%  endincrementcondition %}

      ;;
    increment_key: "hire_date"  #"EMPLOYEE_ID"
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

  dimension_group: hire {
    type: time
    timeframes: [date, week, month, year]
    datatype: date
    sql:  ${TABLE}.HIRE_DATE
      ;;
  }

}
