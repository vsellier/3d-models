fn=100;
difference() {
    cylinder(h=30, r=91, $fn=fn);
    translate([0,0,-1]) {
        cylinder(h=32, r=88, $fn=fn);
    }
};


difference() {
    translate([0,0, 25]) {
        cylinder(h=10, r=100, $fn=fn);
    };

rotate_extrude(convexity = 10, $fn = 100)
translate([100, 20, 0]) {
    circle(r = 10, $fn = 100);
};
};