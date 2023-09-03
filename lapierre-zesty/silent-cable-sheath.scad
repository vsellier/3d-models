fn=32;
difference() {
    union() {
        cylinder(d=11, h=2);
        translate([0,0,2]) {
            for (c=[0:4:100]) {
                translate([0,0,c]) {
                    rotate([0,0,rands(0,180,10)[5]]) {
                    for (a=[0:360/8:360]) {
                        rotate([90,0,a] )cylinder(d=2, h=5.5, $fn=fn);
                    }
                    }
                }
            }
            cylinder(d=8, h=100, $fn=100);
        }
        translate([0,0,102]) cylinder(d=11, h=2);
    }
    translate([0,0,-25]) cylinder(d=5.2, h=150, $fn=fn);

linear_extrude(height=150, convexity=100, twist=1000, $fn=32) {

    square([1,10]);
}

}

