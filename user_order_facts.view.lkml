view: user_order_facts {
  derived_table: {
    sql: select
        orders.user_id as user_id,
        count(*) as total_orders,
        min(orders.created_at) as first_order,
        max(orders.created_at) as last_order
      from users
      left join orders
      on users.id = orders.user_id
      group by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }

  dimension_group: first_order {
    type: time
    timeframes: [day_of_week, date, month, year]
    sql: ${TABLE}.first_order ;;
  }

  dimension_group: last_order {
    type: time
    timeframes: [day_of_week, date, month, year]
    sql: ${TABLE}.last_order ;;
  }

  set: detail {
    fields: [user_id, total_orders]
  }
}
