include <../../constants.scad>
use <./rear_standard_tilt_slot.scad>

module rear_standard_tilt_plate() {
    linear_extrude(height = rear_standard_tilt_plate_thickness) 
    difference() {
        // base shape
        slot_outline_thickness = 3;
        translate(v = [0,rear_standard_housing_height / 5,0]) {
            square(size = [rear_standard_housing_depth,rear_standard_housing_height / 1.75], center = true);
        }
        // hole for pivot stud
        circle(r = (rear_standard_pivot_stud_diameter / 2) + 1);

        // hole for tilt lock screw
        translate(v = [0,rear_standard_tilt_slot_radius - .25,0]) {
            circle(r = (rear_standard_pivot_stud_diameter / 2) + 1);
        } 
    }
}

rear_standard_tilt_plate();