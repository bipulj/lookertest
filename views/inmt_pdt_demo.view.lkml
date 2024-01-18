datagroup: dg_inmt_pdt_demo {
  #sql_trigger: SELECT count(*) FROM `projecttwo-365317.ds_looker_demo.inmt_data_table`;;
  interval_trigger: "24 hours"
  max_cache_age: "5 minutes"

}

######################################### Native Derived Table syntax #########################################
view: inmt_pdt_demo {
#   derived_table: {

#     datagroup_trigger:dg_inmt_pdt_demo

#     explore_source: inmt_pdt_data {
#         column: a_number {}
#         column: a_string {}
#         column:departure {
#         # column: departure {}
#     }

#     increment_key: "departure_date"
#   }
#   # Define your dimensions and measures here, like this:
#   dimension: a_number {
#     description: "Emplpoyee ID"
#     type: number
#   }

#   dimension: a_string {
#     description: "Job role name"
#     type: string
#   }

#   dimension: departure_date {
#     type: date
#   }
# }
}
