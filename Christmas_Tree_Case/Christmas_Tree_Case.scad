// Dimensions are in millimeters. Set part to export an individual component.
part = "preview"; // [preview,tray,lid,lid_white,garlands,sprinkles]
usable_clearance = 30;
floor = 2.4;
wall = 2.2;
clearance = 0.25;
lip_depth = 3.4;
lid_thickness = 2.8;
color_depth = 0.6;
tray_height = floor + usable_clearance + lip_depth;
$fn = 40;

tree_half = [[0,134],[3.5,134],[6.5,132],[9,128],[24,104],
    [25,101],[23,97],[34,80],[37,74],[36,71],[34,68],
    [48,40],[50,34],[50,29],[48,24],[44,21],[22,21],
    [19,19],[19,6],[17,3],[0,3]];

garland_points = [
    [[-13,114],[-8,109],[-2,106],[5,106],[13,109]],
    [[-19,91],[-10,88],[-1,86],[8,87],[17,91]],
    [[-30,76],[-21,70],[-11,66],[-1,65],[10,68],[21,74],[29,81]],
    [[-34,52],[-24,47],[-14,43],[-4,42],[7,45],[17,51],[27,59],[34,67]],
    [[-44,34],[-35,30],[-23,29],[-10,30],[4,34],[18,41],[31,48],[40,53]],
    [[-6,11],[3,16],[12,22],[21,28],[32,32],[43,34]]
];
sprinkle_points = [
    [[4,120],[6,125]],[[-8,107],[-9,112]],[[5,108],[10,110]],
    [[-15,97],[-10,99]],[[0,92],[5,94]],[[12,96],[14,100]],
    [[-18,81],[-14,84]],[[-5,79],[-1,82]],[[15,81],[17,85]],
    [[-26,73],[-24,77]],[[-21,65],[-16,67]],[[-5,66],[-7,70]],
    [[7,67],[5,71]],[[19,69],[23,71]],[[-15,52],[-15,57]],
    [[1,55],[5,58]],[[15,53],[19,56]],[[26,59],[29,63]],
    [[-26,43],[-29,47]],[[-17,42],[-13,44]],[[12,43],[16,46]],
    [[23,47],[28,48]],[[-28,31],[-31,35]],[[-20,24],[-24,25]],
    [[-12,28],[-14,32]],[[-3,34],[2,34]],[[13,34],[18,34]],
    [[29,29],[28,34]],[[13,20],[15,24]]
];

module outline(inset=0) {
    offset(delta=-inset)
        offset(r=2.4) offset(delta=-2.4)
            polygon(concat(tree_half, [for(i=[len(tree_half)-2:-1:1])
                [-tree_half[i][0],tree_half[i][1]]]));
}

module rounded_stroke(points, width) {
    for(i=[0:len(points)-2])
        hull() {
            translate(points[i]) circle(d=width);
            translate(points[i+1]) circle(d=width);
        }
}

module green_art() {
    intersection() {
        outline(1);
        union() for(points=sprinkle_points) rounded_stroke(points, 3);
    }
}

module all_garlands() {
    intersection() {
        outline(1);
        union() for(points=garland_points) rounded_stroke(points, 3.2);
    }
}

module red_art() {
    difference() {
        all_garlands();
        green_art();
    }
}

module tray() {
    difference() {
        union() {
            linear_extrude(tray_height) outline();
            linear_extrude(4.4)
                hull() {
                    translate([0,130]) circle(d=13);
                    translate([0,138.5]) circle(d=14);
                }
        }
        translate([0,0,floor]) linear_extrude(tray_height)
            outline(wall);
        translate([0,138.5,-0.1]) cylinder(h=4.6,d=6);
        // Lead-in at the rim and shallow recesses behind the snap bumps.
        for(step=[1:4])
            translate([0,0,tray_height-0.2*(5-step)])
                linear_extrude(0.21) outline(wall-0.125*step);
        for(side=[-1,1])
            translate([side*16.15,12,tray_height-2.25])
                scale([1,2,0.85]) sphere(r=1.12);
    }
}

// The lid is oriented with the decorated face on the print bed.
// Mirror in X so that the decoration reads correctly when assembled.
module lid_shape() {
    linear_extrude(lid_thickness)
        union() {
            outline();
            rounded_stroke([[0,6],[0,0]], 10);
        }
    translate([0,0,lid_thickness-0.01]) linear_extrude(lip_depth+0.01)
        difference() {
            outline(wall+clearance);
            outline(wall+clearance+1.25);
        }
    for(side=[-1,1])
        translate([side*16.15,12,lid_thickness+2.25])
            scale([1,2,0.85]) sphere(r=0.93);
}

module artwork() {
    mirror([1,0,0]) linear_extrude(color_depth) children();
}

module lid_white() {
    difference() {
        lid_shape();
        translate([0,0,-0.01]) mirror([1,0,0])
            linear_extrude(color_depth+0.01)
                all_garlands();
        translate([0,0,-0.01]) mirror([1,0,0])
            linear_extrude(color_depth+0.01) green_art();
    }
}

if(part=="tray") tray();
if(part=="lid") lid_shape();
if(part=="lid_white") lid_white();
if(part=="garlands") artwork() red_art();
if(part=="sprinkles") artwork() green_art();
if(part=="preview") {
    color("ivory") translate([59,0,0]) tray();
    translate([-59,0,lid_thickness+lip_depth]) rotate([0,180,0]) {
        color("ivory") lid_white();
        color("#db2e29") artwork() red_art();
        color("#30914c") artwork() green_art();
    }
}
