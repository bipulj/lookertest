view: Base {

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

view: Extend1 {
  extends: [Base]

  dimension: Id {
    type: number
    sql: 10;;
  }
}

view: Extend2 {
  extends: [Base]

dimension: First_Name {
  type: string
  sql: "Extended First Name";;
}
dimension: Last_Name {
  type: string
  sql: "Extended Last Name";;
}
}
