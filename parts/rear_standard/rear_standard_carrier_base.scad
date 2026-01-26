include <../../constants.scad>
use <rear_standard_carrier_screw_holes.scad>

module rear_standard_carrier_base_flat () {
    linear_extrude(height = rear_standard_carrier_thickness) {
        difference() {
            triangle_offset = (rear_standard_carrier_base_flat_length / 2) - (rear_standard_carrier_screw_hole_triangle_height / 2) - rear_standard_carrier_screw_hole_triangle_top_margin;
            square(size = [rear_standard_carrier_base_flat_length, rear_standard_carrier_width], center = true);
            translate(v = [triangle_offset,0,0]) {
                rear_standard_carrier_screw_holes();
            } 
        }
    }
}

// rear_standard_carrier_base_flat();
module rear_standard_carrier_base(folded = true) {
    linear_extrude(height = rear_standard_carrier_thickness) {
        difference() {
            union() {
                square([rear_standard_carrier_base_length, rear_standard_carrier_width], center = true);

                // Zero marker
                zero_marker_offset = rear_standard_carrier_width / 2;
                translate(v = [0,zero_marker_offset,0]) {    
                    rotate(a = 45, v = [0,0,1]) {
                        square(size = [4,4], center = true);
                    }
                } 
            }
            // slot
            square([rear_standard_carrier_base_slot_length, rear_standard_carrier_base_slot_width], center = true);
        }
    }

    // Flats
    flat_offset_x = (rear_standard_carrier_base_length / 2) + (rear_standard_carrier_thickness);
    flat_offset_y = (rear_standard_carrier_base_flat_length / 2) + rear_standard_carrier_thickness;
    flat_offset_unfolded = (rear_standard_carrier_base_length / 2) + (rear_standard_carrier_base_flat_length / 2) + 3;
    if (folded == true) {  
        translate(v = [flat_offset_x,0,flat_offset_y]) {
            rotate(a = -90, v = [0,1,0]) {
                rear_standard_carrier_base_flat();
            }
        }
        mirror(v = [1,0,0]) {
            translate(v = [flat_offset_x,0,flat_offset_y]) {
            rotate(a = -90, v = [0,1,0]) {
                rear_standard_carrier_base_flat();
            }
        }
        } 
    }
    if (folded == false) {
        translate(v = [flat_offset_unfolded,0,0]) {
            rear_standard_carrier_base_flat();
        }
        mirror(v = [1,0,0]) {
            translate(v = [flat_offset_unfolded,0,0]) {
                rear_standard_carrier_base_flat();
            }
        } 
    }

}

rear_standard_carrier_base(folded = true);