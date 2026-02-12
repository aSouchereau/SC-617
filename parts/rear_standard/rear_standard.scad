include <../../constants.scad>
use <./rear_standard_housing.scad>
use <./rear_standard_housing_frame.scad>
use <./rear_standard_carrier.scad>

module rear_standard_subassy() {
    rear_standard_housing();
    frame_offset_y = rear_standard_housing_depth / 2 + rear_standard_housing_thickness;
    translate(v = [0,frame_offset_y,rear_standard_housing_height / 2]) {
        rotate(a = 90, v = [1,0,0]) {
            rear_standard_housing_frame();
        } 
    } 
}

module rear_standard() {
    translate(v = [0,0,25]) {
        rotate(a = 180, v = [0,0,1]) 
        rear_standard_subassy();
    } 
    rear_standard_carrier();
}

rear_standard();