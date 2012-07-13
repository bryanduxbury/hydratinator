module bearing(id=3, od=10, t=4) {
  color([128/255, 128/255, 128/255]) render() difference() {
    cylinder(r=od/2, h=t, center=true, $fn=36);
    cylinder(r=id/2, h=t+0.1, center=true, $fn=36);
    rotate_extrude($fn=36, convexity=10) {
      translate([(id/2 + od/2)/2, t/2+0.4]) square(size=[(od/2 - id/2) - 2, 1], center=true);
      translate([(id/2 + od/2)/2, -t/2-0.4]) square(size=[(od/2 - id/2) - 2, 1], center=true);
    }
  }
}

module tubing(od=3, id=1.5, len=20) {
  color([192/255, 192/255, 192/255, .25]) render() difference() {
    cylinder(r=od/2, h=len, center=true, $fn=36);
    cylinder(r=id/2, h=len, center=true, $fn=36);
  }
}

module nema14_stepper() {
  color([75/255, 75/255, 0/255]) render() difference() {
    union() {
      cube(size=[36, 36, 26], center=true);
      translate([0, 0, 14]) cylinder(r=11, h=2, center=true, $fn=36);
      translate([0, 0, 13 + 2 + 21 / 2]) cylinder(r=2.5, h=21, center=true, $fn=36); 
    }
    for (a=[0, 90, 180, 270]) {
      rotate([0, 0, a]) {
        translate([13, 13, 13]) cylinder(r=1.5, h=5, center=true, $fn=36);
      }
      
    }
  }
}

module mounting_collar() {
  color([0/255, 128/255, 192/255]) difference() {
    cylinder(r=19.05/2, h=5.08, center=true, $fn=72);
    cylinder(r=2.5, h=10, center=true, $fn=36);
    for (i=[0:3]) {
      rotate([0, 0, i*90]) {
        translate([6.35, 0, 0]) cylinder(r=1.5, h=10, center=true, $fn=36);
      }
    }
    rotate([0, 0, -45]) translate([19.05/2, 0, 0]) rotate([0, 90, 0]) cylinder(r=1.5, h=19.05, center=true, $fn=36);
  }
}

module washer() {
  color([200/255, 200/255, 200/255]) render() difference() {
    cylinder(r=25.4 * 0.312 / 2, h=25.4 * 0.031, center=true, $fn=36);
    cylinder(r=25.4 * 0.142 / 2, h=1, center=true, $fn=36);
  }
}

module limit_switch() {
  // omron pin plunger limit switch
  // http://www.mouser.com/ProductDetail/Omron-Electronics/SS-01GPT/?qs=Rh%252baoYk36r5bcrGbGT1PWfplQP%2f%252bN%252b31fppJCleG5Dg%3d
  
  color([60/255, 60/255, 60/255]) difference() {
    union() {
      cube(size=[19.8, 9.5, 6], center=true);
      translate([-19.8/4, 9.5 / 2 + 0.7/2, 0]) cube(size=[19.8/2, 0.7, 6], center=true);

      translate([0, -9.5 / 2 + 2.5, 0]) for (i=[1,-1]) {
        translate([9.5/2 * i, 0, 0]) cylinder(r=3.2/2, h=6.4, center=true, $fn=36);
      }
    }
    
    translate([0, -9.5 / 2 + 2.5, 0]) for (i=[1,-1]) {
      translate([9.5/2 * i, 0, 0]) cylinder(r=2.35/2, h=100, center=true, $fn=36);
    }
  }
  
  
  color([220/255, 220/255, 220/255]) {
    translate([-19.8/2, -9.5 / 2 + 2.5 - 10.6/2, 0]) {
      for (xoff=[1.6, 8.8+1.6, 1.6 + 8.8 + 7.3]) translate([xoff, 0, 0]) {
        difference() {
          union() {
            translate([0, 10.6/2 - 3.5/2, 0]) cube(size=[0.5, 3.5, 3.2], center=true);
            translate([0, -10.6/2 + 7.1/2, 0]) cube(size=[0.5, 7.1, 2.8], center=true);
          }
          
          translate([0, -10.6/2 + 1.2, 0]) rotate([0, 90, 0]) cylinder(r=1.2/2, h=10, center=true, $fn=36);
        }
        
      }
    }
  }
  
  color([0/255, 0/255, 255/255]) {
    translate([-19.8/2 + 5.1 + 9.5 - 7.5, -9.5/2 + 2.5 + 8.9 - 1, 0]) cylinder(r=1, h=3.2, center=true, $fn=36);
  }
  
}

function slice_dim(x) = x * 0.271 / 14;

module hose_tee_section() {
  cylinder(r=0.090/2, h=slice_dim(2), $fn=36);
  translate([0, 0, slice_dim(2)]) cylinder(r=0.109/2, h=slice_dim(1), $fn=36);
  translate([0, 0, slice_dim(3)]) cylinder(r1=0.090/2, r2=0.070/2, h=slice_dim(1), $fn=36);
  translate([0, 0, slice_dim(4)]) cylinder(r=0.070/2, h=slice_dim(5), $fn=36);
  translate([0, 0, slice_dim(9)]) cylinder(r1=0.078/2, r2=0.060/2, h=slice_dim(1), $fn=36);
  translate([0, 0, slice_dim(10)]) cylinder(r=0.060/2, h=slice_dim(2), $fn=36);
  translate([0, 0, slice_dim(12)]) cylinder(r1=0.060/2, r2=0.050/2, h=slice_dim(1), $fn=36);
}

module hose_tee() {
  scale([25.4, 25.4, 25.4]) rotate([90, 0, 0]) {
    hose_tee_section();
    rotate([90, 0, 0]) hose_tee_section();
    rotate([180, 0, 0]) hose_tee_section();
  }
}

// limit_switch();

// mounting_collar();

// washer();
// nema14_stepper();

// tubing();
// bearing();

hose_tee();