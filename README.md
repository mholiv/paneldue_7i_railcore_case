# PanelDue 7i Railcore II Case

## About

This is my simple PanelDue 7i case for the Railcore II.

The screen will be 0.5 mm recessed from the front but other then that everything should be flush with everything.
 
The used M3x18 screws but any 3mmx18mm screws and hex bolts should work.

The hex pattern was done via PrusaSlicer. In order to print this case with the hex pattern pre-done print the `railcore_paneldue_7i_case.3mf` file. Other slicers may work but I tested this design with 

This hardware is licensed under the [CERN-OHL-S](https://ohwr.org/project/cernohl/wikis/uploads/002d0b7d5066e6b3829168730237bddb/cern_ohl_s_v2.txt) which [(in my opinion a hardware version of the gplv3)](https://ohwr.org/project/cernohl/wikis/faq) licence.

## Design
This was designed in super quickly in [openSCAD](https://www.openscad.org/). Note that this cover DOES NOT have an SD card slot. If someone wants to submit a PR with a SD card slot it would be accepted. :)

## Printing
Because the hex pattern was done in slicer the original `.scad` file will not reflect these design elements. These are included in the `bin/*.3mf` files.

I printed mine out of cheap PLA at 0.2mm at a very high speed. 

## Images

![Front of Assembly](https://raw.githubusercontent.com/mholiv/paneldue_7i_railcore_case/master/images/front.jpg)

![Back of Assembly](https://raw.githubusercontent.com/mholiv/paneldue_7i_railcore_case/master/images/back.jpg)

![Assembly Mounted on RailCore II 200 ZLT](https://raw.githubusercontent.com/mholiv/paneldue_7i_railcore_case/master/images/mounted.jpg)