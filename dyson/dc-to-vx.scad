fn=200;

INNER=29;
OUTER=34.5;

male();
junction();
female();

// blocker2();

BLOCKER2_LENGTH_OUTSIDE=40;
BLOCKER2_LENGTH_INSIDE=34.8;
BLOCKER2_WIDTH_OUTSIDE=22;
BLOCKER2_WIDTH_INSIDE=17;
BLOCKER2_HEIGHT=9.5;

module spring_cross() {
    hull() {
        translate([-1.7,0,0]) cylinder(d=1.4, h=2, $fn=fn);
        translate([1.7,0,0]) cylinder(d=1.4, h=2, $fn=fn);
    }
    hull() {
        translate([-0,-1.7,0]) cylinder(d=1.4, h=2, $fn=fn);
        translate([0,1.7,0]) cylinder(d=1.4, h=2, $fn=fn);
    }
}

module blocker2() {
    //34.51
    //21
    difference() {
        union() {
            difference() {
                hull() {
                    cylinder(h=BLOCKER2_HEIGHT, d=BLOCKER2_WIDTH_OUTSIDE, $fn=fn);
                    translate([BLOCKER2_LENGTH_OUTSIDE - 2*BLOCKER2_WIDTH_OUTSIDE/2,0,0]) { cylinder(h=BLOCKER2_HEIGHT, d=BLOCKER2_WIDTH_OUTSIDE, $fn=fn); }
                }
                translate([0,0,-5]) {
                    hull() {
                        cylinder(h=BLOCKER2_HEIGHT+10, d=BLOCKER2_WIDTH_INSIDE, $fn=fn);
                        translate([BLOCKER2_LENGTH_OUTSIDE - 2*BLOCKER2_WIDTH_OUTSIDE/2,0,0]) cylinder(h=BLOCKER2_HEIGHT+10, d=BLOCKER2_WIDTH_INSIDE, $fn=fn);
                    }
                }
                translate([7,0,3.2+1.25]) blocker2_clip_hole();

            }
            translate([0, 0, -6.3]) {
                cylinder(h=BLOCKER2_HEIGHT, d=BLOCKER2_WIDTH_OUTSIDE, $fn=fn);
                translate([0,-BLOCKER2_WIDTH_INSIDE/2,0]) cube([26-(BLOCKER2_WIDTH_OUTSIDE/2), BLOCKER2_WIDTH_INSIDE, BLOCKER2_HEIGHT]);
            }
            translate([3.4,0,3.2]) spring_cross();
            translate([-10,-2,1]) {
                cube([6,4,3]);
            }
        }
        translate([-100 - BLOCKER2_WIDTH_OUTSIDE/2 +6,-1.5,0]) cube([100, 3, 3]);
    }
}

module blocker2_clip_hole() {
    DIAMETER=2.5;
    translate([-0.75,(BLOCKER2_WIDTH_OUTSIDE-2)/2,0]) {
        rotate([90,90,0]) {
            hull() {
                cylinder(d=DIAMETER, h=BLOCKER2_WIDTH_OUTSIDE-2, $fn=fn);
                translate([0,1.5,0]) cylinder(d=DIAMETER, h=BLOCKER2_WIDTH_OUTSIDE-2, $fn=fn);
            }
        }
    }
}

module blocker2_hole() {
    translate([0,8.5,0]) {
        difference() {
            hull() {
                cylinder(d=17,h=20, $fn=fn);
                translate([-8.5,5,0]) cube([17,10,20]);
            }
            translate([-10,3.5,-10]) cube([30,20,40]);
        }
    }
}

module junction() {
    translate([0,0,50]) {
        difference() {
            cylinder(h=5, d1=OUTER, d2=39.4, $fn=fn);
            translate([0,0,-2]) cylinder(h=50, d1=INNER, $fn=fn);
        }
    }
}

module female() {
    translate([0,0,55]) {
        difference() {
            union() {
                cylinder(h=45, d=39.4, $fn=fn);
                translate([0,-17,3+39.4]) {
                    rotate([0,90,-90]) blocker2();
                }
            }
            translate([0,0,-4.5]) { cylinder(h=80, d=34.5, $fn=fn); }

            translate([0,0,5]) cylinder(h=40, d=30, $fn=fn);
            translate([0, -5, 15.5]) rotate([90,0,0]) blocker2_hole();
        }
    }

}

module male() {
    difference() {
        union() {
            cylinder(h=50, d=OUTER, $fn=fn);
            translate([0,-9,37]) blocker1();
        }
        translate([0,0,-10]) {
            cylinder(h=70, d=INNER, $fn=fn);
        }
        translate([0,0,9.5]) ring();
    }
}

module ring() {
    difference() {
        cylinder(h=6.5, d=OUTER+1, $fn=fn);
        cylinder(h=5, d=OUTER-1.5, $fn=fn);
        translate([0,0,5]) cylinder(h=1.5, d1=OUTER-1.5, d2=OUTER, $fn=fn);
        translate([0,0,-5]) cylinder(h=15, d=OUTER-1.5, $fn=fn);
    }
}

module blocker1() {
    rotate([90,0,0]) {
        translate([0,-10,0]) {
            difference() {
                union() {
                    cylinder(h=11, r=17, $fn=fn);
                    cylinder(h=11, r2=17, r1=21, $fn=fn);
                }
                translate([0,0,-5]) cylinder(h=20, r=15, $fn=fn);
                translate([0,0,-5]) {
                    difference() {
                        cylinder(h=17, r=25, $fn=fn);
                        linear_extrude() {
                           polygon(points=[[0,0], [30*cos(45), 30*sin(45)],[-30*cos(45), 30*sin(45)]]);
                        }
                    }
                }
            }
            translate([0,11,0]) {
                cylinder(h=9.5, d=2, $fn=fn);
                translate([-1,0,0]) cube([2,5,9.5]);
            }
        }
    }
}
