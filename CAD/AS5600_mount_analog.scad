$fa = 1;

margin = 0.2;

board_height = 2.6;
magnet_height = 1;
gap = 1.5;
bottom_thickness = 2;
edge_height = 1 - margin;

total_height = board_height + magnet_height + gap + bottom_thickness + edge_height;

motor_radius = 49 / 2;
edge_width = 1 - margin;
support_width = 1;

board_hole_radius = 2.2 / 2 + margin;
board_hole_distance = 9.8 / 2 + board_hole_radius;

echo(board_hole_distance);

mount_hole_radius = 2.7 / 2 + margin;
mount_hole_distance = 38.5 / 2;

wire_hole_width = 12;
wire_hole_depth = motor_radius * 2 + 0.1;
wire_hole_height = edge_height + 4;

module board_hole(deg) {
    $fs = 0.2;
    rotate([0, 0, deg])
    translate([board_hole_distance, 0, 0])
    cylinder(h = bottom_thickness + 0.1, r = board_hole_radius);
}

module mount_hole(deg) {
    $fs = 0.2;
    rotate([0, 0, deg])
    translate([mount_hole_distance, 0, 0])
    cylinder(h = bottom_thickness + 0.1, r = mount_hole_radius);
}

module wire_hole(deg) {
    rotate([0, 0, deg])
    translate([-wire_hole_width/2, -wire_hole_depth/2, 0])
    cube([wire_hole_width, wire_hole_depth, wire_hole_height]);
}

difference() {
    cylinder(h = total_height, r = motor_radius);

    translate([0, 0, total_height])
    mirror([0, 0, 1]) {
        cylinder(h = edge_height, r = motor_radius - edge_width);
        cylinder(h = total_height - bottom_thickness
            , r = motor_radius - edge_width - support_width);
        wire_hole(0);
        wire_hole(90);
    }
    
    board_hole(0);
    board_hole(180);
    
    for(deg = [45 : 90 : 360 - 45]) mount_hole(deg);
}