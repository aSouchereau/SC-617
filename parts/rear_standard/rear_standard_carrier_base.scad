include <../../constants.scad>
use <rear_standard_carrier_screw_holes.scad>
use <../../shapes/bends.scad>

// rear_standard_carrier_base_flat();
module rear_standard_carrier_base(folded = true) {
    if (folded) {
        carrier_base();
    } else {
        carrier_base_flat();
    }
}

module carrier_base(folded = true) {
    thickness = rear_standard_carrier_thickness;
    radius = thickness;

    width = rear_standard_carrier_width;
    length = [rear_standard_carrier_base_ear_length, rear_standard_carrier_base_length + (thickness * 2), rear_standard_carrier_base_ear_length];
    angle = [90, 90, 0];
    union() {
        difference() {
            translate(v = [(length[1] / 2) - thickness,-width / 2,max(length[0], length[2])]) {
                rotate(a = -90, v = [1,0,0])  bends(length, angle, radius, width, thickness);
            }

            // slot
            translate(v = [0,0,-1]) linear_extrude(height = thickness + 2) square([rear_standard_carrier_base_slot_length, rear_standard_carrier_base_slot_width], center = true);

            // screw holes
            triangle_offset = rear_standard_carrier_base_ear_length - (rear_standard_carrier_screw_hole_triangle_height / 2) - rear_standard_carrier_screw_hole_triangle_top_margin;
            translate(v = [rear_standard_carrier_base_length / 2 + thickness + 1,0,triangle_offset]) rotate(a = -90, v = [0,1,0]) linear_extrude(height = thickness + 2) rear_standard_carrier_screw_holes();
            mirror(v = [1,0,0]) translate(v = [rear_standard_carrier_base_length / 2 + thickness + 1,0,triangle_offset]) rotate(a = -90, v = [0,1,0]) linear_extrude(height = thickness + 2) rear_standard_carrier_screw_holes();
        }

        // Zero marker
        zero_marker_offset = rear_standard_carrier_width / 2;
        translate(v = [0,zero_marker_offset,0]) {    
            rotate(a = 45, v = [0,0,1]) {
                linear_extrude(height = rear_standard_carrier_thickness) square(size = [4,4], center = true);
            }
        }
    }
}

module carrier_base_flat(ARGS) {

}

rear_standard_carrier_base(folded = true);