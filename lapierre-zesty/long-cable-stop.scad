fn=100;

difference() {
    union() {
        cylinder(d1=8, d2=5.2,h=8, $fn=fn);
        translate([0,0,-8]) cylinder(d1=8, d2=8,h=8, $fn=fn);
    }
    
 #   translate([0,0,-10]) cylinder(d=5.1, h=105, $fn=fn);
 #   translate([2.5,0,0]) cube([3,0.3,20], center=true);
}