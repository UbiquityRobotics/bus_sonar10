#!/usr/bin/env python

import svgwrite
from math import *

def main():
    urdf_file = open("../fiducials/fiducial_lib/freya.urdf", "wa")


    urdf_file.write("<?xml version=\"1.0\"?>\n")
    urdf_file.write("<robot name=\"freya\">\n")
    urdf_file.write("  <link name=\"base_link\">\n")
    urdf_file.write("  </link>\n\n")

    sonar_base( 0, 0.0,  0.0, 0.0, urdf_file)
    sonar_base(10, 0.0, -(6.5 * 25.4), pi,  urdf_file)

    urdf_file.write("</robot>\n")
    urdf_file.close()

def sonar_base(index_base, x_base, y_base, angle_base, urdf_file):
    assert isinstance(index_base, int)
    assert isinstance(x_base, float)
    assert isinstance(y_base, float)
    assert isinstance(angle_base, float)
    assert isinstance(urdf_file, file)

    base_dx = 300.00
    base_dy = 75.00

    bracket_dx = 20.0
    bracket_dy = 13.0

    board_dx = 100.00
    board_dy = 50.00
    board_oval_dx = (base_dx - board_dx) / 2.0
    board_oval_dy = base_dy
    board_radius_dx = board_oval_dx - bracket_dx / 2.0 - bracket_dy / 2.0
    board_radius_dy = board_oval_dy - bracket_dx / 2.0 - bracket_dy / 2.0

    x1_center = (board_dx / 2.0 + bracket_dy / 2.0) * cos(angle_base)
    y1_center = (-base_dy / 2.0 + bracket_dy / 2.0) * sin(angle_base)
    x2_center = - x1_center
    y2_center = y1_center

    for index in range(5):
 	# Bracket on right side:
        angle1 = (pi / 2.0) * (float(index) / 4.0)
	x1 = x1_center + board_radius_dx * cos(angle_base + angle1)
	y1 = y1_center + board_radius_dy * sin(angle_base + angle1)
	sonar(index_base + index,
	  x_base + x1, y_base + y1, angle_base + angle1, urdf_file)

	# Bracket on left side:
	angle2 = angle1 + pi / 2.0
	x2 = x2_center + board_radius_dx * cos(angle_base + angle2)
	y2 = y2_center + board_radius_dy * sin(angle_base + angle2)
	sonar(index_base + index + 5,
          x_base + x2, y_base + y2, angle_base + angle2, urdf_file)

def sonar(index, x, y, angle, urdf_file):
    assert isinstance(index, int)
    assert isinstance(x, float)
    assert isinstance(y, float)
    assert isinstance(angle, float)
    assert isinstance(urdf_file, file)

    urdf_file.write("  <link name=\"sonar_{0}\">\n".
     format(index))
    urdf_file.write("  </link>\n\n")

    urdf_file.write("  <joint name=\"base_sonar_{0}\" type=\"fixed\">\n".
     format(index))
    urdf_file.write("    <parent link=\"base_link\"/>\n")
    urdf_file.write("    <child link=\"sonar_{0}\"/>\n".format(index))
    urdf_file.write("    <origin rpy=\"0 0 {0}\" xyz=\"{1} {2} 0\"/>\n".
     format(angle, x/1000.0, y/1000.0))
    urdf_file.write("  </joint>\n\n")

main()
