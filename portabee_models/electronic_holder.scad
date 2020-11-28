fn=200;

module circuitSupport(fn) {
    difference() {
        cylinder(r=5, h=12, $fn=fn);
        cylinder(d=4.9, h=30, center=true, $fn=fn);
    }
}

difference() {
    cylinder(h=4,r=4.4,$fn=fn);
    cylinder(h=10, d=3.8, $fn=fn, center=true);
};

translate([-21.5,30,0]) {
    circuitSupport(fn);
}

translate([21.5,30,0]) {
    circuitSupport(fn);
}

translate([0,27,6]) {
  difference() {  
    cube(size=[45,4,12], center=true);
    translate([-21.5,3,0]) {
      cylinder(d=5, h=30, center=true, $fn=fn);
    }
    translate([21.5,3,0]) {
      cylinder(d=5, h=30, center=true, $fn=fn);
    }
 
  }
  
}