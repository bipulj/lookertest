include: "/advance/abstract_lat_long.view.lkml"

view: extension_lat_long {

  sql_table_name: `ds_looker_demo.students` ;;
  extends: [abstract_lat_long]

  parameter: city {
    type: string
    allowed_value: {
      label: "Pune"
      value: "pune"
    }
    allowed_value: {
      label: "Mumbai"
      value: "mumbai"
    }
    allowed_value: {
      label: "Nagpur"
      value: "nagpur"
    }
    allowed_value: {
      label: "Tokyo"
      value: "tokyo"
    }
    allowed_value: {
      label: "Nagasaki"
      value: "nagasaki"
    }
  }

  dimension: distance_city_lat {
    hidden: yes
    type: number
    sql: CASE WHEN {% parameter city %} = 'pune' THEN 18.5204
              WHEN {% parameter city %} = 'mumbai' THEN 19.0760
              WHEN {% parameter city %} = 'nagpur' THEN 21.1458
              WHEN {% parameter city %} = 'tokyo' THEN 35.6764
              WHEN {% parameter city %} = 'nagasaki' THEN 32.7503
              ELSE 48.864716 END ;;
  }

  dimension: distance_city_long {
    hidden: yes
    type: number
    sql: CASE WHEN {% parameter city %} = 'pune' THEN 73.8567
              WHEN {% parameter city %} = 'mumbai' THEN 72.8777
              WHEN {% parameter city %} = 'nagpur' THEN 79.0882
              WHEN {% parameter city %} = 'tokyo' THEN 139.6500
              WHEN {% parameter city %} = 'nagasaki' THEN 129.8779
              ELSE 2.349014 END ;;
  }

  dimension: location_of_selected_city {
    #hidden: yes
    type: location
    sql_latitude: ${distance_city_lat} ;;
    sql_longitude: ${distance_city_long} ;;
  }

  dimension: distance_between_selected_city_and_user {
    label: "Distance in km"
    type: distance
    start_location_field: location
    end_location_field: location_of_selected_city
    units: kilometers
  }
}
