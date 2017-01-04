- connection: red_look

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: users
  joins:
    - join: orders
      type: left_outer
      relationship: one_to_many
      sql_on: ${users.id} = ${orders.user_id}

- explore: order_items
  label: 'Ecomm items'
  joins:
    - join: orders
      type: left_outer
      relationship: many_to_one
      sql_on: ${order_items.order_id} = ${orders.id}
      
    - join: users
      type: left_outer
      relationship: many_to_one
      sql_on: ${orders.user_id} = ${users.id}
      
    - join: user_order_facts
      type: left_outer
      relationship: one_to_one
      sql_on: ${users.id} = ${user_order_facts.user_id}





