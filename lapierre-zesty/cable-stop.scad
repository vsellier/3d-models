fn=100;

difference() {
    cylinder(d1=8, d2=5.2,h=8, $fn=fn);
    translate([0,0,-2]) cylinder(d=5.1, h=105, $fn=fn);
    translate([2.5,0,0]) cube([3,1,20], center=true);
}