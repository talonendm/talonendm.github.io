---
layout: post
title: Thumbnail Editor
subtitle: edit pics
tags:
  - Thumbnail
  - editor
  - p5js
comments: false
cover-img: /assets/pics/page/lego/dudes.jpg
thumbnail-img: /assets/pics/thumbnail/photo/e384/e-amigadisk.jpg
published: true
---

<style>

.thumbnail-editor-wrapper {
  background: linear-gradient(180deg, #1b1b1b 0%, #101010 100%);
  border-radius: 24px;
  padding: 1.5rem;
  margin: 2rem 0;
  box-shadow: 0 10px 40px rgba(0,0,0,0.35);
  color: #f1f1f1;
}

.thumbnail-editor-header {
  margin-bottom: 1rem;
}

.thumbnail-editor-header h1 {
  margin: 0;
  font-size: 2.2rem;
  line-height: 1;
}

.thumbnail-editor-header p {
  opacity: 0.7;
  margin-top: 0.5rem;
}

.toolbar {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-bottom: 1rem;
}

.toolbar button,
.toolbar select,
.toolbar input {
  background: #222;
  color: white;
  border: 1px solid #444;
  padding: 0.7rem 1rem;
  border-radius: 12px;
  font-size: 0.95rem;
}

.toolbar button {
  cursor: pointer;
  transition: all 0.15s ease;
}

.toolbar button:hover {
  background: #333;
  transform: translateY(-1px);
}

#dropzone {
  border: 2px dashed #555;
  border-radius: 18px;
  padding: 1rem;
  text-align: center;
  margin-bottom: 1rem;
  background: rgba(255,255,255,0.03);
  transition: all 0.2s ease;
}

#dropzone.dragover {
  border-color: #fff;
  background: rgba(255,255,255,0.08);
}

