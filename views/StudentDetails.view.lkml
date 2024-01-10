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
      label: "googleproject"
      url: "https://pantheon.corp.google.com/welcome?project=projecttwo-365317"
    }}}

view: AdditiveLink {
  extends: [Base,Link]
  dimension: TotalMarks {
    link: {
      label: "Hackerrank"
      url: "https://www.hackerrank.com/"
    }
  }
}
