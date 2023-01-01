difference() {
    union () {
      cylinder(h=20, d=35, $fn=360);
      cylinder(h=8, d1=40, d2=35, $fn=200);
    };
    cylinder(h=30, d=3, $fn=50);
    translate([0,0,8]) {
        cylinder(h=50, d=6, $fn=100);
    }
};