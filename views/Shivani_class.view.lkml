include: "/views/Students.view"

view: shivani_class {

  extends: [Students]

  dimension: Class {
    type: string
    sql: "9";;
  }
  dimension: Section {
    type: string
    sql: "C" ;;
  }

}
