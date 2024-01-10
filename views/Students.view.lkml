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
  dimension: Address {
    type: string
    sql: ${TABLE}.Address ;;
  }
  dimension: Contact {
    type: string
    sql: ${TABLE}.Contact ;;
  }

}

view: Extend1 {
  extends: [Base]

  dimension: Class {
    type: number
    sql: 10;;
  }
}

view: Extend2 {
  extends: [Base]

  dimension: Section {
    type: string
    sql: "A" ;;
  }
}

view: Extend3 {

  extends: [Base]

  dimension: ClassTeacherName {
    type: string
    sql: "Vinita Arora" ;;
  }
}
