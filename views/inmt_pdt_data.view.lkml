view: inmt_pdt_data {

  sql_table_name:  `ds_looker_demo.inmt_data_table` ;;

  dimension: int_col {
    sql: ${TABLE}.int_col ;;
  }

  dimension: string_col {
    sql: ${TABLE}.string_col ;;
  }

  dimension_group: timestamp_col {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      year
    ]
    sql: ${TABLE}.timestamp_col ;;
  }

}
