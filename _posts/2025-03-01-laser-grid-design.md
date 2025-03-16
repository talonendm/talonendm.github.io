---
layout: post
title: Laser Grid Design
subtitle: p5-application for laser designs
tags:
  - laser
  - p5js
comments: false
cover-img: /assets/pics/cover/drawing/laser.jpg
thumbnail-img: /assets/pics/thumbnail/drawing/laser.jpg
published: true
---

A laser cutting design [application](https://talonendm.github.io/lasergriddesign/) built with p5.js that allows users to draw lines, Bezier curves, ellipses, and save their designs as SVG files. The canvas grid and other drawing parameters can be adjusted with keyboard input, see instructions at [github readme](https://github.com/talonendm/lasergriddesign).

# Projects

## Tiainen

Creating a birdhouse that is both functional and aesthetically pleasing can be a fulfilling DIY project. In this design, I’ve incorporated laser-cut 3mm plywood for precision side panels while integrating practical features like a slide-out floor for cleaning. This combination of design and functionality makes it ideal for both birds and bird enthusiasts.

The Design Concept: The birdhouse's main structure is made from untreated wooden boards, providing a natural, bird-friendly habitat. To elevate the design, laser-cut plywood panels are used for the sides, offering precision and the opportunity to customize with intricate patterns or cutouts. [svg](https://talonendm.github.io/assets/svg/laser/laser_tiainen_sivu_20250316T090043.svg)

A key feature of the birdhouse is the entry hole [svg](https://talonendm.github.io/assets/svg/laser/sinitiainen220403.svg). The front wooden panel includes a precisely drilled 28mm hole, perfectly sized for small bird species like sparrows or blue tits. To protect this hole and enhance its appearance, a separate 3mm plywood piece is laser-cut with an exact matching hole and affixed to the front panel. This reinforcement prevents wear and gives the birdhouse a polished, professional look.

One innovative aspect of this birdhouse is the slide-out floor, designed for easy cleaning. The floor panel is built into a groove on the side walls, allowing it to slide out effortlessly. This feature ensures that the birdhouse can be cleaned quickly and hygienically after each nesting season, keeping it safe and welcoming for future bird inhabitants. The sliding mechanism is durable and securely aligned to ensure the floor stays in place during regular use but can be easily removed when needed.

The roof is constructed from untreated wood, maintaining a consistent natural aesthetic while providing excellent protection from the elements. Combined with the laser-cut side panels and the innovative sliding floor, the assembly is straightforward yet robust, ensuring the birdhouse will last for many seasons.

This birdhouse design combines traditional woodworking with the precision of laser-cut components and practical innovations like the slide-out floor. The result is a birdhouse that’s not only functional and bird-friendly but also easy to maintain and visually striking.

# Notes

The size of an A4 sheet of paper in inches is 8.27 x 11.69 inches. To convert these dimensions to pixels, you need to know the DPI (dots per inch) that will be used for the conversion. For standard printing purposes, 300 DPI is typically used, but you can use other values like 72 DPI for screen displays.

Here’s the calculation for A4 size in pixels at different DPI values:

### Formula:

Pixel Dimension = Inch Dimension × DPI


### At 300 DPI (standard print quality):
- **Width**: 8.27 inches × 300 DPI = 2,481 pixels
- **Height**: 11.69 inches × 300 DPI = 3,507 pixels

So, at **300 DPI**, an A4 paper would be **2481 x 3507 pixels**.

### At 72 DPI (standard web display):
- **Width**: 8.27 inches × 72 DPI = 595 pixels
- **Height**: 11.69 inches × 72 DPI = 841 pixels

P5

~~~
g.scale(72/25.4);
~~~

Note: in Inchscape default DPI is 96. 


# Code notes

The reason for creating the saveSVGlaser function was to ensure that the SVG is saved correctly after the drawing process is fully completed. By defining a separate function, we have more control over when and how the SVG is saved. Specifically, this allows us to perform necessary actions, such as ensuring that all dynamic elements (like lines, shapes, or modifications) are fully rendered before saving, preventing incomplete or empty files from being generated. This also enables a clearer organization of the code, as the saving functionality is isolated in its own function, making the code easier to manage and modify if needed.

~~~
function saveSVGlaser() {
  // Create an SVG canvas and draw only the stored lines
  let svgCanvas = createGraphics(w, h, SVG);
  svgCanvas.noFill();
  svgCanvas.stroke(0);
  svgCanvas.strokeWeight(use_laser_strokeweight);

  for (let i = 0; i < lines.length; i++) {
    svgCanvas.line(lines[i].x1, lines[i].y1, lines[i].x2, lines[i].y2);
  }

  // Draw existing Bezier curves
  for (let bezierCurve of beziers) {
    svgCanvas.bezier(
      bezierCurve.startBx,
      bezierCurve.startBy,
      bezierCurve.controlX1,
      bezierCurve.controlY1,
      bezierCurve.controlX2,
      bezierCurve.controlY2,
      bezierCurve.endBX,
      bezierCurve.endBY
    );
  }

  // Draw all stored ellipses from the array
  for (let i = 0; i < ellipses.length; i++) {
    let e = ellipses[i];
    svgCanvas.ellipse(e.x, e.y, e.radius * 2, e.radius * 2); // Draw the ellipse
  }

  if (drawRectInSave) {
    svgCanvas.ect(0, 0, w, h);
  }

  // Save the SVG
  let datetag = new Date().toISOString().replace(/[-:]/g, "").split('.')[0];  // Generate a timestamp
  svgCanvas.save("laser_" + datetag + ".svg");
}
~~~

This function saves all the drawing elements, including lines, Bezier curves, ellipses, and an optional rectangle, to an SVG file. The file is named with a timestamp to ensure uniqueness. The function provides a clear separation between drawing and saving, making it modular and easier to manage.

## Application

### Bezier

1. Dynamic Preview:

- While selecting control points, the Bezier curve is drawn dynamically using the current mouse position for the control point being set.
- If the first control point is being set, the mouseX and mouseY values are used for both controlX1/controlY1 and controlX2/controlY2 in the preview.
- If the second control point is being set, mouseX and mouseY are used for controlX2/controlY2.

2. Preview Styling:

- The preview Bezier curve is drawn in blue (stroke(0, 0, 255)) to distinguish it from completed curves.

3. Bezier State:

- The bezierState variable is used to check whether the user is selecting the first or second control point.
Behavior
  - After setting the start and end points:
- When moving the mouse, you will see a blue preview of the Bezier curve using the mouse position as the control point.
As you click to set each control point, the preview updates accordingly, providing real-time feedback.

~~~
 // Set control points
  if (!controlX1 && !controlY1) {
    if (snapcontrolpointstogrid) {
      controlX1 = snapToGrid(mouseX);
      controlY1 = snapToGrid(mouseY);
    } else {
      controlX1 = mouseX;
      controlY1 = mouseY;
    }
  } else {
    if (snapcontrolpointstogrid) {
      controlX2 = snapToGrid(mouseX);
      controlY2 = snapToGrid(mouseY);
    } else {
      controlX2 = mouseX;
      controlY2 = mouseY;
    }

    // Save the completed Bezier curve
    beziers.push({
      startBx,
      startBy,
      controlX1,
      controlY1,
      controlX2,
      controlY2,
      endBX,
      endBY,
    });

    resetBezierState(); // Reset for the next Bezier
  }
  ~~~

### Equality

=== (Strict Equality)
Type-sensitive: It compares both the value and the type.
Returns true only if the two values are of the same type and are equal.

== (Loose Equality)
Type-converting: It converts the operands to the same type before comparing them.
Can return true even if the types differ, as long as the converted values are equal.

Why === is Preferred
Using === avoids unexpected behavior caused by type coercion. It ensures that the comparison is intentional and predictable.

### Delete objects

If beziers contains Bezier curves and not just line segments, you would need a proper distance calculation. Here's an example approach to fix this:

- Approximate the Bezier curve by sampling points along it (e.g., using a parameter t from 0 to 1 to sample points along the curve).
- Calculate the distance from the mouse to each sampled point.
- Track the minimum distance and index.

~~~

function distanceToBezierCurve(mx, my, bezierCurve) {
  let minDist = Infinity;
  for (let t = 0; t <= 1; t += 0.01) { // Sample points on the Bezier curve from t = 0 to t = 1
    let bx = bezierPoint(bezierCurve.x1, bezierCurve.controlX1, bezierCurve.controlX2, bezierCurve.x2, t);
    let by = bezierPoint(bezierCurve.y1, bezierCurve.controlY1, bezierCurve.controlY2, bezierCurve.y2, t);
    let d = dist(mx, my, bx, by);
    if (d < minDist) {
      minDist = d;
    }
  }
  return minDist;
}

function bezierPoint(p0, p1, p2, p3, t) {
  // Cubic Bezier formula: B(t) = (1-t)^3 * P0 + 3(1-t)^2 * t * P1 + 3(1-t) * t^2 * P2 + t^3 * P3
  let u = 1 - t;
  return u * u * u * p0 + 3 * u * u * t * p1 + 3 * u * t * t * p2 + t * t * t * p3;
}

let closestIndex = -1;
let minDist = Infinity;

for (let i = 0; i < beziers.length; i++) {
  let bezierCurve = beziers[i];
  let d = distanceToBezierCurve(mx, my, bezierCurve);
  if (d < minDist && d < 10) {
    minDist = d;
    closestIndex = i;
  }
}

if (closestIndex !== -1) {
  beziers.splice(closestIndex, 1); // Remove closest Bezier curve
}

~~~

# Examples

 <!-- Embedded SVG from external file -->
  <object type="image/svg+xml" data="/assets/svg/laser/laserHalkoSide.svg" width="200" height="200">
    Your browser does not support SVGs.
  </object>

# Links

- Lasergriddesign [github](https://github.com/talonendm/lasergriddesign)
- For Huion tablet, check [paperjs.org](http://paperjs.org/examples/chain/)
- [Vectr](https://vectr.com/design/)
- [boxySVG](https://boxy-svg.com/)
  - account required
- [svgedit](https://svgedit.github.io/releases/v6.0.0/svg-editor-es.html)

---

[Disclaimer](https://talonendm.github.io/disclaimer)

