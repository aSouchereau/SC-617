include <../../constants.scad>

module rear_standard_carrier_base() {
    difference() {
        square([rear_standard_carrier_base_length, rear_standard_carrier_base_width], center = true);
        square([160, 6], center = true);
    }
}