- view: users
  sql_table_name: public.users
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: age
    type: number
    sql: ${TABLE}.age
    
  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month, day_of_week]
    sql: ${TABLE}.created_at

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: gender
    type: string
    sql: ${TABLE}.gender

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: traffic_source
    type: string
    sql: ${TABLE}.traffic_source

  - dimension: zip
    type: number
    sql: ${TABLE}.zip

  - measure: count
    type: count
    drill_fields: [id, first_name, last_name, orders.count]

