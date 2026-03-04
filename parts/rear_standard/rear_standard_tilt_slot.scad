include <../../constants.scad>

module rear_standard_tilt_slot(additional_slot_width = 0) {
    working_slot_width = rear_standard_tilt_slot_width + additional_slot_width;  
    theta = (rear_standard_tilt_slot_range) / 2;
    H = rear_standard_tilt_slot_radius + (working_slot_width / 2);
    triangle_half_width = H * tan(theta);

    rotate(a =  rear_standard_tilt_slot_rotational_offset, v = [0,0,1]) 
    intersection() {
        polygon(points = [
            [0,0],
            [H,triangle_half_width],
            [H,-triangle_half_width]
            ]);
        //slot ring
        difference() {
            circle(r = rear_standard_tilt_slot_radius + working_slot_width / 2);
            circle(r = rear_standard_tilt_slot_radius - working_slot_width / 2);
        }
    }
    rotate(a = rear_standard_tilt_slot_range / 2 + rear_standard_tilt_slot_rotational_offset, v = [0,0,1]) {
        translate(v = [H - working_slot_width / 2,0,0]) {
            circle(r = working_slot_width / 2);
        }
    }
    rotate(a = -rear_standard_tilt_slot_range / 2 + rear_standard_tilt_slot_rotational_offset, v = [0,0,1]) {
        translate(v = [H - working_slot_width / 2,0,0]) {
            circle(r = working_slot_width / 2);
        }
    }
}

rear_standard_tilt_slot();