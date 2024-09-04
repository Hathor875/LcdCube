include <threads.scad>

// Dimensions of the rectangle
rect_width = 37.7;
rect_height = 44.1;
radius = 4; // Radius for rounding the corners
//44.1
//37.7
// Calculate the offsets for the thread positions
offset_x = rect_width / 2 - 1.5; // Half of the width minus the radius of the thread
offset_y = rect_height / 2 - 1.5; // Half of the height minus the radius of the thread

// Define the thread positions
positions = [
    [ offset_x,  offset_y],
    [-offset_x,  offset_y],
    [ offset_x, -offset_y],
    [-offset_x, -offset_y]
];

// Create the main shape with threads
union() {
    difference() {
        // Rounded rectangle outer shape
        offset(r = radius) {
            // Create a larger rectangle with rounded corners
            square([rect_width, rect_height], center = true);
        }
        // Subtract the inner rectangle to create a hollow effect
        
            
                square([ 34, 40], center = true);
            
        
    }

    // Create threaded holes
    for (pos = positions) {
        translate([pos[0], pos[1], 0]) {
            difference() {
                cylinder(h = 4, r = 2.5, center = false); 
                
                diameter = 3;  // Średnica gwintu
                pitch = 0.5;    // Skok gwintu
                length = 35;     // Długość gwintu

                metric_thread(diameter, pitch, length, internal=true);
            }
        }
    }
   
}
