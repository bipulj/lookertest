datagroup: dg_inmt_pdt_demo {
  sql_trigger: SELECT count(*) FROM `projecttwo-365317.ds_looker_demo.inmt_data_table`;;
  #interval_trigger: "24 hours"
  max_cache_age: "5 minutes"

}

######################################### Native Derived Table syntax #########################################
view: inmt_pdt_demo {
  derived_table: {

    ####persistent startegies for a PDT####

    #datagroup_trigger:dg_employee_count_by_job_id

    #sql_trigger_value:SELECT max(id) FROM `projecttwo-365317.dataset_in_us.employee`;;

    #interval_trigger: "24 hours"

    #persist_for: "24 hours"

    ####persistent startegies for a PDT####


    datagroup_trigger:dg_inmt_pdt_demo

    explore_source: inmt_pdt_data {
        column: int_col {}
        column: string_col {}
        column:timestamp_col_date {}

    }

    increment_key:"timestamp_col_date"
  }
  # Define your dimensions and measures here, like this:
  dimension: int_col {
    type: number
  }

  dimension: string_col {
    type: string
  }

  dimension: timestamp_col_date {
    type: date
  }
}
