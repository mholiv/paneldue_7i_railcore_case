/**
Copyright Caitlin Campbell 2020.
This documentation describes Open Hardware and is licensed under the
CERN OHL-S v.2.

You may redistribute and modify this documentation under the terms of the
CERN OHL-S v2. (http://ohwr.org/cernohl). This documentation is distributed
WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF
MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A
PARTICULAR PURPOSE. Please see the CERN OHL-S v.2 for applicable
conditions.
**/


// All raw dimensions pulled from https://duet3d.dozuki.com/Wiki/PanelDue#Section_Dimensions

// Raw dimensions of the board
boardx = 192.06;
boardy = 104.06;
boardz = 1.75;

// Raw dimensions of the screen
screenx = 164.93;
screeny = 100.03;
screenz = 5.23;

// How far recessed the screen should be from the front.
screen_flush = 0.5;

// The total depth of the case
total_depth = 15;

// How thick the backplate should be
backplatez = 2;


// How wide the part is that we screw on to the printer
attachment_width = 50;

back_standoff = total_depth - screenz - boardz;


// Our front assembly
front();

// Our back assembly, move 120mm.
translate([0,120,0])
back();


// This is the main function that defines the back plate
module back() {
    
    // We have a cube and subtract the screw holes from it
    difference() {
        cube([165+15,boardy,backplatez]);

        // THis is a screw function (see below)
        screws(backplatez);
    }
    
    // We add the standoffs on top of the screw holes.
    // These numbers pulled from https://duet3d.dozuki.com/Wiki/PanelDue#Section_Dimensions
    translate([3,3,0])
    standoff();
    translate([3,3+98,0])
    standoff();
    translate([3+174,3,0])
    standoff();
    translate([3+174,3+98,0])
    standoff();
    
}

// The main front assembly
module front() {

    // We start by creating the frame by hollowing out a box
    difference() {

        // Out box moved 1mm in x and y.
        translate([-1,-1,0])
        cube([boardx+2,boardy+2,total_depth]);

        // We subtract out out positive screen assembly from the box. (see function below.)
        screen();

        // We then subtract out the screws
        screws(screenz+screen_flush);
    }
    
    // This is the part that attaches to the top of the Railcore
    translate([(boardx+2)/2-(attachment_width/2),-5-1,0])
    difference(){
        cube([attachment_width,5,20+total_depth]);
        translate([10,5,20+total_depth-3.5])
        rotate([90,0,0])
        cylinder(h=5, d=3,$fn=25);
        translate([10,5,20+total_depth-3.5])
        rotate([90,0,0])
        cylinder(h=5, d=3,$fn=25);
        translate([attachment_width-10,5,20+total_depth-3.5])
        rotate([90,0,0])
        cylinder(h=5, d=3,$fn=25);
        
    }

}

// Standoff function. I isolate it because we use it over and over again.
module standoff() {
    
    difference () {
        cylinder(h=back_standoff, d=6,$fn=50);
        cylinder(h=back_standoff, d=3,$fn=25);
    }
}

// Generates holes in the correct location of any height.
// These numbers pulled from https://duet3d.dozuki.com/Wiki/PanelDue#Section_Dimensions
module screws(height) {
    translate([3,3,0])
    cylinder(h=height, d=3,$fn=25);
    translate([3,3+98,0])
    cylinder(h=height, d=3,$fn=25);
        
    translate([3+174,3,0])
    cylinder(h=height, d=3,$fn=25);
    translate([3+174,3+98,0])
    cylinder(h=height, d=3,$fn=25);
}


// This is a VERY rough 3d render of the whole board and screen facing down
module screen() {
    
    // We join these together.
    union() {
        // THe screen
        translate([7.56,2.02,0])
        cube([screenx,screeny,screenz+screen_flush]);

        // The board above the screen
        // The z is total_depth because we need to hollow the entire back.
        translate([0,0,screenz+screen_flush])
        cube([boardx,boardy,total_depth]);
        
        // The electronics 
        translate([screenx+6.56+2,(boardy-(screeny-10))/2,screenz+screen_flush-3.55])
        cube([19,screeny-10,3.55]);
    }
}