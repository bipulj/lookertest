datagroup: dg_inmt_pdt_demo {
  sql_trigger: SELECT count(*) FROM `projecttwo-365317.ds_looker_demo.inmt_data_table`;;
  #interval_trigger: "24 hours"
  max_cache_age: "5 minutes"

}

######################################### Native Derived Table syntax #########################################
view: inmt_pdt_demo {
  derived_table: {

    datagroup_trigger:dg_inmt_pdt_demo

    explore_source: inmt_pdt_data {
        column: int_col {}
        column: string_col {}
        column:timestamp_col {}

    }

    increment_key: "departure_date"
  }
  # Define your dimensions and measures here, like this:
  dimension: a_number {
    type: number
  }

  dimension: a_string {
    type: string
  }

  dimension: departure_date {
    type: date
  }
}
