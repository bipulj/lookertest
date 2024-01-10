include: "/views/Students.view"

view: ClassTeacher {

  extends: [Students,Class,Section]

  dimension: ClassTeacherName {
    type: string
    sql: "Vinita Arora" ;;
  }
}
