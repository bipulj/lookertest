include: "/views/Students_refine.view.lkml"

# view: +students_refine {

#   dimension: Id {
#     type: number
#     sql: 10;;
#   }
# }

view: +students_refine {

  dimension: First_Name {
    type: string
    sql: "abc";;
  }
}
