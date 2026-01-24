/********************
* Table of Contents *
* *******************/
// 1. Materials
// 2. Rear Standard
    // 2.1 Rear Standard Carrier
// 3. Front Standard
// 4. Base
// 5. Ground Glass
// 6. Film Cassette



/****************
* 1. Materials  *
* **************/
    sheet_metal_thickness_structural = 2;
    screw_hole_metric_3 = 3;
    screw_hole_metric_4 = 4;
    screw_hole_metric_5 = 5;
    screw_hole_metric_6 = 6;

/********************
* 2. Rear Standard  *
* *******************/

    // 2.1 Rear Standard Carrier
    rear_standard_carrier_thickness = sheet_metal_thickness_structural;
    rear_standard_carrier_width = 26;
    rear_standard_carrier_base_length = 258.5;
    rear_standard_carrier_base_flat_length = 30.25;
    rear_standard_carrier_upright_length = 149;
    rear_standard_carrier_upright_slot_width = 6;
    rear_standard_carrier_screw_hole_diameter = screw_hole_metric_4;
    rear_standard_carrier_screw_hole_triangle_side_length = (rear_standard_carrier_width / 3) + rear_standard_carrier_screw_hole_diameter;
    rear_standard_carrier_screw_hole_triangle_height = (rear_standard_carrier_screw_hole_triangle_side_length * sqrt(3)) / 2;
    rear_standard_carrier_screw_hole_triangle_top_margin = 5;