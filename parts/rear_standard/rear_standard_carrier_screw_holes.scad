include <../../constants.scad>

module rear_standard_carrier_screw_holes() {
    side_length = rear_standard_carrier_screw_hole_triangle_side_length;
    height = rear_standard_carrier_screw_hole_triangle_height;
    translate(v = [height / 2,side_length / 2]) {
        circle(d = rear_standard_carrier_screw_hole_diameter);
    }
    translate(v = [height / 2,-side_length / 2]) {
        circle(d = rear_standard_carrier_screw_hole_diameter);
    }
    translate(v = [-height / 2,0]) {
        circle(d = rear_standard_carrier_screw_hole_diameter);
    }
}

rear_standard_carrier_screw_holes();