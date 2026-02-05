include <../../constants.scad>
use <rear_standard_tilt_slot.scad>

// TODO: move modules to separate files
module finger_holes(part_width) {
    num_fingers = 2;
    finger_width = rear_standard_housing_depth / (num_fingers * 2);
    finger_offset_x = (part_width / 2) - (rear_standard_housing_thickness / 2);
    base_finger_offset_y = (rear_standard_housing_depth / 2) - (finger_width / 2);
    for (i = [0:num_fingers - 1]) {
                finger_offset_y = base_finger_offset_y - finger_width * (i * 2);
                translate(v = [finger_offset_x,finger_offset_y]) {
                    square(size = [rear_standard_housing_thickness,finger_width], center = true);
                }
    }
}

module rear_standard_housing_side_long() {
    linear_extrude(height = rear_standard_housing_thickness) {
        difference() {
            square(size = [rear_standard_housing_width,rear_standard_housing_depth], center = true);
            finger_holes(part_width = rear_standard_housing_width);
            mirror(v = [1,0,0]) {
                finger_holes(part_width = rear_standard_housing_width);
            } 
        }
    }
}

module rear_standard_housing_side_short() {
    linear_extrude(height = rear_standard_housing_thickness) {
        difference() {
            square(size = [rear_standard_housing_height,rear_standard_housing_depth], center = true);
            finger_holes(part_width = rear_standard_housing_height);
            mirror(v = [1,0,0]) {
                finger_holes(part_width = rear_standard_housing_height);
            }
        }
    }
    linear_extrude(height = rear_standard_housing_thickness / 3) {

    } 
}

rear_standard_tilt_slot();


// rear_standard_housing_side_long();
// rear_standard_housing_side_short();