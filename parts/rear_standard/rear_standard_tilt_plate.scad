include <../../constants.scad>
use <./rear_standard_tilt_slot.scad>

module rear_standard_tilt_plate() {
    difference() {
        // base shape
        union() {
            slot_outline_thickness = 3;
            translate(v = [0,rear_standard_housing_height / 5,0]) {
                square(size = [rear_standard_housing_depth,rear_standard_housing_height / 1.75], center = true);
            }
            rotate(a = 90, v = [0,0,1]) {
                rear_standard_tilt_slot(additional_slot_width = slot_outline_thickness * 2);
            }
        }
        // hole for pivot stud
        #circle(r = (rear_standard_pivot_stud_diameter / 2) + 1);
        // slot cutout
        rotate(a = 90, v = [0,0,1]) {
            rear_standard_tilt_slot();
        }
    }
}

rear_standard_tilt_plate();