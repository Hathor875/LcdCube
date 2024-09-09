include <threads.scad>

hole_tread_switch = 0;
rect_width = 34;
rect_height = 40;

offset_x = 44/2 - 1.5; 
offset_y = 38/2 - 1.5; 

positions = [
    [ offset_x,  offset_y],
    [-offset_x,  offset_y],
    [ offset_x, -offset_y],
    [-offset_x, -offset_y]
];

// Parametry gwintu M3
diameter = 3.1;  
pitch = 0.5;   
length = 5;   // Możesz dostosować długość według potrzeb

difference() {
    cube([50, 50, 3], true);

    // Wycięcie prostokąta
    translate([0, 0, 0]) {
        cube([rect_width, rect_height,3.1], true);
    }

    // Wycinanie gwintów M3
    for (pos = positions) {
        translate([pos[0], pos[1], -1.4]) {
            metric_thread(diameter, pitch, length, internal = true);
        }
    }
}
