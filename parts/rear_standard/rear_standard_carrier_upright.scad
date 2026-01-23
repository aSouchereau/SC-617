include <../../constants.scad>

module rear_standard_carrier_screw_holes() {
    triangle_side_length = (rear_standard_carrier_width / 3) + rear_standard_carrier_screw_hole_diameter;
    triangle_vertical_height = (triangle_side_length * sqrt(3)) / 2;
    translate(v = [triangle_vertical_height / 2,triangle_side_length / 2]) {
        circle(d = rear_standard_carrier_screw_hole_diameter);
    }
    translate(v = [triangle_vertical_height / 2,-triangle_side_length / 2]) {
        circle(d = rear_standard_carrier_screw_hole_diameter);
    }
    translate(v = [-triangle_vertical_height / 2,0]) {
        circle(d = rear_standard_carrier_screw_hole_diameter);
    }
}

// rear_standard_carrier_screw_holes();

module rear_standard_carrier_upright() {
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
        translate(v = [-(rear_standard_carrier_upright_length / 2) + (rear_standard_carrier_base_flat_length / 2),0,0]) {
            rear_standard_carrier_screw_holes();
        } 
    }
}

rear_standard_carrier_upright();