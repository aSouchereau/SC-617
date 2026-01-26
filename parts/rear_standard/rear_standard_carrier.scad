include <../../constants.scad>
use <rear_standard_carrier_base.scad>
use <rear_standard_carrier_upright.scad>

module rear_standard_carrier() {
    rear_standard_carrier_base();
    upright_offset_x = (rear_standard_carrier_base_length / 2) + (rear_standard_carrier_thickness / (2/3));
    upright_offset_z = (rear_standard_carrier_upright_length / 2) + rear_standard_carrier_thickness;
    translate(v = [upright_offset_x,0,upright_offset_z]) {
        rotate(a = -90, v = [0,1,0]) {
            rear_standard_carrier_upright();
        } 
    } 
    translate(v = [-upright_offset_x,0,upright_offset_z]) {
        rotate(a = -90, v = [0,1,0]) {
            rear_standard_carrier_upright();
        } 
    } 
}

rear_standard_carrier();