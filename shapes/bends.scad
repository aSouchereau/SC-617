$fn = 360;

module sheet_bend_example(length, angle, radius, width, thickness) {
    translate(v = [(length[1] / 2) - thickness,-width / 2,max(length[0], length[2])])
    rotate(a = -90, v = [1,0,0])  bends(length, angle, radius, width, thickness);
}

module bends(length, angle, radius, width, thickness, i=0) {
    if (i < len(length)) {
        offset = i==0 ? 2*thickness*sin(angle[i]) : 2*thickness*sin(angle[i])+2*thickness*sin(angle[i-1]);
        cube([thickness, length[i]-offset, width]);
        translate([-radius, length[i]-offset]) {
            rotate_extrude(angle = angle[i]) translate([radius,0,0]) square([thickness,width]);
            rotate([0,0,angle[i]]) translate([radius,0,0]) bends(length, angle, radius, width, thickness, i+1);
        }
    }
}

t = 1;
r = t;

w = 10;
l = [10, 20 + (t * 2), 10];
a = [90, 90, 0];

sheet_bend_example(l, a, r, w, t);