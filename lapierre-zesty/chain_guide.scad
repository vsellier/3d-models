rotate([0,-90,0]) {
    difference() {
        linear_extrude(15) {
            polygon(
              points=[[0,0],[0,47],[12,47],[23,31],[12,0]]
            );
        };

        // carre
        translate([7,40,0]) {
            rotate([0,0,60]) {
                #cube([8,8,5.0], center=true);
            }
        }
        
        // trou tête visse
        translate([7,40,13.5]) {
            #cylinder(d=9,h=12, $fn=100, center=true);
        }

        // trou central visse
        translate([7,40,0]) {
            #cylinder(d=5.5, h=50, $fn=100, center=true);
        }

        // Passage chaine
        #translate([-10,0,3]) {
            cube([70,27,9]);
        }

        #translate([0,7,7.5]) {
            rotate([0,00,35]){
                cube([70,27,9], center=true);
            }
        }

        #translate([0,23,7.5]) {
            rotate([0,90,35]){
                cylinder(d=9, h=50, $fn=100);
            }
        }
        // Fin passage chaine
    };
};