#sketch-holder-jt-xml {
  display: flex;
  justify-content: center;
  align-items: center;
  background:
    linear-gradient(45deg, #1a1a1a 25%, transparent 25%),
    linear-gradient(-45deg, #1a1a1a 25%, transparent 25%),
    linear-gradient(45deg, transparent 75%, #1a1a1a 75%),
    linear-gradient(-45deg, transparent 75%, #1a1a1a 75%);
  background-size: 24px 24px;
  background-position: 0 0, 0 12px, 12px -12px, -12px 0px;
  border-radius: 18px;
  overflow: hidden;
  min-height: 400px;
}

canvas {
  max-width: 100%;
  height: auto;
  border-radius: 12px;
}

.statusbar {
  margin-top: 1rem;
  opacity: 0.7;
  font-size: 0.9rem;
}

.help-panel {
  margin-top: 1.5rem;
  background: rgba(255,255,255,0.03);
  border-radius: 14px;
  padding: 1rem;
}

.help-panel summary {
  cursor: pointer;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.help-panel ul {
  margin: 1rem 0 0 0;
  padding-left: 1rem;
}

.help-panel li {
  margin-bottom: 0.4rem;
}

kbd {
  background: #222;
  border: 1px solid #444;
  border-radius: 6px;
  padding: 0.2rem 0.45rem;
  font-size: 0.85rem;
}

.toast {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background: #111;
  color: white;
  padding: 1rem 1.2rem;
  border-radius: 12px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.3);
  z-index: 9999;
  animation: fadein 0.2s ease;
}

@keyframes fadein {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

</style>

<div class="thumbnail-editor-wrapper">

<div class="thumbnail-editor-header">
<h1>Thumbnail Editor</h1>
<p>Create thumbnails for YouTube, blogs, Instagram and social media.</p>
</div>

<div id="dropzone">
Drop image here or use the upload button below
</div>

<div class="toolbar">

<input type="file" id="imageLoader" accept="image/*">

<button onclick="zoomOut()">Zoom −</button>
<button onclick="zoomIn()">Zoom +</button>

<button onclick="rotateLeft()">↺ Rotate</button>
<button onclick="rotateRight()">↻ Rotate</button>

<button onclick="saveImage()">Save</button>

<select id="canvasPreset" onchange="changePreset(this.value)">
  <option value="384">Square Small</option>
  <option value="1080">Instagram Post</option>
  <option value="youtube">YouTube Thumbnail</option>
  <option value="portrait">Portrait</option>
  <option value="4k">4K</option>
</select>

</div>

<div id="sketch-holder-jt-xml"></div>

<div class="statusbar" id="statusbar">
No image loaded
</div>

<details class="help-panel">
<summary>Keyboard Shortcuts</summary>

<ul>
<li><kbd>Z</kbd> Zoom out</li>
<li><kbd>X</kbd> Zoom in</li>
<li><kbd>C</kbd> Rotate left</li>
<li><kbd>V</kbd> Rotate right</li>
<li><kbd>S</kbd> Save image</li>
<li><kbd>Drag Mouse</kbd> Move image</li>
</ul>

</details>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.js"></script>

<script>

let img;

let z = 1;
let x = 0;
let y = 0;
let a = 0;

let iw = 384;
let ih = 384;

let canvas;

function setup() {

  canvas = createCanvas(iw, ih);
  canvas.parent('sketch-holder-jt-xml');

  frameRate(30);

  setupDropzone();
}

function draw() {

  background(80);

  if (img) {

    push();

    translate(width / 2 + x, height / 2 + y);
    rotate(a);

    imageMode(CENTER);

    image(
      img,
      0,
      0,
      img.width * z,
      img.height * z
    );

    pop();

    updateStatus();
  }
}

function updateStatus() {

  const status = document.getElementById("statusbar");

  status.innerHTML =
    "Zoom: " + round(z * 100) + "%" +
    " • Rotation: " + nf(degrees(a),1,1) + "°" +
    " • Canvas: " + iw + "×" + ih;
}

function handleFile(file) {

  if (file.type === 'image') {

    loadImage(file.data, loaded => {

      img = loaded;

      x = 0;
      y = 0;
      z = 1;
      a = 0;

      showToast("Image loaded");

    });
  }
}

document
  .getElementById('imageLoader')
  .addEventListener('change', function(e) {

    const file = e.target.files[0];

    if (!file) return;

    const reader = new FileReader();

    reader.onload = function(event) {

      handleFile({
        type: 'image',
        data: event.target.result
      });
    };

    reader.readAsDataURL(file);
});

function setupDropzone() {

  const dropzone = document.getElementById("dropzone");

  dropzone.addEventListener("dragover", e => {

    e.preventDefault();
    dropzone.classList.add("dragover");
  });

  dropzone.addEventListener("dragleave", () => {

    dropzone.classList.remove("dragover");
  });

  dropzone.addEventListener("drop", e => {

    e.preventDefault();

    dropzone.classList.remove("dragover");

    const file = e.dataTransfer.files[0];

    if (!file) return;

    const reader = new FileReader();

    reader.onload = function(event) {

      handleFile({
        type: 'image',
        data: event.target.result
      });
    };

    reader.readAsDataURL(file);
  });
}

function mouseDragged() {

  x += movedX;
  y += movedY;
}

function zoomIn() {

  z += 0.05;
}

function zoomOut() {

  z -= 0.05;

  if (z < 0.05) z = 0.05;
}

function rotateLeft() {

  a -= 0.05;
}

function rotateRight() {

  a += 0.05;
}

function saveImage() {

  saveCanvas("thumbnail", "jpg");

  showToast("Image saved");
}

function changePreset(value) {

  if (value === "384") {

    iw = 384;
    ih = 384;

  } else if (value === "1080") {

    iw = 1080;
    ih = 1080;

  } else if (value === "youtube") {

    iw = 1280;
    ih = 720;

  } else if (value === "portrait") {

    iw = 720;
    ih = 1280;

  } else if (value === "4k") {

    iw = 3840 / 4;
    ih = 2160 / 4;
  }

  resizeCanvas(iw, ih);

  showToast("Canvas changed");
}

function showToast(message) {

  const toast = document.createElement("div");

  toast.className = "toast";

  toast.innerText = message;

  document.body.appendChild(toast);

  setTimeout(() => {

    toast.remove();

  }, 2000);
}

function keyPressed() {

  if (key === 'z') zoomOut();

  if (key === 'x') zoomIn();

  if (key === 'c') rotateLeft();

  if (key === 'v') rotateRight();

  if (key === 's') saveImage();
}

</script>

## About

A lightweight thumbnail editor built with p5.js.

Supports:
- drag and drop uploads
- zooming
- rotating
- multiple canvas presets
- quick JPG export

Perfect for:
- blog thumbnails
- YouTube previews
- Instagram posts
- social media graphics

```