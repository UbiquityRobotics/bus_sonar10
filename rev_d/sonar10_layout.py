#!/usr/bin/env python

import svgwrite
from math import *

class Canvas:
    def __init__(self, file_name, x_size = 100, y_size = 100, extras = False):
	assert isinstance(file_name, str)
	assert isinstance(extras, bool)

	drawing = svgwrite.Drawing(file_name,
	  size = ("{0}mm".format(x_size), "{0}mm".format(y_size)),
	  viewBox = "0 0 {0} {1}".format(x_size, y_size), profile="tiny")

	self._drawing = drawing
	self._dx = 0.0
	self._dy = 0.0
	self._extras = extras
	self._holes = []
	self._pcb_x = 3.00	# PCB X offset (inches)
	self._pcb_y = 3.00	# PCB Y offset (inches)
	self._scale = 1.0
	self._y_offset = 200	# SVG Y origin offset (mm)

    def rectangle(self, x, y, length, width, rotate, color, label = ""):
	assert isinstance(x, int) or isinstance(x, float)
	assert isinstance(y, int) or isinstance(y, float)
	assert isinstance(length, int) or isinstance(length, float)
	assert isinstance(width, int) or isinstance(width, float)
	assert isinstance(rotate, int) or isinstance(rotate, float)
	assert isinstance(color, str)
	assert isinstance(label, str)

	half_length = length / 2.0
	half_width = width / 2.0
	angle1 = atan2( half_width,  half_length)
	angle2 = atan2( half_width, -half_length)
	angle3 = atan2(-half_width, -half_length)
	angle4 = atan2(-half_width,  half_length)
	hypotenuse = sqrt(half_length * half_length + half_width * half_width)

	x1 = x + hypotenuse * cos(angle1 + rotate)
	y1 = y + hypotenuse * sin(angle1 + rotate)
	x2 = x + hypotenuse * cos(angle2 + rotate)
	y2 = y + hypotenuse * sin(angle2 + rotate)
	x3 = x + hypotenuse * cos(angle3 + rotate)
	y3 = y + hypotenuse * sin(angle3 + rotate)
	x4 = x + hypotenuse * cos(angle4 + rotate)
	y4 = y + hypotenuse * sin(angle4 + rotate)

	if not self._extras:
	    color = "black"
	self.line(x1, y1, x2, y2, color = color)
	self.line(x2, y2, x3, y3, color = color)
	self.line(x3, y3, x4, y4, color = color)
	self.line(x4, y4, x1, y1, color = color)

    def hole(self, x, y, diameter, color = "black", label = ""):
	assert isinstance(x, int) or isinstance(x, float)
	assert isinstance(y, int) or isinstance(y, float)
	assert isinstance(diameter, int) or isinstance(diameter, float)
	assert isinstance(color, str)
	assert isinstance(label, str)

	drawing = self._drawing
	dx = self._dx
	dy = self._dy
	holes = self._holes
	pcb_x = self._pcb_x
	pcb_y = self._pcb_y
	scale = self._scale
	y_offset = self._y_offset

	px = x * scale + dx
	py = y_offset - (y * scale + dy)

	drawing.add(drawing.circle(center = (px, py),
	  r = diameter/2.0 * scale, stroke = "black", fill = "white"))

	#print("y={0} scale={1} dy={2}".format(y, scale, dy))
	xx = pcb_x + ((x * scale + dx) - 100) / 25.4
	yy = pcb_y - ((y * scale + dy) - 100) / 25.4
	holes.append( [xx, yy] )
	if label != "":
	    print("{0}: center x/y=({1:.3f},{2:.3f}) diam={3:.3f}".format(
	      label, x, y, diameter))

    def holes_average(self, label):
	assert isinstance(label, str)

	# If *label* is not empty, print out the average of *holes*:
	if label != "":
	    holes = self._holes
	    holes_size = len(holes)

	    x_sum = 0.0
	    y_sum = 0.0
	    for hole in holes:
		x_sum += hole[0]
		y_sum += hole[1]
	    x_average = x_sum / holes_size
	    y_average = y_sum / holes_size
	    print("{0}: ({1}, {2})".format(label, x_average, y_average))

	self._holes = []
	

    def line(self, x1, y1, x2, y2, color = "black", label = ""):
	assert isinstance(x1, int) or isinstance(x1, float)
	assert isinstance(y1, int) or isinstance(y1, float)
	assert isinstance(x2, int) or isinstance(x2, float)
	assert isinstance(y2, int) or isinstance(y2, float)
	assert isinstance(color, str)
	assert isinstance(label, str)

	#print("Canvas.line({0}, {1}, {2}, {3}, {4})". \
	#  format(x1, y1, x2, y2, color))

	drawing = self._drawing
	dx = self._dx
	dy = self._dy
	pcb_x = self._pcb_x
	pcb_y = self._pcb_y
	scale = self._scale	
	y_offset = self._y_offset

	px1 = x1 * scale + dx
	py1 = y_offset - (y1 * scale + dy)
	px2 = x2 * scale + dx
	py2 = y_offset - (y2 * scale + dy)
	p1 = (px1, py1)
	p2 = (px2, py2)
	drawing.add(drawing.line(p1, p2, stroke=color))

	if label != "":
            xx1 = pcb_x + ((x1 * scale + dx) - 100) / 25.4
            yy1 = pcb_y - ((y1 * scale + dy) - 100) / 25.4
            xx2 = pcb_x + ((x2 * scale + dx) - 100) / 25.4
            yy2 = pcb_y - ((y2 * scale + dy) - 100) / 25.4
	    print("{0}: ({1:.6f}, {2:.6f}) - ({3:.6f}, {4:.6f})".format(label,
	      xx1, yy1, xx2, yy2))

    def origin_scale(self, dx, dy, scale):
	self._dx = dx
	self._dy = dy
	self._scale = scale

    def save(self):
	self._drawing.save()

