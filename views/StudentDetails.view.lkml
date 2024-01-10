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
    link: {
      url: "https://pantheon.corp.google.com/welcome?project=projecttwo-365317"
    }
  }
}

view: StudentMarks {
  extends: [StudentDetails,Marks]
  dimension: TotalMarks {
    link: {
      url: "https://www.hackerrank.com/"
    }
  }
}
