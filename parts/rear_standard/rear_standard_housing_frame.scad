include <../../constants.scad>

module rear_standard_housing_frame_side_long() {
    difference() {
        linear_extrude(height = rear_standard_housing_thickness) {
            square(size = [rear_standard_housing_width, rear_standard_housing_frame_width], center = true);
        }
        half_lap_cutout_offset_x = rear_standard_housing_width / 2 - rear_standard_housing_frame_width / 2;
        translate(v = [half_lap_cutout_offset_x,0,rear_standard_housing_thickness / 2]) {
            linear_extrude(height = rear_standard_housing_thickness) {
                square(size = [rear_standard_housing_frame_width,rear_standard_housing_frame_width], center = true);
            } 
        }
        mirror(v = [1,0,0]) {
            translate(v = [half_lap_cutout_offset_x,0,rear_standard_housing_thickness / 2]) {
                linear_extrude(height = rear_standard_housing_thickness) {
                    square(size = [rear_standard_housing_frame_width,rear_standard_housing_frame_width], center = true);
                } 
            }   
        }
    }
}

module rear_standard_housing_frame_side_short() {
    difference() {
        linear_extrude(height = rear_standard_housing_thickness) {
            square(size = [rear_standard_housing_height,rear_standard_housing_frame_width], center = true);
        }
        half_lap_cutout_offset_x = rear_standard_housing_height / 2 - rear_standard_housing_frame_width / 2;
        translate(v = [half_lap_cutout_offset_x,0,rear_standard_housing_thickness / 2]) {
            linear_extrude(height = rear_standard_housing_thickness) {
                square(size = [rear_standard_housing_frame_width,rear_standard_housing_frame_width], center = true);
            }
        }
        mirror(v = [1,0,0]) {
            translate(v = [half_lap_cutout_offset_x,0,rear_standard_housing_thickness / 2]) {
            linear_extrude(height = rear_standard_housing_thickness) {
                square(size = [rear_standard_housing_frame_width,rear_standard_housing_frame_width], center = true);
            }
        }
        } 
    }
}

module rear_standard_housing_frame() {
    frame_offset_y = rear_standard_housing_height / 2 - rear_standard_housing_frame_width / 2;
    translate(v = [0,frame_offset_y,0]) {
        rear_standard_housing_frame_side_long();
    } 
    mirror(v = [0,1,0]) {
        translate(v = [0,frame_offset_y,0]) {
            rear_standard_housing_frame_side_long();
        } 
    }

    frame_offset_x = rear_standard_housing_width / 2 - rear_standard_housing_frame_width / 2;
    translate(v = [frame_offset_x,0,rear_standard_housing_thickness]) {
        rotate(a = [180,0,90]) {
            rear_standard_housing_frame_side_short();
        } 
    } 
    mirror(v = [1,0,0]) {
        translate(v = [frame_offset_x,0,rear_standard_housing_thickness]) {
            rotate(a = [180,0,90]) {
                rear_standard_housing_frame_side_short();
            } 
        } 
    }
}

rear_standard_housing_frame();