connection: "pod2-sa-conn-test"

include: "/views/Students_refine.view.lkml"
include: "/views/refine_Id.view.lkml" #make sure to include  this view file in modle file

explore: students_refine {}
