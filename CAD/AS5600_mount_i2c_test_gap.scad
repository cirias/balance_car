margin = 0.2;

board_height = 2.6;
bottom_thickness = 2;

motor_radius = 49 / 2;

mount_hole_radius = 2.7 / 2 + margin;
mount_hole_distance_to_center = 38.5 / 2;
plate_mount_hole_margin = 2;
mount_holes_distance = mount_hole_distance_to_center * sin(45) * 2;

module mount_hole(deg) {
    rotate([0, 0, deg])
    translate([mount_hole_distance_to_center, 0, 0])
    cylinder(h = bottom_thickness + 0.1, r = mount_hole_radius);
}

$fs = 0.2;

difference() {
    translate([-mount_holes_distance/2, -mount_holes_distance/2, 0])
    minkowski() {
        cube([mount_holes_distance, mount_holes_distance, bottom_thickness - 0.1]);
        cylinder(h = 0.1, r = mount_hole_radius + plate_mount_hole_margin);
    }
    
    for(deg = [45 : 90 : 360 - 45]) mount_hole(deg);
}