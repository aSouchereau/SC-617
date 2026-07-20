include <../../constants.scad>
use <./rear_standard_tilt_slot.scad>

module rear_standard_rise_plate() {
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


            // zero marker
            zero_marker_offset_x = -rear_standard_housing_depth / 2;
            zero_marker_offset_y = -(plate_height / 2) + plate_offset_y + (sqrt(2 * zero_marker_side_length));
            translate(v = [zero_marker_offset_x,zero_marker_offset_y,0]) {    
                rotate(a = 45, v = [0,0,1]) {
                    square(size = [zero_marker_side_length,zero_marker_side_length], center = true);
                }
            }
        }
        
        // hole for pivot stud
        circle(r = (rear_standard_pivot_stud_diameter / 2) + 1);

        // hole for tilt lock screw
        translate(v = [0,rear_standard_tilt_slot_radius - .25,0]) {
            circle(r = (rear_standard_pivot_stud_diameter / 2) + 1);
        } 
    }
}

rear_standard_rise_plate();