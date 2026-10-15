include <../../constants.scad>
use <./rear_standard_tilt_slot.scad>

module rear_standard_tilt_plate(print = false) {
    union() {
        linear_extrude(height = rear_standard_tilt_plate_thickness) 
        difference() {
            // base shape
            union() {
                slot_outline_thickness = 3;
                plate_height = rear_standard_housing_height / 1.75;
                plate_offset_y = plate_height / 3;
                translate(v = [0,plate_offset_y,0]) {
                    square(size = [rear_standard_housing_depth,plate_height], center = true);
                }
                rotate(a = 90, v = [0,0,1]) {
                    rear_standard_tilt_slot(additional_slot_width = slot_outline_thickness * 2);
                }
            }
            // slot cutout
            rotate(a = 90, v = [0,0,1]) {
                rear_standard_tilt_slot();
            }

            if (!print) {
                // hole for pivot stud
                circle(r = (rear_standard_tilt_pivot_diameter / 2) + .25);
            }
        }

        // 3d printed pivot
        if (print) {
            translate(v = [0,0,rear_standard_tilt_plate_thickness]) linear_extrude(height = rear_standard_rise_plate_thickness + rear_standard_carrier_thickness - 1) circle(r = rear_standard_tilt_pivot_diameter / 2 - .25);
        }
    }
}

rear_standard_tilt_plate(true);