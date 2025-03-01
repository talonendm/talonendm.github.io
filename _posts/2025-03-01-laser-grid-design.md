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

# Code notes

## Bezier

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



# Links

- Lasergriddesign [github](https://github.com/talonendm/lasergriddesign)
- For Huion tablet, check [paperjs.org](http://paperjs.org/examples/chain/)

---

[Disclaimer](https://talonendm.github.io/disclaimer)

