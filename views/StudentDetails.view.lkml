include: "/views/Students.view"

view: StudentDetails {

  extends: [Students,Class,Section,ClassTeacher]

  measure: testmeasure {
    type: number
    sql: ${Class}+11 ;;
  }
}

view: Marks {

  extends: [Students]

  dimension: TotalMarks {
    type: number
    sql:70;;
  }
}

view: StudentMarks {
  extends: [StudentDetails,Marks]
  }
