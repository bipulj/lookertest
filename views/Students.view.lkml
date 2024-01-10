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

view: Bipul_class {
  extends: [Students]

  dimension: Class {
    type: string
    sql: "10";;
  }
  dimension: Section {
    type: string
    sql: "A" ;;
  }
}

view: Tariq_class {
  extends: [Bipul_class]

  dimension: Section {
    type: string
    sql: "B" ;;
  }
}
