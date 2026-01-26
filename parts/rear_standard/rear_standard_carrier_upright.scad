include <../../constants.scad>
use <rear_standard_carrier_screw_holes.scad>
use <rear_standard_carrier_base.scad>

module rear_standard_carrier_upright() {
    linear_extrude(height = rear_standard_carrier_thickness, center = true)
    difference() {
        square([rear_standard_carrier_upright_length, rear_standard_carrier_width], center = true);

        // Movement Screw Slot
        slot_top_margin = (rear_standard_carrier_width - rear_standard_carrier_upright_slot_width) / 2;
        slot_bottom_margin = rear_standard_carrier_base_flat_length + 3;
        slot_length = rear_standard_carrier_upright_length - (slot_top_margin + slot_bottom_margin);
        slot_offset_x = (slot_bottom_margin - slot_top_margin) / 2;
        translate(v = [slot_offset_x,0,0]) {
            square([slot_length, rear_standard_carrier_upright_slot_width], center = true);
        }

        // Screw Holes
        screw_hole_offset = -(rear_standard_carrier_upright_length / 2) + rear_standard_carrier_base_flat_length - (rear_standard_carrier_screw_hole_triangle_height / 2) - rear_standard_carrier_screw_hole_triangle_top_margin;
        translate(v = [screw_hole_offset,0,0]) {
            rear_standard_carrier_screw_holes();
        } 
    }
}

debug_base_flat_offset = -(rear_standard_carrier_upright_length / 2) + rear_standard_carrier_base_flat_length / 2;
// #translate(v = [debug_base_flat_offset,0,0]) rear_standard_carrier_base_flat();


rear_standard_carrier_upright();