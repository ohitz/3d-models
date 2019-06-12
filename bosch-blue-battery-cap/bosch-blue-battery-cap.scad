$fn = 32;

// Cap body:
// Based on https://www.thingiverse.com/thing:1246842, with the cell clips deleted.
module body() {
	module eraser(d) {
		translate([0, 0, 1.95+d/2])
		union() {
			cylinder(d=d, h=20, $fn=16);
			sphere(d=d, $fn=16);
		}
	}

	difference() {
		// Base model
		// color("lightblue")
		import("Original_Bosch_battery_108_cap.stl"); 

		// Erase the provided clips
		hull() {
			translate([-8.8, 17.6, 0])
			eraser(5.5);
			translate([8.8, 17.6, 0])
			eraser(5.5);
		}
		hull() {
			translate([-19, 0, 0])
				eraser(5.5);
			translate([-9.6, -16, 0])
				eraser(8);
		}
		hull() {
			translate([19, 0, 0])
				eraser(5.5);
			translate([9.6, -16, 0])
				eraser(8);
		}

		// Add holes so the clips are accessible from below
		translate([-3, 14, 0])
			cube([6, 3, 5]);
	
		translate([-10.7, -7.7, 0])
			rotate([0, 0, 120])
		cube([6, 3, 5]);

		mirror([1, 0, 0])
			translate([-10.7, -7.7, 0])
			rotate([0, 0, 120])
			cube([6, 3, 5]);
	}
}

// Side cell clips
module cell_clip1() {
	$fn = 32;
	h = 20;
	
	module column() {
		translate([0, 0, 1.5]) {
			union() {
				cylinder(d=1, h=h-2.5);
				sphere(d=1);
			}
		}
	}

	module hook() {
		polyhedron([[-3.5, 0, 0],
			[-2.5, 3, 0],
			[2.5, 3, 0],
			[3.5, 0, 0],
			[2.5, -1, 0],
			[-2.5, -1, 0],
			[-2, 0, 2],
			[2, 0, 2] ],
			[ [0,5,4,3,2,1], [0,1,6], [1,2,7,6], [2,3,7], [3,4,7], [4,5,6,7], [0,6,5] ]);
	}

	translate([-15, -7, 16])
		rotate([90, 0, 120])
		hook();

	hull() {
		translate([-16, -15, 0]) column();
		translate([-13.5, -10, 0]) column();
	};
	hull() {
		translate([-13.5, -10, 0]) column();
		translate([-17, -4, 0]) column();
	}
	hull() {
		translate([-17, -4, 0]) column();
		translate([-21, -4, 0]) column();
	}
}

// Bottom cell clip
module cell_clip2() {
	$fn = 32;
	h = 14;
	
	module column() {
		translate([0, 0, 1.5]) {
			union() {
				cylinder(d=1, h=h-2.5);
				sphere(d=1);
			}
		}
	}

	module hook() {
		polyhedron([[-3.5, 0, 0],
			[-2.5, 3, 0],
			[2.5, 3, 0],
			[3.5, 0, 0],
			[2.5, -1, 0],
			[-2.5, -1, 0],
			[-2, 0, 2],
			[2, 0, 2] ],
			[ [0,5,4,3,2,1], [0,1,6], [1,2,7,6], [2,3,7], [3,4,7], [4,5,6,7], [0,6,5] ]);
	}

	translate([0, 17.5, 10])
		rotate([90, 0, 0])
		hook();

	hull() {
		translate([-9, 20.5, 0]) column();
		translate([-7, 17.5, 0]) column();
	}
	hull() {
		translate([-7, 17.5, 0]) column();
		translate([7, 17.5, 0]) column();
	}
	hull() {
		translate([7, 17.5, 0]) column();
		translate([9, 20.5, 0]) column();
	}
}

// Construct the model

body();

cell_clip1();
mirror([1, 0, 0]) cell_clip1();

// color("red")
cell_clip2();
