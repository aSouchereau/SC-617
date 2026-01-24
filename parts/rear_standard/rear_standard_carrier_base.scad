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

rear_standard_carrier_base_flat();

module rear_standard_carrier_base() {
    difference() {
        square([rear_standard_carrier_base_length, rear_standard_carrier_width], center = true);
        square([160, 6], center = true);
    }
}

// rear_standard_carrier_base();