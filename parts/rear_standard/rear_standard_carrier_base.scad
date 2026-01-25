include <../../constants.scad>
use <rear_standard_carrier_screw_holes.scad>

module rear_standard_carrier_base_flat () {
    difference() {
        triangle_offset = (rear_standard_carrier_base_flat_length / 2) - (rear_standard_carrier_screw_hole_triangle_height / 2) - rear_standard_carrier_screw_hole_triangle_top_margin;
        square(size = [rear_standard_carrier_base_flat_length, rear_standard_carrier_width], center = true);
        translate(v = [triangle_offset,0,0]) {
            rear_standard_carrier_screw_holes();
        } 
    }
}

// rear_standard_carrier_base_flat();

module rear_standard_carrier_base(folded = true) {
    difference() {
        square([rear_standard_carrier_base_length, rear_standard_carrier_width], center = true);
        square([160, 6], center = true);
    }

    // Flats
    flat_offset_x = (rear_standard_carrier_base_length / 2) + (rear_standard_carrier_thickness / 2);
    flat_offset_y = (rear_standard_carrier_base_flat_length / 2);
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