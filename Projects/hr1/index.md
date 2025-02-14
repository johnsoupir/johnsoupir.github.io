---
layout: project
title: "HR-1 The Humanoid Robot"
---

## Overview

HR-1 was built in 2016 as my first adventure into Arduino and robotics. It was designed to resemble a typical humanoid robot as closely as possible while remaining affordable and functional. Control is achieved via a Bluetooth-to-UART module, and a live video feed is served from an Android phone placed inside the head. All the joints are moved by hobby servos, and the frame is built from aluminum stock and wood from Menards. The servos are powered by a 6V lead acid battery, and the drive wheels use a separate 12V lead acid battery.

## Video

Below is a video demonstration of HR-1:

<iframe width="560" height="315" src="https://www.youtube.com/embed/9eYvukYPWd8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Programming

This project was my first experience with programming. Coming into this project with no programming background was a challenge, but many YouTube tutorials and late nights spent copy pasting code from the internet eventually paid off.
The final iteration of the code was inspired by the Kewlsoft LED example. A letter is sent to select the servo and an integer (from 0 to 180) specifies the angle.

## Parts

Below is a list of the key components used in HR-1:

| **Component**   | **Specification**  |
| --------------- | ------------------ |
| Arduino         | Mega               |
| Arm motor       | MG9 Servo          |
| Battery 1       | 6V Lead Acid       |
| Battery 2       | 12V Lead Acid      |
| Drive Motor     | 12V Brushed        |
| Bluetooth       | HC-5 Module        |