def sonar_draw(sonar, canvas, x, y, extras, color):
    # Check argument types:
    assert isinstance(sonar, dict)
    assert isinstance(canvas, Canvas)
    assert isinstance(x, float)
    assert isinstance(y, float)
    assert isinstance(extras, bool)
    assert isinstance(color, str)

    # Grab values from *sonar*:
    sonar_dx = sonar["dx"]
    sonar_dy = sonar["dy"]

    # Draw the sonar rectangle:
    if extras:
	canvas.rectangle(x, y, sonar_dx, sonar_dy, 0.0, color=color)

    # Draw mounting holes:
    hole_diameter = 2.25
    hole_dx = sonar_dx - 2.75
    hole_dy = sonar_dy - 2.75
    canvas.hole(x - hole_dx / 2.0, y + hole_dy / 2.0, hole_diameter)
    canvas.hole(x + hole_dx / 2.0, y - hole_dy / 2.0, hole_diameter)

    # Draw connector gap:
    connector_dx = .1 * 25.4
    connector_dy = .4 * 25.4
    canvas.rectangle(x - (sonar_dx / 2.0 - connector_dx / 2.0), y,
      connector_dx, connector_dy, 0.0, color=color)

    # Draw the crystal opening:
    crystal_dx = 5.50
    crystal_dy = 11.00
    canvas.rectangle(x + (sonar_dx / 2.0 - crystal_dx / 2.0), y,
      crystal_dx, crystal_dy, 0.0, color=color)

    # Draw sonar transceiver holes:
    inner_edge_dy = 11.40
    outer_edge_dy = 43.20
    diameter = (outer_edge_dy - inner_edge_dy) / 2.0
    radius = diameter / 2.0
    diameter_extra = diameter + 1.0
    canvas.hole(x, y + (inner_edge_dy / 2.0 + radius),
      diameter_extra, color=color)
    canvas.hole(x, y - (inner_edge_dy / 2.0 + radius),
      diameter_extra, color=color)

