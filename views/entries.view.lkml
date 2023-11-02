# The name of this view in Looker is "Entries"
view: entries {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.entries ;;
  drill_fields: [entryid]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: entryid {
    primary_key: yes
    type: number
    sql: ${TABLE}."entryid" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Content" in Explore.

  dimension: content {
    type: string
    sql: ${TABLE}."content" ;;
  }

  dimension: guestname {
    type: string
    sql: ${TABLE}."guestname" ;;
  }
  measure: count {
    type: count
    drill_fields: [entryid, guestname]
  }
}
