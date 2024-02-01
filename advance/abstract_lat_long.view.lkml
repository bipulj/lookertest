view: abstract_lat_long {
  extension: required

  #sql_table_name: `ds_looker_demo.students` ;;

  dimension: lat  {
    type: number
    sql: 29.2183;;
  }
  dimension: lon {
    type: number
    sql: 79.5130;;
  }
  dimension: location {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${lon} ;;
  }

}
