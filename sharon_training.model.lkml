connection: "red_look"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: users {
  join: orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id} = ${orders.user_id} ;;
  }
}

explore: order_items {
  label: "Ecomm items"

  join: orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id} = ${orders.id} ;;
  }

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${users.id} ;;
  }

  join: user_order_facts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.id} = ${user_order_facts.user_id} ;;
  }
}
