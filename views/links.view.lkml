# The name of this view in Looker is "Links"
view: links {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dataset_in_us.links`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Object" in Explore.

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: payload__description {
    type: string
    sql: ${TABLE}.payload.description ;;
    group_label: "Payload"
    group_item_label: "Description"
  }

  dimension: payload__id {
    type: number
    sql: ${TABLE}.payload.id ;;
    group_label: "Payload"
    group_item_label: "ID"
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: payload__last_update {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.payload.last_update ;;
  }

  dimension: payload__name {
    type: string
    sql: ${TABLE}.payload.name ;;
    group_label: "Payload"
    group_item_label: "Name"
  }

  dimension: payload__url {
    type: string
    sql: ${TABLE}.payload.url ;;
    group_label: "Payload"
    group_item_label: "URL"
  }

  dimension: read_method {
    type: string
    sql: ${TABLE}.read_method ;;
  }

  dimension_group: read_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.read_timestamp ;;
  }

  dimension: schema_key {
    type: string
    sql: ${TABLE}.schema_key ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: sort_keys {
    hidden: yes
    sql: ${TABLE}.sort_keys ;;
  }

  dimension: source_metadata__change_type {
    type: string
    sql: ${TABLE}.source_metadata.change_type ;;
    group_label: "Source Metadata"
    group_item_label: "Change Type"
  }

  dimension: source_metadata__database {
    type: string
    sql: ${TABLE}.source_metadata.database ;;
    group_label: "Source Metadata"
    group_item_label: "Database"
  }

  dimension: source_metadata__is_deleted {
    type: yesno
    sql: ${TABLE}.source_metadata.is_deleted ;;
    group_label: "Source Metadata"
    group_item_label: "Is Deleted"
  }

  dimension: source_metadata__log_file {
    type: string
    sql: ${TABLE}.source_metadata.log_file ;;
    group_label: "Source Metadata"
    group_item_label: "Log File"
  }

  dimension: source_metadata__log_position {
    type: number
    sql: ${TABLE}.source_metadata.log_position ;;
    group_label: "Source Metadata"
    group_item_label: "Log Position"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_source_metadata__log_position {
    type: sum
    sql: ${source_metadata__log_position} ;;
  }

  measure: average_source_metadata__log_position {
    type: average
    sql: ${source_metadata__log_position} ;;
  }

  dimension: source_metadata__primary_keys {
    hidden: yes
    sql: ${TABLE}.source_metadata.primary_keys ;;
    group_label: "Source Metadata"
    group_item_label: "Primary Keys"
  }

  dimension: source_metadata__table {
    type: string
    sql: ${TABLE}.source_metadata.table ;;
    group_label: "Source Metadata"
    group_item_label: "Table"
  }

  dimension_group: source_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.source_timestamp ;;
  }

  dimension: stream_name {
    type: string
    sql: ${TABLE}.stream_name ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  measure: count {
    type: count
    drill_fields: [stream_name, payload__name]
  }
}

# The name of this view in Looker is "Links Sort Keys"
view: links__sort_keys {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Links Sort Keys" in Explore.

  dimension: links__sort_keys {
    type: number
    sql: links__sort_keys ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_links__sort_keys {
    type: sum
    sql: ${links__sort_keys} ;;
  }

  measure: average_links__sort_keys {
    type: average
    sql: ${links__sort_keys} ;;
  }
}

# The name of this view in Looker is "Links Source Metadata Primary Keys"
view: links__source_metadata__primary_keys {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Links Source Metadata Primary Keys" in Explore.

  dimension: links__source_metadata__primary_keys {
    type: string
    sql: links__source_metadata__primary_keys ;;
  }
}
