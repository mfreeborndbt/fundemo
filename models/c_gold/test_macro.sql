select
    {{ calculate_sum_ship_mode(["TRUCK", "MAIL", "REG AIR", "AIR", "FOB", "SHIP", "RAIL"], ref('agg_order_revenue')) }}