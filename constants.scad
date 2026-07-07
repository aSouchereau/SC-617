/********************
* Table of Contents *
* *******************/
// 1. Materials
// 2. Rear Standard
    // 2.1 Rear Standard Carrier
    // 2.2 Rear Standard Housing
    // 2.3 Rear Standard Tilt Plate
    // 2.4 Rear Standard Rise Plate
// 3. Front Standard
// 4. Base
// 5. Ground Glass
// 6. Film Cassette
// 7. Movements



/****************
* 1. Materials  *
* **************/
    sheet_metal_thickness_structural = 2;
    sheet_metal_thickness_nonstructural = 2;
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
    rear_standard_carrier_base_slot_length = 160;
    rear_standard_carrier_base_slot_width = 6;
    rear_standard_carrier_upright_length = 149;
    rear_standard_carrier_upright_slot_width = 6;
    rear_standard_carrier_screw_hole_diameter = screw_hole_metric_4;
    rear_standard_carrier_screw_hole_triangle_side_length = (rear_standard_carrier_width / 3) + rear_standard_carrier_screw_hole_diameter;
    rear_standard_carrier_screw_hole_triangle_height = (rear_standard_carrier_screw_hole_triangle_side_length * sqrt(3)) / 2;
    rear_standard_carrier_screw_hole_triangle_top_margin = 5;

    // 2.2 Rear Standard Housing
    rear_standard_housing_width = 245;
    rear_standard_housing_height = 126;
    rear_standard_housing_depth = 30;
    rear_standard_housing_thickness = 10;
    rear_standard_housing_frame_width = 33;
    rear_standard_housing_tilt_slot_additional_width = 2; // screw head diameter + small margin - rear_standard_tilt_slot_width


    // 2.3 Rear Standard Tilt Plate
    rear_standard_tilt_plate_thickness = sheet_metal_thickness_nonstructural;
    rear_standard_tilt_slot_radius = 45;
    rear_standard_tilt_slot_width = 5;
    rear_standard_tilt_slot_range = 50;
    rear_standard_tilt_slot_rotational_offset = 5;

    // 2.4 Rear Standard Rise Plate
    rear_standard_pivot_stud_diameter = 4;

/****************
* 7. Movements  *
* **************/
    rear_standard_rise_zero_pos = 25;
    rear_standard_rise = 0;