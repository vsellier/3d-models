fn=100;
rotate([0,180,0]) {
    difference() {
        cylinder(h=25, d=99, $fn=fn);
        translate([0,0,-1]) {
            cylinder(h=25, d=94, $fn=fn);
        }
    };


    difference() {
        translate([0,0, 21]) {
            cylinder(h=6, d=105, $fn=fn);
        };

        rotate_extrude(convexity = 10, $fn = 100)
        translate([50, 14, 0]) {
            circle(d = 14, $fn = 100);
        };
        rotate_extrude(convexity = 10, $fn = 100)
        translate([53, 19, 0]) {
            circle(d = 10, $fn = 100);
        };
    }

}