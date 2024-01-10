view: Students {

  sql_table_name: `ds_looker_demo.students` ;;

  dimension: First_Name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }
  dimension: Last_Name {
    type: string
    sql: ${TABLE}.LastName ;;
  }
  dimension: Address {
    type: string
    sql: ${TABLE}.Address ;;
  }
  dimension: Contact {
    type: string
    sql: ${TABLE}.Contact ;;
  }

}

view: Class {
  extends: [Students]

  dimension: Class {
    type: number
    sql: 10;;
  }
}

view: Section {
  extends: [Students]

  dimension: Section {
    type: string
    sql: "B" ;;
  }
}
