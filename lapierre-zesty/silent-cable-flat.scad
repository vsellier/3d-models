fn=100;
difference() {
    cylinder(d=30, h=3, center=true, $fn=fn);
    cylinder(d=20, h=5, center=true, $fn=fn);
}

hull() {
    cube([1,30,3], center=true);    
    translate([300,0,0]) cube([1,50,3], center=true);
}