def holder_draw(holder, sonar, bracket, canvas, x, y, extras, color):
    # Check argument types:
    assert isinstance(holder, dict)
    assert isinstance(sonar, dict)
    assert isinstance(bracket, dict)
    assert isinstance(canvas, Canvas)
    assert isinstance(x, float)
    assert isinstance(y, float)
    assert isinstance(extras, bool)
    assert isinstance(color, str)

    # Grab some values (note, we rotate by 90 degrees => swap dx and dy):
    bracket_dy = bracket["dx"]
    bracket_dx = bracket["dy"]

    # Some sonar values:
    sonar_dx = sonar["dx"]
    sonar_dy = sonar["dy"]

    # Draw the holder:
    holder_dx = sonar_dx + 10.00
    holder_dy = sonar_dy + bracket_dy + 10.00

    # Draw the holder outline:
    canvas.rectangle(x, y, holder_dx, holder_dy, 0.0, color=color)

    # Draw the *sonar*:
    sonar_x = x
    sonar_y = y + holder_dy/2.0 - 5.0 - sonar_dy/2.0
    sonar_draw(sonar, canvas, sonar_x, sonar_y, extras, color)

    # Draw the bracket mounting rectangle:
    bracket_x = x
    bracket_y = y - holder_dy/2.0 + bracket_dy/2.0
    bracket_draw(bracket, canvas, bracket_x, bracket_y, -pi/2.0, extras, color)

def bracket_draw(bracket, canvas, x, y, angle, extras, color):
    # Verify argument types:
    assert isinstance(bracket, dict)
    assert isinstance(canvas, Canvas)
    assert isinstance(x, float)
    assert isinstance(y, float)
    assert isinstance(angle, float)
    assert isinstance(extras, bool)
    assert isinstance(color, str)

    # Grab some values:
    bracket_dx = bracket["dx"]
    bracket_dy = bracket["dy"]
    bracket_hole_offset = bracket["hole_offset"]
    bracket_hole_diameter = bracket["hole_diameter"]

    # Draw the *bracket* rectangle:
    if extras:
	canvas.rectangle(x, y, bracket_dx, bracket_dy, angle, color=color)

    # Draw the *bracket* mounting hole:
    hole_offset = -bracket_dx / 2 + bracket_hole_offset
    x1 = x + hole_offset * cos(angle)
    y1 = y + hole_offset * sin(angle)
    canvas.hole(x1, y1, bracket_hole_diameter)

    # Compute the alignment polar *align_angle* and *align_radius*:
    half_bracket_dx = bracket_dx / 2.0
    half_bracket_dx_squared = half_bracket_dx * half_bracket_dx
    half_bracket_dy = bracket_dy / 2.0
    half_bracket_dy_squared = half_bracket_dy * half_bracket_dy
    align_radius = sqrt(half_bracket_dx_squared + half_bracket_dy_squared)
    align_angle = atan2(bracket_dy, bracket_dx)

    # Draw the two alignment holes:
    hole_angle = angle + pi
    hole_diameter = 0.1
    x1 = x + align_radius * cos(hole_angle + align_angle)
    y1 = y + align_radius * sin(hole_angle + align_angle)
    canvas.hole(x1, y1, hole_diameter)
    x2 = x + align_radius * cos(hole_angle - align_angle)
    y2 = y + align_radius * sin(hole_angle - align_angle)
    canvas.hole(x2, y2, hole_diameter)

