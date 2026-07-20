include <../../constants.scad>
use <./rear_standard_housing.scad>
use <./rear_standard_housing_frame.scad>
use <./rear_standard_carrier.scad>
use <./rear_standard_tilt_plate.scad>
use <./rear_standard_rise_plate.scad>

module rear_standard_subassy() {
    color(c = "#8192df") rear_standard_housing();
    frame_offset_y = rear_standard_housing_depth / 2 + rear_standard_housing_thickness;
    color(c = "#657fd3") translate(v = [0,frame_offset_y,rear_standard_housing_height / 2]) {
        rotate(a = 90, v = [1,0,0]) {
            rear_standard_housing_frame();
        } 
    }
    color(c = "#7a3333") {
        translate(v = [(rear_standard_housing_width / 2) + rear_standard_tilt_plate_thickness,0,rear_standard_housing_height / 2]) {
            rotate(a = [-90,0,90]) {
                rear_standard_tilt_plate();
            }
        }
        translate(v = [-(rear_standard_housing_width / 2),0,rear_standard_housing_height / 2]) {
            rotate(a = [-90,0,90]) {
                rear_standard_tilt_plate();
            }
        }
    }
}

module rear_standard() {
    translate(v = [0,0,rear_standard_rise_zero_pos + rear_standard_rise]) {
        // rise plates
        rise_plate_offset_x = rear_standard_housing_width / 2 + rear_standard_tilt_plate_thickness;
        rise_plate_offset_z = rear_standard_housing_height / 2;
        translate(v = [rise_plate_offset_x,0,rise_plate_offset_z]) {
            rotate (a = [-90,0,-90]) rear_standard_rise_plate();
        }
        mirror(v = [1,0,0]) {
            translate(v = [rise_plate_offset_x,0,rise_plate_offset_z]) {
                rotate (a = [-90,0,-90]) rear_standard_rise_plate();
            }   
        } 
    
        rotate(a = 180, v = [0,0,1]) 
        rear_standard_subassy();
    } 
    rear_standard_carrier();
}

rear_standard();