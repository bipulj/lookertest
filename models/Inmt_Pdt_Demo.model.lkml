connection: "pod2-sa-conn-test"

include: "/views/inmt_pdt_data.view.lkml"
include: "/views/inmt_pdt_demo.view.lkml"

explore: inmt_pdt_data {}


explore: inmt_pdt_demo {}
