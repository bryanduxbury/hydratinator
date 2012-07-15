use <common.scad>

module spacer() {
  difference() {
    cylinder(r=4.5, h=3, center=true, $fn=36);
    cylinder(r=1.5, h=3.1, center=true, $fn=36);
  }
}

module slide() {
  color([255/255, 0/255, 0/255]) difference() {
    union() {
      translate([0, 6, 0]) cylinder(r=4.5, h=3, center=true, $fn=36);
      translate([0, -12, 0]) cylinder(r=4.5, h=3, center=true, $fn=36);
      translate([0, -3, 0]) cube(size=[9, 18, 3], center=true);
    }
    cylinder(r=1.5, h=3.1, center=true, $fn=36);
    translate([0, 6, 0]) cylinder(r=1.5, h=3.1, center=true, $fn=36);
    translate([0, -12, 0]) cylinder(r=1.5, h=3.1, center=true, $fn=36);
  }
}

module lower_plate() {
  render() difference() {
    union() {
      cylinder(r=50, h=3, center=true, $fn=72);
      translate([-3, 50, 0]) cube(size=[23, 22, 3], center=true);
    }
    cylinder(r=3, h=3.1, center=true, $fn=36);

    for (i=[-1,1]) {
      translate([9.5 / 2 - 7.5 - 9.5/2 * i, 55 + 9.5/2 - 2.5, 0]) cylinder(r=2.5/2, h=10, center=true, $fn=36);
    }
    for (i=[0:7]) {
      rotate([0, 0, 360/8 * i]) {
        translate([35, 0, 0]) {
          cylinder(r=1.6, h=3.1, center=true, $fn=36);
          translate([6, 0, 0]) {
            cylinder(r=1.6, h=3.1, center=true, $fn=36);
            translate([1.5, 0, 0]) cube(size=[3, 3.2, 3.1], center=true);
            translate([3, 0, 0]) cylinder(r=1.6, h=3.1, center=true, $fn=36);
          }
          translate([-9, 0, 0]) {
            cylinder(r=1.6, h=3.1, center=true, $fn=36);
            translate([-1.5, 0, 0]) cube(size=[3, 3.2, 3.1], center=true);
            translate([-3, 0, 0]) cylinder(r=1.6, h=3.1, center=true, $fn=36);
          }
        }
      }
    }
    for (a=[0, 90, 180, 270]) {
      rotate([0, 0, a+22.5]) {
        translate([13, 13, 0]) cylinder(r=1.7, h=3.1, center=true, $fn=36);
      }
    }
  }
}

module upper_plate() {
  color([128/255, 0/255, 128/255]) render() difference() {
    // main disk
    cylinder(r=50, h=3, center=true, $fn=72);
    // central cutout for the selector wheel
    cylinder(r=22, h=3.1, center=true);

    // cutout for the limit switch
    translate([-3, 59, 0]) cube(size=[35, 22, 3.1], center=true);

    // loop for all the valves
    for (i=[0:7]) {
      rotate([0, 0, 360/8 * i]) {
        translate([35, 0, 0]) {
          // central hole for the hose
          cylinder(r=1.6, h=3.1, center=true, $fn=36);

          // far end slot for the guide
          translate([6, 0, 0]) {
            cylinder(r=1.6, h=3.1, center=true, $fn=36);
            translate([1.5, 0, 0]) cube(size=[3, 3.2, 3.1], center=true);
            translate([3, 0, 0]) cylinder(r=1.6, h=3.1, center=true, $fn=36);
          }

          // close cutout for the bearing
          translate([-9, 0, 0]) {
            cylinder(r=5.1, h=3.1, center=true, $fn=36);
            translate([-3, 0, 0]) cube(size=[6, 10.2, 3.1], center=true);
          }
        }
      }
    }
  }
}

module upper_to_top_strut() {
  color([220/255, 0/255, 0/255]) {
    translate([-14 + 1.5, -9 + 3, 0]) cylinder(r=1.5, h=3, center=true, $fn=36);
    translate([14 - 1.5, -9 + 3, 0]) cylinder(r=1.5, h=3, center=true, $fn=36);
    
    translate([14 - 4 - 1.5, 9, 0]) cylinder(r=1.5, h=3, center=true, $fn=36);
    translate([14 - 4 - 1.5 - 10, 9, 0]) cylinder(r=1.5, h=3, center=true, $fn=36);
    
    
    // linear_extrude(height=3, center=true) {
    //   polygon([
    //     [-2, 9],
    //     [0, 9],
    //     [0, 6],
    //     [2.5, 6],
    //     [2.5, 3],
    //     [1.5, 3],
    //     [1.5, 1],
    //     [2.5, 1],
    //     [2.5, -2],
    //     [5.5, -2],
    //     [5.5, 1],
    //     [6.5, 1],
    //     [6.5, 3],
    //     [5.5, 3],
    //     [5.5, 6],
    //     [8, 6],
    //     [8, 9],
    //     [10, 9],
    //     [14, -7],
    //     [14, -9],
    //     [-14, -9],
    //     [-14, -7]
    //   ]);
    // }
    
    // difference() {
      // cube(size=[28, 18, 3], center=true);
    //   // 8 to edge
    //   #translate([0, 0, 0]) cube(size=[10, 10, 3.1]);
    // }
    
  }
  
}

