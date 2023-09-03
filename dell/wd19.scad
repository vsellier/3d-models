D=90;
W=206;
H=30;
VENTILATION_HOLE_DIAMETER=1.5;
VENTILATION_HOLE_HEIGHT=9;
VENTILATION_HOLE_DEEP=6;

VENTILATION_HOLE_SPACE=1;
VENTILATION_HOLE_COUNT=35;

VENTILATION_HOLE_CENTER=21.5;

fn=100;

// main box
difference() {
    cube([W, D, H], center=true);
    translate([W/2 - VENTILATION_HOLE_DEEP/2 + 1,0, VENTILATION_HOLE_CENTER - H/2]) ventilation_holes();
    translate([-W/2 + VENTILATION_HOLE_DEEP/2 -1 ,0, VENTILATION_HOLE_CENTER - H/2]) ventilation_holes();

    // screw
    translate([0,0,-H/2-1]) {
        translate([-32, -32, 0]) cylinder(d=5, h=10, $fn=fn);
        translate([32, 32, 0]) cylinder(d=5, h=10, $fn=fn);
    }

    // infos
    translate([0, 0, -H/2]) cube([50, 50, 3], center=true);
}
// USB cable
translate([W/2, 0, -H/2 + 7]) {
    rotate([0,90,0]) {
        cylinder(h=10, d=8.5, $fn=fn);
        translate([0,0,10]) cylinder(h=20, d=6, $fn=fn);
    }
}


module ventilation_holes(count = VENTILATION_HOLE_COUNT) {

    translate([0, - ((VENTILATION_HOLE_DIAMETER + VENTILATION_HOLE_SPACE) * (count-1) +  VENTILATION_HOLE_DIAMETER) / 2  , 0]) {
        for (i = [1:count]) {

            translate([0, (VENTILATION_HOLE_DIAMETER/2) + (VENTILATION_HOLE_DIAMETER + VENTILATION_HOLE_SPACE) * (i-1), 0]) ventilation_hole();
        }
    }
}

module ventilation_hole() {
    translate([0,0,-VENTILATION_HOLE_HEIGHT / 2]) {
        rotate([90, 0, 90]) hull() {
            cylinder(d=VENTILATION_HOLE_DIAMETER, h=VENTILATION_HOLE_DEEP, center=true, $fn=fn);
            translate([0, VENTILATION_HOLE_HEIGHT, 0]) cylinder(d=VENTILATION_HOLE_DIAMETER, h=VENTILATION_HOLE_DEEP, center=true, $fn=fn);
        }
    }
}


