view: students_refine {
  sql_table_name: `ds_looker_demo.students` ;;

  dimension: First_Name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: Last_Name {
    type: string
    sql: ${TABLE}.LastName ;;
  }
}
