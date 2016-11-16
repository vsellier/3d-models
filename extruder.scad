$fn=180;

%color("red", 0.8) {
    translate([78,25,27]) {
        rotate([90,180,-90]) {
            import("extruder/idler-block.stl");
        }
    }

    import("extruder/extruder-block.stl");

    rotate([90,0,0]) {
        translate([55,15,0]) {
            rotate([0,180,0]) {
                slidemountPlate();
            }
        }
    }
    translate([60,-17.5+5,15]) {
        rotate([-90,0,0]) {
            insulatorBarrel();
        }
    }

    // 35-6.5-8
    translate([60,-30-20.5,15]) {
        rotate([-90,0,0]) { 
            hotendNozzle();
        }
    }
}


module hotendNozzle() {
    translate([0,0,4]) {
      cylinder(26,d=8,center=false);
    }
    cylinder(4,d2=8, d1=0,center=false);
}


module insulatorBarrel() {
    difference() {
        cylinder(35, d=16, center=true);
        cylinder(50, d=5, center=true);
        translate([0,0,12.5]) {
            difference() {
                cylinder(3, d=20, center=true);
                cylinder(5, d=10, center=true);
            }
        }
        translate([0,0, -14.5]) {
            cylinder(10,d=8,center=true);
        }
        translate([8,0,-15]) {
            cube([3,10,20], true);
        }
        translate([-8,0,-15]) {
            cube([3,10,20], true);
        }
    }
}

module slidemountPlate() {
    difference() {
        cube([60,20,3],true);
        translate([-25,0,0]) {
            cylinder(6,2,2,true);
        }
        translate([25,0,0]) {
            cylinder(6,2,2,true);
        }
        translate([-5,0,0]) {
            cylinder(6,5,5,true);
            translate([-5,0,-3]) {
                rotate([0,0,-90]) {
                    cube([15,10,6], false);
                }
            }
        }
    }
}
