Employee.destroy_all

Employee.create!([{
    name: "Alex"
},
{
    name: "Jack"
},
{
    name: "Michael"
}
])

p "Created #{Employee.count} employees"