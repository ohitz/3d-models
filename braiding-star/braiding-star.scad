// Customizable braiding star
//
// Oliver Hitz <oliver@net-track.ch>

// Number of spikes
spikes = 8; // [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

// Outer diameter
diameter = 45; // [30:100]

// Inner diameter
inner_diameter = 2*diameter/3;

// Central cutout diameter
cutout_diameter = 20; // [20:30]

// Star thickness
thickness = 8; // [6:12]

// Cutout width, adapt to the thickness of the yarn.
slot_w = 0.5; // [0.5:2]

// Cutout length
slot_l = 12; // [10:25]

// Rounded edges radius (slow!)
round_r = 1; // [0:3]

// Create star polygon
points = [ for (i = [0:2*spikes-1]) (i%2==1) ? [sin(i*180/spikes)*diameter, cos(i*180/spikes)*diameter] : [sin(i*180/spikes)*inner_diameter, cos(i*180/spikes)*inner_diameter] ];

difference() {
	minkowski() {
		// Extrude star
		linear_extrude(thickness-2*round_r, center=true) {
			difference() {
				// Star
				polygon(points);
				// Central cutout
				circle(d=cutout_diameter);
			}
		}
		// Sphere for minkowski rounding
		sphere(r=round_r, $fn=16);
	}

	// Yarn-holding slots
	for (i = [0:spikes-1]) {
		rotate([0, 0, i*360/spikes])
			translate([0, inner_diameter-slot_l/2+2*round_r, 0])
				cube([slot_w, slot_l, thickness], center=true);
	}
}
