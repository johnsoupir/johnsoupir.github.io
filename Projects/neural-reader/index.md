---
layout: project
title: "neural-reader"
download: "/Projects/neural-reader/Downloads/neural-reader.zip"
image: "/Projects/neural-reader/Images/nn-wide.png"
---

## Overview

My first adventure into machine learning was an MNIST classifier I wrote after learning about neural networks in Dr. Terry Pilling's advanced engineering math course at UMary.

In true UMary Engineering style, the full training loop and classifier are written from scratch in C with only basic libraries.

The approach and architecture are far from ideal, but with persistence, I was able to achieve >95% accuracy. The network has four layers, each 784 neurons tall. The height comes from the 28x28 resolution of the MNIST dataset. There are, of course, $28^2 = 784$ pixels in each image, each needing to be fed into the network. For code simplicity, I chose to keep each layer the same height. Each neuron in the output layer is trained to output a value between 0.0 and 0.9, which maps to 0-9. A final output is produced by averaging across the output layer.  

{% include figure.html src=page.image alt="neural-reader Image" caption="Figure 1: Visualization of a neural network with the same depth but only 1/10th the height of neural-reader." %}

## Downloading and Compiling

The code is available on my GitHub page. You can try it yourself by following these instructions:

1. Clone the repository:
```
git clone https://github.com/johnsoupir/neural-reader.git
```

2. Change to the project directory:
```
cd neural-reader
```

3. Compile the code:
```
make all
```

If this fails because `make` is not installed, run:
```
sudo apt install make
```

## Training and Recognition

A pre-trained network is included, but to train your own:

```
./train
```

The network can continue training from a previous parameter file by setting the `oldDogNewTricks` variable to `true`.

To recognize using the pre-trained parameters, run:

```
./recognize
```