def main():
    extras = True
    extras = False
    canvas = Canvas("sonar10_layout.svg",
      x_size = 300, y_size = 300, extras = extras)

    #canvas.origin_scale(150, 50, 0.050 * 25.4)
    canvas.origin_scale(150, 50, 1.00)

    # Define the *base* dimensions (mm):
    base = {}
    base_dx = base["dx"] = 300.00
    base_dy = base["dy"] = 75.00

    # Define the *board* dimensions (mm):
    board = {}
    board_dx = board["dx"] = 100.00
    board_dy = board["dy"] = 50.00

    # Define the *bracket* dimensions (mm):
    bracket = {}
    bracket_dx = bracket["dx"] = 20.0
    bracket_dy = bracket["dy"] = 13.0
    bracket_hole_offset = bracket["hole_offset"] = 7.25
    bracket_hole_diameter = bracket["hole_diameter"] = 3.10

    # Define the *sonar* dimensions (mm):
    sonar = {}
    sonar_dx = sonar["dx"] = 20.0
    sonar_dy = sonar["dy"] = 45.0

    # Define the *holder* dimensions (mm):
    holder = {}
    holder_dx = holder["dx"] = sonar_dx + 10.00
    holder_dy = holder["dy"] = sonar_dy + bracket_dy + 10.00

    # Define the *board* dimensions (mm):
    board = {}
    board_dx = board["dx"] = 100.00
    board_dy = board["dy"] = 50.00
    board_oval_dx = board["oval_dx"] = (base_dx - board_dx) / 2.0
    board_oval_dy = board["oval_dy"] = base_dy
    board_radius_dx = board["radius_dx"] = \
      board_oval_dx - bracket_dx / 2.0 - bracket_dy / 2.0
    board_radius_dy = board["radius_dy"] = \
      board_oval_dy - bracket_dx / 2.0 - bracket_dy / 2.0


    # Draw the *base* rectangle*:
    canvas.rectangle(0.0, 0.0, base_dx, base_dy, 0.0, color="black")

    # Draw the board rectangle
    if extras:
	canvas.rectangle(0, 0, board_dx, board_dy, 0.0, color="green")

    # Draw the board mounting holes:
    for dx in (-45.0, 45.0):
	for dy in (-20.0, 20.0):
	    canvas.hole(dx, dy, 3.10)	# 3.10 = 3mm or #4 hole diameter

    x1_center = board_dx / 2.0 + bracket_dy / 2.0
    y1_center = -base_dy / 2.0 + bracket_dy / 2.0
    x2_center = - x1_center
    y2_center = y1_center

    degrees_to_radians = 180.0 / pi
    for index in range(5):
 	# Bracket on right side:
        angle1 = (pi / 2.0) * (float(index) / 4.0)
	x1 = x1_center + board_radius_dx * cos(angle1)
	y1 = y1_center + board_radius_dy * sin(angle1)
	bracket_draw(bracket, canvas, x1, y1, angle1, extras, "black")

	# Bracket on left side:
	angle2 = angle1 + pi / 2.0
	x2 = x2_center + board_radius_dx * cos(angle2)
	y2 = y2_center + board_radius_dy * sin(angle2)
	bracket_draw(bracket, canvas, x2, y2, angle2, extras, "black")

    # Draw the robot base mounting holes:
    #for xy in [(2.5, -.5), (3.5, -.5), (4.5, -.5), (2.5, .5), (5.5, .5)]:
    mounting_holes = [
      (2.5, -1.0),
      (3.5, -1.0),
      (4.5, -1.0),
      (2.5,  0.0),
      (3.5,  0.0),
      (4.5,  1.0),
      (5.5,  1.0)]
    for xy in mounting_holes:
        x = xy[0] * 25.4
	y = xy[1] * 25.4
        canvas.hole( x, y, .1960 * 25.4)	# #10 hole in mm.
        canvas.hole(-x, y, .1960 * 25.4)	# #10 hole in mm.

    # Draw the arm base mounting holes:
    for index in range(5):
        x = index * 10 + 5
        for y in (30, -30):
	    canvas.hole( x, y, 3.1)
            canvas.hole(-x, y, 3.1)

    # Draw a bunch of holders along the bottom:
    x_pitch = 30.0
    y = -75.0
    for index in range(5):
        x = index * x_pitch + x_pitch / 2.0
	holder_draw(holder, sonar, bracket, canvas,  x, y, extras, "purple")
	holder_draw(holder, sonar, bracket, canvas, -x, y, extras, "purple")

    # Save *canvas*:
    canvas.save()

main()
