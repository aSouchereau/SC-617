include <../../constants.scad>

module rear_standard_tilt_slot(additional_slot_width = 0) {      
    working_slot_width = rear_standard_tilt_slot_width + additional_slot_width;  
    top_half_angle = rear_standard_tilt_slot_range / 2;
    tilt_range_triangle_half_width = rear_standard_tilt_slot_radius * tan(top_half_angle);
    rotate(a = rear_standard_tilt_slot_rotational_offset, v = [0,0,1]) 
    intersection() {
        polygon(points = [[rear_standard_tilt_slot_radius + working_slot_width / 2,tilt_range_triangle_half_width],
                        [rear_standard_tilt_slot_radius + working_slot_width / 2,-tilt_range_triangle_half_width],
                        [0,0]]);
        //slot ring
        difference() {
            circle(r = rear_standard_tilt_slot_radius + working_slot_width / 2);
            offset(delta = -working_slot_width) {
                circle(r = rear_standard_tilt_slot_radius + working_slot_width / 2);
            }
        }
    }
}

rear_standard_tilt_slot();