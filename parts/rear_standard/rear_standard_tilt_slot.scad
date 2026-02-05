include <../../constants.scad>

module rear_standard_tilt_slot() {        
    top_half_angle = rear_standard_tilt_slot_range / 2;
    tilt_range_triangle_half_width = rear_standard_tilt_slot_outer_radius * tan(top_half_angle);
    rotate(a = rear_standard_tilt_slot_rotational_offset, v = [0,0,1]) 
    intersection() {
        polygon(points = [[rear_standard_tilt_slot_outer_radius,tilt_range_triangle_half_width],
                        [rear_standard_tilt_slot_outer_radius,-tilt_range_triangle_half_width],
                        [0,0]]);
        //slot ring
        difference() {
            circle(r = rear_standard_tilt_slot_outer_radius);
            offset(delta = -rear_standard_tilt_slot_width) {
                circle(r = rear_standard_tilt_slot_outer_radius);
            }
        }
    }
}

rear_standard_tilt_slot();