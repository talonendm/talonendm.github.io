---
layout: post
title: AI Painter - Google Chimera
subtitle: testing
tags:
  - GAN
  - Google
  - art
  - Huion
  - Gimp
  - Pen Tablet
comments: true
cover-img: /assets/pics/cover/drawing/Chimera.JPG
thumbnail-img: /assets/pics/thumbnail/drawing/Chimera.JPG
published: true
---
# Generative Adversarial Network (GAN) - Chimera

Chimera Painter, a trained machine learning (ML) model that automatically creates creatures, see [Google AI blog](https://ai.googleblog.com/2020/11/using-gans-to-create-fantastical.html).
The neural network architecture is capable of generating new data that conforms to learned patterns. 
Try it by yourself with [Chimera Painter Demo](https://storage.googleapis.com/chimera-painter/index.html)

![Chimera Painter Data Permission](/assets/pics/page/www/ChimeraScreen1.JPG){: .mx-auto.d-block :}
Give some more data for Google..

![Chimera Painter](/assets/pics/page/www/ChimeraScreen2.JPG){: .mx-auto.d-block :}
Make your drawing similar as Paint Brush. This flying panther is one of four sample creatures. I tested monster with two heads (another on torso) and it worked quite well. 

Read more about GAN:

- [What is GAN](https://www.unite.ai/what-is-a-generative-adversarial-network-gan/)
- [Impressive Applications](https://machinelearningmastery.com/impressive-applications-of-generative-adversarial-networks/)
- PDF by Hanne Carlsson [Image Generation and Recognition (Emotions)](https://arxiv.org/pdf/1910.05774.pdf)

# H430P Huion Pen Tablet Experiments

- Connect tablet with usb-cable -> install drivers automatically.
- Go to https://huion.com/ and select your Product model (H430P) and OS (Windows). Download and install software
- Pen tablet icon appeared to bottom right corner.

## Gimp setup

Gimp wasn't work directly. It was possible to move pointer, but pressure or even touch wasm't detected. Pressure setup:
- Edit -> Input Devices: Click the mode box and select *Screen*, see e.g. tips [here](https://www.gimpusers.com/forums/gimp-user/19318-huion-1060pro-cannot-draw-on-gimp-2-8-20).
- Pencil worked first, but then something happened and it was not working. Go: Edit -> Preferences -> Tool Options -> Reset Saved Tool Options to Default Values. Restart Gimp.
- Select e.g. Pencil (N) and then it is possible undel Pencil toolbox to select Brush size etc. + Dynamics: off = pen is like mouse. Pressure Opacity = nice.
Huion software and tailored setup for Gimp:
- pen tablet icon setup: add new app, find gimp from program files. 
- select Gimp and press edit. For example, button 1 as "N" i.e. select brush.
- Top Left: 
- Bottom Left: N = Select pencil
- Top Right: CTRL A = Select all
- Bottom Right: CTRL Z = Undo
- Pen Button 1:
- Pen Button 2:

| Location        | What exactly           | Gimp shortcut  |   Action in Gimp |
| ------------- |:-------------:|:-----:| --------------:|
| Tablet        | Top Left|   |          |
| Tablet     | Bottom LEft      |     |                      |
| Tablet | Top Right     |      |               |
| Tablet        | Botton Right |  CTRL Z |    Undo             |
| Pen     | 1      |     |                   |
| Pen | 2      |     |                     |





![Chimera Painter test](/assets/pics/page/screenshot/ChimeraCapture.JPG){: .mx-auto.d-block :}