module top_plate() {
  color([0/255, 64/255, 128/255]) difference() {
    union() {
      // main disk
      cylinder(r=40, h=3, center=true, $fn=72);

      // for (i=[0:7]) {
      //   rotate([0, 0, 360/8 * i + 360/16]) {
      //     translate([40, 0, 0]) cylinder(r=5.5, h=3, center=true);
      //   }
      // }
    }

    // central cutout for the selector wheel
    cylinder(r=30, h=3.1, center=true, $fn=72);


    // loop for all the valves
    for (i=[0:7]) {
      rotate([0, 0, 360/8 * i]) {
        translate([35, 0, 0]) {
          // central hole for the hose
          cylinder(r=1.6, h=3.1, center=true, $fn=36);
          for (a=[-1,1]) for (b=[-1, 1]) {
            translate([a * 3, b * 3, 0]) cube(size=[1.5, 2, 3.1], center=true);
          }
        }
      }
      rotate([0, 0, 360/8 * i + 360 / 16]) {
        translate([40, 0, 0]) {
          cube(size=[3, 3, 3.1], center=true);
        }
        
        translate([35, 0, 0]) cylinder(r=1.5, h=3.1, center=true, $fn=36);
        
        translate([30, 0, 0]) {
          cube(size=[3, 3, 3.1], center=true);
        }
      }
    }
  }
}

module selector_wheel() {
  color([0/255, 255/255, 0/255]) difference() {
    cylinder(r=20.5, h=3, center=true, $fn=72);
    translate([0, 21, 0]) cube(size=[25, 6, 3.1], center=true);
    // translate([0, 22.5, 0]) scale([1.5, 1, 1]) cylinder(r=5, h=3.1, center=true, $fn=36);
    cylinder(r=2.5, h=10, center=true, $fn=36);
    for (i=[0, 1, 2, 3]) {
      rotate([0, 0, i*90]) {
        translate([6.35, 0, 0]) cylinder(r=1.5, h=10, center=true, $fn=36);
      }
    }
  }
}

translate([0, 0, -20.5]) rotate([0, 0, 22.5]) nema14_stepper();

for (d=[-3,-6]) {
  translate([0, 0, d]) {
    for (a=[0, 90, 180, 270]) {
      rotate([0, 0, a+22.5]) {
        translate([13, 13, 0]) spacer();
      }
    }
  }
}



lower_plate();

for (z = [0, 3.2, 6.6]) {
  translate([0, 0, z + -1.6]) {
    for (i=[1:7]) {
      rotate([0, 0, 360/8 * i]) {
        for (o=[0, 18]) {
          translate([0, o + 26, 0]) {
            washer();
          }
        }
      }
    }
    translate([0, 23, 0]) {
      washer();
    }
    translate([0, 18 + 23, 0]) {
      washer();
    }
  }
}

translate([0, 0, 3.5]) {
  for (i=[1:7]) {
    rotate([0, 0, 360/8 * i]) {
      translate([0, 38, 0]) {
        slide();
      }
    }
  }

  translate([0, 35, 0]) {
    slide();
  }
}

translate([9.5 / 2 - 7.5, 55, 1.5 + 3.2]) rotate([0, 0, 180]) limit_switch();

// translate([0, 0, 7]) upper_plate();

translate([0, 0, 7]) {
  for (i=[1:7]) {
    rotate([0, 0, 360/8 * i]) {
      translate([0, 26, 0]) {
        bearing();
      }
    }
  }
  translate([0, 23, 0]) {
    bearing();
  }
}

translate([0, 0, 8]) selector_wheel();

translate([0, 0, 12]) {
  mounting_collar();
}

// translate([0, 0, 18]) {
//   for (i=[1:7]) {
//     rotate([0, 0, 360/8 * i]) {
//       translate([0, 35, 0]) rotate([0, 0, 90]) {
//         hose_tee();
//       }
//     }
//   }
// }
// 
// translate([0, 0, 15]) top_plate();

// translate([0, 0, 7.5]) {
//   for (i=[0:7]) {
//     rotate([0, 0, 360/8 * i + 360/16]) {
//       translate([0, (50 + 22) / 2, 0]) rotate([0, 0, 90]) {
//         rotate([90, 0, 0]) !upper_to_top_strut();
//       }
//     }
//   }
// }
