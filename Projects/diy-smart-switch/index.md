---
layout: project
title: "DIY Smart Switch Project"
download: "/Projects/diy-smart-switch/Downloads/DIY_Smart_Switch.zip"
image: "/Projects/diy-smart-switch/Images/switch_tools.webp"
---

## Overview

These Wi‑Fi connected Smart Switch boards can be used to control almost anything—lamps, fans, coffee makers, radios, etc. They also include a built‑in temperature and humidity sensor for monitoring room conditions. They are compatible with Google Assistant and Amazon Alexa voice controls (for example: “Hey Google, turn on my fan” or “Alexa, what’s the humidity in the basement?”).

{% include figure.html src="/Projects/diy-smart-switch/Images/switch_tools.webp" alt="Image of circuit board" caption="Figure 1: DIY Smart Switch Prototype" %}


Last year I made version 1.0 of my smart switch. Although it was a very crude prototype, it was very useful and a lot of fun. I decided to design an improved version this year—one that was easier to assemble, safer, and more reliable. I ended up designing two models: one with a mechanical relay to handle larger loads, and one with a solid state relay that is smaller and silent for lighter loads.

{% include figure.html src="/Projects/diy-smart-switch/Images/switch1.webp" alt="Rotated image of the circuit board" caption="Figure 2: Revised Smart Switch Circuit Board (rotated view)" %}


I started by choosing my components and learning about circuit board design. It turned out to be easier than I had originally thought. After some research, I settled on CircuitMaker for designing my boards—CircuitMaker is free and simpler than many alternatives. Once I had my schematics planned on paper, I began working on a digital schematic in CircuitMaker. After entering all the components, I created a complete schematic, arranged the components, and let the software automatically route most of the traces based on the schematic.

When my design was complete, I needed to have the boards manufactured. There were many companies to choose from, but based on their prices and good reviews, I chose PCBWay. They manufacture 10 boards for $5 (plus shipping) and delivered my boards in about 3 days (with arrival at my door in roughly a week). Once all the parts arrived, I assembled everything. After a bit of soldering and coding, the project was complete.

