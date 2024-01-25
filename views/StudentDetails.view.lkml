include: "/views/Students.view"

view: NewFileExtend {
  extends: [Base,Extend1,Extend2]
  measure: testmeasure {
    type: number
    sql: ${Id}+11 ;;
  }
}

view: Link {
  extends: [Base]
  dimension: TotalMarks {
    type: number
    sql:70;;
    link: {
      label: "Report Card"
      url: "https://pantheon.corp.google.com/welcome?project=projecttwo-365317"
    }
  }
}

view: AdditiveLink {
  extends: [Link]

  dimension: TotalMarks {
    link: {
      label: "Marksheet"
      url: "https://www.hackerrank.com/"
    }
  }
}
