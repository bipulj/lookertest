include: "/views/Students.view"

view: StudentDetails {

  extends: [Students,Class,Section,ClassTeacher]

  measure: testmeasure {
    type: number
    sql: ${Class}+11 ;;
  }
}

view: testview {
  extends: [StudentDetails]
  measure:  abc{
    filters: [testmeasure: "11"]
  }

}
