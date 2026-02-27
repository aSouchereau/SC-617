include <../../constants.scad>
use <./rear_standard_tilt_slot.scad>

module rear_standard_tilt_plate() {
    difference() {
        // base shape
        union() {
            translate(v = [0,rear_standard_housing_height / 4,0]) {
                square(size = [rear_standard_housing_depth,rear_standard_housing_height / 2], center = true);
            }
            rotate(a = 90, v = [0,0,1]) {
                offset(delta = 3) {
                    rear_standard_tilt_slot();
                } 
            }
        }

        // slot cutout
        rotate(a = 90, v = [0,0,1]) {
            rear_standard_tilt_slot();
        }
    }
}

rear_standard_tilt_plate();