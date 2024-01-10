include: "/views/Students.view"

view: ClassTeacher {

  extends: [Students]

  dimension: ClassTeacherName {
    type: string
    sql: "Vinita Arora" ;;
  }
}
